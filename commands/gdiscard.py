#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util

msg_list = [
        "Brief:",
        "    git discard everything",
        "Usage:",
        "    %s" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_git()

branch = util.git_branch()
print("[lin-vim] git discard all working on '%s', path: '%s'" % (branch, os.getcwd()))
util.user_confirm()

save_dir = os.getcwd()

os.chdir(util.git_root())

if os.path.exists(save_dir):
    os.chdir(save_dir)
