# Sitecore.Demo.Base

## Introduction

This repository contains the scripts used to build various base Docker images used in the Lighthouse Demo. It uses docker 'asset' images previously built to install modules into the CM, CD, SQL, etc. images.

The repo also currently contains helm charts for deploying the Lighthouse Demo to K8S. We will be splitting the helm charts into another repository soon.

## Hosted Images

* COMING SOON*

## Getting Started

To build your base images from this repo, you can simply call `docker-compose build` from the docker folder to build the Windows images and `docker-compose -f docker-compose-linux.yml` to build Linux images.
