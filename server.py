import http.server
import socketserver
import os

PORT = os.environ.get('PORT', 8080)

class CustomRequestHandler(http.server.SimpleHTTPRequestHandler):

    def do_GET(self):
        with open('./index.html', 'rb') as f:
            self.send_response(200)
            self.send_header('Content-Type', 'text/html; charset=utf-8')
            self.end_headers()
            self.wfile.write(f.read())

    def do_HEAD(self):
        with open('./index.html', 'rb') as f:
            self.send_response(200)
            self.send_header('Content-Type', 'text/html; charset=utf-8')
            self.end_headers()
            self.wfile.write(f.read())

httpd = socketserver.TCPServer(("", int(PORT)), CustomRequestHandler)
print("Python Sample Web Server listening on port {}...".format(PORT))
httpd.serve_forever()

