First update everything: 

```bash
sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y
```

---

systemctl

- `systemctl status` monitor running services
- `systemctl start` start service
- `systemctl enable` run service on reboot


---
ufw (Uncomplicated firewall)

`ufw` is a wrapper for `iptables` -- use `ufw` to manage simple firewall rules: 

```
sudo apt install ufw
sudo ufw enable
```

many apps have shorthands for ufw

```bash
sudo ufw allow ssh
sudo ufw allow postgresql
sudo ufw allow pihole
```

or specify ports: 
```bash
sudo ufw allow 27017
sudo ufw allow 27017/tcp
```

restart after adding a rule: 

```bash
sudo ufw reload
sudo ufw status
```
