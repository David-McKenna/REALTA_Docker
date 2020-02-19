NPROC = $(shell nproc)
BUILD_CORES = $(shell echo $(NPROC) '0.75' | awk '{printf "%1.0f", $$1*$$2}')

all: gpu cpu


gpu:
	docker build --build-arg BUILD_CORES="$(BUILD_CORES)" -t pulsar-gpu-dsp2020 -f Dockerfile_gpu .

cpu:
	docker build --build-arg BUILD_CORES="$(BUILD_CORES)" -t pulsar-dsp2020 -f Dockerfile_cpu .


dockeralias:
	echo "alias dckrgpu='docker run --gpus all --run -it pulsar-gpu-dsp2020'" >> ~/.bash_aliases
	echo "alias dckrcpu='docker run --run -it pulsar-dsp2020'" >> ~/.bash_aliases