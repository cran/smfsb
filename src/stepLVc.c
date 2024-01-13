#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>
#include <R_ext/Rdynload.h>

// Actual code we want to be able to call from R:
void stepLV_c(int *x,double *t0p,double *dtp,double *c)
{
  double t=*t0p, dt=*dtp, termt=t+dt;
  GetRNGstate();
  double h0,h1,h2,h3,u;
  while (1==1) {
    h1=c[0]*x[0]; h2=c[1]*x[0]*x[1]; h3=c[2]*x[1];
    h0=h1+h2+h3;
    if ((h0<1e-10)||(x[0]>=1000000))
      t=1e99;
    else
      t+=rexp(1.0/h0);
    if (t>=termt) {
      PutRNGstate();
      return;
    }
    u=unif_rand();
    if (u<h1/h0)
      x[0]+=1;
    else if (u<(h1+h2)/h0) {
      x[0]-=1; x[1]+=1;
    } else
      x[1]-=1;
  }
}

// Boilerplate for registering the routine, needed for CRAN...

static R_NativePrimitiveArgType stepLV_t[] = {
  INTSXP, REALSXP, REALSXP, REALSXP
};

static const R_CMethodDef cMethods[] = {
   {"stepLV_c", (DL_FUNC) &stepLV_c, 4, stepLV_t},
   {NULL, NULL, 0, NULL}
};

void R_init_smfsb(DllInfo *info)
{
   R_registerRoutines(info, cMethods, NULL, NULL, NULL);
   R_useDynamicSymbols(info, FALSE);
   R_forceSymbols(info, TRUE);
}

// eof


