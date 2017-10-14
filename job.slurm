#!/bin/bash
#SBATCH --account=def-jchoy4
#SBATCH -J nonphosphoetge			# change name to 
#SBATCH -e nonphosphoetge.err
#SBATCH -o nonphosphoetge.log
#SBATCH --nodes=4                # number of nodes
#SBATCH --tasks-per-node=8
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:2
#SBATCH --mail-user=mohamed.moselhy@uwo.ca 	# this will email you 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=REQUEUE
#SBATCH --mail-type=ALL
#SBATCH --mem-per-cpu 128
#SBATCH --time 1-0:00:00           # time (D-HH:MM:ss)
echo "DEBUG: [$SLURM_JOB_ID]  [$(hostname)]  [$(date -R)]" > myoutput.err 
export OMP_NUM_THREADS="${SLURM_CPUS_PER_TASK:-1}"
mpiexec gmx_mpi mdrun -v -deffnm 2 -maxh 8 -s 1.tpr
echo "DEBUG: [$(date -R)]" >> myoutput.err
