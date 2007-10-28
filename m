From: Daniel van Eeden <daniel.van.eeden-dAMBqdhANRhmR6Xm/wNWPw@public.gmane.org>
Subject: Re: Oops with Nouveau on amd64 with nv15 card and
	kernel	2.6.22 (debian sid)
Date: Sun, 28 Oct 2007 14:11:36 +0100
Message-ID: <1193577097.21380.6.camel@pc1.myname.nl>
References: <1193510282.6740.5.camel@pc1.myname.nl>
	<6a89f9d50710271702x2c305fd3h4bb8e19315a0f8c5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-A9NPL8YvxKViLV8Uzz6Q"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a89f9d50710271702x2c305fd3h4bb8e19315a0f8c5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--=-A9NPL8YvxKViLV8Uzz6Q
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Stephane,

Thanks for the quick response.

I've tried today's git and the Oops went away. drm and nouveau are
working. :)

I tried mesa, but that failed with the following error (backtrace is
attached)
$ glxinfo
name of display: :0.0
************************************INFO***********************************
File nouveau_fifo.c function nouveauFifoInit line 149
Fifo init ok. Using context 2
***************************************************************************
Segmentation fault (core dumped)

I'm not on the list so please keep me on CC.

Cheers,

Daniel


On Sun, 2007-10-28 at 02:02 +0200, Stephane Marchesin wrote:
> 
> 
> On 10/27/07, Daniel van Eeden <daniel.van.eeden-dAMBqdhANRhmR6Xm/wNWPw@public.gmane.org> wrote:
>         Hello,
>         
>         I've build drm and nouveau from git and got this error while
>         starting
>         Xorg.
>         
>         Another thing is that before the install instructions on the
>         wiki worked
>         I had to install xorg-dev. This was the error I got before
>         installing 
>         xorg-dev:
>         ./configure: line 20257: syntax error near unexpected token
>         `RANDR,'
>         ./configure: line 20257: `XORG_DRIVER_CHECK_EXT(RANDR,
>         randrproto)'
>         
>         I'm not on the list so please keep me on CC.
> 
> Can you please retry with current drm git ?
> 
> Stephane
> 

--=-A9NPL8YvxKViLV8Uzz6Q
Content-Disposition: attachment; filename=glxinfo-nouveau-backtrace.txt
Content-Type: text/plain; name=glxinfo-nouveau-backtrace.txt; charset=UTF-8
Content-Transfer-Encoding: 7bit

GNU gdb 6.6.90.20070912-debian
Copyright (C) 2007 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu"...
(no debugging symbols found)
Using host libthread_db library "/lib/libthread_db.so.1".
Reading symbols from /usr/X11R6/lib/libGL.so.1...done.
Loaded symbols for /usr/X11R6/lib/libGL.so.1
Reading symbols from /lib/libc.so.6...done.
Loaded symbols for /lib/libc.so.6
Reading symbols from /usr/lib/libX11.so.6...done.
Loaded symbols for /usr/lib/libX11.so.6
Reading symbols from /usr/lib/libXext.so.6...done.
Loaded symbols for /usr/lib/libXext.so.6
Reading symbols from /usr/lib/libXxf86vm.so.1...done.
Loaded symbols for /usr/lib/libXxf86vm.so.1
Reading symbols from /usr/lib/libXdamage.so.1...done.
Loaded symbols for /usr/lib/libXdamage.so.1
Reading symbols from /usr/lib/libXfixes.so.3...done.
Loaded symbols for /usr/lib/libXfixes.so.3
Reading symbols from /lib/libm.so.6...done.
Loaded symbols for /lib/libm.so.6
Reading symbols from /lib/libpthread.so.0...done.
Loaded symbols for /lib/libpthread.so.0
Reading symbols from /lib/libdl.so.2...done.
Loaded symbols for /lib/libdl.so.2
Reading symbols from /usr/lib/libdrm.so.2...done.
Loaded symbols for /usr/lib/libdrm.so.2
Reading symbols from /lib/ld-linux-x86-64.so.2...done.
Loaded symbols for /lib64/ld-linux-x86-64.so.2
Reading symbols from /usr/lib/libXau.so.6...done.
Loaded symbols for /usr/lib/libXau.so.6
Reading symbols from /usr/lib/libXdmcp.so.6...done.
Loaded symbols for /usr/lib/libXdmcp.so.6
Reading symbols from /usr/X11R6/lib/modules/dri/nouveau_dri.so...done.
Loaded symbols for /usr/X11R6/lib/modules/dri/nouveau_dri.so
Reading symbols from /usr/lib/libexpat.so.1...done.
Loaded symbols for /usr/lib/libexpat.so.1
Core was generated by `glxinfo'.
Program terminated with signal 11, Segmentation fault.
#0  _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:287
	in shader/program.c
(gdb) bt
#0  _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:287
#1  0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#2  0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#3  0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#4  0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#5  0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#6  0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#7  0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#8  0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#9  0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#10 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#11 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#12 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#13 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#14 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#15 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#16 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#17 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#18 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#19 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#20 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#21 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#22 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#23 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#24 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#25 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#26 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#27 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#28 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#29 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#30 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#31 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#32 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#33 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#34 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#35 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#36 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#37 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#38 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#39 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#40 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#41 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#42 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#43 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#44 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#45 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#46 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#47 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#48 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#49 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#50 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#51 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#52 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#53 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#54 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#55 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#56 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#57 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#58 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#59 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#60 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#61 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#62 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#63 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#64 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#65 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#66 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#67 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#68 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#69 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#70 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#71 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#72 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#73 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#74 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#75 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#76 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#77 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#78 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#79 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#80 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#81 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#82 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#83 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#84 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#85 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#86 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#87 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#88 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#89 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#90 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#91 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#92 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#93 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#94 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#95 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#96 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#97 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#98 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#99 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#100 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#101 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#102 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#103 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#104 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#105 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#106 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#107 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#108 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#109 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#110 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#111 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#112 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#113 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#114 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#115 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#116 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#117 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#118 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#119 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#120 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#121 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#122 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#123 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#124 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#125 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#126 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#127 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#128 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#129 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#130 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#131 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#132 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#133 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#134 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#135 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#136 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#137 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#138 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#139 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#140 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#141 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#142 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#143 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#144 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#145 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#146 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#147 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#148 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#149 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#150 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#151 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#152 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#153 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#154 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#155 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#156 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#157 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#158 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#159 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#160 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#161 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#162 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#163 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#164 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#165 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#166 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#167 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#168 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#169 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#170 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#171 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#172 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#173 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#174 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#175 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#176 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#177 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#178 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#179 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#180 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#181 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#182 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#183 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#184 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#185 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#186 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#187 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#188 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#189 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#190 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#191 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#192 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#193 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#194 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#195 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#196 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#197 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#198 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#199 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#200 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#201 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#202 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#203 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#204 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#205 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#206 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#207 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#208 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#209 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#210 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#211 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#212 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#213 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#214 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#215 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#216 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#217 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#218 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#219 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#220 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#221 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#222 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#223 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#224 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#225 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#226 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#227 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#228 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#229 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#230 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#231 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#232 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#233 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#234 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#235 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#236 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#237 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#238 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#239 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#240 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#241 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#242 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#243 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#244 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#245 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#246 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#247 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#248 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#249 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#250 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#251 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#252 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#253 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#254 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#255 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#256 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#257 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#258 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#259 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#260 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#261 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#262 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#263 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#264 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#265 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#266 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#267 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#268 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#269 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#270 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#271 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#272 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#273 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#274 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#275 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#276 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#277 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#278 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#279 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#280 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#281 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#282 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#283 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#284 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#285 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#286 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#287 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#288 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#289 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#290 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#291 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#292 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#293 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#294 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#295 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#296 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#297 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#298 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#299 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#300 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#301 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#302 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#303 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#304 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#305 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#306 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#307 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#308 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#309 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#310 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#311 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#312 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#313 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#314 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#315 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#316 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#317 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#318 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#319 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#320 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#321 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#322 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#323 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#324 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#325 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#326 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#327 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#328 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#329 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#330 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#331 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#332 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#333 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#334 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#335 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#336 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#337 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#338 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#339 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#340 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#341 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#342 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#343 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#344 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#345 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#346 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#347 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#348 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#349 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#350 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#351 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#352 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#353 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#354 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#355 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#356 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#357 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#358 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#359 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#360 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#361 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#362 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#363 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#364 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#365 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#366 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#367 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#368 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#369 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#370 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#371 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#372 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#373 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#374 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#375 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#376 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#377 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#378 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#379 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#380 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#381 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#382 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#383 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#384 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#385 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#386 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#387 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#388 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#389 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#390 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#391 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#392 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#393 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#394 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#395 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#396 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#397 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#398 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#399 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#400 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#401 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#402 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#403 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#404 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#405 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#406 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#407 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#408 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#409 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#410 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#411 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#412 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#413 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#414 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#415 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#416 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#417 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#418 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#419 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#420 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#421 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#422 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#423 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#424 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#425 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#426 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#427 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#428 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#429 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#430 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#431 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#432 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#433 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#434 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#435 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#436 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#437 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#438 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#439 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#440 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#441 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#442 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#443 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#444 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#445 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#446 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#447 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#448 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#449 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#450 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#451 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#452 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#453 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#454 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#455 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#456 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#457 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#458 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#459 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#460 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#461 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#462 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#463 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#464 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#465 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#466 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#467 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#468 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#469 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#470 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#471 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#472 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#473 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#474 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#475 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#476 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#477 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#478 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#479 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#480 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#481 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#482 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#483 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#484 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#485 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#486 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#487 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#488 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#489 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#490 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#491 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#492 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#493 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#494 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#495 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#496 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#497 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#498 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#499 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#500 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#501 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#502 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#503 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#504 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#505 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#506 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#507 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#508 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#509 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#510 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#511 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#512 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#513 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#514 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#515 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#516 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#517 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#518 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#519 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#520 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#521 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#522 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#523 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#524 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#525 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#526 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#527 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#528 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#529 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#530 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#531 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#532 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#533 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#534 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#535 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#536 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#537 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#538 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#539 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#540 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#541 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#542 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#543 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#544 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#545 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#546 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#547 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#548 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#549 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#550 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#551 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#552 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#553 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#554 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#555 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#556 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#557 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#558 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#559 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#560 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#561 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#562 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#563 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#564 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#565 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#566 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#567 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#568 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#569 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#570 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#571 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#572 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#573 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#574 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#575 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#576 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#577 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#578 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#579 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#580 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#581 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#582 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#583 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#584 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#585 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#586 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#587 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#588 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#589 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#590 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#591 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#592 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#593 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#594 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#595 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#596 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#597 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#598 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#599 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#600 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#601 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#602 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#603 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#604 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#605 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#606 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#607 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#608 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#609 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#610 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#611 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#612 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#613 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#614 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#615 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#616 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#617 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#618 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#619 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#620 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#621 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#622 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#623 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#624 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#625 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#626 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#627 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#628 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#629 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#630 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#631 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#632 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#633 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#634 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#635 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#636 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#637 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#638 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#639 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#640 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#641 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#642 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#643 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#644 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#645 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#646 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#647 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#648 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#649 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#650 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#651 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#652 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#653 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#654 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#655 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#656 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#657 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#658 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#659 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#660 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#661 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#662 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#663 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#664 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#665 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#666 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#667 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#668 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#669 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#670 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#671 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#672 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#673 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#674 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#675 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#676 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#677 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#678 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#679 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#680 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#681 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#682 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#683 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#684 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#685 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#686 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#687 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#688 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#689 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#690 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#691 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#692 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#693 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#694 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#695 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#696 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#697 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#698 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#699 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#700 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#701 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#702 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#703 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#704 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#705 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#706 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#707 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#708 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#709 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#710 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#711 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#712 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#713 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#714 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#715 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#716 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#717 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#718 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#719 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#720 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#721 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#722 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#723 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#724 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#725 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#726 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#727 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#728 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#729 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#730 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#731 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#732 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#733 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#734 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#735 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#736 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#737 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#738 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#739 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#740 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#741 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#742 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#743 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#744 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#745 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#746 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#747 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#748 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#749 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#750 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#751 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#752 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#753 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#754 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#755 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#756 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#757 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#758 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#759 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#760 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#761 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#762 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#763 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#764 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#765 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#766 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#767 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#768 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#769 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#770 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#771 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#772 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#773 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#774 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#775 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#776 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#777 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#778 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#779 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#780 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#781 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#782 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#783 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#784 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#785 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#786 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#787 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#788 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#789 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#790 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#791 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#792 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#793 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#794 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#795 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#796 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#797 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#798 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#799 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#800 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#801 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#802 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#803 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#804 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#805 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#806 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#807 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#808 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#809 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#810 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#811 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#812 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#813 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#814 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#815 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#816 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#817 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#818 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#819 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#820 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#821 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#822 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#823 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#824 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#825 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#826 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#827 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#828 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#829 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#830 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#831 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#832 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#833 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#834 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#835 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#836 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#837 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#838 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#839 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#840 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#841 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#842 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#843 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#844 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#845 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#846 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#847 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#848 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#849 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#850 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#851 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#852 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#853 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#854 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#855 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#856 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#857 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#858 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#859 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#860 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#861 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#862 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#863 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#864 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#865 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#866 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#867 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#868 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#869 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#870 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#871 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#872 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#873 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#874 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#875 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#876 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#877 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#878 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#879 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#880 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#881 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#882 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#883 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#884 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#885 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#886 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#887 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#888 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#889 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#890 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#891 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#892 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#893 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#894 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#895 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#896 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#897 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#898 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#899 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#900 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#901 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#902 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#903 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#904 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#905 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#906 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#907 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#908 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#909 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#910 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#911 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#912 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#913 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#914 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#915 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#916 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#917 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#918 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#919 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#920 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#921 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#922 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#923 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#924 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#925 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#926 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#927 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#928 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#929 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#930 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#931 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#932 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#933 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#934 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#935 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#936 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#937 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#938 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#939 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#940 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#941 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#942 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#943 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#944 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#945 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#946 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#947 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#948 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#949 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#950 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#951 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#952 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#953 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#954 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#955 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#956 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#957 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#958 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#959 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#960 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#961 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#962 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#963 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#964 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#965 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#966 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#967 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#968 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#969 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#970 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#971 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#972 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#973 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#974 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#975 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#976 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#977 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#978 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#979 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#980 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#981 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#982 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#983 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#984 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#985 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#986 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#987 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#988 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#989 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#990 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#991 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#992 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#993 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#994 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#995 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#996 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#997 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#998 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#999 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, id=0)
    at shader/program.c:289
#1000 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1001 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1002 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1003 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1004 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1005 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1006 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1007 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1008 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1009 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1010 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1011 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1012 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1013 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1014 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1015 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1016 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1017 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1018 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1019 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1020 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1021 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1022 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1023 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1024 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1025 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1026 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1027 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1028 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1029 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1030 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1031 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1032 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1033 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1034 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1035 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1036 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1037 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1038 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1039 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1040 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1041 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1042 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1043 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1044 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1045 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1046 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1047 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1048 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1049 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1050 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1051 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1052 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1053 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1054 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1055 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1056 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1057 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1058 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1059 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1060 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1061 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1062 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1063 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1064 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1065 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1066 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1067 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1068 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1069 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1070 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1071 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1072 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1073 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1074 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1075 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1076 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1077 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1078 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1079 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1080 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1081 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1082 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1083 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1084 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1085 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1086 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1087 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1088 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1089 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1090 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1091 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1092 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1093 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1094 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1095 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1096 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1097 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1098 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1099 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1100 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1101 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1102 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1103 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1104 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1105 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1106 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1107 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1108 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1109 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1110 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1111 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1112 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1113 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1114 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1115 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1116 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1117 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1118 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1119 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1120 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1121 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1122 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1123 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1124 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1125 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1126 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1127 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1128 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1129 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1130 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1131 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1132 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1133 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1134 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1135 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1136 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1137 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1138 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1139 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1140 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1141 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1142 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1143 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1144 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1145 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1146 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1147 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1148 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1149 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1150 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1151 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1152 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1153 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1154 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1155 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1156 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1157 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1158 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1159 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1160 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1161 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1162 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1163 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1164 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1165 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1166 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1167 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1168 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1169 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1170 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1171 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1172 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1173 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1174 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1175 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1176 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1177 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1178 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1179 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1180 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1181 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1182 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1183 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1184 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1185 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1186 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1187 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1188 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1189 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1190 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1191 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1192 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1193 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1194 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1195 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1196 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1197 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1198 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1199 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1200 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1201 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1202 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1203 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1204 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1205 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1206 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1207 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1208 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1209 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1210 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1211 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1212 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1213 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1214 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1215 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1216 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1217 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1218 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1219 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1220 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1221 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1222 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1223 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1224 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1225 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1226 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1227 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1228 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1229 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1230 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1231 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1232 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1233 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1234 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1235 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1236 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1237 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1238 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1239 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1240 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1241 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1242 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1243 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1244 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1245 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1246 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1247 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1248 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1249 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1250 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1251 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1252 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1253 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1254 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1255 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1256 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1257 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1258 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1259 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1260 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1261 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1262 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1263 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1264 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1265 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1266 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1267 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1268 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1269 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1270 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1271 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1272 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1273 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1274 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1275 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1276 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1277 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1278 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1279 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1280 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1281 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1282 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1283 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1284 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1285 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1286 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1287 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1288 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1289 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1290 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1291 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1292 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1293 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1294 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1295 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1296 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1297 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1298 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1299 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1300 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1301 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1302 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1303 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1304 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1305 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1306 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1307 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1308 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1309 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1310 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1311 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1312 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1313 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1314 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1315 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1316 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1317 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1318 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1319 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1320 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1321 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1322 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1323 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1324 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1325 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1326 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1327 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1328 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1329 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1330 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1331 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1332 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1333 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1334 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1335 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1336 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1337 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1338 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1339 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1340 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1341 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1342 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1343 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1344 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1345 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1346 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1347 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1348 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1349 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1350 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1351 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1352 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1353 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1354 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1355 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1356 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1357 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1358 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1359 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1360 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1361 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1362 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1363 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1364 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1365 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1366 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1367 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1368 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1369 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1370 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1371 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1372 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1373 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1374 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1375 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1376 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1377 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1378 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1379 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1380 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1381 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1382 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1383 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1384 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1385 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1386 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1387 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1388 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1389 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1390 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1391 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1392 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1393 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1394 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1395 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1396 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1397 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1398 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1399 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1400 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1401 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1402 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1403 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1404 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1405 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1406 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1407 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1408 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1409 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1410 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1411 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1412 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1413 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1414 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1415 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1416 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1417 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1418 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1419 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1420 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1421 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1422 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1423 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1424 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1425 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1426 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1427 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1428 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1429 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1430 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1431 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1432 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1433 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1434 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1435 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1436 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1437 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1438 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1439 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1440 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1441 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1442 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1443 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1444 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1445 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1446 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1447 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1448 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1449 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1450 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1451 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1452 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1453 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1454 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1455 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1456 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1457 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1458 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1459 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1460 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1461 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1462 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1463 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1464 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1465 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1466 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1467 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1468 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1469 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1470 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1471 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1472 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1473 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1474 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1475 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1476 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1477 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1478 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1479 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1480 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1481 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1482 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1483 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1484 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1485 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1486 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1487 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1488 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1489 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1490 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1491 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1492 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1493 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1494 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1495 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1496 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1497 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1498 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1499 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1500 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1501 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1502 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1503 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1504 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1505 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1506 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1507 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1508 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1509 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1510 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1511 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1512 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1513 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1514 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1515 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1516 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1517 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1518 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1519 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1520 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1521 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1522 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1523 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1524 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1525 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1526 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1527 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1528 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1529 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1530 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1531 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1532 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1533 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1534 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1535 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1536 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1537 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1538 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1539 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1540 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1541 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1542 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1543 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1544 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1545 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1546 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1547 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1548 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1549 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1550 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1551 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1552 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1553 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1554 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1555 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1556 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1557 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1558 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1559 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1560 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1561 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1562 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1563 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1564 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1565 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1566 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1567 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1568 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1569 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1570 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1571 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1572 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1573 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1574 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1575 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1576 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1577 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1578 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1579 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1580 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1581 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1582 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1583 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1584 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1585 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1586 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1587 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1588 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1589 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1590 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1591 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1592 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1593 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1594 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1595 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1596 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1597 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1598 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1599 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1600 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1601 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1602 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1603 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1604 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1605 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1606 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1607 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1608 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1609 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1610 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1611 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1612 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1613 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1614 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1615 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1616 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1617 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1618 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1619 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1620 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1621 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1622 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1623 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1624 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1625 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1626 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1627 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1628 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1629 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1630 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1631 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1632 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1633 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1634 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1635 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1636 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1637 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1638 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1639 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1640 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1641 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1642 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1643 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1644 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1645 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1646 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1647 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1648 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1649 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1650 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1651 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1652 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1653 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1654 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1655 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1656 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1657 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1658 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1659 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1660 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1661 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1662 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1663 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1664 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1665 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1666 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1667 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1668 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1669 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1670 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1671 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1672 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1673 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1674 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1675 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1676 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1677 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1678 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1679 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1680 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1681 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1682 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1683 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1684 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1685 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1686 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1687 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1688 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1689 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1690 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1691 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1692 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1693 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1694 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1695 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1696 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1697 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1698 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1699 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1700 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1701 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1702 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1703 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1704 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1705 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1706 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1707 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1708 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1709 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1710 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1711 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1712 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1713 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1714 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1715 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1716 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1717 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1718 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1719 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1720 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1721 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1722 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1723 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1724 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1725 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1726 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1727 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1728 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1729 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1730 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1731 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1732 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1733 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1734 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1735 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1736 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1737 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1738 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1739 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1740 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1741 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1742 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1743 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1744 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1745 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1746 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1747 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1748 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1749 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1750 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1751 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1752 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1753 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1754 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1755 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1756 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1757 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1758 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1759 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1760 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1761 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1762 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1763 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1764 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1765 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1766 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1767 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1768 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1769 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1770 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1771 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1772 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1773 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1774 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1775 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1776 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1777 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1778 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1779 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1780 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1781 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1782 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1783 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1784 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1785 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1786 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1787 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1788 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1789 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1790 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1791 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1792 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1793 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1794 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1795 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1796 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1797 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1798 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1799 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1800 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1801 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1802 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1803 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1804 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1805 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1806 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1807 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1808 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1809 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1810 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1811 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1812 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1813 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1814 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1815 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1816 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1817 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1818 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1819 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1820 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1821 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1822 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1823 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1824 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1825 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1826 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1827 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1828 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1829 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1830 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1831 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1832 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1833 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1834 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1835 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1836 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1837 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1838 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1839 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1840 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1841 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1842 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1843 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1844 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1845 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1846 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1847 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1848 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1849 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1850 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1851 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1852 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1853 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1854 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1855 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1856 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1857 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1858 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1859 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1860 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1861 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1862 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1863 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1864 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1865 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1866 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1867 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1868 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1869 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1870 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1871 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1872 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1873 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1874 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1875 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1876 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1877 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1878 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1879 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1880 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1881 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1882 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1883 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1884 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1885 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1886 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1887 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1888 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1889 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1890 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1891 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1892 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1893 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1894 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1895 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1896 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1897 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1898 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1899 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1900 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1901 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1902 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1903 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1904 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1905 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1906 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1907 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1908 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1909 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1910 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1911 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1912 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1913 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1914 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1915 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1916 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1917 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1918 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1919 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1920 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1921 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1922 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1923 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1924 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1925 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1926 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1927 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1928 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1929 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1930 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1931 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1932 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1933 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1934 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1935 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1936 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1937 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1938 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1939 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1940 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1941 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1942 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1943 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1944 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1945 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1946 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1947 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1948 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1949 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1950 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1951 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1952 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1953 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1954 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1955 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1956 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1957 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1958 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1959 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1960 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1961 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1962 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1963 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1964 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1965 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1966 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1967 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1968 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1969 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1970 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1971 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1972 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1973 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1974 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1975 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1976 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1977 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1978 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1979 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1980 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1981 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1982 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1983 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1984 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1985 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1986 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1987 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1988 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1989 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1990 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1991 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1992 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1993 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1994 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1995 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1996 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1997 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1998 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#1999 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2000 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2001 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2002 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2003 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2004 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2005 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2006 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2007 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2008 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2009 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2010 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2011 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2012 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2013 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2014 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2015 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2016 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2017 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2018 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2019 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2020 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2021 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2022 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2023 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2024 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2025 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2026 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2027 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2028 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2029 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2030 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2031 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2032 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2033 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2034 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2035 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2036 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2037 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2038 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2039 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2040 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2041 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2042 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2043 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2044 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2045 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2046 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2047 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2048 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2049 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2050 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2051 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2052 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2053 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2054 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2055 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2056 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2057 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2058 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2059 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2060 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2061 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2062 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2063 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2064 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2065 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2066 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2067 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2068 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2069 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2070 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2071 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2072 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2073 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2074 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2075 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2076 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2077 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2078 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2079 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2080 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2081 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2082 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2083 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2084 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2085 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2086 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2087 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2088 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2089 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2090 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2091 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2092 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2093 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2094 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2095 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2096 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2097 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2098 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2099 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2100 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2101 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2102 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2103 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2104 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2105 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2106 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2107 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2108 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2109 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2110 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2111 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2112 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2113 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2114 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2115 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2116 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2117 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2118 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2119 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2120 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2121 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2122 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2123 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2124 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2125 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2126 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2127 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2128 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2129 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2130 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2131 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2132 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2133 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2134 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2135 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2136 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2137 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2138 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2139 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2140 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2141 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2142 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2143 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2144 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2145 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2146 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2147 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2148 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2149 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2150 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2151 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2152 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2153 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2154 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2155 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2156 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2157 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2158 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2159 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2160 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2161 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2162 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2163 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2164 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2165 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2166 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2167 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2168 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2169 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2170 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2171 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2172 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2173 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2174 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2175 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2176 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2177 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2178 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2179 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2180 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2181 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2182 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2183 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2184 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2185 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2186 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2187 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2188 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2189 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2190 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2191 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2192 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2193 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2194 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2195 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2196 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2197 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2198 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2199 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2200 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2201 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2202 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2203 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2204 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2205 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2206 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2207 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2208 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2209 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2210 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2211 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2212 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2213 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2214 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2215 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2216 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2217 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2218 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2219 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2220 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2221 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2222 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2223 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2224 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2225 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2226 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2227 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2228 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2229 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2230 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2231 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2232 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2233 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2234 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2235 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2236 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2237 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2238 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2239 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2240 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2241 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2242 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2243 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2244 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2245 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2246 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2247 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2248 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2249 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2250 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2251 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2252 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2253 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2254 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2255 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2256 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2257 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2258 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2259 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2260 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2261 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2262 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2263 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2264 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2265 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2266 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2267 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2268 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2269 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2270 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2271 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2272 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2273 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2274 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2275 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2276 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2277 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2278 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2279 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2280 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2281 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2282 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2283 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2284 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2285 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2286 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2287 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2288 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2289 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2290 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2291 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2292 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2293 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2294 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2295 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2296 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2297 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2298 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2299 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2300 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2301 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2302 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2303 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2304 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2305 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2306 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2307 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2308 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2309 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2310 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2311 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2312 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2313 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2314 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2315 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2316 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2317 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2318 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2319 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2320 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2321 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2322 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2323 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2324 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2325 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2326 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2327 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2328 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2329 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2330 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2331 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2332 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2333 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2334 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2335 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2336 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2337 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2338 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2339 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2340 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2341 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2342 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2343 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2344 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2345 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2346 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2347 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2348 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2349 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2350 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2351 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2352 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2353 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2354 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2355 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2356 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2357 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2358 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2359 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2360 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2361 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2362 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2363 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2364 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2365 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2366 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2367 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2368 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2369 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2370 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2371 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2372 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2373 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2374 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2375 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2376 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2377 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2378 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2379 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2380 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2381 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2382 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2383 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2384 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2385 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2386 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2387 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2388 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2389 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2390 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2391 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2392 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2393 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2394 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2395 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2396 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2397 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2398 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2399 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2400 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2401 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2402 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2403 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2404 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2405 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2406 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2407 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2408 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2409 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2410 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2411 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2412 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2413 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2414 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2415 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2416 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2417 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2418 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2419 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2420 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2421 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2422 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2423 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2424 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2425 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2426 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2427 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2428 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2429 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2430 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2431 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2432 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2433 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2434 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2435 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2436 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2437 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2438 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2439 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2440 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2441 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2442 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2443 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2444 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2445 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2446 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2447 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2448 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2449 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2450 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2451 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2452 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2453 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2454 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2455 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2456 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2457 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2458 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2459 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2460 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2461 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2462 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2463 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2464 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2465 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2466 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2467 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2468 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2469 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2470 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2471 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2472 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2473 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2474 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2475 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2476 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2477 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2478 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2479 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2480 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2481 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2482 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2483 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2484 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2485 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2486 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2487 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2488 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2489 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2490 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2491 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2492 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2493 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2494 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2495 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2496 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2497 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2498 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2499 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2500 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2501 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2502 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2503 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2504 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2505 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2506 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2507 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2508 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2509 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2510 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2511 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2512 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2513 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2514 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2515 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2516 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2517 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2518 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2519 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2520 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2521 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2522 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2523 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2524 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2525 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2526 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2527 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2528 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2529 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2530 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2531 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2532 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2533 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2534 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2535 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2536 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2537 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2538 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2539 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2540 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2541 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2542 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2543 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2544 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2545 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2546 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2547 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2548 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2549 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2550 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2551 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2552 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2553 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2554 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2555 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2556 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2557 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2558 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2559 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2560 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2561 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2562 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2563 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2564 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2565 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2566 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2567 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2568 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2569 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2570 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2571 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2572 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2573 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2574 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2575 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2576 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2577 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2578 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2579 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2580 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2581 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2582 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2583 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2584 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2585 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2586 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2587 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2588 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2589 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2590 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2591 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2592 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2593 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2594 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2595 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2596 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2597 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2598 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2599 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2600 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2601 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2602 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2603 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2604 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2605 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2606 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2607 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2608 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2609 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2610 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2611 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2612 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2613 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2614 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2615 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2616 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2617 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2618 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2619 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2620 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2621 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2622 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2623 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2624 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2625 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2626 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2627 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2628 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2629 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2630 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2631 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2632 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2633 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2634 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2635 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2636 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2637 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2638 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2639 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2640 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2641 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2642 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2643 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2644 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2645 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2646 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2647 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2648 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2649 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2650 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2651 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2652 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2653 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2654 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2655 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2656 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2657 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2658 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2659 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2660 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2661 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2662 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2663 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2664 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2665 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2666 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2667 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2668 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2669 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2670 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2671 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2672 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2673 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2674 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2675 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2676 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2677 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2678 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2679 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2680 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2681 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2682 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2683 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2684 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2685 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2686 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2687 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2688 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2689 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2690 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2691 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2692 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2693 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2694 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2695 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2696 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2697 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2698 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2699 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2700 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2701 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2702 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2703 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2704 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2705 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2706 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2707 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2708 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2709 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2710 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2711 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2712 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2713 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2714 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2715 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2716 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2717 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2718 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2719 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2720 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2721 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2722 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2723 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2724 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2725 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2726 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2727 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2728 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2729 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2730 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2731 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2732 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2733 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2734 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2735 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2736 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2737 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2738 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2739 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2740 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2741 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2742 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2743 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2744 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2745 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2746 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2747 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2748 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2749 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2750 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2751 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2752 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2753 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2754 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2755 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2756 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2757 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2758 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2759 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2760 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2761 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2762 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2763 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2764 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2765 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2766 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2767 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2768 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2769 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2770 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2771 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2772 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2773 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2774 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2775 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2776 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2777 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2778 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2779 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2780 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2781 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2782 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2783 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2784 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2785 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2786 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2787 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2788 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2789 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2790 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2791 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2792 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2793 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2794 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2795 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2796 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2797 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2798 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2799 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2800 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2801 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2802 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2803 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2804 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2805 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2806 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2807 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2808 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2809 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2810 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2811 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2812 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2813 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2814 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2815 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2816 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2817 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2818 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2819 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2820 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2821 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2822 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2823 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2824 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2825 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2826 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2827 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2828 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2829 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2830 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2831 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2832 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2833 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2834 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2835 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2836 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2837 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2838 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2839 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2840 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2841 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2842 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2843 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2844 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2845 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2846 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2847 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2848 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2849 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2850 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2851 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2852 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2853 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2854 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2855 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2856 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2857 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2858 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2859 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2860 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2861 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2862 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2863 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2864 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2865 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2866 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2867 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2868 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2869 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2870 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2871 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2872 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2873 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2874 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2875 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2876 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2877 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2878 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2879 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2880 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2881 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2882 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2883 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2884 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2885 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2886 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2887 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2888 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2889 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2890 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2891 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2892 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2893 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2894 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2895 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2896 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2897 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2898 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2899 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2900 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2901 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2902 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2903 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2904 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2905 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2906 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2907 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2908 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2909 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2910 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2911 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2912 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2913 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2914 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2915 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2916 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2917 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2918 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2919 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2920 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2921 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2922 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2923 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2924 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2925 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2926 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2927 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2928 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2929 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2930 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2931 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2932 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2933 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2934 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2935 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2936 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2937 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2938 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2939 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2940 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2941 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2942 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2943 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2944 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2945 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2946 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2947 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2948 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2949 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2950 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2951 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2952 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2953 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2954 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2955 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2956 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2957 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2958 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2959 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2960 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2961 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2962 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2963 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2964 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2965 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2966 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2967 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2968 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2969 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2970 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2971 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2972 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2973 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2974 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2975 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2976 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2977 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2978 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2979 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2980 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2981 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2982 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2983 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2984 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2985 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2986 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2987 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2988 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2989 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2990 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2991 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2992 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2993 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2994 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2995 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2996 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2997 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2998 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#2999 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3000 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3001 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3002 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3003 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3004 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3005 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3006 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3007 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3008 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3009 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3010 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3011 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3012 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3013 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3014 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3015 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3016 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3017 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3018 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3019 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3020 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3021 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3022 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3023 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3024 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3025 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3026 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3027 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3028 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3029 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3030 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3031 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3032 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3033 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3034 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3035 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3036 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3037 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3038 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3039 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3040 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3041 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3042 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3043 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3044 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3045 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3046 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3047 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3048 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3049 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3050 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3051 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3052 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3053 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3054 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3055 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3056 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3057 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3058 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3059 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3060 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3061 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3062 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3063 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3064 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3065 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3066 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3067 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3068 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3069 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3070 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3071 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3072 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3073 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3074 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3075 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3076 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3077 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3078 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3079 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3080 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3081 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3082 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3083 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3084 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3085 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3086 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3087 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3088 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3089 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3090 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3091 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3092 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3093 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3094 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3095 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3096 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3097 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3098 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3099 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3100 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3101 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3102 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3103 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3104 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3105 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3106 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3107 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3108 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3109 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3110 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3111 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3112 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3113 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3114 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3115 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3116 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3117 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3118 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3119 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3120 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3121 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3122 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3123 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3124 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3125 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3126 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3127 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3128 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3129 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3130 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3131 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3132 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3133 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3134 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3135 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3136 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3137 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3138 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3139 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3140 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3141 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3142 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3143 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3144 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3145 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3146 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3147 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3148 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3149 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3150 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3151 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3152 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3153 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3154 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3155 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3156 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3157 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3158 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3159 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3160 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3161 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3162 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3163 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3164 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3165 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3166 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3167 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3168 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3169 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3170 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3171 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3172 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3173 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3174 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3175 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3176 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3177 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3178 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3179 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3180 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3181 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3182 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3183 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3184 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3185 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3186 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3187 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3188 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3189 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3190 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3191 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3192 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3193 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3194 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3195 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3196 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3197 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3198 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3199 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3200 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3201 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3202 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3203 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3204 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3205 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3206 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3207 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3208 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3209 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3210 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3211 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3212 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3213 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3214 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3215 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3216 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3217 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3218 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3219 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3220 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3221 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3222 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3223 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3224 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3225 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3226 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3227 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3228 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3229 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3230 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3231 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3232 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3233 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3234 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3235 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3236 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3237 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3238 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3239 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3240 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3241 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3242 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3243 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3244 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3245 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3246 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3247 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3248 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3249 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3250 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3251 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3252 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3253 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3254 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3255 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3256 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3257 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3258 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3259 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3260 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3261 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3262 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3263 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3264 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3265 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3266 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3267 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3268 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3269 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3270 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3271 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3272 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3273 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3274 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3275 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3276 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3277 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3278 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3279 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3280 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3281 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3282 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3283 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3284 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3285 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3286 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3287 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3288 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3289 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3290 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3291 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3292 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3293 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3294 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3295 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3296 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3297 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3298 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3299 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3300 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3301 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3302 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3303 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3304 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3305 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3306 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3307 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3308 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3309 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3310 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3311 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3312 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3313 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3314 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3315 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3316 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3317 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3318 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3319 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3320 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3321 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3322 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3323 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3324 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3325 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3326 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3327 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3328 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3329 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3330 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3331 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3332 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3333 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3334 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3335 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3336 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3337 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3338 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3339 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3340 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3341 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3342 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3343 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3344 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3345 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3346 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3347 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3348 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3349 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3350 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3351 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3352 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3353 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3354 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3355 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3356 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3357 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3358 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3359 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3360 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3361 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3362 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3363 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3364 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3365 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3366 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3367 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3368 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3369 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3370 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3371 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3372 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3373 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3374 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3375 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3376 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3377 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3378 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3379 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3380 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3381 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3382 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3383 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3384 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3385 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3386 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3387 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3388 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3389 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3390 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3391 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3392 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3393 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3394 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3395 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3396 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3397 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3398 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3399 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3400 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3401 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3402 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3403 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3404 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3405 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3406 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3407 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3408 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3409 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3410 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3411 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3412 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3413 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3414 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3415 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3416 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3417 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3418 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3419 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3420 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3421 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3422 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3423 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3424 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3425 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3426 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3427 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3428 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3429 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3430 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3431 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3432 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3433 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3434 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3435 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3436 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3437 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3438 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3439 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3440 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3441 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3442 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3443 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3444 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3445 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3446 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3447 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3448 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3449 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3450 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3451 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3452 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3453 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3454 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3455 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3456 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3457 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3458 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3459 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3460 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3461 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3462 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3463 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3464 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3465 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3466 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3467 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3468 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3469 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3470 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3471 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3472 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3473 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3474 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3475 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3476 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3477 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3478 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3479 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3480 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3481 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3482 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3483 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3484 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3485 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3486 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3487 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3488 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3489 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3490 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3491 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3492 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3493 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3494 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3495 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3496 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3497 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3498 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3499 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3500 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3501 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3502 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3503 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3504 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3505 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3506 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3507 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3508 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3509 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3510 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3511 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3512 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3513 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3514 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3515 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3516 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3517 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3518 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3519 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3520 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3521 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3522 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3523 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3524 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3525 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3526 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3527 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3528 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3529 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3530 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3531 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3532 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3533 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3534 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3535 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3536 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3537 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3538 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3539 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3540 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3541 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3542 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3543 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3544 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3545 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3546 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3547 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3548 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3549 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3550 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3551 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3552 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3553 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3554 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3555 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3556 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3557 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3558 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3559 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3560 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3561 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3562 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3563 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3564 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3565 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3566 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3567 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3568 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3569 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3570 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3571 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3572 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3573 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3574 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3575 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3576 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3577 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3578 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3579 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3580 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3581 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3582 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3583 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3584 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3585 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3586 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3587 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3588 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3589 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3590 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3591 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3592 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3593 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3594 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3595 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3596 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3597 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3598 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3599 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3600 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3601 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3602 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3603 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3604 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3605 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3606 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3607 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3608 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3609 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3610 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3611 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3612 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3613 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3614 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3615 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3616 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3617 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3618 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3619 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3620 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3621 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3622 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3623 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3624 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3625 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3626 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3627 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3628 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3629 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3630 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3631 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3632 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3633 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3634 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3635 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3636 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3637 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3638 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3639 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3640 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3641 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3642 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3643 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3644 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3645 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3646 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3647 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3648 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3649 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3650 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3651 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3652 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3653 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3654 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3655 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3656 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3657 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3658 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3659 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3660 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3661 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3662 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3663 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3664 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3665 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3666 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3667 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3668 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3669 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3670 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3671 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3672 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3673 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3674 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3675 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3676 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3677 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3678 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3679 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3680 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3681 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3682 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3683 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3684 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3685 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3686 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3687 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3688 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3689 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3690 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3691 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3692 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3693 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3694 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3695 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3696 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3697 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3698 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3699 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3700 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3701 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3702 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3703 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3704 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3705 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3706 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3707 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3708 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3709 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3710 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3711 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3712 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3713 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3714 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3715 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3716 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3717 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3718 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3719 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3720 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3721 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3722 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3723 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3724 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3725 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3726 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3727 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3728 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3729 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3730 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3731 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3732 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3733 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3734 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3735 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3736 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3737 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3738 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3739 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3740 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3741 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3742 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3743 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3744 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3745 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3746 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3747 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3748 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3749 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3750 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3751 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3752 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3753 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3754 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3755 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3756 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3757 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3758 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3759 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3760 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3761 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3762 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3763 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3764 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3765 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3766 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3767 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3768 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3769 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3770 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3771 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3772 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3773 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3774 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3775 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3776 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3777 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3778 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3779 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3780 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3781 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3782 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3783 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3784 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3785 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3786 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3787 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3788 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3789 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3790 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3791 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3792 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3793 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3794 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3795 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3796 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3797 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3798 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3799 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3800 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3801 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3802 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3803 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3804 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3805 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3806 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3807 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3808 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3809 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3810 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3811 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3812 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3813 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3814 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3815 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3816 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3817 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3818 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3819 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3820 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3821 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3822 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3823 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3824 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3825 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3826 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3827 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3828 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3829 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3830 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3831 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3832 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3833 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3834 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3835 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3836 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3837 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3838 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3839 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3840 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3841 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3842 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3843 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3844 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3845 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3846 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3847 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3848 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3849 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3850 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3851 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3852 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3853 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3854 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3855 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3856 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3857 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3858 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3859 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3860 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3861 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3862 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3863 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3864 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3865 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3866 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3867 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3868 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3869 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3870 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3871 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3872 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3873 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3874 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3875 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3876 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3877 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3878 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3879 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3880 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3881 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3882 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3883 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3884 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3885 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3886 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3887 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3888 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3889 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3890 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3891 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3892 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3893 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3894 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3895 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3896 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3897 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3898 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3899 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3900 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3901 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3902 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3903 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3904 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3905 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3906 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3907 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3908 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3909 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3910 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3911 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3912 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3913 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3914 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3915 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3916 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3917 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3918 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3919 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3920 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3921 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3922 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3923 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3924 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3925 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3926 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3927 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3928 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3929 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3930 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3931 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3932 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3933 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3934 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3935 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3936 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3937 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3938 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3939 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3940 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3941 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3942 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3943 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3944 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3945 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3946 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3947 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3948 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3949 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3950 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3951 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3952 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3953 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3954 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3955 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3956 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3957 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3958 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3959 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3960 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3961 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3962 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3963 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3964 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3965 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3966 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3967 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3968 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3969 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3970 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3971 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3972 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3973 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3974 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3975 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3976 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3977 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3978 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3979 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3980 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3981 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3982 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3983 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3984 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3985 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3986 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3987 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3988 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3989 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3990 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3991 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3992 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3993 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3994 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3995 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3996 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3997 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3998 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#3999 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4000 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4001 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4002 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4003 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4004 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4005 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4006 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4007 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4008 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4009 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4010 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4011 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4012 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4013 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4014 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4015 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4016 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4017 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4018 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4019 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4020 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4021 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4022 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4023 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4024 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4025 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4026 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4027 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4028 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4029 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4030 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4031 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4032 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4033 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4034 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4035 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4036 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4037 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4038 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4039 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4040 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4041 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4042 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4043 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4044 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4045 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4046 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4047 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4048 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4049 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4050 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4051 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4052 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4053 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4054 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289
#4055 0x00002b9f9e5f4ee1 in _mesa_new_program (ctx=0x61ac40, target=34336, 
    id=0) at shader/program.c:289

--=-A9NPL8YvxKViLV8Uzz6Q
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-A9NPL8YvxKViLV8Uzz6Q--
