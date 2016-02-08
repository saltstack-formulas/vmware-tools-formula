{% if 'VMWare' in grains['virtual'] or 'VMware' in grains['virtual'] %}
{% from "vmware-tools/map.jinja" import include_file with context %}

include:
  - vmware-tools.{{ include_file.include }}

{% endif %}
