" the python pyflakes module from the git repo is in the wrong location
python <<EOF
import sys
import os
import vim
pyflakes_path = os.path.join(
    vim.eval('expand("$HOME")'),
    ".vim",
    "bundle",
    "pyflakes",
    "pyflakes")
sys.path.insert(0, pyflakes_path)
EOF

" the pyflakes.vim file from the git repo is also in the wrong location
source $HOME/.vim/bundle/pyflakes/ftplugin/pyflakes.vim
