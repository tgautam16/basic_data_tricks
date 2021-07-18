#!/bin/bash


### Taking datafile, mask, dm, accelfile, accelcand (dont include /u/ in the directory)

##if [ "$1" == "-h"]
##then
##	echo "### Taking datafile, mask, dm, accelfile, accelcand, working directory (dont include /u/ in the directory)"
##	exit 0
##else


#SBATCH --job-name=fold_harms
#SBATCH --error=/u/tasha/GC_search/tjob.err.%j
#SBATCH --output=/u/tasha/GC_search/tjob.out.%j
#SBATCH --mail-user=tgautam@mpifr-bonn.mpg.de
#SBATCH --mail-type=ALL
#SBATCH --partition=short.q
#SBATCH --mem=60G
#SBATCH --array=0-2


srun -N 1 singularity exec -H /u:/home1 -B /u:/home/psr/work /u/tasha/docker_sing_imgs/prestonew5-2019-09-30-5cd93e04bd30.simg prepfold -ncpus 4  -npart 128 -noxwin -accelcand $5 -accelfile /home1/$4 -dm $3 -mask /home1/$2 -pfact 2.0 -end 0.2 -o /home1/tasha/GC_search/2ndharm_ck00 /home1/$1 &

srun -N 1 singularity exec -H /u:/home1 -B /u:/home/psr/work /u/tasha/docker_sing_imgs/prestonew5-2019-09-30-5cd93e04bd30.simg prepfold -ncpus 4  -npart 128 -noxwin -accelcand $5 -accelfile /home1/$4 -dm $3 -mask /home1/$2 -pfact 3.0 -end 0.2 -o /home1/tasha/GC_search/3rdharm_ck00 /home1/$1 &

srun -N 1 singularity exec -H /u:/home1 -B /u:/home/psr/work /u/tasha/docker_sing_imgs/prestonew5-2019-09-30-5cd93e04bd30.simg prepfold -ncpus 4  -npart 128 -noxwin -accelcand $5 -accelfile /home1/$4 -dm $3 -mask /home1/$2 -pfact 0.5 -end 0.2 -o /home1/tasha/GC_search/halfharm_ck00 /home1/$1 &

wait
