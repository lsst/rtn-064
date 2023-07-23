"""Sphinx configuration.

To learn more about the Sphinx configuration for technotes, and how to
customize it, see:

https://documenteer.lsst.io/technotes/configuration.html
"""

from documenteer.conf.technote import *  # noqa: F401, F403

from documenteer.sphinxconfig.technoteconf import configure_technote

html_logo = '_static/rubin_logo.png'

