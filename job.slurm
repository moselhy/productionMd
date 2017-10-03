#!/bin/bash
#SBATCH --account=def-jchoy4
#SBATCH -J nonphosphoetge			# change name to 
#SBATCH -e nonphosphoetge.err
#SBATCH -o nonphosphoetge.log
#SBATCH --nodes=1                # number of nodes
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24   
#SBATCH --gres=gpu:4             
#SBATCH --mail-user=mohamed.moselhy@uwo.ca 	# this will email you 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=REQUEUE
#SBATCH --mail-type=ALL
#SBATCH --mem 100G               # memory pool per node
#SBATCH --time 0-8:00:0           # time (D-HH:MM:ss)
echo "DEBUG: [$SLURM_JOB_ID]  [$(hostname)]  [$(date -R)]" > myoutput.err 
gmx mdrun -v -deffnm md_0_1		# this is where your commands go, change accordingly to what you need  
echo "DEBUG: [$(date -R)]" >> myoutput.err
