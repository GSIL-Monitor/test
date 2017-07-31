
Administrator@CM18VQGQ1G9666S MINGW32 ~
$ kk
bash: kk: command not found

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ cd ~/.ssh
bash: cd: /c/Users/Administrator/.ssh: No such file or directory

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ ssh-keygen -t rsa -C "1002110484@qq.com"
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/Administrator/.ssh/id_rsa):
Created directory '/c/Users/Administrator/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Passphrases do not match.  Try again.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /c/Users/Administrator/.ssh/id_rsa.
Your public key has been saved in /c/Users/Administrator/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:nPI0H1jNCRyTDZvv7DQN9orpwzjyDjLIO9mhu/gnBo4 1002110484@qq.com
The key's randomart image is:
+---[RSA 2048]----+
|         .==     |
|          oB..   |
|          + +    |
|       . + .     |
|      . S . +    |
|.. ..  + o = +   |
|o.o+o.. .o. = o  |
|Eo*.oo..o o= o   |
|.o=*   +oo+.o    |
+----[SHA256]-----+

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ ssh -T git@github.com
The authenticity of host 'github.com (192.30.255.112)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)?
Host key verification failed.

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ ssh -T git@github.com
The authenticity of host 'github.com (192.30.255.112)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,192.30.255.112' (RSA) to the list of known hosts.
Enter passphrase for key '/c/Users/Administrator/.ssh/id_rsa':
Permission denied (publickey).

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ ssh -T git@github.com
Enter passphrase for key '/c/Users/Administrator/.ssh/id_rsa':
Enter passphrase for key '/c/Users/Administrator/.ssh/id_rsa':
Hi github001100! You've successfully authenticated, but GitHub does not provide shell access.

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ git config --list
core.symlinks=false
core.autocrlf=true
core.fscache=true
color.diff=auto
color.status=auto
color.branch=auto
color.interactive=true
help.format=html
rebase.autosquash=true
http.sslcainfo=D:/Program Files/Git/mingw32/ssl/certs/ca-bundle.crt
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.required=true
filter.lfs.process=git-lfs filter-process
pack.packsizelimit=2g
credential.helper=manager
user.name=Fly
user.email=twofly88@Hotmail¡£com

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ git config --global user.name "fusanjie"

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ git config --global user.email "1002110484@qq.com"

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ git config --list
core.symlinks=false
core.autocrlf=true
core.fscache=true
color.diff=auto
color.status=auto
color.branch=auto
color.interactive=true
help.format=html
rebase.autosquash=true
http.sslcainfo=D:/Program Files/Git/mingw32/ssl/certs/ca-bundle.crt
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.required=true
filter.lfs.process=git-lfs filter-process
pack.packsizelimit=2g
credential.helper=manager
user.name=fusanjie
user.email=1002110484@qq.com

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ $ git clone git:https://github.com/github001100/test.git
bash: $: command not found

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ git clone git:https://github.com/github001100/test.git
Cloning into 'test'...
fatal: I don't handle protocol 'git:https'

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ git clone git://github.com/github001100/test.git
Cloning into 'test'...
warning: You appear to have cloned an empty repository.

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ mkdir test
mkdir: cannot create directory ¡®test¡¯: File exists

Administrator@CM18VQGQ1G9666S MINGW32 ~
$ cd test

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git init
Reinitialized existing Git repository in C:/Users/Administrator/test/.git/

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git add .

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git commit -m "first commit -fusanjie"
On branch master

Initial commit

nothing to commit

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git remote add origin https://github.com/github001100/test.git
fatal: remote origin already exists.

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git push -u origin master
error: src refspec master does not match any.
error: failed to push some refs to 'git://github.com/github001100/test.git'

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$  git init
Reinitialized existing Git repository in C:/Users/Administrator/test/.git/

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git push -u origin master
error: src refspec master does not match any.
error: failed to push some refs to 'git://github.com/github001100/test.git'

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ touch README

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git add README

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git commit -m 'first commit by fusanjie'
[master (root-commit) 6edd357] first commit by fusanjie
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 README

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git push origin master
fatal: remote error:
  You can't push to git://github.com/github001100/test.git
  Use https://github.com/github001100/test.git

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git push -u origin master
fatal: remote error:
  You can't push to git://github.com/github001100/test.git
  Use https://github.com/github001100/test.git

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$  git init
Reinitialized existing Git repository in C:/Users/Administrator/test/.git/

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git push -u origin master
fatal: remote error:
  You can't push to git://github.com/github001100/test.git
  Use https://github.com/github001100/test.git

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git remote add origin https://github.com/github001100/test.git
fatal: remote origin already exists.

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git push -u origin master
fatal: remote error:
  You can't push to git://github.com/github001100/test.git
  Use https://github.com/github001100/test.git

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git push -u origin master
fatal: remote error:
  You can't push to git://github.com/github001100/test.git
  Use https://github.com/github001100/test.git

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git remote rm origin

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git remote add origin git@github.com:github001100/test.git

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git push origin
fatal: The current branch master has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin master


Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git branch --set-upstream-to=origin/master
error: the requested upstream branch 'origin/master' does not exist
hint:
hint: If you are planning on basing your work on an upstream
hint: branch that already exists at the remote, you may need to
hint: run "git fetch" to retrieve it.
hint:
hint: If you are planning to push out a new local branch that
hint: will track its remote counterpart, you may want to use
hint: "git push -u" to set the upstream config as you push.

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git push --set-upstream origin develop
error: src refspec develop does not match any.
error: failed to push some refs to 'git@github.com:github001100/test.git'

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git push origin
fatal: The current branch master has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin master


Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$ git push -u origin master
Warning: Permanently added the RSA host key for IP address '192.30.255.113' to the list of known hosts.
Enter passphrase for key '/c/Users/Administrator/.ssh/id_rsa':
Counting objects: 3, done.
Writing objects: 100% (3/3), 209 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To github.com:github001100/test.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.

Administrator@CM18VQGQ1G9666S MINGW32 ~/test (master)
$
