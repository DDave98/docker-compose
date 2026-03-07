from jupyterhub.auth import DummyAuthenticator
from dockerspawner import DockerSpawner

c = get_config()

# jednoduché přihlašování
c.JupyterHub.authenticator_class = DummyAuthenticator
c.DummyAuthenticator.password = "student"

# každý student dostane vlastní container
c.JupyterHub.spawner_class = DockerSpawner

c.DockerSpawner.image = "jupyter/minimal-notebook:python-3.11"

c.DockerSpawner.volumes = {
    "jupyterhub-user-{username}": "/home/jovyan/work",
    "/srv/shared": "/home/jovyan/shared"
}

c.JupyterHub.bind_url = "http://0.0.0.0:8000"
