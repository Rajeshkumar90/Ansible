#!/usr/bin/python
# -*- coding: utf-8 -*-

# (c) 2015, RajeshKumar SyedShabir
#
# This file is part of Ansible
#
# Ansible is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ansible is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ansible.  If not, see <http://www.gnu.org/licenses/>.

# this is a windows documentation stub.  actual code lives in the .ps1
# file of the same name

DOCUMENTATION = '''
---
module: win_shortcut
version_added: "2.3"
short_description: Adds windows shortcut on windows hosts.
description:
    - Uses .net Environment to add windows shortcut.  
options:
 src:
    description: 
      - Path for windows shortcut.
    required: true
    default: no default
 dest:
    description: 
      - Path for linking file with .lnk or .url.
    required: true
    default: no default
author: "SyedShabir, RajeshKumar"
notes: 
   - This module is helpful for deploying application with windows shortcut.  
'''

EXAMPLES = '''
  # Creates windows shortcut for lnk
  win_shortcut:
    src: 'C:\Program Files\Mozilla Firefox\Firefox.exe'
    dest: 'C:\Users\test\Desktop\Firefox.lnk'
  # Creates windows shortcut for url
  win_shortcut:
    src: 'C:\Program Files\Mozilla Firefox\Firefox.exe'
    dest: 'C:\Users\test\Desktop\Firefox.url'
'''

RETURN = '''
'''
