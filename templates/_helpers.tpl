{{- define "crate.clusterName" }}
  {{- if $n := .Values.crate.clusterName }}
    {{- $n }}
  {{- else }}
    {{- .Values.app }}
  {{- end }}
{{- end }}

{{- define "crate.initialMasterNodes" }}
  {{- range $i := until (int .Values.crate.numberOfNodes) -}}
    {{- if $i }},{{ end }}crate-{{ $i -}}
  {{- end }}
{{- end }}

{{- define "crate.recoverAfterNodes" }}
  {{- if $r := .Values.crate.recoverAfterNodes }}
    {{- $r }}
  {{- else }}
    {{- div .Values.crate.numberOfNodes 2 | floor | add 1 }}
  {{- end }}
{{- end }}

{{- define "cratedb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cratedb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cratedb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cratedb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cratedb.labels" -}}
helm.sh/chart: {{ include "cratedb.chart" . }}
{{ include "cratedb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}