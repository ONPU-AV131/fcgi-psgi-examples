#! /bin/sh

carton exec -- plackup --server HTTP::Server::Simple --port 11112 --host 127.0.0.1 ./simple.psgi
