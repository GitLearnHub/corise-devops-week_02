#! /usr/bin/env bash

/usr/bin/podman container run --detach \
                              --interactive \
                              --tty \
                              --rm \
                              --name=quote-disp-container \
                              --volume=qute-disp:/app:Z \
                              --pod=quote-pod \
                              localhost/quote-disp-service


#                              --network=quote-network \
#                              --pod=quotes-pod \
#                              --publish 5001:5001 \
