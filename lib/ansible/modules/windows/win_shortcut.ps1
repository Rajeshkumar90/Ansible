#!powershell
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

# WANT_JSON
# POWERSHELL_COMMON

$ErrorActionPreference = "Stop"

$params = Parse-Args $args

$result = New-Object psobject @{
    changed = $FALSE
}

$TargetFile = Get-Attr $params "src" $FALSE

If ($TargetFile -eq $FALSE)
{
   Fail-Json (New-Object psobject) "missing required argument: src File Path"
}

$ShortcutFile = Get-Attr $params "dest" $FALSE

If ($ShortcutFile -eq $FALSE)
{
   Fail-Json (New-Object psobject) "missing required argument: dest File Path"
}

If(($TargetFile -or $ShortcutFile) -eq $null)
{
 Fail-Json (New-Object psobject) "missing required argument: Either src or  dest File path contains Null Value"
}

if((Test-Path  $TargetFile ) -and (Test-Path $ShortcutFile))
{
  $result.changed = $FALSE
}
else
{
 $WScriptShell = New-Object -ComObject WScript.Shell
 $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
 $Shortcut.TargetPath = $TargetFile
 $Shortcut.Save()
 $result.changed = $TRUE
}
Exit-Json $result
