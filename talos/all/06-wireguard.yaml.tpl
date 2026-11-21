# vim:ft=yaml
{{- $key := env (printf "WG_%s_PRIVATE_KEY" (upper .Node.Host)) }}
{{- if not $key }}{{ fail (printf "WG_%s_PRIVATE_KEY is not set" (upper .Node.Host)) }}{{ end -}}
---
apiVersion: v1alpha1
kind: WireguardConfig
name: wg0
privateKey: {{ $key }}
listenPort: 51821
up: true
addresses:
  - address: {{ .Node.Data.ipv4.wgAddr }}/24
  - address: {{ .Node.Data.ipv6.wgAddr }}/64
peers:
  - publicKey: vKz+v75M8FHF781BPOvUHTZbeTQmLpURwNMJPadYyl0=
    allowedIPs:
      - 10.42.43.2/32
      - fd42:43::2/128
