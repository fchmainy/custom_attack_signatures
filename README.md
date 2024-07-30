# custom_attack_signatures



# How to use it?
You can use plan & apply it or reference to it as a terraform module.

## Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Important Configuration Notes](#important-configuration-notes)
- [Installation Example](#installation-example)

## Introduction

Terraform Module to manage custom attack signatures


## Prerequisites

A big-ip with Token based authentication.


## Files

  - versions.tf
  - providers.tf
  - variables.tf
  - outputs.tf
  - auth.tf - there are two resources for authentication. One mapped to the "before_login_endpoint" which takes admin credentials as inputs and "after_login_endpoint" which takes the token from the creds based authentication and use it as the **F5-Auth-Token** header.
  - main.tf - terraform resources to manage the custom attack signatures.
  - templates:
      - login.tf: JSON template for authentication
      - custom_attack_sig.tmpl: JSON template to create the custom attack signature

## To use it as a terraform blueprint

  1. Clone the repo:
  ```bash
      git clone https://github.com/fchmainy/custom_attack_signatures.git
      cd custom_attack_signatures/
  ```     
  3. set the sensitive env variables
  ```bash
      export TF_VAR_USERNAME="admin"
      export TF_VAR_PASSWORD='DefineYourPassword123'
  ```
  3. Initialize your terraform.auto.tfvars 
  ```bash
      cp terraform.auto.tfvars.example terraform.auto.tfvars
      vi terraform.auto.tfvars
  ```
  4. Set your input variables
  ```terraform
      name          = "Blocking-uuid-uuid=123456"
      signatureId   = 300000001
      description   = "This is a demo Custom Attack Signature"
      tag           = "demo"
      hasCve        = false
      revision      = "1"
      accuracy      = "high"
      risk          = "high"
      signatureType = "request"
      rule          = "content:\"uuid=543210\";"
      keywords = [
        {
          value      = "uuid=543210"
          matchCase  = true
          comparison = "string-match"
          context    = "request"
        }
      ]
      matchesWithinParameter = true
      matchesWithinRequest   = true
  ```
  5. Initialize the terraform working directory, plan then apply
  ```bash
      terraform init
      terraform plan
      terraform apply
  ```

## Use it as a terraform module

```terraform
module "attack_sig_uuid1234" {
  source = "github.com/fchmainy/custom_attack_signatures?ref=v0.0.1"
  USERNAME      = var.username
  PASSWORD      = var.password
  signatureId   = 300000002
  description   = "This is a demo Custom Attack Signature"
  tag           = "demo"
  hasCve        = false
  revision      = "1"
  accuracy      = "high"
  risk          = "high"
  signatureType = "request"
  rule          = "content:\"uuid=1234\";"
  keywords = [
  {
    value      = "uuid=1234"
    matchCase  = true
    comparison = "string-match"
    context    = "request"
  }
  ]
  matchesWithinParameter = true
  matchesWithinRequest   = true
  }
```



## Variables

| Name | Description | Mandatory |Type | Default | Constraints |
|------|-------------|-----------|-----|---------|-------------|
| bigip | Management *IPAddress* or *IPAddress:Port* of the target BIG-IP | true | string | "" |  |
| USERNAME | Username to authenticate to BIG-IP. Keep it secret! | true | string | "" |  |
| PASSWORD | Password to authenticate to BIG-IP. Keep it secret! | true | string | "" |  |
| name | Name of the Custom Attack Signature | true | string | "" |  |
| signatureId | ID of the custom Attack Signature. If not provided it will be computed by the BIG-IP | false | number | "" |  |
| description | Description of the custom Attack Signature. | false | string | "" |  |
| tag | Description of the custom Attack Signature. | false | string | "" |  |
| hasCve | Description of the custom Attack Signature. | false | string | "" |  |
| revision | Description of the custom Attack Signature. | false | string | "" |  |
| accuracy | Accuracy of the custom Attack Signature. | false | string | high | **low**, **medium** or **high** |
| risk | Risk of the custom Attack Signature. | false | string | high | **low**, **medium** or **high** |
| signatureType | Signature Type. | false | string | "" | **request** or **response** |
| isUserDefined | Custom Attack Signatures are often user defined. | false | bool | true |  |
| rule | Description of the custom Attack Signature. | false | string | "" |  |
| keywords | Description of the custom Attack Signature. | false | string | "" |  |
| ^ | Value: rule match. | false | string | "" |  |
| ^ | matchCase: the rule is Case sensitive. | false | bool | true |  |
| ^ | comparison: type of match of the rule. | false | string | string-match | **regexp-does-not-match**, **string-match**, **regexp-match**, **string-does-not-match** |
| ^ | Context of the custom Attack Signature. | false | string | "" | **request**, **response**, **gwt**, **parameter-cookie-contentprofile**, **parameter-cookie**, **json**, **uri-without-query-string**, **xml**, **uri-with-query-string**, **header** |
| matchesWithinCookie | Could it mach within a Cookie? | false | bool | false |  |
| matchesWithinParameter | Could it mach within a Cookie? | false | bool | false |  |
| matchesWithinHeader | Could it mach within a Cookie? | false | bool | false |  |
| matchesWithinUri | Could it mach within a Cookie? | false | bool | false |  |
| matchesWithinXml | Could it mach within a Cookie? | false | bool | false |  |
| matchesWithinJson | Could it mach within a Cookie? | false | bool | false |  |
| matchesWithinPlainText | Could it mach within Plain Text | false | bool | false |  |
| matchesWithinGwt | Could it mach within Gwt? | false | bool | false |  |
| matchesWithinRequest | Could it mach within Request? | false | bool | true |  |
| matchesWithinResponse | Could it mach within Response? | false | bool | false |  |


