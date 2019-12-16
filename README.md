# Features

* Same prompt, functions, and tweaks on all servers connected to via SSH.

* Automatic search and excution of commands with the new `_ ` command. (I.e. `_ ssh` for a list of all the servers you have previously conected) 

* Current git branch displayed as part of the prompt.

* System load displayed as a part of shell title

* Random colors for each server's hostname in prompt (Switched using `regenerate`).

* Unique colors for each file type with `ls` output

* A hexadecimal unix timestamp of each prompt aligned to the right. (Converted to human readable time using `hextime`)

* Easily search history using up/down arrows as you type.

* Automatically updated on all servers during session start.

* Automatic monthly backups of shell history.

# Demo

[![asciicast](https://asciinema.org/a/iYHysYOySTe8mZSSSevXlgY4l.svg)](https://asciinema.org/a/iYHysYOySTe8mZSSSevXlgY4l)

# Installation Instructions

Just **back up** your old ~/.bashrc and **download** the new file from this repository:

```bash
cp ~/.bashrc{,.old}; wget -O ~/.bashrc https://raw.githubusercontent.com/inferont/shell-scripts/master/.bashrc
```

If you don't have _Wget_, try _Curl_:

```bash
cp ~/.bashrc{,.old}; curl -o ~/.bashrc https://raw.githubusercontent.com/inferont/shell-scripts/master/.bashrc
```

All done!

# Restoring from Backup

Assuming you created a backup, as mentioned in the above section, this can be done with another simple one-liner, provided you've not messed with or deleted the backed-up file:

```bash
mv ~/.bashrc.old ~/.bashrc
```

That should do it.

# Development/Customization

* Customize this prompt for your own needs by forking this project and updating the `.bashrc` and `.commonrc` URLs.
* A generic configuration section for multiple users may be introduced in the future.
