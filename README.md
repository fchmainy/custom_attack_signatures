# custom_attack_signatures



# How to use it?
You can use it as a module or as is.

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
  ```
      git clone https://github.com/fchmainy/custom_attack_signatures.git
      cd custom_attack_signatures/
  ```     
  3. set the sensitive env variables
  ```
      export TF_VAR_USERNAME="admin"
      export TF_VAR_PASSWORD='DefineYourPassword123'
  ```
  3. Initialize your terraform.auto.tfvars 
  ```
      cp terraform.auto.tfvars.example terraform.auto.tfvars
      vi terraform.auto.tfvars
  ```
  4. Set your input variables
  ```
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
  5. Initialize the directory
  ```
      terraform init
  ```
  5. Test the plan and validate errors
  ```
      terraform plan
  ```
  6. Finally, apply and deploy
  ```
      terraform apply
  ```
  7. When done with everything, don't forget to clean up!
  ```
      terraform destroy
  ```

<!-- markdownlint-disable no-inline-html -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.59.0 |
