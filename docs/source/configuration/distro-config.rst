Distribution Configuration
==========================

The layer provides a custom distribution configuration in ``conf/distro/seabot.conf``.

Include Files:
---------------

.. list-table::
   :header-rows: 1

   * - File
     - Description
   * - ``host-build-machine-conf.inc``
     - Host machine build configuration
   * - ``seabot-base.inc``
     - Base distribution settings
   * - ``seabot-global-conf.inc``
     - Global configuration variables
   * - ``seabot-sdk.inc``
     - SDK-specific settings
   * - ``seabot-user.inc``
     - User management settings

Configuration Variables:
------------------------

.. code-block:: none

   # Example from seabot-global-conf.inc
   PREFERRED_PROVIDER_virtual/kernel = "linux-jammy-nvidia-tegra"