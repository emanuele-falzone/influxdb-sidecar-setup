#! /bin/bash

echo "Checking enviroment variables..."

function check {
    [ -z "$2" ] && echo "Need to set $1" && exit 1;
}

check INFLUX_HOSTNAME $INFLUX_HOSTNAME
check INFLUX_USERNAME $INFLUX_USERNAME
check INFLUX_PASSWORD $INFLUX_PASSWORD
check INFLUX_TOKEN $INFLUX_TOKEN
check INFLUX_ORGANIZATION $INFLUX_ORGANIZATION
check INFLUX_BUCKET $INFLUX_BUCKET
check INFLUX_RETENTION_PERIOD $INFLUX_RETENTION_PERIOD

echo "Done!"

set -e

./wait-for.sh "$INFLUX_HOSTNAME:9999" --timeout=600

echo "Broker ready"

echo "http://$INFLUX_HOSTNAME:9999/api/v2/setup"
curl -X POST \
	"http://$INFLUX_HOSTNAME:9999/api/v2/setup" \
	-H 'Content-Type: application/json' \
	-d "{
		\"username\": \"$INFLUX_USERNAME\",
		\"password\": \"$INFLUX_PASSWORD\",
		\"org\": \"$INFLUX_ORGANIZATION\",
		\"bucket\": \"$INFLUX_BUCKET\",
		\"token\": \"$INFLUX_TOKEN\",
		\"retentionPeriodHrs\": $INFLUX_RETENTION_PERIOD
	}"
