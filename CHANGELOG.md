# Changelog

## 0.8.0 (upcoming)

* [EOS-3882] Include dcos-spartan/net resolvers in default template

## 0.7.0-62c453c (Built: June 01, 2020 | Released: June 19, 2020)

* Change Anchore policy
* [EOS-3590] Fix Vault token renewal

## 0.6.0-458dce6 (Built: January 14, 2020 | Released: January 27, 2020)

* [EOS-3126] Fix PyJWT vulnerability
* [EOS-3126] Fix and activate Anchore tests

## 0.5.0-96093b8 (Built: October 03, 2019 | Released: November 18, 2019)

* [EOS-3031] Bump kms_utils to version 0.4.6
* [EOS-2970] Treat HAPROXY_RSYSLOG as a boolean parameter
* [EOS-2939] Update error message for Marathon-LB default certificate
* Improve exception handling and logging
* [EOS-2913] Replace healthchecking lua mechanism
* [EOS-2879] Bump HAproxy to 2.0.5 and enable metrics endpoint

## 0.4.0-aa77ef6 (Built: July 02, 2019 | Released: July 04, 2019)

* [EOS-2578] Fold all certifiates, keys and CAs to files with lines of length 64
* [EOS-2579] Download certs only when an app's backends increase from 0 and the cert is not already present 
* [EOS-2425] Error when logging app id of not found Vault cert 
* [EOS-2395] New label in marathon-lb to specify certs location
* Adapt repo to new versioning flow
* [EOS-1819] Download certificates only of new deployed apps
* [EOS-1817] Look for marathon-lb own cert following multitenant convention, fall back to "default" path if not found
* [EOS-1825] Fix logger in haproxy_wrapper.py
* [EOS-1816] Add new thread to renew vault token and fix token expire_time calculation
* [EOS-1810] Include checking vault token state in healthcheck
* Fix curl dependency and gpg keyserver in Dockerfile
* [EOS-1074] Fix to tcplog format in tcp backends
* Fix isolate failed backends when regenerating config

## 0.3.1 (March 06, 2018)

* [EOS-1074] Fix to tcplog format in tcp backends
* Fix isolate failed backends when regenerating config

## 0.3.0 (February 20, 2018)

* [EOS-987] Marathon-lb-sec logging format should comply with standard
* [EOS-987] Included b-log version 0.4.0
* [EOS-987] Python, bash, and HAproxy with standard centralized log format
* [EOS-1023] Bug fixing with dead connections to Vault
* [EOS-1038] Output marathon-lb-sec logs to stdout
* [EOS-1067] Ensure the default marathon-lb certificate to be present by SNI if there's no certificate for the concrete app
* [EOS-1068] Updated kms_utils version to 0.4.0
* [EOS-1069] Add CA-bundle to the container
* Add iptables rules in position 2 if a calico rule is present
* Updated Marathon-LB main version v1.11.3
* Bug fixing with race conditions

## 0.2.0 (December 19, 2017)

* [EOS-852] Expose certificates per app
* Python kms_utils wrapper
* Updated kms_utils version to 0.3.0

## 0.1.0 (November 22, 2017)

* [EOS-568] Implement dynamic authentication in Marathon-lb entrypoint
* Marathon-LB main version v1.10.3
