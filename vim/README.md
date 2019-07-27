## Windows下配置说明
为配色主题创建软链接:
```
mklink /j ${vim_install_dir}\Vim\${vim_version}\colors D:\Workspace\Github\myconf\vim\colorscheme\colors
```
例:
```
mklink /j "C:\Program Files (x86)\Vim\vim81\colors" D:\Workspace\Github\myconf\vim\colorscheme\colors
```
为主配置文件创建软链接:
```
mklink ${vim_install_dir}\Vim\vimrc D:\Workspace\Github\myconf\vim\vimrc
```
例:
```
mklink  "C:\Program Files (x86)\Vim\vimrc" D:\Workspace\Github\myconf\vim\vimrc
```
## Linux下配置说明

//TODO