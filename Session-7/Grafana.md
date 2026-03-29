# GRAFANA
- IT IS DATA VISUALIZATION TOOL
## How to Install ?
- Link:
```
https://www.grafana.com/grafana/download
```
- Copy the Linux Debian Code
```
sudo apt-get install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/grafana-enterprise/release/12.4.2/grafana-enterprise_12.4.2_23531306697_linux_amd64.deb
sudo dpkg -i grafana-enterprise_12.4.2_23531306697_linux_amd64.deb
```
- Run The GRAFANA
```
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server
sudo systemctl enable grafana-server.service
```
- Open GRAFA UI -> http://localhost:3000
- LOGIN: admin/admin
- Configure DataSource: Configuration -> DataSource
- Select: Prometheus and Enter Prometheus URL: http://localhost:9090
- Save and Test