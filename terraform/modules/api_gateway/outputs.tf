output "api_id" {
  description = "ID of the HTTP API"
  value       = aws_apigatewayv2_api.http_api.id
}

output "api_endpoint" {
  description = "Endpoint URL of the HTTP API"
  value       = aws_apigatewayv2_api.http_api.api_endpoint
}