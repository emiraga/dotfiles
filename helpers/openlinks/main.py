#!/usr/bin/python

from twisted.internet import reactor, protocol, utils
import webbrowser
import cgi


class LinkOpenerProtocol(protocol.Protocol):

    def connectionMade(self):
        self.data = ''

    def dataReceived(self, data):
        self.data += data

    def connectionLost(self, _unused):
        self.transport.loseConnection()
        data = self.data.strip()
        parts = data.split(' ', 1)
        cmd = parts[0]
        param = parts[1] if len(parts) > 1 else None
        if cmd == 'link':
            self.factory.openLink(param)
        elif cmd == 'lol':
            if param:
                url = 'http://bunnylol.facebook.com/?' \
                    + cgi.escape(param)
            else:
                url = 'http://bunnylol.facebook.com/'
            self.factory.openLink(url)
        elif cmd == 'google':
            if param:
                url = 'https://www.google.com/search?q=' \
                    + cgi.escape(param)
            else:
                url = 'https://www.google.com/'
            self.factory.openLink(url)
        elif cmd == 'refresh':
            self.factory.refresh()
        else:
            print 'Not recognized command', cmd


class LinkOpenerFactory(protocol.ServerFactory):
    protocol = LinkOpenerProtocol

    def openLink(self, url):
        webbrowser.open_new_tab(url)

    def refresh(self):
        cmd = ("ps -xc | grep -sq Chrome && osascript" +
            " -e 'tell app \"Google Chrome\"'" +
            " -e 'set winref to a reference to (first window)'" +
            " -e 'reload active tab of winref'" +
            " -e 'end tell'")
        utils.getProcessOutput('bash', ['-c', cmd])

reactor.listenTCP(52698, LinkOpenerFactory(), interface='127.0.0.1')
reactor.run()
