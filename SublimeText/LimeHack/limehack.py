import os
import re
import subprocess

import sublime_plugin
import sublime

MAGIC_TOKEN = 'AUTO332'
HH_CLIENT = '/mnt/vol/engshare/tools/hh_client'

class LimehackAutocomplete(sublime_plugin.EventListener):
    def process_result(self, result):
        rrows = result.split("\n")
        rows = []
        for row in rrows:
            if not row:
                continue
            parts = row.split(' ', 1)
            if len(parts) == 2:
                rows.append(parts)
            else:
                if parts[0][0] == '$':
                    vv = parts[0][1:]
                    tt = 'local variable'
                else:
                    vv = parts[0]
                    tt = 'function'
                rows.append([vv, tt])
        results = [(name+"\t"+desc.strip('()'), name) for (name, desc) in rows]
        return results

    def on_query_completions(self, view, prefix, locations):
        def syntax_name(view):
            syntax = os.path.basename(view.settings().get('syntax'))
            syntax = os.path.splitext(syntax)[0]
            return syntax

        print 'on_query_completions'

        if syntax_name(view) != 'PHP':
            return

        if (len(locations) != 1):
            return
        location = locations[0]
        contents = view.substr(sublime.Region(0, location)) + \
                   MAGIC_TOKEN + \
                   view.substr(sublime.Region(location, view.size()))

        command = [HH_CLIENT, "--auto-complete"]
        proc = subprocess.Popen(command,
                                cwd='/home/emir/www/',
                                stdin=subprocess.PIPE,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        proc.stdin.write(contents)
        stdout, stderr = proc.communicate(contents)
        if stderr:
            print stderr
            return

        if int(proc.returncode) == 0 and len(stderr) == 0:
            return (self.process_result(stdout),
                sublime.INHIBIT_WORD_COMPLETIONS
                | sublime.INHIBIT_EXPLICIT_COMPLETIONS)
