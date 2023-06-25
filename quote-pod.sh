#! /usr/bin/env bash

/usr/bin/podman pod create --infra-name=infra-quote-pod \
                           --name=quote-pod \
                           --publish 5001:5001
