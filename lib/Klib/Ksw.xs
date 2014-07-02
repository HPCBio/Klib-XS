#ifdef PERL_CAPI
#define WIN32IO_IS_STDIO
#endif

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#ifdef USE_SFIO
  #include <config.h>
#else
  #include <stdio.h>
#endif
#include <perlio.h>

#include "ppport.h"
#include "ksw.h"

typedef kswr_t*      Klib__Ksw__Report;
//typedef kswq_t** Klib__Ksw__Query;

MODULE = Klib::Ksw PACKAGE = Klib::Ksw  PREFIX=ksw_

# kswr_t ksw_align(int qlen, uint8_t *query, int tlen, uint8_t *target, int m, const int8_t *mat, int gapo, int gape, int xtra, kswq_t **qry);

Klib::Ksw::Report 
ksw_align(qlen, query, tlen, target, m, mat, gapo, gape, xtra)
    int qlen
    uint8_t* query
    int tlen
    uint8_t* target
    int m
    const int8_t* mat
    int gapo
    int gape
    int xtra
    CODE:
        kswr_t rp = ksw_align(qlen, query, tlen, target, m, mat, gapo, gape, xtra, NULL);
        RETVAL = &rp;
    OUTPUT:
        RETVAL

MODULE = Klib::Ksw PACKAGE = Klib::Ksw::Query  PREFIX=kswq_

#int kswq_get_qlen(qp)
#    Klib::Ksw::Query qp
#PROTOTYPE:
#    CODE:
#        RETVAL = qp->qlen;
#    OUTPUT:
#        RETVAL
#
#int kswq_get_slen(qp)
#    Klib::Ksw::Query qp
#PROTOTYPE:
#    CODE:
#        RETVAL = qp->slen;
#    OUTPUT:
#        RETVAL

MODULE = Klib::Ksw PACKAGE = Klib::Ksw::Report  PREFIX=kswr_

int kswr_get_score(rp)
    Klib::Ksw::Report rp
    PROTOTYPE:
    CODE:
        RETVAL = rp->score;
    OUTPUT:
        RETVAL

int kswr_get_te(rp)
    Klib::Ksw::Report rp
    PROTOTYPE:
    CODE:
        RETVAL = rp->te;
    OUTPUT:
        RETVAL

int kswr_get_qe(rp)
    Klib::Ksw::Report rp
    PROTOTYPE:
    CODE:
        RETVAL = rp->qe;
    OUTPUT:
        RETVAL

int kswr_get_score2(rp)
    Klib::Ksw::Report rp
    PROTOTYPE:
    CODE:
        RETVAL = rp->score2;
    OUTPUT:
        RETVAL

int kswr_get_te2(rp)
    Klib::Ksw::Report rp
    PROTOTYPE:
    CODE:
        RETVAL = rp->te2;
    OUTPUT:
        RETVAL

int kswr_get_tb(rp)
    Klib::Ksw::Report rp
    PROTOTYPE:
    CODE:
        RETVAL = rp->tb;
    OUTPUT:
        RETVAL

int kswr_get_qb(rp)
    Klib::Ksw::Report rp
    PROTOTYPE:
    CODE:
        RETVAL = rp->qb;
    OUTPUT:
        RETVAL
