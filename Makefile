.DEFAULT_GOAL := all
.PHONY: all build run run-naked clean


all: build run

build: Dockerfile
	docker build -t ansible .
run:
	docker run --rm -it --network host -p 8080:8080 -v $${PWD}:/ansible ansible ansible-playbook -i /ansible/hosts /ansible/sonar.yaml

run-naked:
	docker run --rm -it --network host -v $${PWD}:/ansible ansible

build-k3s:
	curl -sfL https://get.k3s.io | sh -

clean-k3s:
	/usr/local/bin/k3s-uninstall.sh

clean:
	helm -n sonarqube uninstall sonarqube; pkill kubectl
