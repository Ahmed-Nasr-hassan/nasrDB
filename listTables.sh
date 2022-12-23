#!/usr/bin/bash
find . -type f | grep -v "_MetaData$" | cut -d/ -f 2