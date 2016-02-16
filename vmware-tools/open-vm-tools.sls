package-install-open-vm-tools:
  pkg.installed:
    - pkgs:
      - open-vm-tools

service-open-vm-tools:
  service.running:
    - name: vmtoolsd
    - enable: True
