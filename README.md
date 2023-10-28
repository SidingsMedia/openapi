<!-- 
SPDX-FileCopyrightText: 2022-2023 Sidings Media <contact@sidingsmedia.com>
SPDX-License-Identifier: MIT
-->

# openapi

This repo contains the OpenAPI specification for Sidings Media's public
API services, including all endpoints that are accessible to the public
without authentication, as well as authenticated endpoints that appear
in public source code. This repo is the source of truth for the API.

This repo also contains the API documentation build script and API
documentation service that is deployed to form the `/docs` and
`/openapi.json` endpoints for the API.

## Building

### Docker

This will require docker to be installed. After you have installed
docker, you need to run only one command to build the container.

```
docker build . -t <service>:latest
```

Note: `-t <service>` gives the container the name <service> and the tag
latest.

Docker will now download all the dependancies and then build your
container. This may take a while.

## Running

### Docker

```
docker run --publish 3000:3000 -d --name messaging ghcr.io/sidingsmedia/openapi
```

To add the environment variables, you can use multiple `-e` flags. For
more information see the [docker
documentation](https://docs.docker.com/engine/reference/commandline/run/#env).

### Docker Compose

A docker compose file is also provided if you would like to use it.

```
docker compose up . -d
```

To pass the environment variables, just store them in a .env file.

## Licence
This repo uses the [REUSE](https://reuse.software) standard in order to
communicate the correct licence for the file. For those unfamiliar with
the standard the licence for each file can be found in one of three
places. The licence will either be in a comment block at the top of the
file, in a `.license` file with the same name as the file, or in the
dep5 file located in the `.reuse` directory. If you are unsure of the
licencing terms please contact
[contact@sidingsmedia.com](mailto:contact@sidingsmedia.com?subject=Messaging%20Microservice).
All files committed to this repo must contain valid licencing
information or the pull request can not be accepted.
