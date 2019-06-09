# myconf
常用软件配置文件(IDEA/PyCharm/Vim/Emacs/Notepad++...)

*使用的时候把所有的配置文件pull到一个地方，软件再通过软链接读取*
Linux下创建软链接的命令：
```
# 小小输入法配置文件软链接

ln -s /opt/workspace/github/myconf/yong ~/.yong

# Emacs配置文件软链接
ln -s /opt/workspace/github/myconf/emacs ~/.emacs.d
```

Windows下为小小输入法配置文件目录创建软链接:
```
mklink /j C:\Users\Administrator\AppData\Roaming\yong D:\Workspace\Github\myconf\yong
```

Windows下IntelliJ-IDEA配置文件目录创建软链接:
cmd命令行创建.IntelliJIdea隐藏目录
```
md ${user.home}\.IntelliJIdea
```
录创建软链接
```
mklink /j ${user.home}\.IntelliJIdea\config D:\Workspace\Github\myconf\IntelliJ\config
```
创建idea.properties配置文件的软链接
```
mklink D:\ProgramFiles\JetBrains\IntelliJIDEA\bin\idea.properties D:\Workspace\Github\myconf\IntelliJ\idea\idea.properties
```

Windows下Notepad++配置文件目录创建软链接:
```
mklink /j ${user.home}\AppData\Roaming\Notepad++ D:\Workspace\Github\myconf\Notepad++
```