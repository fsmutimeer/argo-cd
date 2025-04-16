{{/* vim: set filetype=mustache: */}}
{{/*
Create the name of the service account
*/}}
{{- define "quarkusapp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "quarkusapp.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "quarkusapp.labels" -}}
helm.sh/chart: {{ include "quarkusapp.chart" . }}
{{ include "quarkusapp.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "quarkusapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "quarkusapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}