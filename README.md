# Environment-setup
source files you need in your dotfiles

# Tmux
## About tmux
* According to `man 1 tmux`, tmux is a terminal multiplexer. It enables a number of terminals to be created, accessed, and controlled from a signle screen. It may be detached from a screen and continue running in the background, then later reattached.
* When tmux starts it creates a a new session with a single window. A session is a single collection of pseudo terminals. Each session has one or more windows linked to it. A window occupies the entire screen and may be split into rectangular panes, ea

## Working with tmux using command line
* The tmux server manages clients, sessions, windows and panes. Clients are attached to sessions to interact with them. The most common tmux commands include:
    * tmux new-session [-s session-name]
        * This creates a new session with desired name and automatically attaches the to the current terminal. Useful when you want to start working with tmux.
    * tmux attach [-t target-session]
        * This attaches tmux client to a target session
    * tmux kill-server
        * This kills the tmux server and client and destroy all sessions. Useful if you want to completely stop tmux
    * tmux list-clients [ -t target-session]
        * This lsits all clients attached to the server. Useful if you want to see all clients attached to all or a specific session.
    * tmux list-commands
        * List the syntax of all commands supported by tmux.

## Default key bindings tour
* Tmux may be controlled from an attached client by using a key combination of a prefix key, 'C-b' (Ctrl-b) by default, followed by a command key. The most common command key are:
    * 0-9
        * Select windows 0 to 9
    * "
        * Split the current pane into two, top and bottom
    * %
        * Split the current pane into two, left and right
    * d
        * Detach the current client
    * s
        * Select a new session for the attached client interactively
    * x
        * Kill current panel. Useful when the current pane becomes unresponsive
    * C-o
        * Rotate the panes in the current window forwards (useful when you want to rotate panes to the left or right side of the window.
    * [
        * Enters copy mode
    * ]
        * Paste the most recently copied buffer of text
    * =
        * Choose which buffer to paste interactively
    * C-z
        * Suspend the tmux client. Useful when you want to suspend the client so you can continue using the terminal and run `fg` when you want to resume the client
    * ?
        * List all key bindings
    * :
        * Enters tmux command prompt
    * !
        * Breaks the current pane out of the window
    * More bindings, run `PAGER='less -p "^KEY BINDINGS"' man 1 tmux`

## About tmux.conf
* ~/.tmux.conf is a file for user configuration. Tmux command can specify option, -f file, to load an alternative config file. By default it loads the system conf file /etc/tmux.conf if present, then looks for a user config file at ~/.tmux.conf
* Tmux conf allows the customization of tmux and the loading of tmux plugins.
    * To learn more about key binding run `PAGER='less -p "^KEY BINDINGS"' man 1 tmux` then press `n`

## About environment-setup tmux.conf
* what environment-setup tmux.conf do?
    * Configures [Tmux plugin manager](https://github.com/tmux-plugins/tpm) and [Tmux-resurect](https://github.com/tmux-plugins/tmux-resurrect)
        * Tmux plugin manager installs and loads tmux plugins. It's useful because it manages plugin installation, update and removal from GitHub or any other git repos.
        * Tmux Resurrect restores tmux environment after restart. It's useful when you want to persist don't want to lose all the running programs, working directories, pane layout and more. It optionally restores vim and neovim sessions.
            * Configures resurrection of vim session.
    * Sets global display and control settings
        * repeat key time is set to 6 seconds
    * Sets window style, purple in this case, and other window settings
    * Unbinds some of the keys that's not needed as we will remap it.
    * Sets general binding
        * Binds C-\ as the prefix, this avoids conflict with vim as <C-b> means go down half screen.
        * Binds tmux.conf editing and reloading keys
        * Binds copy mode vim selection keys. It makes the tmux line selection experience similar to when you are in vim visual mode.
        * Binds tmux buffer keys just like vim buffer naming convention
    * Sets window and navigation binding
        * Sets window split key to - and | because they look like what the result view should be.
        * All new window or split window are craeted with current path as the default terminal path.
        * Binds global screen navigation settings to navigate panes without typing prefix
        * Binds window operation using repeat keys so that one can resize/select panes or navigate windows just by pressing the bindkey repeatedly instead of typing prefix + bind key multiple times.

