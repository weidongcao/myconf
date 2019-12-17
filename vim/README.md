## Windows下配置说明
主配置文件创建软链接:
```
mklink ${vim_install_dir}\Vim\_vimrc D:\Workspace\Github\myconf\vim\vimrc
```
例:
```
mklink  "C:\Program Files (x86)\Vim\_vimrc" D:\Workspace\Github\myconf\vim\vimrc

mklink C:\Vim\_vimrc D:\Workspace\Github\myconf\vim\vimrc
```

为配色主题创建软链接:
创建colors目录软链接:
```
mklink /j ${vim_install_dir}\Vim\vimfiles\colors D:\Workspace\Github\myconf\vim\colorscheme\colors
```
例:
```
mklink /j "C:\Program Files (x86)\Vim\vim81\colors" D:\Workspace\Github\myconf\vim\colorscheme\colors

mklink /j C:\Vim\vimfiles\colors D:\Workspace\Github\myconf\vim\colorscheme\colors
```
创建autoload目录软链接:
```
mklink /j ${vim_install_dir}\Vim\vimfiles\autoload D:\Workspace\Github\myconf\vim\colorscheme\autoload
```
例:
```
mklink  "C:\Program Files (x86)\Vim\vimrc" D:\Workspace\Github\myconf\vim\vimrc

mklink  C:\Vim\vimrc D:\Workspace\Github\myconf\vim\vimrc

mklink /j "C:\Program Files (x86)\Vim\vimfiles\autoload" D:\Workspace\Github\myconf\vim\colorscheme\autoload

mklink /j C:\Vim\vimfiles\autoload D:\Workspace\Github\myconf\vim\colorscheme\autoload
```

## Linux下配置说明

//TODO

## Vim执行Python外部命令
把以下文件软链接到python的site-packages目录下
```
mklink  D:\ProgramFiles\Anaconda3\envs\python27\Lib\site-packages\wedo.pth  D:\Workspace\Github\myconf\vim\cmd\wedo.pth
mklink  D:\ProgramFiles\Anaconda3\envs\python3.6\Lib\site-packages\wedo.pth  D:\Workspace\Github\myconf\vim\cmd\wedo.pth
```

为vim外部Python命令创建软链接指向IDEA目录:
```
mklink D:\Workspace\Github\huanLing\src\main\com\utils\fmt_date.py D:\Workspace\Github\myconf\vim\cmd\python\fmt_date.py
```