cd ~
mkdir vim_source
git clone git@github.com:vim/vim.git vim_source
cd vim_source
./configure --with-features=huge --enable-pythoninterp --enable-multibyte --enable-luainterp --enable-python3interp --disable-netbeans --enable-fail-if-missing
make
sudo make install
