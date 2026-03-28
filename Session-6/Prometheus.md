# Prometheus
- it is open source monitoring system
- pull based model to collect system metrics from systems

## How to Install
- download from :
```
https://prometheus.io/download/
```
- Extract it to the folder
- start the prometheus directly from folder by double clicking on Prometheus OR
- if you have installed prometheus using linux run as below
```
./prometheus --config.file=prometheus.yml
```
- goto> browser and open
```
localhost:9090
```

## Step:1 Install Windows Metrics System 
- Download From 
```
https://github.com/prometheus-community/windows_exporter/releases
```
- Downaload '.msi' and install in your system
- install -> Next -> Next -> Finish
- Verify the installtion , check the metrics coming on Browser
```
http://localhost:9182/metrics
```
- Output:
```
windows_cpu_time_total
windows_os_physical_memory_free_bytes
.
.
.
```
## Step:2 Configure the Prometheus
- goto prometheus -> prometheus.yml > open with Visual Studio Code
- copy the below configuration to prometheus.yml
- prometheus.yml
```
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: "windows"
    static_configs:
      - targets: ["localhost:9182"]
```

## Step:3 Restart the Prometheus
- goto> prometheus> opnen in cmd
```
prometheus.exe --config.file=prometheus.yml

```

## Step:4 Check Target
```
http://localhost:9090/targets
```

## Step:5 Test Queries
- 1. CPU USAGE  
```
rate(windows_cpu_time_total[1m])
```
- 2. MEMORY FREE
```
windows_os_physical_memory_free_bytes
```
- 3. DISK FREE
```
windows_logical_disk_free_bytes
```
