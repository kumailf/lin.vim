#! /usr/bin/env python
#-*- coding:utf-8 -*-

# Copyright 2018-  <linrongbin16@gmail.com>

import sys
import os
sys.path.append('.')
import util
import git
import pdb

# pdb.set_trace()

msg_list = [
        "Brief:",
        "    git commit with [comment]",
        "Usage:",
        "    %s [comment]" % util.command_name(),
        "Try again"]

util.check_help(msg_list)
util.check_repository()

if len(sys.argv) != 2:
    util.help_msg(msg_list)

comment = util.merge_args()

branch = util.repository_branch()
print("[lin-vim] git commit on branch: '%s', comment: '%s', path: '%s'" % (branch, comment, os.getcwd()))
util.user_confirm()
os.system('git add -A %s' % util.repository_root())
os.system('git commit -m "%s"' % comment)
