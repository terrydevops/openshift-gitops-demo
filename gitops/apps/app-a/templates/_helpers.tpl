{{- define "app-a.labels" -}}
app.kubernetes.io/part-of: app-a
app.kubernetes.io/managed-by: argocd
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/* webapp image: internal-registry ImageStream when build.enabled, else the pre-built image */}}
{{- define "app-a.webappImage" -}}
{{- if .Values.build.enabled -}}
image-registry.openshift-image-registry.svc:5000/{{ .Release.Namespace }}/{{ .Values.app.name }}:latest
{{- else -}}
{{ .Values.image.repository }}:{{ .Values.image.tag }}
{{- end -}}
{{- end -}}
