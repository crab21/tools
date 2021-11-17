#!/bin/bash
chronyd -q 'server ntp.ntsc.ac.cn iburst'
/workspace/naiveproxy95/naive /workspace/naiveproxy95/config.json  &
tail -f /dev/null