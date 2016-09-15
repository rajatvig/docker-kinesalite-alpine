[![Build Status](https://travis-ci.org/rajatvig/docker-kinesalite-alpine.svg?branch=master)](https://travis-ci.org/rajatvig/docker-kinesalite-alpine)
[![](https://images.microbadger.com/badges/image/rajatvig/kinesalite-alpine.svg)](http://microbadger.com/images/rajatvig/kinesalite-alpine "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/rajatvig/kinesalite-alpine.svg)](http://microbadger.com/images/rajatvig/kinesalite-alpine "Get your own version badge on microbadger.com")

# Overview

This image contains a copy of Kinesalite on Alpine.
Kinsalite is an AWS Kinesis emulator written by Michael Hart.

Kinesalite can be found here: https://github.com/mhart/kinesalite.

# How-to/usage

In order to use this, simply run:

docker run -d -t -p 4567:4567 rajatvig/kinesalite-alpine:latest
