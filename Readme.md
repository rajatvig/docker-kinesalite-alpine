[![Build Status](https://travis-ci.org/rajatvig/docker-kinesalite-alpine.svg?branch=master)](https://travis-ci.org/rajatvig/docker-kinesalite-alpine)

[![](https://imagelayers.io/badge/rajatvig/kinesalite-alpine:latest.svg)](https://imagelayers.io/?images=rajatvig/kinesalite-alpine:latest 'Get your own badge on imagelayers.io')

# Overview

This image contains a copy of Kinesalite on Alpine.
Kinsalite is an AWS Kinesis emulator written by Michael Hart.

Kinesalite can be found here: https://github.com/mhart/kinesalite.

# How-to/usage

In order to use this, simply run:

docker run -d -t -p 4567:4567 rajatvig/kinesalite-alpine:latest
