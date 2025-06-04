{{/*
Expand the name of the chart.
*/}}
{{- define "tlm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tlm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tlm.labels" -}}
helm.sh/chart: {{ include "tlm.chart" . }}
{{ include "tlm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tlm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tlm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
