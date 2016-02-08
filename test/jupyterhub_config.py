# use the sudo spawner
import logging
c.JupyterHub.log_level = logging.DEBUG
c.JupyterHub.spawner_class = 'sudospawner.SudoSpawner'
c.SudoSpawner.debug_mediator = True
