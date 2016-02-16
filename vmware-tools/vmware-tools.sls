{% from "vmware-tools/map.jinja" import vmware with context %}
remove-previous-vmware-versions:
  cmd.run:
    - name: rm VMwareTools*
    - cwd: /root/
    - prereq:
      - file: /root/{{ vmware.latest }}
    - onlyif: ls VMwareTools*

/root/{{ vmware.latest }}:
  file.managed:
    - source: {{ vmware.source }}
    - source_hash: {{ vmware.hash }}
    - user: root
    - group: root

remove-/root/vmware-tools-distrib:
 file.absent:
    - name: /root/vmware-tools-distrib
    - onchanges:
      - file: /root/{{ vmware.latest }}
    - onlyif: ls /root/vmware-tools-distrib

command-untar-{{ vmware.latest }}:
  cmd.run:
    - name: tar -xf /root/{{ vmware.latest }}
    - cwd: /root/
    - onchanges:
      - file: /root/{{ vmware.latest }}

command-upgrade-vmware-tools:
  cmd.run:
    - name: ./vmware-install.pl -d
    - cwd: /root/vmware-tools-distrib/
    - output_loglevel: quiet
    - onchanges:
      - file: /root/{{ vmware.latest }}
    - onlyif: ls /root/vmware-tools-distrib/vmware-install.pl

{% if salt['file.directory_exists' ]('/root/vmware-tools-distrib/') %}
command-reinit-vmware-tools:
  cmd.run:
    - name: ./vmware-install.pl -d
    - cwd: /root/vmware-tools-distrib/
    - output_loglevel: quiet
    - unless: initctl list |grep vmware |grep running
{% endif %}
