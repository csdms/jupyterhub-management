# setup

The variable `OES_HUB`, defined in `/etc/bash.bashrc`,
sets the name of the JupyterHub (e.g., "lab", "jupyter").

* [custom_prompt.sh](./custom_prompt.sh): Place this script in

  `/etc/profile.d/`
  
  to set a custom prompt for all users.

* [login.html](./login.html): This is the custom login page used on CSDMS
  JupyterHub servers that use either FirstUseAuthenticator or GitHubAuthenticator.
  Place this file in
  
  `/opt/tljh/hub/share/jupyterhub/templates`
  
  overwriting the existing file. This hack came from tips in [this
  issue](https://github.com/jupyterhub/jupyterhub/issues/1385).

* [maintenance.html](./maintenance.html): A replacement for [login.html](./login.html)
  during the twice-yearly maintenance periods.
  Rename it to `login.html` and follow the instructions above.

* [403-allowed.html](./403.html): The page a user sees if their GitHub account isn't on the allow list for the Hub. Copy this file to `403.html` in the `templates` directory described above. Use this on the *jupyter* and *frontier* Hubs.

* [403-xsrf-cookie.html](./403.html): The page a user sees if the XSRF cookie from a previous Hub login expired. Copy this file to `403.html` in the `templates` directory described above. Use this on the *explore* Hub.

To set up the common `scratch/` and `data/` directories:

1. Make the directories in `/srv/`:
    ```
    $ ll /srv/
    total 16
    drwxr-xr-x  4 root root             4096 Jul 21  2022 ./
    drwxr-xr-x 19 root root             4096 Jun  3 19:54 ../
    drwxr-xr-x  6 root root             4096 May 16 14:26 data/
    drwxrwsrwx  6 root jupyterhub-users 4096 May 15 17:51 scratch/
    ```

1. Make a symlink to `data/` in `/`:
    ```
    cd /
    sudo ln -s /srv/data .
    ```

1. Make symlinks to `scratch/` and `data/` in `/etc/skel/`.
