variable "custom_attack_type" {
  type = string
}


variable "available_attack_types" {
  type = map(string)
  default = {

    "GraphQL Parser Attack"                = "4OaFWV3bBs9ZhHfIPNnesw"
    "Server-Side Template Injection"       = "Wi4K-OYJXdLYI0Ai9i6oDA"
    "Insecure File Upload"                 = "LcTOmfD2OfKZxxRBrqPlgA"
    "NoSQL Injection"                      = "ZySyewknn_WggNdTaPnmkg"
    "Insecure Deserialization"             = "aUftbIZ_YVuGjf-DrkuY4A"
    "XML External Entities (XXE)"          = "S3tHDE0bXkoM5ytkykxKHw"
    "Server-Side Request Forgery (SSRF)"   = "AIPrYoCG9m83dlswlWYWHQ"
    "Cache Poisoning"                      = "EndHpZiIDwHusWtKLvL28g"
    "WebSocket Parser Attack"              = "9ru3ED5Jw1bwCEB4irbZbA"
    "GWT Parser Attack"                    = "di_UV_kiz2Kjf1nv6nZFUQ"
    "Cross-site Request Forgery"           = "_ORDhC_SbI9QNEOpXiYbSg"
    "JSON Parser Attack"                   = "3ADXrhZIrE9nhfyPPN4tPg"
    "Malicious File Upload"                = "Iral_tbLPskGQ_XeHv_9aQ"
    "Web Scraping"                         = "G3mwfHhGYHGMeO1Yp_c3Tg"
    "HTTP Response Splitting"              = "-CYMSgFRysows6qg-RkjUw"
    "Session Hijacking"                    = "ZnQyw3_Y8GIUuV9gt8NLCw"
    "XML Parser Attack"                    = "XS9bU3md1Ce0Uf2ozNe8cQ"
    "Parameter Tampering"                  = "lcWl9Dj_eSGwXbrj9epVJQ"
    "Injection Attempt"                    = "9NwF1hQ3cHekmYVly24QRQ"
    "Brute Force Attack"                   = "7ujQfnp2DnDUErIxzStVoQ"
    "Forceful Browsing"                    = "43rxhPl-82kb4yHfTEjfGQ"
    "HTTP Request Smuggling Attack"        = "ltXQ37eBUaUrr9YHnJMc7A"
    "HTTP Parser Attack"                   = "HnpmaQ5rPpEPr4mhJgaaqw"
    "Other Application Activity"           = "-iU8w4eZi3MTE6fgzX4DEg"
    "Denial of Service"                    = "cR0FGnwNtwyhCLgEqlMZrA"
    "Cross Site Scripting (XSS)"           = "MFsWvSAV_Z5j1vSkR0hnXg"
    "SQL-Injection"                        = "hemWDLSEGYEf7qbxPE5hsw"
    "Command Execution"                    = "j0Tz_I-5yKUmvGlePjbjzA"
    "Server Side Code Injection"           = "bPdfd8J74YS0zJeATrXJEA"
    "LDAP Injection"                       = "qiTCm8HcupTAtQCwjUrzJg"
    "XPath Injection"                      = "0hTSgJ4vI1rydERmSArxgw"
    "Path Traversal"                       = "lFAA7-6kAJTJr10CRPd7XA"
    "Directory Indexing"                   = "6f0yekwGg34CzIKvPZwHSg"
    "Information Leakage"                  = "1DsOkn6MTcm3RAj6BJWfJg"
    "Predictable Resource Location"        = "E3wKhtjWWYh_zzGmlF_GHQ"
    "Buffer Overflow"                      = "B3HVSe6nB0eoOKQEeFXBJg"
    "Authentication/Authorization Attacks" = "m2ObMAg9yOVlP5GYaIZOfQ"
    "Abuse of Functionality"               = "ZaSem-D_13W-D3PCOByRuw"
    "Vulnerability Scan"                   = "JS-sALk-MfHAndr4TVQBYg"
    "Detection Evasion"                    = "CdlqS-GlMoFdQYr5VfSJDg"
    "Trojan/Backdoor/Spyware"              = "48tjyUZAfrvScWZvyg9yLw"
    "Other Application Attacks"            = "HgiC5vtNTMgDoIldHkf6Ag"
    "Non-browser Client"                   = "ufg0smEkZrpmkoDHfSPGdQ"
    "Remote File Include"                  = "9yL3q5_pO0E3pK1Uz9x2cw"
  }
}
