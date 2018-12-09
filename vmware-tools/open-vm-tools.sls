{% from "vmware-tools/map.jinja" import vmware with context %}
package-install-open-vm-tools:
  pkg.installed:
    - pkgs:
      - {{ vmware.package }}

service-open-vm-tools:
  service.running:
    - name: {{ vmware.service }}
    - enable: True
