# Keep dotfiles in your $HOME dir and use a a bare Git repository.
This method is taken from [here](https://www.atlassian.com/git/tutorials/dotfiles) and [here](https://news.ycombinator.com/item?id=11070797). The basic idea is to keep your dotfile in their original location (mainly $HOME) and avoid symlinks entirely. This is done by creating a base repository and set the work-tree to be the $HOME directory. When we want to add a new config file to the repository we specify the work-tree as $HOME (this is made easier with an alias command). This keeps the files at their original location and allows for using different branches on different computers (Linux vs osx).

## Scratch setup
```
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin <git-repo-url>
```
Make sure you change the remote URL to your git repo. Add the alias to your `.bashrc` file for convenience. This way you can interact with the repository inside the $HOME directory.
Now any file within your $HOME directory can be versioned with normal commands:

```
dotfiles status
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles push
```

## Install to a new machine
First clone the bare repository
```
git clone --bare <git-repo-url> $HOME/.dotfiles
```
Define the alias in the current shell scope:
```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
If we would perform a checkout (dotfiles checkout) at this point it will probably fail because your $HOME directory will contain files like .bashrc etc. We will first need to backup (or remove) the files.
```
mkdir $HOME/.dotfiles_backup
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles_backup/{}
```
Note: if you want to remove the files without backing them up, you can replace the xargs command with the following `xargs rm`.
Now we can run the checkout and set the showUntrackedFiles flag off for this repository. We also need to fetch the submodules.
```
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
dotfiles submodule update --init --recursive
```

That is it. You can now add/update/remove files from your dotfiles.
