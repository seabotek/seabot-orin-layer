Image Recipes
=============

Core Image Configuration
------------------------

The layer provides several image configuration files:

image-seabot.bb
---------------
Main image recipe that includes base configurations.

Include Files:
- ``image-seabot-base.inc``: Base image configuration
- ``network-config.inc``: Network configuration
- ``seabot-acceleration.inc``: Hardware acceleration
- ``seabot-extrausers.inc``: User management
- ``seabot-pkg-conf-base.inc``: Package configuration
- ``seabot-power-manager.inc``: Power management
- ``seabot-tools.inc``: Development tools
- ``usb-ethernet.inc``: USB Ethernet support
- ``virtualization.inc``: Virtualization support

Example usage:

.. code-block:: bash

   bitbake image-seabot