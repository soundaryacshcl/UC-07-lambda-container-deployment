output "api_endpoint" {
  description = "Invoke URL for the deployed API"
  value       = aws_apigatewayv2_stage.example.invoke_url
}
