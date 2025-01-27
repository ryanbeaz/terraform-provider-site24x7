terraform {
  # Require Terraform version 0.15.x (recommended)
  required_version = "~> 0.15.0"

  required_providers {
    site24x7 = {
      source  = "site24x7/site24x7"
      # Update the latest version from https://registry.terraform.io/providers/site24x7/site24x7/latest
      version = "0.0.1-beta.12"
    }
  }
}

// Authentication API doc - https://www.site24x7.com/help/api/#authentication
provider "site24x7" {
  // The client ID will be looked up in the SITE24X7_OAUTH2_CLIENT_ID
  // environment variable if the attribute is empty or omitted.
  oauth2_client_id = "<SITE24X7_OAUTH2_CLIENT_ID>"

  // The client secret will be looked up in the SITE24X7_OAUTH2_CLIENT_SECRET
  // environment variable if the attribute is empty or omitted.
  oauth2_client_secret = "<SITE24X7_OAUTH2_CLIENT_SECRET>"

  // The refresh token will be looked up in the SITE24X7_OAUTH2_REFRESH_TOKEN
  // environment variable if the attribute is empty or omitted.
  oauth2_refresh_token = "<SITE24X7_OAUTH2_REFRESH_TOKEN>"

  // Specify the data center from which you have obtained your
  // OAuth client credentials and refresh token. It can be (US/EU/IN/AU/CN).
  data_center = "US"

  // The minimum time to wait in seconds before retrying failed Site24x7 API requests.
  retry_min_wait = 1

  // The maximum time to wait in seconds before retrying failed Site24x7 API
  // requests. This is the upper limit for the wait duration with exponential
  // backoff.
  retry_max_wait = 30

  // Maximum number of Site24x7 API request retries to perform until giving up.
  max_retries = 4

}

resource "site24x7_webhook_integration" "webhook_integration" {
  // (Required) Display name for the WebHook
  name                            = "Test WebHook"
  // (Required) URL to be invoked for action execution
  url                             = "http://example.com"
  // (Required) The amount of time a connection waits to time out.Range 1 - 45
  timeout                         = 30
  // (Required) HTTP Method to access the URL
  // https://www.site24x7.com/help/api/#http_methods
  method                          = "P"
  // (Required) Resource Type associated with this integration
  // https://www.site24x7.com/help/api/#resource_type_constants
  // Monitor Group not supported
  selection_type                  = 2
  // (Required) URL to be invoked from an On-Premise Poller agent
  is_poller_webhook               = false
  // (Optional) Denotes On-Premise Poller ID
  poller                          = "113770000023231022"
  // (Optional) Configuration to send incident parameters while executing the action
  send_incident_parameters        = false
  // (Optional) Configuration to send custom parameters while executing the action
  send_custom_parameters          = true
  // (Optional) Custom parameters to be passed while accessing the URL
  custom_parameters               = "{\"test\":\"abcd\"}"
  // (Optional) Configuration to enable json format for post parameters
  send_in_json_format             = true
  // (Optional) Authentication method to access the action url.
  // https://www.site24x7.com/help/api/#auth_method
  auth_method                     = "B"
  // (Optional) Username for Authentication
  username                        = "username"
  // (Optional) Password for Authentication
  password                        = "password"
  // (Optional) Provider ID of the OAuth Provider to be associated with the action
  // https://www.site24x7.com/help/api/#list-oauth-providers
  oauth2_provider                 = "113770000023231001"
  // (Optional) User Agent to be used while monitoring the website
  user_agent                      = "Mozilla"
  // (Optional) Monitors associated with the integration
  monitors                        = ["756"]
  // (Required) Configuration to handle ticketing based integration
  manage_tickets                  = false
  // (Optional) URL to be invoked to update the request
  update_url                      = "http://test.tld"
  // (Optional) HTTP Method to access the URL
  // https://www.site24x7.com/help/api/#http_methods
  update_method                   = "P"
  // (Optional) Configuration to send incident parameters while executing the action
  update_send_incident_parameters = false
  // (Optional) Configuration to send custom parameters while executing the action
  update_send_custom_parameters   = false
  // (Optional) When update_send_custom_parameters is set as true.Custom parameters to be passed while accessing the URL
  update_custom_parameters        = "param=value"
  // (Optional) URL to be invoked to close the request
  close_url                       = "http://test.tld"
  // (Optional) HTTP Method to access the URL
  // https://www.site24x7.com/help/api/#http_methods
  close_method                    = "P"
  // (Optional) Configuration to send incident parameters while executing the action
  close_send_incident_parameters  = false
  // (Optional) Configuration to send custom parameters while executing the action
  close_send_custom_parameters    = false
  // (Optional) When close_send_custom_parameters is set as true.Custom parameters to be passed while accessing the URL
  close_custom_parameters         = "param=value"
  // (Optional) List of tag IDs to be associated with the integration
  alert_tags_id                   = ["123"]
}