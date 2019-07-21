python3 << EOF
import os
import sys
import vim

# Fix issue with python not able to gf
vim.command(r"set path=")
for p in sys.path:
    # Add each directory in sys.path, if it exists.
    if os.path.isdir(p):
        # Command 'set' needs backslash before each space.
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
