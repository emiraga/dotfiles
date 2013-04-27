import os
import subprocess

import sublime_plugin
import sublime

MAGIC_TOKEN = 'AUTO332'
HH_CLIENT = '/mnt/vol/engshare/tools/hh_client'
WWW_CHECKOUT = '~/www'


class LimehackAutocomplete(sublime_plugin.EventListener):
    def process_result(self, result):
        rows = []
        for row in result.split("\n"):
            if not row:
                continue
            parts = row.split(' ', 1)
            if len(parts) == 2:
                rows.append(parts)
            else:
                if parts[0].startswith('$'):
                    rows.append([parts[0][1:], 'variable'])
                else:
                    rows.append([parts[0], 'function'])

        return [(name+"\t"+desc.strip('()'), name) for (name, desc) in rows]

    def on_query_completions(self, view, prefix, locations):
        def syntax_name(view):
            syntax = os.path.basename(view.settings().get('syntax'))
            syntax = os.path.splitext(syntax)[0]
            return syntax

        if syntax_name(view) != 'PHP':
            return

        if (len(locations) != 1):
            return
        location = locations[0]
        contents = view.substr(sublime.Region(0, location)) + \
            MAGIC_TOKEN + \
            view.substr(sublime.Region(location, view.size()))

        if os.path.isfile(HH_CLIENT):
            command = [HH_CLIENT, "--auto-complete"]
            cwd = os.path.expanduser(WWW_CHECKOUT)
        else:
            command = [
                'ssh', 'dev',
                'cd ' + WWW_CHECKOUT+'; ' + HH_CLIENT + ' --auto-complete'
            ]
            cwd = None
        proc = subprocess.Popen(command,
                                cwd=cwd,
                                stdin=subprocess.PIPE,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        proc.stdin.write(contents)
        stdout, stderr = proc.communicate(contents)
        if stderr:
            print stderr
            return

        if int(proc.returncode) == 0 and len(stderr) == 0:
            results = self.process_result(stdout)
            # if we don't have any result, let something else do the completion.
            if len(results) > 0:
                return (results,
                        sublime.INHIBIT_WORD_COMPLETIONS
                        | sublime.INHIBIT_EXPLICIT_COMPLETIONS)
