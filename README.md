# Klib

A simple low-level (XS) Perl interface to various C files from klib:

    https://github.com/attractivechaos/klib

# Implemented

* kseq - very fast FASTA/FASTQ parsing

This implements the basic interface with Klib::KSeq. Note this does not include
any additional macros or code that is specific to seqtk or other tools including
this code, in particular conversion of quality encodings to PHRED scores.

# Planned support

* ksw - Smith-Waterman alignments (in progress)
* khmm - simple HMM
* knhx - newick tree parser
* ksa - suffix arrays
* bgzf - 'blocked' gzip compression

We may set up an XS interface for htslib to take advantage of bgzf and tabix
there instead.  At the moment we do not plan on supporting other code, but
patches are welcome.

# WARNING

Highly experimental! As in you will probably get burned. FASTQ/FASTA is probably
the most 'stable' in terms of testing and checking for memory leaks.
