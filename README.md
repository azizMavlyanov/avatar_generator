# Avatar generator

## Author

Aziz Mavlyanov

## Stack

HTML, CSS, JavaScript, Python, Flask, Redis

## Installation and usage of the project

**Please make sure that you have docker installed on your PC (Notebook)**

1\) Run containers from the root of the project:

```dotenv
sudo docker-compose up -d --build --force-recreate
```

2\) Visit http://localhost:9090/ and start using the app

**Redis database is persistent** since data located in volume.

## Monitoring

1\) Address http://localhost:8083/ stands for the administration web server’s port of Influxdb

2\) Address http://localhost:8086/ stands the HTTP API endpoint port, it’s used to send query to Influxdb by Telegraf

3\) Address http://localhost:3000/ stands Grafana dashboard monitoring page
