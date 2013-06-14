# Building Vim from source
**This how-to come from: [YouCompleteMe] (https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source).**


Compiling Vim from source is actually not that difficult. Here's what you should do:

1.  First, install all the prerequisite libraries, including Mercurial. For a Debian-like Linux distribution like Ubuntu, that would be the following:


        sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial

2. Remove vim if you have it already.

        sudo apt-get remove vim vim-runtime gvim

  On Ubuntu 12.04.2 you probably have to remove these packages as well:

        sudo apt-get remove vim-tiny vim-common vim-gui-common

3. Once everything is installed, getting the source is easy:

        cd ~
        hg clone https://code.google.com/p/vim/
        cd vim
        ./configure --with-features=huge \
                    --enable-rubyinterp \
                    --enable-pythoninterp \
                    --enable-perlinterp \
                    --enable-gui=gtk2 --enable-cscope --prefix=/usr
        make VIMRUNTIMEDIR=/usr/share/vim/vim73
        sudo make install

  If you want to be able to easily uninstall the package use `checkinstall` instead of `sudo make install`

        sudo apt-get install checkinstall
        cd vim
        sudo checkinstall
  Set vim as your default editor with `update-alternatives`.

        sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
        sudo update-alternatives --set editor /usr/bin/vim
        sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
        sudo update-alternatives --set vi /usr/bin/vim

4. Double check that you are in fact running the new Vim binary by looking at the output of `vim --version`.

**If you don't get gvim working (on ubuntu 12.04.1 LTS), try changing `--enable-gui=gtk2` to `--enable-gui=gnome2`**

**You may need to add `--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/` to the `configure` call.**

These `configure` and `make` calls assume a Debian-like distro where Vim's runtime files directory is placed in `/usr/share/vim/vim73/`, which is not Vim's default. Same thing goes for `--prefix=/usr` in the `configure` call. Those values may need to be different with a Linux distro that is not based on Debian. In such a case, try to remove the `--prefix` variable in the `configure` call and the `VIMRUNTIMEDIR` in the `make` call (in other words, go with the defaults).

If you get stuck, here's some [other useful information on building Vim](http://vim.wikia.com/wiki/Building_Vim).
