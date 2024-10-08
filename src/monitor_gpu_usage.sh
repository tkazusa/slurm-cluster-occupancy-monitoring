#!/bin/bash

# Header
echo "JobID,User,JobName,Partition,GPU_Allocated,RunTime"

# Loop through each job
squeue --format="%A %u %j %P" | tail -n +2 | while read -r jobid user jobname partition; do

    # Get GPU allocation info from scontrol for the job
    gpu_alloc=$(scontrol show job $jobid | grep -oP 'TRES=cpu=\d+,mem=\d+\w+,gres/gpu=\K\d+')

    # Get the elapsed time (how long the job has been running)
    runtime=$(scontrol show job $jobid | grep -oP 'Elapsed=\K\S+')

    # If no GPUs are allocated, set it to 0
    if [ -z "$gpu_alloc" ]; then
        gpu_alloc=0
    fi

    # Output the information
    echo "$jobid,$user,$jobname,$partition,$gpu_alloc,$runtime"
    
done
