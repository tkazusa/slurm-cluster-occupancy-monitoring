# slurm-cluster-occupancy-monitoring
This repository contains a script for monitoring GPU usage by jobs in a Slurm cluster. The script collects information about how many GPUs each job occupies and how long each job has been running.

## Features

- Monitors the number of GPUs allocated to each job in a Slurm cluster.
- Displays the job's runtime (time the job has been running).

## Usage

### Prerequisites

- A Slurm workload manager installed on your cluster.

### Running the Script

```bash
git clone https://github.com/your-username/slurm-gpu-monitor.git
cd slurm-gpu-monitor/src
chmod +x monitor_gpu_usage.sh
./monitor_gpu_usage.sh
```

### Output Format

The script outputs a CSV format with the following fields:

- `JobID`: The job ID in the Slurm cluster.
- `User`: The username of the job owner.
- `JobName`: The name of the job.
- `Partition`: The partition in which the job is running.
- `GPU_Allocated`: Number of GPUs allocated to the job.
- `RunTime`: How long the job has been running (in days-hours:minutes:seconds).

#### Example Output

```plaintext
JobID,User,JobName,Partition,GPU_Allocated,RunTime
123456,user1,training_job,gpu,4,01-12:34:56
123457,user2,inference_job,gpu,2,00-05:12:45
```