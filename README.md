# keycloak

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 26.3.4](https://img.shields.io/badge/AppVersion-26.3.4-informational?style=flat-square)

## Description

Keycloak installation

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Dmitrii Bogomolnyi | <nex1gen@yandex.ru> | <https://github.com/nex1gen> |

## Values

Example dev.values.yaml

```yaml
---

ingress:
  enabled: true
  host: keycloak-ingress-nginx.host
  tlsSecretName: keycloak-ingress-nginx-tls

env:
  kcHostname: keycloak-ingress-nginx.host
  kcDbUrl: jdbc:postgresql://postgres.host:5432/keycloak_db?sslmode=verify-full&sslrootcert=/etc/ssl/db/ca.crt

```

## Contribute

Don't forget to generate every time actual README.md:

```bash
helm-docs --skip-version-footer --template-files=README.md.gotmpl
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admin.secretName | string | `"keycloak-admin-credentials"` | secret name with admin user credentials |
| containerSecurityContext | object | `{}` | container security context overrides |
| db.secretName | string | `"keycloak-db-credentials"` | secret name with database user credentials |
| db.ssl.caSecretKey | string | `"ca.crt"` | key in the secret for ca certificate |
| db.ssl.caSecretMountPath | string | `"/etc/ssl/db/ca.crt"` | secret mount path |
| db.ssl.caSecretName | string | `"keycloak-db-ssl-ca"` | secret name containing ca certificate |
| db.ssl.enabled | bool | `true` | enable mounting ca certificate for tls database connection |
| env.kcCache | string | `"ispn"` | keycloak cache mechanism (only ispn for production) |
| env.kcDb | string | `"postgres"` | keycloak database driver type |
| env.kcHealthEnabled | string | `"true"` | keycloak enable health endpoints |
| env.kcHostnameStrict | string | `"true"` | keycloak strict hostname |
| env.kcHttpEnabled | string | `"true"` | keycloak enable http |
| env.kcMetricsEnabled | string | `"true"` | keycloak enable metrics endpoint |
| env.kcProxyHeaders | string | `"xforwarded"` | keycloak proxy headers to accept |
| image.digest | string | `"sha256:5838c6e0bd64e8d0f2285bcb12ad65a460d1512a94faf044c6b0a875accc619a"` | image digest |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.registry | string | `"nix-docker.registry.twcstorage.ru"` | image registry |
| image.repository | string | `"keycloak/keycloak"` | image repository |
| image.tag | string | `"26.3.4"` | image tag |
| ingress.adminPath | string | `""` | ingress custom path |
| ingress.annotations."cert-manager.io/cluster-issuer" | string | `"letsencrypt-prod"` | cert manager cluster issuer for signing ssl certificates |
| ingress.annotations."nginx.ingress.kubernetes.io/hsts" | string | `"true"` | ingress add strict transport secirity header to response |
| ingress.annotations."nginx.ingress.kubernetes.io/hsts-max-age" | string | `"31536000"` | ingress strict transport secirity header max age |
| ingress.annotations."nginx.ingress.kubernetes.io/ssl-redirect" | string | `"true"` | ingress redirect from http to https |
| ingress.className | string | `"nginx"` | ingress class name |
| ingress.enabled | bool | `false` | open access to keycloak outside cluster |
| ingress.host | string | `""` | ingress host |
| ingress.tlsSecretName | string | `""` | ingress tls secret name |
| podSecurityContext | object | `{}` | pod security context overrides |
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
| resources.limits.memory | string | `"1Gi"` |  |
| resources.requests.cpu | string | `"250m"` | cpu requests |
| resources.requests.memory | string | `"512Mi"` | memory requests |
| service.headlessName | string | `"keycloak-headless"` | headless service name |
| service.managementPort | int | `9000` | management port (health, metrics) |
| service.name | string | `"keycloak"` | service name |
| service.port | int | `8080` | service port (app) |
| serviceAccount.automountServiceAccountToken | bool | `false` | service account auto mount token |
| serviceAccount.name | string | `"keycloak"` | service account name |
| updateStrategy.type | string | `"RollingUpdate"` | update strategy type |
