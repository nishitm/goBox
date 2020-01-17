# goBox

> GO sandbox to run untrusted code.

goBox uses Ptrace to hook into READ syscalls, giving you the option to accept or deny syscalls before they are executed.

## Usage

```
Usage of ./gobox:

  gobox [FLAGS] command

  flags:
    -h	Print Usage.
    -n value
        A glob pattern for automatically blocking file reads.
    -y value
        A glob pattern for automatically allowing file reads.
```

## Use cases

### You want to install anything

```shell
> gobox -n "/etc/password.txt" npm install sketchy-module

  BLOCKED READ on /etc/password.txt
```

```shell
> gobox -n "/etc/password.txt" bash <(curl  https://danger.zone/install.sh)

  BLOCKED READ on /etc/password.txt
```

### You are interested in what file reads you favourite program makes.

Sure you could use strace, but it references file descriptors goBox makes the this much easier at a glance by printing the absolute path of the fd.

```
> gobox ls
Wanting to READ /usr/lib/x86_64-linux-gnu/libselinux.so.1 [y/n]
```

**NOTE**: It's definitely a better idea to encrypt all your sensitive data, goBox should probably only be used when that is inconvenient or impractical.

**NOTE**: I haven't made any effort for cross-x compatibility so it currently only works on linux. I'd happily accept patches to improve portability.

