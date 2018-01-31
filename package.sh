#!/bin/sh
vagrant up
vagrant package --base spacemacsOS
echo "The vagrant environment is packaged , now you can upload the package."
