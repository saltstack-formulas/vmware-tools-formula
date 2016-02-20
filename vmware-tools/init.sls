# Not sure if this is how this should be done.
include:
  - build-essential

gunzip-vmware:
    module.run:
        - name: archive.gunzip
        - gzipfile: {{ pillar.get('vmware.path', '/tmp/') }}VMwareTools-{{ pillar.get('vmware.version', '8.3.12-493255') }}.tar.gz

tar-vmware:
    module.run:
        - name: archive.tar
        - options: xf
        # FIXME: take out tar file name
        - tarfile: {{ pillar.get('vmware.path', '/tmp/') }}VMwareTools-{{ pillar.get('vmware.version', '8.3.12-493255') }}.tar.gz
        - cwd: /tmp/

# extract-vmware:
#   archive:
#     - extracted
#     - name: /tmp/
#     - source: {{ pillar.get('vmware.path', '/tmp/') }}VMwareTools-{{ pillar.get('vmware.version', '8.3.12-493255') }}.tar.gz
#     - source_hash: {{ pillar.get('vmware.path', '/tmp/') }}
#     - tar_options: J
#     - archive_format: tar
#     - if_missing: /tmp/vmware-tools-distrib/

install-vmware-tools:
    cmd.run:
        - cwd: /tmp/vmware-tools-distrib/
        # TODO: Should be quiet
        - quiet: True
        - name: ./vmware-install.pl -d 2>&1

# TODO: Remove build-essentials
vmware-tools:
    service:
        - running
        - enable: True
        - require:
          - sls: build-essential.absent

