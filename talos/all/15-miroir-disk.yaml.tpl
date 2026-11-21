{{- if index .Node.Data "miroirDisk" }}
---
# The additional OVH disk, partitioned whole for the miroir lvmthin pool
# (/dev/disk/by-partlabel/r-miroir).
apiVersion: v1alpha1
kind: RawVolumeConfig
name: miroir
provisioning:
  diskSelector:
    match: disk.transport == "virtio" && !system_disk
  maxSize: 100%
{{- end }}
