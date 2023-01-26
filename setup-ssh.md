## setup ssh


Install: 

```bash
# ssh is typically installed by default -- if it isn't , run this: 
sudo apt install ssh
```

---

Create a new ssh public / private key pair.

```bash
ssh-keygen
```

ssh-keygen will create two files in `~/.ssh`: 

- `id_rsa` -- private key -- **do not share the private key with anyone *EVER*.**
- `id_rsa.pub` - public key -- use this key to connect this as a client to other servers
  - github: https://github.com/settings/keys


To connect a client to this server, create a separate key-value pair on the client machine, then copy its public key to `~/.ssh/authorized_keys`

- if your client OS is linux or macos, you can use `ssh-copy-id`

  `ssh-copy-id -i ~/.ssh/id_rsa.pub user@remote-host`

- if your client is windows, copy the contents of id_rsa.pub and paste it into authorized_keys
  
  `vi ~/.ssh/authorized_keys`


