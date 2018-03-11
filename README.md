ELK stack on Docker
===================

### Usage:

##### Run ELK stack.
`$ ./elk`
#####  Run ELK stack in daemon mode.
`$ ./elk start`
#####  Tail logs of the ELK stack.
`$ ./elk logs`
##### Stop ELK stack.
`$ ./elk stop`

----

### Installing and configuring filebeat agent

Filebeat agent should be installed in all the nodes which are suppose to send its logs to the ELK stack. 

Installation guide can be fount at => https://www.elastic.co/guide/en/beats/filebeat/5.1/filebeat-installation.html

##### Below is a sample `filebeat.yml` config to install in the monitoring node

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
