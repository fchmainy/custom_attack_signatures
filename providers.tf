provider "restapi" {
  alias                = "before_login_endpoint"
  uri                  = "https://${var.bigip}"
  insecure             = true
  debug                = true
  write_returns_object = true
}


provider "restapi" {
  alias                 = "after_login_endpoint"
  uri                   = "https://${var.bigip}"
  insecure              = true
  debug                 = true
  create_returns_object = true
  create_method         = "POST"
  update_method         = "PATCH"
  destroy_method        = "DELETE"

  headers = {
    X-F5-Auth-Token = jsondecode(restapi_object.login.api_response).token.token
  }
}
