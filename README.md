# deploy-sonar-helm-ansible
a sneaky way to setup sonarqube on some k8s with helm and ansible

after running `make`, take the output `podname` and run
`kubectl port-forward -n sonarqube ${podname} 8080:9000`
