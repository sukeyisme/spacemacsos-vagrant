#!/bin/sh
spacemacs_dir=/home/vagrant/.emacs.d
spacemacs_private_dir=/home/vagrant/.spacemacs.d
spacemacs_packages_dir=/home/vagrant/.emacs.d/elpa
cd $spacemacs_dir && git push
cd $spacemacs_private_dir && git commit -a -m "auto push by vagrant" && git push
cd $spacemacs_packages_dir && git add -A && git commit -a -m "auto push by vagrant" && git push
