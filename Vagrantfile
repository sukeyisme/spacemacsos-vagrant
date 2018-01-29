Vagrant.configure("2") do |config|
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://10.0.2.2:4411/"
    config.proxy.https    = "http://10.0.2.2:4411/"
    config.proxy.no_proxy = "localhost,127.0.0.1"
  end
  config.vm.box = "hodge/spacemacs-os"
  config.vm.box_check_update = true
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = "spacemacsOS"
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    vb.customize ['setextradata', :id, 'GUI/HiDPI/UnscaledOutput', '1']
    vb.customize ['setextradata', :id, 'GUI/Fullscreen', "on"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--memory", 4096]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
  end
  config.vm.provision "root-build", type:"shell" do |s| 
    s.inline = <<-SHELL
        sed -i "s/TIMEOUT.*/TIMEOUT 1/g" /boot/syslinux/syslinux.cfg
        echo [archlinuxfr] >> /etc/pacman.conf
        echo SigLevel = Never >> /etc/pacman.conf
        echo Server = http://repo.archlinux.fr/'$'arch >> /etc/pacman.conf
        pacman -Syu --noconfirm
        pacman -S git emacs xorg-xinit xorg-server xorg-xset yaourt fakeroot adobe-source-code-pro-fonts --noconfirm
        cp /usr/lib/systemd/system/getty@.service /usr/lib/systemd/system/autologin@.service
        sed -i 's@ExecStart.*@ExecStart=-/sbin/agetty --noclear -a vagrant %I 38400 linux@g' /usr/lib/systemd/system/autologin@.service
        systemctl disable getty@tty1
        systemctl enable autologin@tty1
      SHELL
  end
  config.vm.provision "vagrant-build", type:"shell" do |s|
    s.privileged = false
    s.inline = <<-SHELL
        echo "VBoxClient-all" >> .xinitrc
        echo "xset r rate 200 30" >> .xinitrc
        echo "exec dbus-launch --exit-with-session emacs" >> .xinitrc
        echo "xinit -- vt01" >> .bash_profile
        spacemacs_dir=/home/vagrant/.emacs.d
        spacemacs_private_dir=/home/vagrant/.spacemacs.d
        rm -rf $spacemacs_dir
        git clone https://github.com/sukeyisme/spacemacs.git $spacemacs_dir -b develop
        git clone https://github.com/sukeyisme/spacemacs-private.git $spacemacs_private_dir -b develop
      SHELL
  end
  config.vm.provision "root", type:"shell" do |s|
    s.inline = <<-SHELL
      SHELL
  end
  config.vm.provision "vagrant", type:"shell" do |s|
    s.privileged = false
    s.inline = <<-SHELL
      SHELL
  end
end
