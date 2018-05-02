import sublime
import sublime_plugin
import subprocess
import traceback
import re


class AbstractShellCommander(sublime_plugin.WindowCommand):
    NAME = 'shell_commander'
    PATH_TO_SETTINGS = 'ShellCommander.sublime-settings'

    def show_panel(self):
        # init the panel for later usage
        self.panel = self.window.get_output_panel(self.NAME)
        # panel's name would be `output.panel_name`
        self.window.run_command('show_panel', {'panel': 'output.%s' % self.NAME})

    def exec_commands_and_print_result(self, commands):
        (returncode, stdout, stderr) = self.handle_execution(commands)
        self.print_to_panel(self.filter_text(stdout))
        if not returncode == 0:
            self.print_to_panel('\nERROR:\n' + self.filter_text(stderr))

    def handle_execution(self, commands):
        process = subprocess.Popen(['/bin/bash', '-l', '-c', '\n'.join(commands)],
                                   stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE)
        (stdout, stderr) = process.communicate()
        return (process.returncode, stdout, stderr)

    def filter_text(self, text):
        lines = text.split('\n')
        if lines[0].startswith('This server cannot connect directly to the in'):
            lines = lines[1:]
        if lines[0].startswith('proxying for this shell session has been conf'):
            lines = lines[1:]
        if lines[0].startswith('See http://fburl.com/devproxy for more inform'):
            lines = lines[1:]

        text = '\n'.join(lines)
        # remove the ANSI color code from the text
        return re.sub(r'\033\[\d+m', '', text)

    def print_to_panel(self, text):
        edit = self.panel.begin_edit()
        self.panel.insert(edit, self.panel.size(), text)
        self.panel.end_edit(edit)

    def run_commands(self, commands):
        try:
            self.show_panel()
            self.exec_commands_and_print_result(commands)
        except Exception as e:
            print e


class ShellCommanderCommand(AbstractShellCommander):
    """
      @command_name: shell_commander
      @usage: `window.run_command('shell_commander')` or press the keys below
      @keys: ctrl + x
      @introduction: Prompt the user for a shell command to run inside the
                      project folder, and show the result in a panel.
    """

    # main entry point when this command is triggered
    def run(self):
        self.prompt_for_shell_command()

    # this will be trigger once user pressed enter
    def on_done(self, input):
        try:
            self.show_panel()
            commands = self.process_commands(input)
            self.print_commands(commands)
            self.exec_commands_and_print_result(commands)
        except Exception:
            self.print_to_panel('\nERROR:' + traceback.format_exc())

    def settings(self):
        return sublime.load_settings(self.PATH_TO_SETTINGS)

    # private methods

    def prompt_for_shell_command(self):
        # @see http://www.sublimetext.com/docs/2/api_reference.html
        self.window.show_input_panel('$', '', self.on_done, None, None)

    # Print the commands like below
    #   $> command1
    #   .> command2
    def print_commands(self, commands):
        pretty_commands = '$> ' + '\n.> '.join(commands)
        self.print_to_panel(pretty_commands)

    def process_commands(self, command):
        return filter(None, [
                      self.cd_project_folder(),
                      self.before(),
                      command,
                      self.after()
                      ])

    def before(self):
        return self.settings().get('before_command')

    def after(self):
        return self.settings().get('after_command')

    def cd_project_folder(self):
        return 'cd "%s"' % self.window.folders()[0]


class ShellCommanderRunTestsCommand(AbstractShellCommander):
    def run(self):
        self.run_commands([
            'cd ~/www',
            't -c `git show'
            ' | grep --color=never ^+++.*__test.*\\.php$'
            ' | cut -d/ -f2-` 2>&1',
        ])


class ShellCommanderHackCommand(AbstractShellCommander):
    def run(self):
        self.run_commands([
            'cd ~/www',
            'hh_client 2>&1 || true',
        ])


class ShellCommanderRunEmirCommand(AbstractShellCommander):
    def run(self):
        self.run_commands([
            'php ~/www/scripts/emir.php 2>&1',
        ])


class ShellCommanderTestingCommand(AbstractShellCommander):
    def run(self):
        print 'this is me'
