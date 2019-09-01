STACK:=docker-workflow-stack
TEMPLATE:=aws_docker_cicd.yml
PARAMETERS:=aws_docker_cicd_params.json
TAGS:=tags.json
BUCKET:=mysandbox-ramiaj-artifact-bucket

create:
	aws cloudformation create-stack --stack-name $(STACK) --template-body file://`pwd`/$(TEMPLATE) --parameters file://`pwd`/$(PARAMETERS) --tags file://`pwd`/$(TAGS) --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND

update:
	aws cloudformation update-stack --stack-name $(STACK) --template-body file://`pwd`/$(TEMPLATE) --parameters file://`pwd`/$(PARAMETERS) --tags file://`pwd`/$(TAGS) --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND

delete:
	python3 remove_bucket_contents.py $(BUCKET)
	aws cloudformation delete-stack --stack-name $(STACK)

delete_main_stack_only:
	aws cloudformation delete-stack --stack-name $(STACK)

local_unit_test:
	python -m unittest discover
