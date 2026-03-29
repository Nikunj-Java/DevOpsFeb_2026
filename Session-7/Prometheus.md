# Prometheus Setup Guide (Linux - Beginner to Practical)

## 📌 Overview

Prometheus is an open-source monitoring and alerting toolkit used in DevOps and SRE to collect and query system and application metrics.

---

## 🧭 Architecture

```
Node Exporter → Prometheus → Grafana (optional)
```

* **Node Exporter** → Collects system metrics (CPU, Memory, Disk)
* **Prometheus** → Stores and queries metrics
* **Grafana** → Visualizes metrics (dashboards)

---

## ⚙️ Step 1: Update System

```bash
sudo apt update && sudo apt upgrade -y
```

---

## ⚙️ Step 2: Install Required Packages

```bash
sudo apt install -y wget curl tar
```

---

## 📦 Step 3: Download Prometheus

```bash
wget https://github.com/prometheus/prometheus/releases/download/v2.52.0/prometheus-2.52.0.linux-amd64.tar.gz
```

---

## 📂 Step 4: Extract Files

```bash
tar -xvf prometheus-2.52.0.linux-amd64.tar.gz
cd prometheus-2.52.0.linux-amd64
```

---

## 👤 Step 5: Create Prometheus User

```bash
sudo useradd --no-create-home --shell /bin/false prometheus
```

---

## 📁 Step 6: Create Directories

```bash
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
```

---

## 📂 Step 7: Move Files

```bash
sudo cp prometheus /usr/local/bin/
sudo cp promtool /usr/local/bin/
sudo cp -r consoles /etc/prometheus
sudo cp -r console_libraries /etc/prometheus
sudo cp prometheus.yml /etc/prometheus/
```

---

## 🔐 Step 8: Set Permissions

```bash
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus
```

---

## ⚙️ Step 9: Create Systemd Service

```bash
sudo nano /etc/systemd/system/prometheus.service
```

### Add:

```ini
[Unit]
Description=Prometheus Monitoring
After=network.target

[Service]
User=prometheus
ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/var/lib/prometheus

Restart=always

[Install]
WantedBy=multi-user.target
```

---

## ▶️ Step 10: Start Prometheus

```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
```

---

## ✅ Step 11: Check Status

```bash
sudo systemctl status prometheus
```

Expected:

```
active (running)
```

---

## 🌐 Step 12: Access Prometheus UI

```
http://localhost:9090
```

---

## ⚙️ Step 13: Install Node Exporter

```bash
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.1/node_exporter-1.8.1.linux-amd64.tar.gz
tar -xvf node_exporter-1.8.1.linux-amd64.tar.gz
cd node_exporter-1.8.1.linux-amd64
sudo cp node_exporter /usr/local/bin/
```

---

## ⚙️ Step 14: Create Node Exporter Service

```bash
sudo nano /etc/systemd/system/node_exporter.service
```

### Add:

```ini
[Unit]
Description=Node Exporter

[Service]
User=prometheus
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
```

---

## ▶️ Step 15: Start Node Exporter

```bash
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
```

---

## 🧪 Step 16: Test Node Exporter

```
http://localhost:9100/metrics
```

---

## ⚙️ Step 17: Configure Prometheus

```bash
sudo nano /etc/prometheus/prometheus.yml
```

### Replace with:

```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: "node_exporter"
    static_configs:
      - targets: ["localhost:9100"]
```

---

## 🔄 Step 18: Restart Prometheus

```bash
sudo systemctl restart prometheus
```

---

## 🧪 Step 19: Verify Targets

```
http://localhost:9090/targets
```

Expected:

```
UP
```

---

## 📊 Step 20: Test Queries

* CPU:

```
node_cpu_seconds_total
```

* Memory:

```
node_memory_MemAvailable_bytes
```

---

## 📊 Step 21: Install Grafana (Optional)

```bash
sudo apt install -y grafana
sudo systemctl start grafana
sudo systemctl enable grafana
```

---

## 🌐 Access Grafana

```
http://localhost:3000
```

* Username: admin
* Password: admin

---

## 🔌 Add Prometheus Data Source

```
http://localhost:9090
```

---

## 📥 Import Dashboard

```
Dashboard ID: 1860
```

---

## 🚨 Troubleshooting

| Issue                   | Solution                               |
| ----------------------- | -------------------------------------- |
| Prometheus not starting | Check logs: `journalctl -u prometheus` |
| Port not accessible     | `sudo ufw allow 9090`                  |
| Target DOWN             | Restart node_exporter                  |
| No metrics              | Check config file                      |

---

## 🎯 Final Result

✔ Prometheus running
✔ Node Exporter collecting metrics
✔ Targets showing UP
✔ Dashboards working

---

## 🚀 Next Steps

* Setup Alertmanager (Email/Slack alerts)
* Monitor multiple servers
* Integrate with Kubernetes / AWS
* Create SRE dashboards

---

## 🧠 Key Commands Summary

```bash
sudo systemctl start prometheus
sudo systemctl restart prometheus
sudo systemctl status prometheus

sudo systemctl start node_exporter
sudo systemctl status node_exporter
```

---

**End of File**
