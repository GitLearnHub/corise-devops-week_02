#! /usr/bin/env bash

/usr/bin/podman container run --detach \
                              --interactive \
                              --tty \
                              --rm \
                              --name=quote-gen-container \
                              --volume=qute-gen:/app:Z \
                              --pod=quote-pod \
                              localhost/quote-gen-service


#                              --network=quote-network \
#                              --pod=quotes-pod \
#                              --publish 5000:5000 \
