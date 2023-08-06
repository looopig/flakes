# flakes

使用
``` bash
mkpasswd {PASSWORD} -m sha-512
```
生成 hash 密码串加入到配置当中

最后使用
```bash
nixos-install --no-root-passwd --flake .#laptop
```
