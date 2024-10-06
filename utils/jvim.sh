jvim() {
  tmux new -s "$dir" \; \
    split-pane \; \
    split-pane -h \; \
    resize-pane -t 0 -y 60 \; \
    select-pane -t 0 \; \
    send-keys "nvim $@" C-m \;
}
