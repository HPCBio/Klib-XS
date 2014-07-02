# From ExtUtils::MakeMaker 6.48 and DBI 1.43
use 5.014;
use strict;
use ExtUtils::MakeMaker;
use Config;
use File::Spec;
use File::Find;
use Data::Dumper;

WriteMakefile(
    BUILD_REQUIRES      => {
        "ExtUtils::CBuilder"    => 0
                            },
    ABSTRACT            => "low-level XS-based bindings to klib",
    AUTHOR              => [
                            "Chris Fields <cjfields\@bioperl.org>"
                            ],
    NAME                => "Klib",
    VERSION_FROM        => "lib/Klib.pm",
    INC                 => join(" ", map {"-I$_"} '.', File::Spec->catdir(qw(src klib))),
    LIBS                => ["-lz"],
    CCFLAGS             => '-fPIC',

    LICENSE             => 'perl',

    META_MERGE          => {
        "meta-spec"     => { version => 2 },
        resources       => {
            repository  => {
                type    => 'git',
                url     => 'git://github.com/HPCBio/Klib-XS',
                web     => 'https://github.com/HPCBio/Klib-XS',
            },
        },
    },

    #XS                  => find_xs_files(),

    test                => { RECURSIVE_TEST_FILES    => 1 },

);

sub find_xs_files {
    my @xs;
    find({
        'wanted'        => sub { if (/\.xs$/) {
            push @xs, $File::Find::name
        }},
    }, 'lib');

    my %xs_map = map {
        my $cfile = $_;
        $cfile =~ s/\.xs$/.c/;
        $_ => $cfile
        } @xs;
    say Dumper \%xs_map;

    \%xs_map;
}

__END__

