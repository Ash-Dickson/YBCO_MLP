# YBCO_MLP
Machine learned potentials for YBCO, trained using GAP and tabGAP. All potentials were trained on the same database. The CP2K input used to collect the training data is included. All simulations were performed with CP2K version 2024.1.

Downloading the potential files can either be done by downloading the raw data directly from github, or by cloning the repository. To clone the repository you must first have git lfs installed:

```
git lfs install
```

Then simply use ```git clone --recursive GIT_URL_HERE```. In order to utilise the potentials in LAMMPS, you must compile LAMMPS for use with tabGAP / GAP. The compilation instructions for LAMMPS with GAP can be found here: https://docs.lammps.org/Build_extras.html#ml-quip

The tabGAP installation instructions can be found here: https://gitlab.com/jezper/tabgap

Note that FOR VIRTUALLY ALL CASES THE TABGAP IS RECOMMENDED. It is significantly faster than the GAP and has VERY similar accuracy. Note that the h5 format of tabGAP allows for quicker initialisation in LAMMPS simulations, and is recommended when running many short simulations (the installation instructions for the h5 version are found at the link above).

Finally, running the tabGAP on GPU requires that LAMMPS is compiled with KOKKOS and the KOKKOS tabGAP files found in the tabGAP github repo. For large simulations (several million atoms) this is significnatly faster than CPU. 

