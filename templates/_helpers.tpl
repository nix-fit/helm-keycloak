{{/*
Name, labels and annotations
*/}}
{{- define "kc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "kc.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "kc.name" . -}}
{{- end -}}
{{- end }}

{{- define "kc.labels" -}}
app.kubernetes.io/name: {{ include "kc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "kc.annotations" -}}
prometheus.io/scrape: "true"
prometheus.io/path: "/metrics"
prometheus.io/port: "{{ .Values.service.managementPort }}"
{{- end }}

{{/*
Default PodSecurityContext (used if .Values.podSecurityContext is empty)
*/}}
{{- define "kc.defaults.podSecurityContext" -}}
fsGroup: 10001
fsGroupChangePolicy: OnRootMismatch
seccompProfile:
  type: RuntimeDefault
runAsUser: 10001
runAsGroup: 10001
runAsNonRoot: true
{{- end }}

{{/*
Default ContainerSecurityContext (used if .Values.containerSecurityContext is empty)
*/}}
{{- define "kc.defaults.containerSecurityContext" -}}
allowPrivilegeEscalation: false
readOnlyRootFilesystem: true
capabilities:
  drop: ["ALL"]
{{- end }}

{{/*
Render env from secrets (admin/db) if provided
*/}}
{{- define "kc.envFromSecrets" -}}
{{- with .Values.secrets.env.admin }}
- name: KC_BOOTSTRAP_ADMIN_USERNAME
  valueFrom:
    secretKeyRef:
      name: {{ include "kc.fullname" $ }}-admin-env
      key: KC_BOOTSTRAP_ADMIN_USERNAME
- name: KC_BOOTSTRAP_ADMIN_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "kc.fullname" $ }}-admin-env
      key: KC_BOOTSTRAP_ADMIN_PASSWORD
{{- end }}
{{- with .Values.secrets.env.db }}
- name: KC_DB_USERNAME
  valueFrom:
    secretKeyRef:
      name: {{ include "kc.fullname" $ }}-db-env
      key: KC_DB_USERNAME
- name: KC_DB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "kc.fullname" $ }}-db-env
      key: KC_DB_PASSWORD
{{- end }}
{{- end }}

{{/*
Render env from values (camelCase -> upper snakeCase)
*/}}
{{- define "kc.envFromValues" -}}
{{- range $k, $v := .Values.env }}
- name: {{ $k | snakecase | upper }}
  value: {{ $v | quote }}
{{- end }}
{{- end }}
