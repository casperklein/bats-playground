#!/bin/bash

set -ueo pipefail

test/bats/bin/bats -T test/*.bats
