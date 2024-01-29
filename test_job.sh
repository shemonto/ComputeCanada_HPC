#!/bin/bash
#SBATCH --time=1-20:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=8
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shemontod@mun.ca

echo "[JOB]: Job Started!"

module load python/3.10
virtualenv --no-download $SLURM_TMPDIR/my_env
source $SLURM_TMPDIR/my_env/bin/activate

echo "[JOB]: Environment Created!"

pip install --no-index --upgrade pip -q
pip install numpy pandas sklearn matplotlib --no-index -q
echo "[JOB]: Python Libraries Installed!"


mkdir $SLURM_TMPDIR/data
mv ~/Data/*  $SLURM_TMPDIR/data

python3.10 phpdataprocessing.py
echo "JOB Ended !"