================
vmware-tools-formula
================

A saltstack formula that can be used to setup vmware-tools or open-vm-tools on RHEL and Debian based systems.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``vmware-tools``
------------

Installs the vmware-tools or open-vm-tools package based on OS version and then starts the associated service.
If running on RHEL/CentOS 6 the latest vmware-tools tar.gz will be pulled in from a local webserver.
The tarball will be extracted and the install started.
