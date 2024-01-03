# dotfiles

This repo contains all my config files  which I would like to backup and 
eventually install on a new machine.  In addition, it contains a script 
`sync.sh` which allows to update the files in the repo or on the current system
with each other based on their modification date.  For example, if `repo_file` 
is older than `system_file` then `sync.sh` will copy the `system_file` into
`repo_file`.

## Adding a file for synchronization

Copy the file from your system to the `repo_file` path.  Then, add the 
`repo_file` and `system_file` paths to `files` in `sync.sh` as presented.
