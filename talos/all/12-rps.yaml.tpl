{{- with index .Node.Data "rpsCpus" }}
---
# OVH VPS virtio NICs have a single rx queue; spread receive processing with
# RPS/RFS per Documentation/networking/scaling.rst.
apiVersion: v1alpha1
kind: SysctlConfig
params:
  net.core.rps_sock_flow_entries: "65536"
---
apiVersion: v1alpha1
kind: SysfsConfig
params:
  class.net.eth0.queues.rx-0.rps_cpus: "{{ . }}"
  class.net.eth0.queues.rx-0.rps_flow_cnt: "65536"
{{- end }}
