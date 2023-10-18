# SSH Setup

## Generating SSH Key
Source: [GitHub Docs | Generating new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

Enter this command to generate a new SSH Key.
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"

# if system does not support ED25519 use this instead
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Just follow prompts on where you wanted to save the keys and if you want it to be password protected.

## Add SSH Key to GitHub
Source: [GitHub Docs | Add SSH Key to Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

```bash
# show your SSH public key
cat ~/.ssh/id_ed25519.pub
# then copy what has displayed in the terminal to your clipboard.

```

Copy your public key and paste it to the GitHub settings for SSH and GPG Keys page.
