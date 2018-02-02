Vagrant.configure("2") do |config|
  config.vm.box = "hodge/spacemacs-os"
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.vm.provision "setup-root", type:"shell" do |s|
    s.inline = <<-SHELL
      SHELL
  end
  config.vm.provision "package-vagrant", type:"shell" do |s| 
    s.privileged = false
    s.inline = <<-SHELL
      yaourt -S yadm-git oh-my-zsh-git zsh-autosuggestions zsh-history-substring-search --noconfirm
      yaourt -Scc --noconfirm
      yadm clone https://github.com/sukeyisme/dotfiles.git --no-bootstrap
      spacemacs_dir=/home/vagrant/.emacs.d
      spacemacs_private_dir=/home/vagrant/.spacemacs.d
      spacemacs_packages_dir=/home/vagrant/.emacs.d/elpa
      cd $spacemacs_dir && git pull
      cd $spacemacs_private_dir && rm init.el && git pull
      rm -rf $spacemacs_packages_dir
      git clone https://github.com/sukeyisme/spacemacs-packages.git $spacemacs_packages_dir -b develop
      SHELL
  end
  config.vm.provision "package-root", type:"shell" do |s|
    s.inline = <<-SHELL
      pacman -S wqy-zenhei ttf-dejavu zsh-syntax-highlighting fzf --noconfirm
      pacman -Scc --noconfirm
      rm -rf /var/log/journal/* /var/log/old/* /var/log/faillog /var/log/lastlog /var/log/pacman.log
      rm -f /home/vagrant/.bash_history
      rm -f /root/.bash_history
      cd /root
      dd if=/dev/zero of=zerofillfile bs=1M
      rm -f zerofillfile
      history -c
      systemctl poweroff
      SHELL
  end
end
