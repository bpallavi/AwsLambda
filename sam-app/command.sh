aws s3 mb s3://ppb-code-sam

#package cloudformation

aws cloudformation package --s3-bucket ppb-code-sam --template-file template.yaml --output-template-file gen/template-generated.yaml

#deploy
aws cloudformation deploy --template-file HelloWorldFunction\gen\template-generated.yaml --stack-name hello-world-lambda --capabilities CAPABILITY_IAM

#to download zip file
aws s3 cp s3://ppb-code-sam/46f70161c00bd2a12c2a8db12c0d2904 46f70161c00bd2a12c2a8db12c0d2904.zip

#to run locally
sam local start-api
sam build
sam deploy --guided