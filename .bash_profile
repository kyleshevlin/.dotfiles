if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# opam configuration
test -r /Users/kyle/.opam/opam-init/init.sh && . /Users/kyle/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
