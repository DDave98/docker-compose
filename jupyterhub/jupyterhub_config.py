c = get_config()

c.JupyterHub.bind_url = "http://0.0.0.0:8000"

# jednoduchá autentizace pro výuku
c.JupyterHub.authenticator_class = "jupyterhub.auth.DummyAuthenticator"
c.DummyAuthenticator.password = "student"

# admin
c.Authenticator.admin_users = {"teacher"}

# spawner
c.JupyterHub.spawner_class = "simple"

# notebook
c.Spawner.default_url = "/lab"
