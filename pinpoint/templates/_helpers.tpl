{{/*
Form the Zookeeper URL. If zookeeper is installed as part of this chart, use k8s service discovery,
else use user-provided URL
*/}}
{{- define "zookeeper.url" }}
{{- $port := .Values.zookeeper.port | toString }}
{{- if .Values.zookeeper.enabled -}}
{{- printf "%s:%s" (include "zookeeper.fullname" .) $port }}
{{- else -}}
{{ include "common.tplvalues.render" (dict "value" .Values.zookeeper.urlOverride "context" $)  }}
{{- end -}}
{{- end -}}