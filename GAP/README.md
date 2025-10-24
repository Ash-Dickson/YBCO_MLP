In order to use the GAP potential, LAMMPS must be compiled with QUIP (https://docs.lammps.org/Build_extras.html#ml-quip). For all purposes we recommend using the tabGAP, however, we include the GAP for completness. pairpot.xml contains a fitted short range potential to data from https://journals.aps.org/pra/abstract/10.1103/PhysRevA.111.032818. Run a GAP simulation with the following LAMMPS input: 
```
mass  4 137.3269999646734 # Ba
mass  2 63.545999983653154 # Cu
mass  1 15.998999995884349 # O
mass  3 88.905839977129475 # Y

pair_style quip
pair_coeff * * gp1.xml "Potential xml_label=GAP_2025_8_9_60_6_54_43_259" 8 29 39 56

```
The training script for GAP is also attached (train.sh). If you wish to retrain, it is crucial to use the parallel version of GAP_fit. Finally, the training database is included as db.xyz. Energies are in eV, forces in eV/Angstrom, and virial stress in units of eV. 
