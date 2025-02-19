SHELL := /bin/bash

# Define variables using environment variables
AWS_ACCOUNT_NUMBER ?= $(AWS_ACCOUNT_NUMBER)
AWS_REGION ?= $(AWS_REGION)
ECR_REPO_NAME ?= demo-llm-project

.PHONY: ecr-push
ecr-push:
	@set -e; \
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(AWS_ACCOUNT_NUMBER).dkr.ecr.$(AWS_REGION).amazonaws.com; \
	docker build -t $(ECR_REPO_NAME) .; \
	docker tag $(ECR_REPO_NAME):latest $(AWS_ACCOUNT_NUMBER).dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO_NAME):latest; \
	docker push $(AWS_ACCOUNT_NUMBER).dkr.ecr.$(AWS_REGION).amazonaws.com/$(ECR_REPO_NAME):latest
