# itzgio-elck

This repository is intended to install and configure a cluster of cassandra and logstash, to retrieve the logs from cassandra and send store them in elasticsearch. The results are shown in kibana.

It's meant to be run in AWS OpsWorks, so to avoid dependency issues when using Chef version 12, I've uploaded the community versions of elasticsearch, cassandra-dse, logstash, java and kibana5 to my repository.

For educational purposes only.
