# npm Install Hooks Test

This repo was created along with a blog post https://blog.alexwendland.com/2018/npm-install-scripts-intro/.

## Overview

This repo contains two packages:

* **package** which subscribes to each install/uninstall hook and reports that they've run.
  * For install and uninstall hooks additional actions can be triggered.
    * install: setting `DEMO_EXFILTRATION` will report your user name and the sha256 of your `.bashrc`, while setting `DEMO_BREW_INSTALL` will cause the install script to use rew to install `cowsay`.
    * uninstall: settings `DEMO_EXFILTRATION` will perform the same operation on the install.
* **consumer** which consumes the _package_ to demonstrate the install hooks.

## Example Outputs

```
###################
# Packing package #
###################

npm notice
npm notice 📦  npm-install-hook-test-package@1.0.0
npm notice === Tarball Contents ===
npm notice 532B   package.json
npm notice 508B   install.sh
npm notice 24.0kB npm-install-hook-test-package-1.0.0.tgz
npm notice 41B    postinstall.sh
npm notice 42B    postuninstall.sh
npm notice 40B    preinstall.sh
npm notice 42B    preuninstall.sh
npm notice 355B   uninstall.sh
npm notice === Tarball Details ===
npm notice name:          npm-install-hook-test-package
npm notice version:       1.0.0
npm notice filename:      npm-install-hook-test-package-1.0.0.tgz
npm notice package size:  25.1 kB
npm notice unpacked size: 25.5 kB
npm notice shasum:        57ec297dea3697c5297f21a576d0470d5dafc60a
npm notice integrity:     sha512-ThnW2eiTu3w08[...]X1Et16ETg9OYg==
npm notice total files:   8
npm notice
npm-install-hook-test-package-1.0.0.tgz

######################
# Installing package #
######################


> npm-install-hook-test-package@1.0.0 preinstall /Users/awendland/tmp_code/misc/npm-install-hook-test/consumer/node_modules/npm-install-hook-test-package
> ./preinstall.sh

script: preinstall

> npm-install-hook-test-package@1.0.0 install /Users/awendland/tmp_code/misc/npm-install-hook-test/consumer/node_modules/npm-install-hook-test-package
> ./install.sh

script: install
request caughtUpdating Homebrew...
==> Auto-updated Homebrew!
Updated 1 tap (homebrew/core).
==> Updated Formulae
miniserve                                    mockserver                                   shc

==> Downloading https://homebrew.bintray.com/bottles/cowsay-3.04.mojave.bottle.tar.gz
Already downloaded: /Users/awendland/Library/Caches/Homebrew/downloads/38854ad3bfa8be16c69e8b9813aebb2526a32b23a8ab3e7c1b33c24164e891c0--cowsay-3.04.mojave.bottle.tar.gz
==> Pouring cowsay-3.04.mojave.bottle.tar.gz
🍺  /usr/local/Cellar/cowsay/3.04: 65 files, 82.9KB
 _______________________________________
/ Uh Oh! The install script in this npm \
| package just installed cowsay using   |
\ brew.                                 /
 ---------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

> npm-install-hook-test-package@1.0.0 postinstall /Users/awendland/tmp_code/misc/npm-install-hook-test/consumer/node_modules/npm-install-hook-test-package
> ./postinstall.sh

script: postinstall
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN npm-install-hook-test-consumer@1.0.0 No repository field.

+ npm-install-hook-test-package@1.0.0
added 1 package from 1 contributor and audited 1 package in 11.306s
found 0 vulnerabilities


########################
# Uninstalling package #
########################


> npm-install-hook-test-package@1.0.0 preuninstall /Users/awendland/tmp_code/misc/npm-install-hook-test/consumer/node_modules/npm-install-hook-test-package
> ./preuninstall.sh

script: preuninstall

> npm-install-hook-test-package@1.0.0 uninstall /Users/awendland/tmp_code/misc/npm-install-hook-test/consumer/node_modules/npm-install-hook-test-package
> ./uninstall.sh

script: uninstall
request caught
> npm-install-hook-test-package@1.0.0 postuninstall /Users/awendland/tmp_code/misc/npm-install-hook-test/consumer/node_modules/npm-install-hook-test-package
> ./postuninstall.sh

script: postuninstall
npm WARN npm-install-hook-test-consumer@1.0.0 No repository field.

removed 1 package in 0.672s
found 0 vulnerabilities


##############################################################
# If https://npm-test-install-hook.requestcatcher.com/       #
# was open before you ran this demo then exfiltrated         #
# information will be visible there. (If it wasn't, just     #
# open it now and then run this demo again)                  #
##############################################################
```
