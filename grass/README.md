# GRASS GIS

I've tried three paths for installing GRASS GIS:

1. build from source
1. install OS packages
1. in a conda environment

The first two install GRASS globally on the OS.
The third isolates GRASS in a Python virtual environment.

## Build from source with OS packages (Ubuntu)

These are the steps I took to install GRASS GIS on the *lab* and *jupyter* EarthscapeHub instances.

Start by logging in to the underlying EC2 instance and upgrading the system packages.
```
sudo apt upgrade
```
May have to restart the instance afterward.

Add the [ubuntugis-stable](https://launchpad.net/~ubuntugis/+archive/ubuntu/ppa) channel to the system software sources.
```
sudo add-apt-repository ppa:ubuntugis/ppa
sudo apt update
```

Install the dependent system packages listed in `package.list`.
```
sudo apt install $(awk '{print $1}' package.list)
```

Run `install-grass.sh` to clone and checkout the GRASS GIS v8.3.1 source and run `configure`-`make`-`make install` on it.
```
bash install-grass.sh
```
The install prefix is `/usr/local`.
This installs a headless version of GRASS GIS.
From a shell prompt, run it with with:
```
grass
```

For associated Python and Jupyter Notebook examples,
set up a conda environment with
```
sudo -E mamba create -n grass -c conda-forge --file requirements.txt
```

Activate the environment.
```
source activate grass
```

Create a Jupyter kernel from this environment.
```
sudo -E python -m ipykernel install --name grass --display-name "GRASS GIS" --prefix /opt/tljh/user
```

That's it.

## Install from OS packages (Ubuntu)

I used the following steps to install GRASS on the *explore* EarthscapeHub instance in May 2025.

As above, start by upgrading the system packages.
```
sudo apt upgrade
```

Add the [ubuntugis-stable](https://launchpad.net/~ubuntugis/+archive/ubuntu/ppa) channel to the system software sources.
```
sudo add-apt-repository ppa:ubuntugis/ppa
sudo apt update
```

> [!NOTE]  
> I used the [ubuntugis-unstable](https://launchpad.net/~ubuntugis/+archive/ubuntu/ubuntugis-unstable) PPA on *explore* because noble wasn't on the stable PPA.

Install the GRASS development package with libraries.
```
sudo apt install grass-dev
```

As above, set up a conda environment with dependencies and make a Jupyter kernel.


## Install into a conda environment

Use conda packages to satisfy the dependencies of GRASS GIS.
I've used these instructions successfully on my macOS laptop.

Set up a conda environment.
```
mamba env create --file environment.yml
```

Activate the environment.
```
source activate grass
```

Run the `install-grass.sh` script to clone the GRASS GIS source and configure/make/install it.
```
bash install-grass.sh -p $CONDA_PREFIX
```
This installs a headless version of GRASS GIS into `$CONDA_PREFIX`.
From a shell prompt, run it with with:
```
grass
```

That's it.
