## Basic Workflow

To work on this variant of the project, we use <a href="https://podman.io/" target="_blank">Podman</a> and Linux.
Here we are running [Fedora CoreOS](https://fedoraproject.org/coreos/ "Fedora CoreOS") on KVM/QEMU,
but every Linux environment that relies on systemd as init system should be suitable.

Assuming we are in the root directory of the project.

`podman image build --file ./quote_gen/Containerfile --tag quote-gen-service`</br>
`podman image build --file ./quote_disp/Containerfile --tag quote-disp-service`</br>

Next, we create and run a pod containing two containers.
For convenience, the commands are located in the corresponding scripts.

`./quote-pod.sh`</br>
`./quote_gen.sh`</br>
`./quote_disp.sh`</br>

Now we are ready to generate unit files for the pod and install them for the current user.
If it doesn't already exist, create a directory to store the service files.

`mkdir --parents ~/.config/systemd/user`</br>
`cd ~/.config/systemd/user`</br>
`podman generate systemd --new --files --name quote-pod`</br>

At this point we can continue using `systemctl` to manage the pod's main service;
systemd will take care of (re)starting and stopping the containers' services along with the main service.
