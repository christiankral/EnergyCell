#define DYNEventSpecial
/* DSblock model generated by Dymola from Modelica model EnergyCell.TestingExamples.Complex_Test
 Dymola Version 2020x (64-bit), 2019-10-10 translated this at Sun Oct 10 23:00:43 2021

   */

#include <matrixop.h>
/* Declaration of C-structs */
/* Prototypes for functions used in model */
/* Codes used in model */
/* DSblock C-code: */

#define NX_    0
#define NX2_   0
#define NU_    0
#define NY_    0
#define NW_    6
#define NP_    4
#define NPS_   0
#define ND_   0
#define NXP_   0
#define NInitial_   0
#define MAXAuxStr_   0
#define MAXAuxStrLen_   500
#define NHash1_ -1686161289
#define NHash2_ 1370297786
#define NHash3_ 0
#define NI_    0
#define NRelF_ 0
#define NRel_  0
#define NTim_  0
#define NSamp_ 0
#define NCons_ 0
#define NA_    18
#define SizePre_ 0
#define SizeEq_ 0
#define SizeDelay_ 0
#define QNLmax_ 0
#define MAXAux 0
#define NrDymolaTimers_ 0
#define NWhen_ 0
#define NCheckIf_ 0
#define NGlobalHelp_ 24
#define NGlobalHelpI_ 8
#ifndef NExternalObject_
#define NExternalObject_ 0
#endif
#include <moutil.c>
DYMOLA_STATIC unsigned int FMIClockValueReferences_[1]={0};
DYMOLA_STATIC unsigned int FMIClockFirstValueReferences_[1]={0};
PreNonAliasDef(0)
PreNonAliasDef(1)
PreNonAliasDef(2)
PreNonAliasDef(3)
PreNonAliasDef(4)
PreNonAliasDef(5)
#if !defined(DYM2CCUR)
 DYMOLA_STATIC const char*modelName="EnergyCell.TestingExamples.Complex_Test";
#endif
DYMOLA_STATIC const char*usedLibraries[]={0};
DYMOLA_STATIC const char*dllLibraryPath[]={0};
DYMOLA_STATIC const char*default_dymosim_license_filename=0;
#include <dsblock1.c>

/* Define variable names. */

#define Sections_

TranslatedEquations

InitialSection
if (!DymolaUserHomotopy) UpdateInitVars(time, X_, XD_, U_, DP_, IP_, LP_, F_, Y_, W_, QZ_, duser_, iuser_, cuser_, did_, 1);
BoundParameterSection
BoundParameterConstantSection

 /* Linear system of equations to solve. */
/* Tag: initialization.linear[1] */
/* Introducing 1 common subexpressions used in 0 expressions */
/* Of the common subexpressions 1 are reals, 0 are integers, and 0
   are booleans. */
{
  const char*const varnames_[]={"one_Phase.I.re", "one_Phase.I.im"};
  const double nominal_[]={1, 1};
  DidLinearSystemOfEquations(J, b, y, 2, DYNX(DYNhelp,0), 24, DYNX(did_->helpvari_vec,0), 8);
  /* Parameter dependent Jacobian */
  if (NewParametersJac) SetNeedFactor(J);
  if (NeedFactor(J)) {
    MatrixZeros(J);
    SetMatrixLeading(J, 1, 1, 2, DYNX(DP_,2));
    SetMatrixLeading(J, 1, 2, 2,  -DYNX(DP_,3));
    SetMatrixLeading(J, 2, 1, 2, DYNX(DP_,3));
    SetMatrixLeading(J, 2, 2, 2, DYNX(DP_,2));
  }
  SetVector(b, 1,  -DYNX(DP_,0));
  SetVector(b, 2,  -DYNX(DP_,1));
  SetVector(y, 1, 0.0);
  SetVector(y, 2, 0.0);
  SolveLinearSystemOfEquations(J, b, y, 1, "initialization.linear[1]");
  DYNX(W_,0) = GetVector(y, 1);
  DYNX(W_,1) = GetVector(y, 2);
  EndStaticLinearSystemOfEquations(J);
}
 /* End of Equation Block */ 

DYNX(W_,2) = 3.0*(DYNX(DP_,0)*DYNX(W_,0)+DYNX(DP_,1)*DYNX(W_,1));
DYNX(W_,3) = (-3.0)*(DYNX(DP_,0)*DYNX(W_,1)-DYNX(DP_,1)*DYNX(W_,0));
DYNX(W_,4) = (-3.0)*(DYNX(DP_,0)*DYNX(W_,0)+DYNX(DP_,1)*DYNX(W_,1));
DYNX(W_,5) = (-3.0)*(DYNX(DP_,1)*DYNX(W_,0)-DYNX(DP_,0)*DYNX(W_,1));
BoundParameterSection
InitialSection
InitialSection
InitialStartSection
InitialSection
if (!DymolaUserHomotopy) UpdateInitVars(time, X_, XD_, U_, DP_, IP_, LP_, F_, Y_, W_, QZ_, duser_, iuser_, cuser_, did_, 1);
DefaultSection
InitializeData(0)
InitialSection
InitialSectionB
Init_=false;InitializeData(2);Init_=true;
EndInitialSection

OutputSection

DynamicsSection

AcceptedSection1

AcceptedSection2

DefaultSection
InitializeData(1)
EndTranslatedEquations

#include <dsblock6.c>

PreNonAliasNew(0)
StartNonAlias(0)
DeclareAlias2("one_Phase.V.re", "Imaginary part of complex voltage [V]", \
"one_Phase.V_phase.re", 1, 7, 0, 0)
DeclareAlias2("one_Phase.V.im", "Real part of complex voltage [V]", \
"one_Phase.V_phase.im", 1, 7, 1, 0)
DeclareVariable("one_Phase.I.re", "Real part of complex current [A]", 0.0, \
0.0,0.0,0.0,0,513)
DeclareVariable("one_Phase.I.im", "Imaginary part of complex current [A]", 0.0, \
0.0,0.0,0.0,0,513)
DeclareVariable("one_Phase.P", "Active power [W]", 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("one_Phase.S.re", "Real part of complex apparent power (active power) [W]",\
 "one_Phase.P", 1, 5, 2, 0)
DeclareVariable("one_Phase.S.im", "Imaginary part of complex apparent power (reactive power) [var]",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("one_Phase.Q", "Reactive power [var]", "one_Phase.S.im", 1, 5, 3, 0)
DeclareAlias2("one_Phase.p.V.re", "Imaginary part of complex electric potential [V]",\
 "one_Phase.V_phase.re", 1, 7, 0, 0)
DeclareAlias2("one_Phase.p.V.im", "Real part of complex electric potential [V]",\
 "one_Phase.V_phase.im", 1, 7, 1, 0)
DeclareAlias2("one_Phase.p.I.re", "Real part of complex current [A]", \
"one_Phase.I.re", 1, 5, 0, 128)
DeclareAlias2("one_Phase.p.I.im", "Imaginary part of complex current [A]", \
"one_Phase.I.im", 1, 5, 1, 128)
DeclareParameter("one_Phase.V_phase.re", "Imaginary part of complex voltage [V]",\
 0, 230.0, 0.0,0.0,0.0,0,560)
DeclareParameter("one_Phase.V_phase.im", "Real part of complex voltage [V]", 1, \
0.0, 0.0,0.0,0.0,0,560)
DeclareParameter("impedance.Z.re", "Real part of complex impedance (resistance) [Ohm]",\
 2, 5.0, 0.0,0.0,0.0,0,560)
DeclareParameter("impedance.Z.im", "Imaginary part of complex impedance (reactance) [Ohm]",\
 3, 0.0, 0.0,0.0,0.0,0,560)
DeclareAlias2("impedance.V.re", "Imaginary part of complex voltage [V]", \
"one_Phase.V_phase.re", 1, 7, 0, 0)
DeclareAlias2("impedance.V.im", "Real part of complex voltage [V]", \
"one_Phase.V_phase.im", 1, 7, 1, 0)
DeclareAlias2("impedance.I.re", "Real part of complex current [A]", \
"one_Phase.I.re", -1, 5, 0, 0)
DeclareAlias2("impedance.I.im", "Imaginary part of complex current [A]", \
"one_Phase.I.im", -1, 5, 1, 0)
DeclareVariable("impedance.P", "Active power [W]", 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("impedance.S.re", "Real part of complex apparent power (active power) [W]",\
 "impedance.P", 1, 5, 4, 0)
DeclareVariable("impedance.S.im", "Imaginary part of complex apparent power (reactive power) [var]",\
 0.0, 0.0,0.0,0.0,0,513)
DeclareAlias2("impedance.Q", "Reactive power [var]", "impedance.S.im", 1, 5, 5, 0)
DeclareAlias2("impedance.p.V.re", "Imaginary part of complex electric potential [V]",\
 "one_Phase.V_phase.re", 1, 7, 0, 0)
DeclareAlias2("impedance.p.V.im", "Real part of complex electric potential [V]",\
 "one_Phase.V_phase.im", 1, 7, 1, 0)
DeclareAlias2("impedance.p.I.re", "Real part of complex current [A]", \
"one_Phase.I.re", -1, 5, 0, 128)
DeclareAlias2("impedance.p.I.im", "Imaginary part of complex current [A]", \
"one_Phase.I.im", -1, 5, 1, 128)
EndNonAlias(0)

#define DymolaHaveUpdateInitVars 1
#include <dsblock5.c>

DYMOLA_STATIC void UpdateInitVars(double*time, double* X_, double* XD_, double* U_, double* DP_, int IP_[], Dymola_bool LP_[], double* F_, double* Y_, double* W_, double QZ_[], double duser_[], int iuser_[], void*cuser_[],struct DYNInstanceData*did_,int initialCall) {
}
StartDataBlock
EndDataBlock