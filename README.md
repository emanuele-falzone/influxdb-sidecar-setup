# influxdb-sidecar-setup

This component allows the developer to easily setup InfluxDB V2

### Example
This is an example of how it can be used in a `docker-compose.yml`

```yml
version: '3.2'
services:
  influxdb:
    image: quay.io/influxdb/influxdb:2.0.0-alpha
    hostname: influxdb
    container_name: influxdb
    ports:
      - "9999:9999"   
  influxdb-sidecar-setup:
    image: emanuelefalzone/influxdb-sidecar-setup:1.0.0
    hostname: influxdb-sidecar-setup
    container_name: influxdb-sidecar-setup
    environment:
      INFLUX_HOSTNAME: influxdb 
      INFLUX_USERNAME: admin 
      INFLUX_PASSWORD: password 
      INFLUX_TOKEN: "d2VsY29tZQ==" 
      INFLUX_ORGANIZATION: polimi 
      INFLUX_BUCKET: bucket
      INFLUX_RETENTION_PERIOD: 0
```
