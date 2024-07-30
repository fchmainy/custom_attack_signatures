resource "restapi_object" "login" {
  provider  = restapi.before_login_endpoint
  object_id = "authToken"
  path      = "/mgmt/shared/authn/login"
  data      = local.login
}

resource "restapi_object" "login2" {
  provider       = restapi.after_login_endpoint
  object_id      = "authToken"
  path           = "/mgmt/shared/authn/login"
  data           = local.login
  update_method  = "PATCH"
  destroy_method = "DELETE"
  debug          = true

}
