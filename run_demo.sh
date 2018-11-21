#! /bin/bash

# Setup package
(
  echo ""
  echo "###################"
  echo "# Packing package #"
  echo "###################"
  echo ""
  cd package/
  npm pack
)

# Install package
(
  echo ""
  echo "######################"
  echo "# Installing package #"
  echo "######################"
  echo ""
  cd consumer/
  export DEMO_EXFILTRATION=true
  if [[ "$OSTYPE" == "darwin"* ]]; then
    export DEMO_BREW_INSTALL=true
  fi
  npm install ../package/npm-install-hook-test-package-*.tgz
)

# Uninstall package
(
  cd consumer
  echo ""
  echo "########################"
  echo "# Uninstalling package #"
  echo "########################"
  echo ""
  export DEMO_EXFILTRATION=true
  npm uninstall npm-install-hook-test-package
)

echo ""
echo "##############################################################"
echo "# If https://npm-test-install-hook.requestcatcher.com/       #"
echo "# was open before you ran this demo then exfiltrated         #"
echo "# information will be visible there. (If it wasn't, just     #"
echo "# open it now and then run this demo again)                  #"
echo "##############################################################"
echo ""
