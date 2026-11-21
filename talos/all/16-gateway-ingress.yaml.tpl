{{- if index .Node.Data "gatewayIngress" }}
# A gateway listens on this node's addresses.
apiVersion: v1alpha1
kind: NetworkRuleConfig
name: gateway-tcp-ingress
portSelector:
  ports:
    - 22
    - 80
    - 443
    - 2222
  protocol: tcp
ingress:
  - subnet: 0.0.0.0/0
  - subnet: ::/0
---
apiVersion: v1alpha1
kind: NetworkRuleConfig
name: gateway-udp-ingress
portSelector:
  ports:
    - 443
  protocol: udp
ingress:
  - subnet: 0.0.0.0/0
  - subnet: ::/0
{{- end }}
