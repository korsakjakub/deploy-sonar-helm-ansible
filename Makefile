build: Dockerfile
	docker build -t ansible .
run:
	docker run --rm -it --network host -p 8080:8080 -v $${PWD}:/ansible ansible ansible-playbook -i /ansible/hosts /ansible/sonar.yaml

run-naked:
	docker run --rm -it --network host -v $${PWD}:/ansible ansible

clean:
	helm -n sonarqube uninstall sonarqube; pkill kubectl
