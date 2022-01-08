#!/bin/bash

set -ueo pipefail

test/bats/bin/bats test/*.bats
