use 5.014;
use strict;
use warnings;
use Module::Build 0.3601;
use File::Spec;
use File::Find;
use File::Copy;
use Data::Dumper;

# We only support a subset of klib, so instead of compiling everything we
# only compile what we need.  Yes, this is purely a hack to get around
# c_source only accepting directories and not explicit filenames

my %supported = map { $_ => 1 } qw(kseq.h ksw.h ksw.c);

my @cleanup;

my $tmpsrcdir = 'srctmp';

if (! -e $tmpsrcdir) {
    mkdir $tmpsrcdir or die "Can't create tmp src directory: $!";
}

for my $f (find_c_files()) {
    my ($path, $base) = @$f;
    File::Copy::copy($path,File::Spec->catfile($tmpsrcdir, $base)) or die "Can't copy file :$!";
}

my %module_build_args = (
    "build_requires"        => {
        "Module::Build"         => "0.3601",
        "ExtUtils::CBuilder"    => 0
    },
    "configure_requires"    => {
        "Module::Build"         => "0.3601"
    },
    "dist_abstract"         => "low-level XS-based bindings to klib",
    "dist_author"           => [
        "Chris Fields <cjfields\@bioperl.org>"
    ],
    "c_source"              => $tmpsrcdir,
    "dist_name"             => "Klib",
    "dist_version_from"     => "lib/Klib.pm",
    "license"               => "perl",
    "module_name"           => "Klib",
    "extra_compiler_flags"  => ['-fPIC'],
    "include_dirs"          => ['.', $tmpsrcdir],
    "extra_linker_flags"    => ["-lz"],
    "recursive_test_files"  => 1,
    "add_to_cleanup"        => [$tmpsrcdir]
);

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;

sub find_c_files {
    my @c;
    find({
        'wanted'        => sub { if (exists $supported{$_}) {
            push @c, [$File::Find::name, $_]
        }},
    }, 'src/klib');

    @c;
}
