#!/bin/bash

# Input File
n='1'
infile="db.xyz"
outfile="gp${n}.xml"

# Gap-fit Settings
settings="sparse_jitter=1e-8 \
          default_sigma={0.002 0.02 0.02 0.0} \
          config_type_sigma={isolated_atom:0.0001:0.00001:0.00001:0.0:YBCO7:0.002:0.02:0.02:0.0:YBCO6:0.002:0.02:0.02:0.0:crystal:0.002:0.02:0.02:0.0:amorphous:0.005:0.05:0.05:0.0:subsystem:0.01:0.1:0.1:0.0:Cu:0.01:0.1:0.1:0.0:Ba:0.01:0.1:0.1:0.0:O:0.01:0.1:0.1:0.0} \
          sparse_separate_file=F \
          do_copy_at_file=F \
          rnd_seed=999 \
	  core_param_file=pairpot.xml \
          core_ip_args={IP Glue} \
          e0={Ba:-691.598:O:-430.085:Y:-1038.579:Cu:-1306.079} \
          energy_parameter_name=dft_energy \
          virial_parameter_name=dft_virial \
          force_parameter_name=dft_force"

k2b_cutoff="6.5"
k2b_delta="2.9689764976501465"
k2b_theta="1.0"
k3b_cutoff="4.5"
k3b_theta="2.36578106880188"
k3b_delta="0.24312911927700043"
k3b_sparse="550"

#k2b_params="distance_2b cutoff=6 cutoff_transition_width=1.0 delta=1.598 n_sparse=50 sparse_method=uniform covariance_type=ARD_SE add_species=T theta_uniform=1.486"
# Two-body descriptors with gaussian kernel
k2b_params="distance_2b cutoff_transition_width=1.0 delta=${k2b_delta} n_sparse=25 sparse_method=uniform covariance_type=ARD_SE theta_uniform=${k2b_theta}"

k2b_Ba_Ba="distance_2b add_species       = F \
                    cutoff = 6.5 \
                       Z1                = 56 \
                       Z2                = 56 \
                       ${k2b_params}"
k2b_Cu_Cu="distance_2b add_species       = F \
                    cutoff = ${k2b_cutoff} \
                       Z1                = 29 \
                       Z2                = 29 \
                       ${k2b_params}"

k2b_O_O="distance_2b add_species       = F \
                    cutoff = ${k2b_cutoff} \
                       Z1                = 8 \
                       Z2                = 8 \
                       ${k2b_params}"
k2b_Y_Y="distance_2b add_species       = F \
                    cutoff = 6.5 \
                       Z1                = 39 \
                       Z2                = 39\
                       ${k2b_params}"
k2b_Ba_Y="distance_2b add_species       = F \
                    cutoff = ${k2b_cutoff} \
                       Z1                = 56 \
                       Z2                = 39 \
                       ${k2b_params}"
k2b_Cu_Ba="distance_2b add_species       = F \
                    cutoff = ${k2b_cutoff} \
                       Z1                = 29 \
                       Z2                = 56 \
                       ${k2b_params}"
k2b_O_Ba="distance_2b add_species       = F \
                    cutoff = ${k2b_cutoff} \
                       Z1                = 8 \
                       Z2                = 56 \
                       ${k2b_params}"
k2b_O_Cu="distance_2b add_species       = F \
                    cutoff = ${k2b_cutoff} \
                       Z1                = 8 \
                       Z2                = 29 \
                       ${k2b_params}"
k2b_Cu_Y="distance_2b add_species       = F \
                    cutoff = ${k2b_cutoff} \
                       Z1                = 29 \
                       Z2                = 39 \
                       ${k2b_params}"
k2b_O_Y="distance_2b add_species       = F \
                    cutoff = ${k2b_cutoff} \
                       Z1                = 8 \
                       Z2                = 39 \
                       ${k2b_params}"



k3b_params="angle_3b cutoff=${k3b_cutoff} theta_uniform=${k3b_theta} covariance_type=ARD_SE n_sparse=${k3b_sparse} delta=${k3b_delta} add_species=T"


EAM_params="eam_density cutoff=6.5 delta=${k3b_delta} pair_function=FSgen mode=FSgen covariance_type=ard_se theta_uniform=${k2b_theta} sparse_method=uniform n_sparse=20 add_species=T print_sparse_index=T"

# Run the Program
exec="/work/e05/e05/ash141/codes/QUIP-EAM-mpi/QUIP/build/archer2_mpich+openmp/gap_fit"
$exec atoms_filename=$infile gap={{$k2b_Ba_Ba}:{$k2b_Cu_Cu}:{$k2b_O_O}:{$k2b_Y_Y}:{$k2b_Ba_Y}:{$k2b_Cu_Ba}:{$k2b_O_Ba}:{$k2b_O_Cu}:{$k2b_Cu_Y}:{$k2b_O_Y}:{$k3b_params}:{$EAM_params}} $settings gp_file=$outfile
