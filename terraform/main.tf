provider "aws" {
    region     = "eu-central-1"
    shared_credentials_file = "~/.aws/creds"
    profile = "default"
}




##### API Gateway
module "apiGateway" {
  source = "./api_gateway"
  lambda_name = module.lambda.function_name
  lambda_invoke_arn = module.lambda.invoke_arn
  tags = var.tags
  
}

##### S3 Bucket
module "s3" {
  source = "./s3"
  tags = var.tags
  apiUrl = module.apiGateway.apiUrl
  
}

##### LAMBDA FUNCTION
module "lambda" {
  source = "./lambda"
  tags = var.tags
  
}

