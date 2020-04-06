
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Archiver
data "archive_file" "lambda" {
    type                = "zip"
    source_dir           = "../app/server"
    output_path            = "./lambda_function_payload.zip"
  
}

# Function resource
resource "aws_lambda_function" "lambda_function" {
    filename            = "lambda_function_payload.zip"
    function_name       = "usersApi"
    role                = aws_iam_role.iam_for_lambda.arn
    handler             = "lambda.handler"
    source_code_hash    = filebase64sha256(data.archive_file.lambda.output_path)


    runtime             ="nodejs12.x"

    tags                = var.tags

}
