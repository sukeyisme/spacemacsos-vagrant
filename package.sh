#!/bin/sh
vagrant destory default -f
vagrant up
vagrant provision --provision-with package-vagrant package-root
vagrant package --base spacemacsOS
echo "The vagrant environment is packaged , now you can upload the package."
