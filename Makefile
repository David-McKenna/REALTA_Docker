NPROC=`nproc`
BUILD_CORES=`echo $NPROC 0.75 | awk '{printf "%1.0f",$1*$2}'`

all: gpu cpu


gpu:
	docker build -e BUILD_CORES="$(BUILD_CORES)" -t pulsar-gpu-dsp2020 -f Dockerfile_gpu .

cpu:
	docker build -e BUILD_CORES="$(BUILD_CORES)" -t pulsar-dsp2020 -f Dockerfile_cpu .
