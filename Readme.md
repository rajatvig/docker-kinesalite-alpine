![](https://circleci.com/gh/rajatvig/kinesalite-alpine.svg?style=shield&circle-token=3f34afbfe78afa0b3097b7f27abd8b0764833bd0)
[![](https://imagelayers.io/badge/rajatvig/kinesalite-alpine:latest.svg)](https://imagelayers.io/?images=rajatvig/kinesalite-alpine:latest 'Get your own badge on imagelayers.io')

# Overview

This image contains a copy of Kinesalite on Alpine.
Kinsalite is an AWS Kinesis emulator written by Michael Hart.

Kinesalite can be found here: https://github.com/mhart/kinesalite.

# How-to/usage

In order to use this, simply run:

docker run -d -t -p 4567:4567 rajatvig/kinesalite-alpine:latest
