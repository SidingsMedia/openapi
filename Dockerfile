# SPDX-FileCopyrightText: 2023 Sidings Media
# SPDX-License-Identifier: MIT

FROM node:16 as build

WORKDIR /build

# Install dependancies
COPY package.json package-lock.json /build/
RUN npm ci

# Generate OpenAPI files
COPY openapi.yaml /build/openapi.yaml
COPY components /build/components
COPY paths /build/paths
RUN npm run openapi:generate
RUN npm run openapi:convert

FROM nginx:stable-alpine as deploy

WORKDIR /

# Clean out files
RUN rm /usr/share/nginx/html/*
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copy files
COPY --from=build /build/openapi.html /usr/share/nginx/html/openapi.html
COPY --from=build /build/openapi.json /usr/share/nginx/html/openapi.json

# Copy config
COPY conf /etc/nginx
