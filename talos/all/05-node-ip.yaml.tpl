# vim:ft=yaml
---
apiVersion: v1alpha1
kind: KubeNodeConfig
nodeIP:
  validSubnets:
    - {{ .Node.Data.ipv4.addr }}/32
    {{- with index .Node.Data "ipv6" }}
    - {{ .addr }}/128
    {{- end }}
{{- with index .Node.Data "labels" }}
labels:
  {{- range $k, $v := . }}
  {{ $k }}: {{ $v | quote }}
  {{- end }}
{{- end }}
{{- with index .Node.Data "taints" }}
taints:
  {{- range $k, $v := . }}
  {{ $k }}: {{ $v | quote }}
  {{- end }}
{{- end }}
