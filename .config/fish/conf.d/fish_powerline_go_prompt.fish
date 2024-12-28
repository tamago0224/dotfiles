function fish_prompt
    eval $GOPATH/bin/powerline-go -shell bare -newline -cwd-mode fancy -cwd-max-depth 3 --modules-right time,kube
end
