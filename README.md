ELK stack on Docker
===================================

## Run (stack)
```
  # run 
  ./elk
  # run (daemon)
  ./elk start
  # show logs
  ./elk logs
  # stop
  ./elk stop
```

## Sample filebeat config to install in the monitoring node

```
filebeat:
  prospectors:
    -
      paths:
        - "/opt/wso2/esb/repository/logs/*.log"
      document_type: wso2
output:
  redis:
    hosts: ["redis"]
    port: 6379
    key: "logstash"
```
