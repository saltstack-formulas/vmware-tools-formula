{% if 'VMWare' in grains['virtual'] or 'VMware' in grains['virtual'] %}
{% from "vmware-tools/map.jinja" import config with context %}

include:
  - vmware-tools.{{ config.include }}

{% endif %}
