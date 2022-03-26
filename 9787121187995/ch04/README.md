# 第 4 章 虚拟机的安装和使用

|本期版本|上期版本
|:---:|:---:|
`Sat Mar 26 21:25:03 CST 2022` |

## 4.1 计算机的启动过程

### 4.1.2 计算机的加电和复位

* 对于 Intel 8086 来说，复位将使代码段寄存器(CS)的内容为 `0xFFFF`, 其他所有寄存器的内容为 `0x0000`
* **8086 之后的处理器并未延续这种设计**

### 4.1.5 一切从主引导扇区开始

* 硬盘的第一个扇区是 0 面 0 道 1 扇区，或者说是 0 头 0 柱 1 扇区，这个扇区称为 `主引导扇区`
* ROM-BIOS 将读取主引导扇区的内容，将它加载到内存地址  `0x0000:0x7c00`

```nasm
jmp 0x0000:0x7c00
```

## 4.2 创建和使用虚拟机

### 4.2.3  虚拟硬盘简介

* 硬盘的读写是以扇区为最小单位的。所以无论什么时候，要从硬盘读数据，或者向硬盘写数据，至少得是 1 个扇区

```bash
# 4MB = 4 * 1024 * 1024 = 4194816D = 0400200H
# 4194816 - 512 = 4194304

VBoxManage createmedium disk --filename demo --format VHD --variant Fixed --size 4
hexdump -s 4194304 -n 512 -C demo.vhd
```

### 4.2.4 练习使用 FixVhdWr 工具向虚拟硬盘写入数据

```bash
dd if=mbr.bin of=c.img bs=512 count=1 seek=100 conv=notrunc
```

## Ref

内存

* [RAM和ROM到底有什么区别？](https://www.youtube.com/watch?v=QODgKl84Uug)
* [内存时序到底是什么意思？越大越好？还是越小越好呢？](https://www.youtube.com/watch?v=VhStI8vYBT0)

硬盘

* [【科技杂谈65】记录的史诗，存储的百年马拉松](https://www.youtube.com/watch?v=hPrCDvdfLHQ)
* [【科技杂谈66】机械硬盘发展史](https://www.youtube.com/watch?v=8yDipw1RqEk&t=698s)
* [【硬件科普】选购机械硬盘的大坑，不看你就上当，详解SMR瓦楞式堆叠硬盘](https://www.youtube.com/watch?v=nxmlCNzme34)
* [了解固态硬盘SSD，竟然如此简单！小白也能懂！](https://www.youtube.com/watch?v=alb6-zp52mA)
* [柱面-磁头-扇区寻址的一些旧事](http://farseerfc.me/zhs/history-of-chs-addressing.html)