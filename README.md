# ytdlp-shortcut
script run by apple shortcuts to download & cagegorize videos

I use this to add videos to plex/jellyfin libraries for group watching.


## Requirements
* You need a server that runs the script and can access the plex libraries
* Your iOS device needs to be able to SSH to the server. Consider tailscale or port forwarding if you want to run it outside your local network.
  * Note if you use tailscale, you can use the MagicDNS name in the "Run Script over SSH" object in the shortcut, and then configure the tailscale app to do nothing except when it detects MagicDNS hostnames.


## How To
1. Create a shortcut like the screenshot
  - Modify the list object in the shortcut to include your plex library folder names.
  - Copy the SSH public key text to your server
  - Add your server's hostname to the SSH object
2. Clone the script to your server, and modify it.
  - Modify the SAVEPATH in the script to match the path to the root of your Plex libraries.
3. Set up your SSH key from the shortcut
  - copy the public key from your iOS device to ~/.ssh/authorized_keys
  - I recommend setting up a [forced command](https://www.oreilly.com/library/view/bash-cookbook/0596526784/ch14s22.html) to limit what can be done from that shortcut. Especially if you're setting this up on your friend's phones.
4. Download some videos. If you made categories in the list object that don't match existing plex library folder names, the script will create new folders matching what you put in the list object, and you'll have to add them to libraries in plex.


## Configuration Screenshots

### Shortcut
<img width="616" alt="shortcut_config" src="https://github.com/fine-fiddle/ytdlp-shortcut/assets/1920747/61dfc51d-a3f8-4c8e-80a9-09b0b1dc4373">


### Tailscale using MagicDNS
<img width="300" alt="tailscale config" src="https://github.com/fine-fiddle/ytdlp-shortcut/assets/1920747/c0ff7fc5-4009-4b99-b16f-00a428a07d69">
