# keycloak

![Version: 1.2.0](https://img.shields.io/badge/Version-1.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 26.3.4](https://img.shields.io/badge/AppVersion-26.3.4-informational?style=flat-square)

## Description

Keycloak - the open source identity and access management solution

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Dmitrii Bogomolnyi | <nex1gen@yandex.ru> | <https://github.com/nex1gen> |

## Values

Example values.yaml

```yaml
---

ingress:
  enabled: true
  host: keycloak-ingress-nginx.host
  tlsSecretName: keycloak-ingress-nginx-tls

app:
  env:
    KC_HOSTNAME: keycloak-ingress-nginx.host
    KC_DB_URL: jdbc:postgresql://postgres.host:5432/keycloak_db?sslmode=verify-full&sslrootcert=/etc/ssl/db-ca.crt
```

## Contribute

Don't forget to generate every time actual README.md:

```bash
helm-docs --template-files=README.md.gotmpl
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| annotations.ingress.certManager.clusterIssuer | string | `"letsencrypt-prod"` | cert manager cluster issuer |
| annotations.statefulset.prometheus.path | string | `"/metrics"` | prometheus metrics path |
| annotations.statefulset.prometheus.port | string | `"9000"` | prometheus metrics port |
| annotations.statefulset.prometheus.scrape | string | `"true"` | prometheus scrape enabled |
| app.env.KC_CACHE | string | `"ispn"` | keycloak cache mechanism (only ispn for production) |
| app.env.KC_DB | string | `"postgres"` | keycloak database driver type |
| app.env.KC_HEALTH_ENABLED | string | `"true"` | keycloak enable health endpoints |
| app.env.KC_HOSTNAME_STRICT | string | `"true"` | keycloak strict hostname |
| app.env.KC_HTTP_ENABLED | string | `"true"` | keycloak enable http |
| app.env.KC_METRICS_ENABLED | string | `"true"` | keycloak enable metrics endpoint |
| app.env.KC_PROXY_HEADERS | string | `"xforwarded"` | keycloak proxy headers to accept |
| app.secrets.certificates | string | `nil` | app secrets certificates (store them in sops encrypted file) |
| app.secrets.certificatesMountDir | string | `"/etc/ssl"` | app secrets certificates mount directory |
| app.secrets.env | string | `nil` | app secrets env (store them in sops encrypted file) |
| gateway.enabled | bool | `false` | gateway enabled |
| gateway.httpRoute.filters.responseHeaderModifier.set | list | `[{"name":"Content-Security-Policy","value":"frame-src 'self'; frame-ancestors 'self'; object-src 'none';"},{"name":"Referrer-Policy","value":"no-referrer"},{"name":"Strict-Transport-Security","value":"max-age=31536000; includeSubDomains"},{"name":"X-Content-Type-Options","value":"nosniff"},{"name":"X-Frame-Options","value":"SAMEORIGIN"}]` | response header modifier filter set (override headers values) |
| gateway.httpRoute.host | string | `""` | httproute hostname |
| gateway.name | string | `"envoy-gateway"` | gateway object name |
| gateway.namespace | string | `"envoy-gateway-system"` | gateway object namespace |
| image.digest | string | `"sha256:5838c6e0bd64e8d0f2285bcb12ad65a460d1512a94faf044c6b0a875accc619a"` | image digest |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.registry | string | `"nix-docker.registry.twcstorage.ru"` | image registry |
| image.repository | string | `"infra/auth/keycloak"` | image repository |
| image.tag | string | `"26.3.4"` | image tag |
| ingress.className | string | `"nginx"` | ingress class name |
| ingress.enabled | bool | `false` | open access to app outside cluster via ingress |
| ingress.host | string | `""` | ingress host |
| ingress.tlsSecretName | string | `""` | ingress tls secret name (where to store signed certificate from Let's Encrypt) |
| podDisruptionBudget.maxUnavailable | int | `1` | pod disruption budget max unavailable |
| probes.liveness.failureThreshold | int | `5` | liveness probe max consecutive failures before restart |
| probes.liveness.initialDelaySeconds | int | `60` | liveness probe initial delay |
| probes.liveness.path | string | `"/health/live"` | liveness probe path |
| probes.liveness.periodSeconds | int | `5` | liveness probe period |
| probes.liveness.timeoutSeconds | int | `1` | liveness probe timeout per attempt |
| probes.readiness.failureThreshold | int | `5` | readiness probe max consecutive failures before unready |
| probes.readiness.initialDelaySeconds | int | `60` | readiness probe inital delay |
| probes.readiness.path | string | `"/health/ready"` | readiness probe path |
| probes.readiness.periodSeconds | int | `5` | readiness probe period |
| probes.readiness.timeoutSeconds | int | `1` | readiness probe timeout per attempt |
| replicaCount | int | `2` | replica count |
| resources.limits.cpu | string | `"1000m"` | cpu limits |
| resources.limits.ephemeral-storage | string | `"512Mi"` | ephemeral storage limits |
| resources.limits.memory | string | `"1Gi"` |  |
| resources.requests.cpu | string | `"250m"` | cpu requests |
| resources.requests.ephemeral-storage | string | `"256Mi"` | ephemeral storage requests |
| resources.requests.memory | string | `"512Mi"` | memory requests |
| service.managementPort | int | `9000` | management port (health, metrics) |
| service.port | int | `8080` | service port (app) |
| serviceAccount.automountServiceAccountToken | bool | `false` | service account auto mount token |
| serviceAccount.name | string | `"keycloak"` | service account name |
| updateStrategy.type | string | `"RollingUpdate"` | update strategy type |
