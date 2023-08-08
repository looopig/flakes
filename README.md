# flakes

使用
``` bash
mkpasswd {PASSWORD} -m sha-512
```
生成 hash 密码串加入到配置当中

# 安装
```bash
nixos-install --no-root-passwd --flake .#laptop

#或者指定源：
nixos-install --option substituters "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" --no-root-passwd --flake .#laptop
```
