# vim:ft=yaml
---
customization:
  extraKernelArgs:
    - net.ifnames=0
  meta:
    - key: 10
      value: |
        addresses:
          - address: {{ .Node.Data.ipv4.addr }}/32
            linkName: eth0
            family: inet4
            scope: global
            flags: permanent
            layer: platform
          - address: {{ .Node.Data.ipv6.addr }}/128
            linkName: eth0
            family: inet6
            scope: global
            flags: permanent
            layer: platform
        links:
          - name: eth0
            up: true
            layer: platform
        routes:
          - family: inet4
            dst: {{ .Node.Data.ipv4.gateway }}/32
            outLinkName: eth0
            table: main
            scope: link
            type: unicast
            protocol: static
            priority: 1024
            layer: platform
          - family: inet4
            gateway: {{ .Node.Data.ipv4.gateway }}
            outLinkName: eth0
            table: main
            scope: global
            type: unicast
            protocol: static
            priority: 1024
            layer: platform
          - family: inet6
            dst: {{ .Node.Data.ipv6.gateway }}/128
            outLinkName: eth0
            table: main
            scope: link
            type: unicast
            protocol: static
            priority: 2048
            layer: platform
          - family: inet6
            gateway: {{ .Node.Data.ipv6.gateway }}
            outLinkName: eth0
            table: main
            scope: global
            type: unicast
            protocol: static
            priority: 2048
            layer: platform
        resolvers:
          - dnsServers:
              {{- range (index .Node.Data "dns" | default (list "213.186.33.99" "1.1.1.1")) }}
              - {{ . }}
              {{- end }}
            layer: platform
  systemExtensions:
    officialExtensions:
      - siderolabs/qemu-guest-agent
      - siderolabs/drbd
      - siderolabs/binfmt-misc
