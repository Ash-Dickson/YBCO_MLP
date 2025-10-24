Two different versions of tabGAP can be used, the h5 version, or the standard. Note that the h5 version requires additional compilation steps, but is recommended for running many short jobs (reading the standard file takes some time). Compilation instructions for both are found at: https://gitlab.com/jezper/tabgap.

YBCO_tabGAP can be used with the following lammps input:
```
mass 3 15.999
mass 2 63.546
mass 4 88.90585
mass 1 137.327

pair_style   hybrid/overlay tabgap eam/fs
pair_coeff   * * tabgap Ba-Cu-O-Y.tabgap.h5 Ba Cu O Y no yes
pair_coeff   * * eam/fs Ba-Cu-O-Y.eam.fs Ba Cu O Y
```
(or for standard tabGAP):
```
mass 3 15.999
mass 2 63.546
mass 4 88.90585
mass 1 137.327

pair_style   hybrid/overlay tabgap eam/fs
pair_coeff   * * tabgap Ba-Cu-O-Y.tabgap Ba Cu O Y no yes
pair_coeff   * * eam/fs Ba-Cu-O-Y.eam.fs Ba Cu O Y
```

Note that KOKKOS is required for GPU runs. The speed-up is dramatic therefore this is recommended for large simulations. TabGAP for KOKKOS has extra compilation instructions (again, these are in  https://gitlab.com/jezper/tabgap).
