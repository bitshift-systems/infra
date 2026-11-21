---
cluster:
  etcd:
    advertisedSubnets:
      - {{ .Node.Data.ipv4.addr }}/32
    extraArgs:
      listen-metrics-urls: http://0.0.0.0:2381
