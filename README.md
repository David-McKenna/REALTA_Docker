# REALTA Pulsar Docker Containers

Docker containers used on the I-LOFAR REALTA nodes for processing pulsar observations.

## CUDA Container Requirements
* Docker 19.03+
* [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) container toolkit
* GPU with SM70+ available (Volta+, lower CCs may be possible by modifying the Dockerfile as needed, but I believe sm_30 is the minimum requirement)

## Caveats/Todos
Known issues/TODOs:
* Cleanup ENV variables
* Pass on packages to see if any can be removed after some changes to image requirements
* Not all installed packages have been stress tested as of yet
* Intel MKL/IPP libraries fail to be detected at compile time, removed for the time being and isolated to the "Dockerfile_MKLWIP" file. Could allow for a significant speed up, and for increase python performance (intelpython).
* mark5access, PsrXML and a few other packages were intended to be installed but appear to have issues compiling, leaving out for now.
