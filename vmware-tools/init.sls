{% if 'VMWare' in grains['virtual'] or 'VMware' in grains['virtual'] %}
{% from "vmware-tools/map.jinja" import vmware with context %}

include:
  - vmware-tools.{{ vmware.include }}

{% endif %}
