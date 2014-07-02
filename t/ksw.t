use strict;
use warnings;
use lib qw(.. ../blib/lib ../blib/arch);
use Test::Most;
use Klib::Ksw;
use inc::TestHelper;
use Data::Dumper;

use_ok('Klib::Kseq');

#for my $example (sort keys %example_files) {
#    my $file = test_input_file("$example.fastq");
#    my $kseq = Klib::Kseq->new($file);
#    my $it = $kseq->iterator;
#    my $ct = 0;
#    my $sample_seq;
#    while (my $seq = $it->next_seq) {
#        $ct++;
#        $sample_seq = $seq; # always grab the last seq
#    }
#    is($ct, $example_files{$example}->{count}, "correct num. seqs in $example");
#    ok(defined($sample_seq), 'sample sequence obtained');
#    if ($sample_seq) {
#        for my $key (qw(seq desc name qual)) {
#            is($sample_seq->{$key},
#               $example_files{$example}->{$key},
#               "$key matches $example");
#        }
#        is(length($sample_seq->{seq}), length($sample_seq->{qual}));
#    }
#}

done_testing();
