resource "aws_api_gateway_rest_api" "api" {
  name        = "UsersApi"
  endpoint_configuration {
      types = ["REGIONAL"]
  }
    tags = var .tags
}

resource "aws_api_gateway_resource" "api_resource" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "{proxy+}"
}



resource "aws_api_gateway_method" "api_method_any" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.api_resource.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.api_resource.id
  http_method             = aws_api_gateway_method.api_method_any.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.api_resource.id
  http_method = aws_api_gateway_method.api_method_any.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "integration_response" {
   depends_on = [aws_api_gateway_integration.integration]
   rest_api_id = aws_api_gateway_rest_api.api.id
   resource_id = aws_api_gateway_resource.api_resource.id
   http_method = aws_api_gateway_method.api_method_any.http_method
   status_code = aws_api_gateway_method_response.response_200.status_code


}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_name
  principal     = "apigateway.amazonaws.com"
  source_arn  = "${aws_api_gateway_rest_api.api.execution_arn}/*/*/*"
}

resource "aws_api_gateway_deployment" "api_deployment" {
  depends_on = [aws_api_gateway_integration.integration,]

  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "dev"

}