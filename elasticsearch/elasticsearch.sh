#!/bin/sh

if [ -n "$CLUSTER" ]; then
  OPTS="$OPTS -Des.cluster.name=$CLUSTER"
fi

echo "Starting Elasticsearch with the options $OPTS"
$ES_HOME/bin/elasticsearch $OPTS -f 2>&1
