{% from "vmware-tools/map.jinja" import config with context %}
package-install-open-vm-tools:
  pkg.installed:
    - pkgs:
      - {{ config.package }}

service-open-vm-tools:
  service.running:
    - name: {{ config.service }}
    - enable: True
