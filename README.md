```
     _            _                        _            _        _ 
  __| | ___   ___| | _____ _ __      _ __ (_)_   _____ | |_ __ _| |
 / _` |/ _ \ / __| |/ / _ \ '__|____| '_ \| \ \ / / _ \| __/ _` | |
| (_| | (_) | (__|   <  __/ | |_____| |_) | |\ V / (_) | || (_| | |
 \__,_|\___/ \___|_|\_\___|_|       | .__/|_| \_/ \___/ \__\__,_|_|
                                    |_|                            

```

# about
I mostly use this docker image with [concourse](https://concourse-ci.org/) pipelines.

# build

![](https://api.travis-ci.com/bzhtux/docker-pivotal.svg?branch=master)

# supported versions

Pivotal docker image provides the following cli tools:

 * BOSH: **6.4.1**
 * FLY: **6.7.5**
 * OM: **7.2.0**
 * BBR: **1.9.1**
 * CREDHUB: **2.9.1-beta.9**


# download

Latest release:

```shell
$ docker pull bzhtux/pivotal:0.0.10
```

For other/old releases:

```shell
$ docker pull bzhtux/pivotal:${tag}
```

[docker hub](https://hub.docker.com/repository/docker/bzhtux/pivotal/tags?page=1&ordering=name)