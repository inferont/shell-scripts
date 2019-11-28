# What's on Offer?

* Same prompt on all servers connected to via SSH.
* Current git branch displayed as part of the prompt.
* Random colors for each server's hostname in prompt (Switched using `regenerate`).
* Unix timestamp of each prompt aligned to the right.
* Easily search history using up/down arrows as you type.
* Automatically updated on all servers during session start.
* Automatic monthly backups of shell history.

# Installation Instructions

First and optionally, **back up** your existing `.bashrc` file:

```bash
cp ~/.bashrc{,.old}
```

Now **download** and place the new file from this repository:

```bash
wget -O ~/.bashrc https://raw.githubusercontent.com/inferont/shell-scripts/master/.bashrc
```

If you don't have _Wget_, try _Curl_:

```bash
curl -o ~/.bashrc https://raw.githubusercontent.com/inferont/shell-scripts/master/.bashrc
```

All done!

# Restoring from Backup

Assuming you created a backup, as mentioned in the above section, this can be done with a another simple one-liner, provided you've not messed with or deleted the backed-up file:

```bash
mv ~/.bashrc.old ~/.bashrc
```

That should do it.

# Development/Customization

* Customize this prompt for your own needs by forking this project and updating the `.bashrc` and `.commonrc` URLs.
* A generic configuration section for multiple users may be introduced in the future.
