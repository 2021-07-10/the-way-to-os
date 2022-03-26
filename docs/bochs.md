# Bochs

> `Ubuntu 20.04`

## 调试

> 5.9.2 Bochs 下的程序调试入门《x86汇编语言 - 从实模式到保护模式》

* `s`: 单步执行
* `b`: 断点
* `c`: 持续执行
* `r`: 显示通用寄存器
* `sreg`: 显示段寄存器
* `xp`: 显示指定物理内存的内容
* `q`: 退出

## 安装

### 2.6.11


```bash
sudo apt-get install -y bochs bochs-x
```

> Bug

* [`https://www.bilibili.com/video/BV1b44y1k7mT?p=2`](https://www.bilibili.com/video/BV1b44y1k7mT?p=2)
* [Fixed deadlock in GTK debugger gui pointed out in SF patch](https://sourceforge.net/p/bochs/code/14068/)



### 2.7

依赖

```bash
apt-get install -y build-essential libx11-dev xorg-dev libgtk2.0-dev
```


源码编译

```bash
wget https://nchc.dl.sourceforge.net/project/bochs/bochs/2.7/bochs-2.7.tar.gz
tar -zxvf bochs-2.7.tar.gz
cd bochs-2.7
./configure --enable-debugger --enable-debugger-gui
make
sudo make install
```

## Misc

创建磁盘

```bash
bximage -mode=create -hd=16M -q master.img # 2.6.11
bximage -func=create -hd=16M -q master.img # 2.7
```

镜像写入磁盘

```bash
nasm hello.asm -o hello.bin
dd if=hello.bin of=master.img bs=512 count=1 conv=notrunc
```


## 自动打一个断点

> [`https://www.bilibili.com/video/BV1b44y1k7mT?p=4&spm_id_from=pageDriver`](https://www.bilibili.com/video/BV1b44y1k7mT?p=4&spm_id_from=pageDriver)

需要在配置开启

```
magic_break: enabled=1
```

```nasm
xchg bx, bx
```

## Ref

* [https://bochs.sourceforge.io/](https://bochs.sourceforge.io/)
* [自己动手写操作系统（一）](https://blog.csdn.net/weixin_51760563/article/details/119713850)