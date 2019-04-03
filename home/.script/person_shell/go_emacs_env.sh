#!/bin/sh
# https://github.com/syl20bnr/spacemacs/blob/release_notes_0.300/layers/%2Blang/go/README.org

# basic
go get -u -v github.com/mdempsky/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v github.com/zmb3/gogetdoc
go get -u -v github.com/cweill/gotests/...
go get -u github.com/haya14busa/gopkgs/cmd/gopkgs
go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
go get -u github.com/josharian/impl

# gometalinter lint
go get -u -v github.com/alecthomas/gometalinter
gometalinter --install --update

# golangci-lint
go get -u github.com/golangci/golangci-lint/cmd/golangci-lint

# refactoring
go get -u -v github.com/godoctor/godoctor
go install github.com/godoctor/godoctor

# gomodifytags
go get -u -v github.com/fatih/gomodifytags

# LSP backend
go get -u github.com/sourcegraph/go-langserver
