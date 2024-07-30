locals {
  login = templatefile("${path.module}/templates/login.tmpl", {
    USERNAME = var.USERNAME
  PASSWORD = var.PASSWORD })
  attack_sig = templatefile("${path.module}/templates/custom_attack_sig.tmpl", {
    name                   = var.name
    signatureId            = var.signatureId
    description            = var.description
    tag                    = var.tag
    hasCve                 = var.hasCve
    revision               = var.revision
    accuracy               = var.accuracy
    risk                   = var.risk
    signatureType          = var.signatureType
    isUserDefined          = var.isUserDefined
    rule                   = var.rule
    keywords               = var.keywords
    matchesWithinParameter = var.matchesWithinParameter
    matchesWithinRequest   = var.matchesWithinRequest
    matchesWithinCookie    = var.matchesWithinCookie
    matchesWithinHeader    = var.matchesWithinHeader
    matchesWithinUri       = var.matchesWithinUri
    matchesWithinXml       = var.matchesWithinXml
    matchesWithinJson      = var.matchesWithinJson
    matchesWithinPlainText = var.matchesWithinPlainText
    matchesWithinGwt       = var.matchesWithinGwt
    matchesWithinResponse  = var.matchesWithinResponse

  })
}
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

resource "restapi_object" "attack_signature" {
  provider  = restapi.after_login_endpoint
  object_id = "attackSig"
  path      = "/mgmt/tm/asm/signatures"
  data      = local.attack_sig
}
