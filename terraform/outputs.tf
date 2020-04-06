output "apiUrl" {
  value = module.apiGateway.apiUrl
}

output "websiteEndpoint" {
  value = module.s3.website_endpoint
}
