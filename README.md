# myconf
常用软件配置文件(IDEA/PyCharm/Vim/Emacs/Notepad++...)

*使用的时候把所有的配置文件pull到一个地方，软件再通过软链接读取*
Windows下不知github目录创建软链接到用户目录:
```
mklink /j ${user.home}\github D:\Workspace\Github
```
Linux下创建软链接的命令：
```
# 小小输入法配置文件软链接

ln -s /opt/workspace/github/myconf/yong ~/.yong

# Emacs配置文件软链接
ln -s /opt/workspace/github/myconf/emacs ~/.emacs.d
```

Windows下为小小输入法配置文件目录创建软链接:
```
mklink /j ${user.home}\AppData\Roaming\yong D:\Workspace\Github\myconf\yong
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
Windows下Maven相关配置
目录创建软链接:
```
mklink /j D:\ProgramFiles\maven D:\ProgramFiles\apache-maven-3.6.1
```
setting配置文件创建软链接:
```
mklink D:\ProgramFiles\maven\conf\settings.xml D:\Workspace\Github\myconf\maven\windows\settings.xml
mklink ${user.home}\.m2\settings.xml D:\Workspace\Github\myconf\maven\windows\settings.xml
md ${user.home}\.m2
```
创建Maven仓库位置:
```
md D:\ProgramFiles\apache-maven\repo
```
添加M2_HOME环境变量:```M2_HOME --> D:\ProgramFiles\apache-maven```

添加PATH:```%M2_HOME%\bin```

测试是否成功:```mvn -version```