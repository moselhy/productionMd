#!/bin/bash
#SBATCH --account=def-jchoy4
#SBATCH -J charmm36
#SBATCH -e charmm36.err
#SBATCH -o charmm36.log
#SBATCH --nodes=1                # number of nodes
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:2
#SBATCH --mail-user=mohamed.moselhy@uwo.ca 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=REQUEUE
#SBATCH --mail-type=ALL
#SBATCH --mem 20G               # memory pool per node
#SBATCH --time 0-12:00:00           # time (D-HH:MM:ss)
echo "DEBUG: [$SLURM_JOB_ID]  [$(hostname)]  [$(date -R)]" > myoutput.err 
export OMP_NUM_THREADS="${SLURM_CPUS_PER_TASK:-1}"
mpiexec gmx_mpi mdrun -v -deffnm 2 -noappend -cpi 1.cpt -s 1.tpr		# this is where your commands go, change accordingly to what you need  
echo "DEBUG: [$(date -R)]" >> myoutput.err
