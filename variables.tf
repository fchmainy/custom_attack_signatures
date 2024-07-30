variable "bigip" {
  type = string
}

variable "USERNAME" {
  type = string
}

variable "PASSWORD" {
  type = string
}

variable "name" {
  type    = string
  default = ""
}
variable "signatureId" {
  type = number
}

variable "description" {
  type    = string
  default = ""
}
variable "tag" {
  type    = string
  default = ""
}
variable "hasCve" {
  type    = bool
  default = false
}
variable "revision" {
  type    = string
  default = "1"
}
variable "accuracy" {
  type    = string
  default = "high"
  validation {
    condition     = contains(["low", "medium", "high"], var.accuracy)
    error_message = "Accuracy valid values are: low, medium or high (default = high)"
  }
}
variable "risk" {
  type    = string
  default = "high"
  validation {
    condition     = contains(["low", "medium", "high"], var.risk)
    error_message = "Risk valid values are: low, medium or high (default = high)"
  }
}
variable "signatureType" {
  type    = string
  default = "request"
  validation {
    condition     = contains(["request", "response"], var.signatureType)
    error_message = "Signature Types allowed values are: request or response (default = request)"
  }
}
variable "isUserDefined" {
  type    = bool
  default = true
}
variable "rule" {
  type    = string
  default = ""
}
variable "keywords" {
  type = list(object({
    value      = string
    matchCase  = bool
    comparison = string
    context    = string
  }))
  default = [
    {
      value      = ""
      matchCase  = true
      comparison = "string-match"
      context : "request"
    }
  ]
  validation {
    condition = length([
      for o in var.keywords : true
      if contains(["regexp-does-not-match", "string-match", "regexp-match", "string-does-not-match"], o.comparison)
    ]) == length(var.keywords)
    error_message = "Please check your keywords"
  }
  validation {
    condition = length([
      for o in var.keywords : true
      if contains(["request", "response", "gwt", "parameter-cookie-contentprofile", "parameter-cookie", "json", "uri-without-query-string", "xml", "uri-with-query-string", "header"], o.context)
    ]) == length(var.keywords)
    error_message = "Please check your keywords"
  }
}

variable "matchesWithinCookie" {
  type    = bool
  default = false
}
variable "matchesWithinParameter" {
  type    = bool
  default = false
}
variable "matchesWithinHeader" {
  type    = bool
  default = false
}
variable "matchesWithinUri" {
  type    = bool
  default = false
}
variable "matchesWithinXml" {
  type    = bool
  default = false
}
variable "matchesWithinJson" {
  type    = bool
  default = false
}
variable "matchesWithinPlainText" {
  type    = bool
  default = false
}
variable "matchesWithinGwt" {
  type    = bool
  default = false
}
variable "matchesWithinRequest" {
  type    = bool
  default = true
}
variable "matchesWithinResponse" {
  type    = bool
  default = false
}
