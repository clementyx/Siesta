#!/bin/bash
# ===========================================================#
# 	**** Script for scat  run ****        	             # 
#============================================================#
# Please follow the steps : 				     #
# 1) modify this script file as per requirement of your      #
# (don't change the name of file as  well as system name).   #
# It is expected that in ~/bin dir  the  binary/exe file of  #
# transiesta.						     #
# In presence of proper *.psf file for corresponding elements #
# run this script for electrode using command                #
#	 $ sh bias_script.sh                                 #
# The calculation may take long time depending on size of    #
# system and number of nodes(in parallel run )  and will     #
#  generate a scat.TSHS file.		        	     #
# Author: Mohan L Verma, Computational Nanomaterial          #  
# Research lab, Department of Applied Physics, FET,          #
# SSGI, Shri Shanakaracharya Technical Campus-Junwani        # 
# Bhilai(Chhattisgarh)  INDIA                                #
# Sept 29    ver: 0.1   year: 2014                           #
#------------------------------------------------------------#
cp ../Elec/elec.TSHS .   # copy TSHS file from step-1

mkdir cont   # read the comment at the end of this script.

for i in `seq -w 0.0 0.1 1.8`  
do


cp -r cont $i
cd $i
cp ../*.psf .
cp ../Elec/elec.TSHS .
cp ~/bin/transiesta .
cp ~/bin/tbtrans .

cat > scat.fdf <<EOF

SolutionMethod  Transiesta

SystemName  scat 
SystemLabel scat

==================================================
==================================================
# SPECIES AND BASIS

NumberOfSpecies        4
NumberOfAtoms        134

%block ChemicalSpeciesLabel
  1   1  H
  2   6  C
  3   7  N
  4   8  O
%endblock ChemicalSpeciesLabel

PAO.BasisSize    SZP
PAO.EnergyShift  0.005 Ry
XC.functional   GGA
XC.authors      PBE


==================================================
==================================================

 %block kgrid_Monkhorst_Pack 
 1   0   0    0.0
 0   1   0    0.0
 0   0   26   0.0
 %endblock kgrid_Monkhorst_Pack

# ---------------------------------------------------------------------------
# Lattice
# ---------------------------------------------------------------------------
LatticeConstant             1.00 Ang

%block LatticeVectors
    27.532700      0.000000      0.000000
     0.000000     13.725869      0.000000
     0.000000      0.000000     28.920319
%endblock LatticeVectors
 
# ---------------------------------------------------------------------------
# Atomic Coordinates
# ---------------------------------------------------------------------------

AtomicCoordinatesFormat Ang

%block AtomicCoordinatesAndAtomicSpecies
13.654350	1.940930	0.710430		2
13.654350	4.401930	0.710430		2
13.654350	6.862930	0.710430		2
13.654350	9.323940	0.710430		2
13.654350	11.784940	0.710430		2
13.654350	0.710430	1.420860		2
13.654350	3.171430	1.420860		2
13.654350	5.632430	1.420860		2
13.654350	8.093440	1.420860		2
13.654350	10.554440	1.420860		2
13.654350	13.015440	1.420860		2
13.654350	0.710430	2.841720		2
13.654350	3.171430	2.841720		2
13.654350	5.632430	2.841720		2
13.654350	8.093440	2.841720		2
13.654350	10.554440	2.841720		2
13.654350	13.015440	2.841720		2
13.654350	1.940930	3.552150		2
13.654350	4.401930	3.552150		2
13.654350	6.862930	3.552150		2
13.654350	9.323940	3.552150		2
13.654350	11.784940	3.552150		2
13.654350	1.940930	4.973010		2  
13.654350	4.401930	4.973010		2
13.654350	6.862930	4.973010		2
13.654350	9.323940	4.973010		2
13.654350	11.784940	4.973010		2
13.654350	0.710430	5.683440		2
13.654350	3.171430	5.683440		2
13.654350	5.632430	5.683440		2
13.654350	8.093440	5.683440		2
13.654350	10.554440	5.683440		2
13.654350	13.015440	5.683440		2
13.654350	0.710430	7.104300		2
13.654350	3.171430	7.104300		2
13.654350	5.632430	7.104300		2
13.654350	8.093440	7.104300		2
13.654350	10.554440	7.104300		2
13.654350	13.015440	7.104300		2
13.654350	1.940930	7.814730		2
13.654350	4.401930	7.814730		2
13.654350	6.862930	7.814730		2
13.654350	9.323940	7.814730		2
13.654350	11.784940	7.814730		2  
14.575100	5.554150	9.198480		1
14.169000	6.430520	9.312590		4
11.819820	7.560060	9.877690		1
13.220320	8.555190	10.422720		1
13.538310	6.447310	10.600610		2
12.606970	7.629100	10.656670		2
12.973620	5.464340	10.724180		1
16.035920	7.569070	10.764670		1
10.000000	7.119190	11.578760		1
15.433840	7.678270	11.590770		3
14.580860	6.511870	11.727670		2
15.127810	5.503460	11.735200		1
11.721580	8.970000	12.024110		1
11.992020	7.898060	12.030400		2
16.051330	7.733370	12.412280		1
10.663610	7.222660	12.467950		2
13.798830	6.583250	13.043450		2
12.991450	7.794160	13.068320		4
10.740790	5.955030	13.096680		4
13.136630	5.676080	13.125130		1
10.172190	7.956180	13.160620		1
11.054300	6.100600	14.014650		1
14.692060	6.634870	14.096100		4
16.282500	5.397310	14.512480		1
11.785540	7.065690	15.020320		1
16.557870	5.762740	15.389460		4
15.396170	8.164800	15.409690		1
14.645630	7.310240	15.410630		2
14.611020	5.211040	15.873190		1
13.168340	8.839730	15.959030		1
15.324830	6.085830	16.010590		2
12.165580	6.934530	16.053300		2
12.382810	5.810760	16.162930		1
13.425650	7.768230	16.245450		2
11.162110	7.338080	16.951790		4
17.532700	6.881640	17.376880		1
15.599430	6.240460	17.502940		2
13.759960	7.864690	17.627990		4
16.637200	7.231090	17.745550		3
11.631910	7.615610	17.760500		1
15.836710	5.184070	17.864850		1
13.553850	5.823700	18.093880		1
14.308160	6.664290	18.198070		2
16.741480	7.351040	18.760300		1
14.587660	6.945510	19.517900		4
13.762800	7.238270	19.972610		1
13.654350	1.940930	21.105590		2  
13.654350	4.401930	21.105590		2
13.654350	6.862930	21.105590		2
13.654350	9.323940	21.105590		2
13.654350	11.784940	21.105590		2
13.654350	0.710430	21.816020		2
13.654350	3.171430	21.816020		2
13.654350	5.632430	21.816020		2
13.654350	8.093440	21.816020		2
13.654350	10.554440	21.816020		2
13.654350	13.015440	21.816020		2
13.654350	0.710430	23.236880		2
13.654350	3.171430	23.236880		2
13.654350	5.632430	23.236880		2
13.654350	8.093440	23.236880		2
13.654350	10.554440	23.236880		2
13.654350	13.015440	23.236880		2
13.654350	1.940930	23.947310		2
13.654350	4.401930	23.947310		2
13.654350	6.862930	23.947310		2
13.654350	9.323940	23.947310		2
13.654350	11.784940	23.947310		2
13.654350	1.940930	25.368170		2  
13.654350	4.401930	25.368170		2
13.654350	6.862930	25.368170		2
13.654350	9.323940	25.368170		2
13.654350	11.784940	25.368170		2
13.654350	0.710430	26.078600		2
13.654350	3.171430	26.078600		2
13.654350	5.632430	26.078600		2
13.654350	8.093440	26.078600		2
13.654350	10.554440	26.078600		2
13.654350	13.015440	26.078600		2
13.654350	0.710430	27.499460		2
13.654350	3.171430	27.499460		2
13.654350	5.632430	27.499460		2
13.654350	8.093440	27.499460		2
13.654350	10.554440	27.499460		2
13.654350	13.015440	27.499460		2
13.654350	1.940930	28.209890		2
13.654350	4.401930	28.209890		2
13.654350	6.862930	28.209890		2
13.654350	9.323940	28.209890		2
13.654350	11.784940	28.209890		2
%endblock AtomicCoordinatesAndAtomicSpecies



==================================================
==================================================
# SCF variables

DM.MixSCF1   T
MaxSCFIterations      300           # Maximum number of SCF iter
DM.MixingWeight       0.05          # New DM amount for next SCF cycle
DM.Tolerance          1.d-4         # Tolerance in maximum difference
DM.UseSaveDM          true          # to use continuation files
DM.NumberPulay        5
TS.MixH               yes

==================================================
==================================================
# MD variables

MD.FinalTimeStep 1
MD.TypeOfRun CG
MD.NumCGsteps     000
MD.UseSaveXV      .true.

==================================================
==================================================
# Output variables

WriteMullikenPop                1
WriteBands                      .true.
SaveRho                         .true.
SaveDeltaRho                    .false.
SaveHS                          .false.
SaveElectrostaticPotential      True 
SaveTotalPotential              no
WriteCoorXmol                   .true.
WriteMDXmol                     .true.
WriteMDhistory                  .false.
WriteEigenvalues                yes
 

==================================================
==================================================
# Transmission 
TS.TBT.NPoints      101
TS.TBT.Emin        -0.5 eV
TS.TBT.Emax         0.5 eV

TS.TBT.NEigen              9

# Bias voltage
TS.Voltage $i eV
TS.biasContour.NumPoints       20

# Transiesta: electrode definition:
# LEFT ELECTRODE
TS.HSFileLeft ./elec.TSHS
TS.ReplicateA1Left    1
TS.ReplicateA2Left    1
TS.NumUsedAtomsLeft   22
TS.BufferAtomsLeft    22
# RIGHT ELECTRODE
TS.HSFileRight ./elec.TSHS
TS.ReplicateA1Right   1
TS.ReplicateA2Right   1
TS.NumUsedAtomsRight  22
TS.BufferAtomsRight   22

# SPECIES AND ATOMS
# DYNAMICS
TS.UseBulkInElectrodes  T
==================================================
==================================================
====================


EOF

./transiesta < scat.fdf | tee  scat.out 


cd ..
rm -rf cont 
mkdir cont

cp  ./$i/scat.TSDE ./$i/scat.TSHS ./$i/scat.DM  cont  # copy these files for continuation of the next bias step.



done

