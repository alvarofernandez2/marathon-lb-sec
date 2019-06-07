@rest
Feature: [QATM-2113] Vault Renewal Token

  Scenario:[01] Obtain info from bootstrap
    Given I open a ssh connection to '${BOOTSTRAP_IP}' with user '${REMOTE_USER}' using pem file '${PEM_FILE_PATH}'
    Then I obtain basic information from bootstrap

  Scenario:[02] Check Vault path by default
    Given I run 'curl -X GET -fskL --tlsv1.2 -H "X-Vault-Token:!{VAULT_TOKEN}" "https://!{EOS_VAULT_HOST}:${EOS_VAULT_PORT}/v1/${VAULT_USERLAND_CERTIFICATE_BASE_PATH:-userland/certificates/}marathon-lb" | jq '.data."marathon-lb_crt"'' locally
    And I run 'curl -X GET -fskL --tlsv1.2 -H "X-Vault-Token:!{VAULT_TOKEN}" "https://!{EOS_VAULT_HOST}:${EOS_VAULT_PORT}/v1/${VAULT_USERLAND_CERTIFICATE_BASE_PATH:-userland/certificates/}marathon-lb" | jq '.data."marathon-lb_key"'' locally