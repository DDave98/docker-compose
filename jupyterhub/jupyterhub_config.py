import os
from dockerspawner import DockerSpawner

c = get_config()

c.JupyterHub.spawner_class = DockerSpawner

c.DockerSpawner.image = os.environ["DOCKER_JUPYTER_IMAGE"]

c.DockerSpawner.network_name = os.environ["DOCKER_NETWORK_NAME"]

c.DockerSpawner.notebook_dir = "/home/jovyan/work"

c.JupyterHub.hub_ip = "0.0.0.0"
c.JupyterHub.hub_port = 8000

# jednoduchý login pro výuku
c.JupyterHub.authenticator_class = "jupyterhub.auth.DummyAuthenticator"

c.DummyAuthenticator.password = "student"

c.Authenticator.admin_users = {"teacher"}
