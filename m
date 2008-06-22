From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Fw:  Renouoveau hangs on 79th test on 8800 GT
Date: Sun, 22 Jun 2008 14:27:05 +0300
Message-ID: <20080622142705.2010d5db@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Aaron Whitehouse <lists-U0r1Rbd8+dlZj6j52QthyaVXKuFTiq87@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Forwarding some personal communique to the list, as I'm not the best to
answer. Looks like a bug in the proprietary driver, that prevents SDL
from cleaning up the graphics system. Or renouveau is putting the card
to a funny state, which the blob does not expect.

Aaron, might be worth to try a different driver version, and please at least
CC the list next time.

>> The computer has a nVidia Corporation GeForce 8800 GT (rev a2) and I
>> am running Koala's script.
>>
>> It compiles and runs through most of the tests properly, but
>> consistently hangs indefinitely on the 79th test until I press Ctrl+C
>> and quit the program.  


Begin forwarded message:

Date: Sun, 22 Jun 2008 15:02:50 +1200
From: "Aaron Whitehouse" <lists-U0r1Rbd8+dlZj6j52QthyaVXKuFTiq87@public.gmane.org>
To: "Pekka Paalanen" <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [Nouveau] Renouoveau hangs on 79th test on 8800 GT


Pekka,

Please find attached the backtrace.

The program didn't quit when I pressed Ctrl+C and wouldn't quit when I
tried to close it with System Monitor. The backtrace is after it hung.

$ gdb ./renouveau
GNU gdb 6.8-debian
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu"...
(gdb) run
Starting program: /home/ryan/Desktop/rentmp/renouveau/renouveau 
[Thread debugging using libthread_db enabled]
[New Thread 0x7f7e858966e0 (LWP 6135)]
9/80 test_draw_buffer                                 
No Stereo context. Skipping stereo tests
No double buffering. Skipping double buffer tests
No GL_EXT_vertex_weighting extension.                                  
No GL_NV_texgen_emboss extension.                                 
GL_NV_vertex_program3 crashes up until driver 100.14.19 on G80 - skipping.
79/80 test_arb_vertex_buffer_object_indexed                              

Program received signal SIGINT, Interrupt.
[Switching to Thread 0x7f7e858966e0 (LWP 6135)]
0x00007f7e84c69757 in sched_yield () from /lib/libc.so.6
(gdb) bt
#0  0x00007f7e84c69757 in sched_yield () from /lib/libc.so.6
#1  0x00007f7e820dcdb5 in ?? () from /usr/lib/libGLcore.so.1
#2  0x00007f7e81e6a27c in ?? () from /usr/lib/libGLcore.so.1
#3  0x00007f7e81e6b926 in _nv000087gl () from /usr/lib/libGLcore.so.1
#4  0x00007f7e8262e92d in ?? () from /usr/lib/libGL.so.1
#5  0x00007f7e82631d70 in ?? () from /usr/lib/libGL.so.1
#6  0x00007f7e8260a518 in ?? () from /usr/lib/libGL.so.1
#7  0x00007f7e81ba71fd in ?? () from /usr/lib/libGLcore.so.1
#8  0x00007f7e81bcd578 in ?? () from /usr/lib/libGLcore.so.1
#9  0x00007f7e81bcd6b3 in _nv000549gl () from /usr/lib/libGLcore.so.1
#10 0x00007f7e81ba779f in ?? () from /usr/lib/libGLcore.so.1
#11 0x00007f7e81b9351c in ?? () from /usr/lib/libGLcore.so.1
#12 0x00007f7e81e2dec3 in ?? () from /usr/lib/libGLcore.so.1
#13 0x00007f7e8262d60f in ?? () from /usr/lib/libGL.so.1
#14 0x00007f7e82607e78 in ?? () from /usr/lib/libGL.so.1
#15 0x00007f7e8260afe0 in ?? () from /usr/lib/libGL.so.1
#16 0x00007f7e8555d4a2 in ?? () from /usr/lib/libSDL-1.2.so.0
#17 0x00007f7e8556145e in ?? () from /usr/lib/libSDL-1.2.so.0
#18 0x00007f7e85561667 in ?? () from /usr/lib/libSDL-1.2.so.0
#19 0x00007f7e85552b12 in SDL_VideoQuit () from /usr/lib/libSDL-1.2.so.0
#20 0x00007f7e8552d855 in SDL_QuitSubSystem () from /usr/lib/libSDL-1.2.so.0
#21 0x00007f7e8552d8be in SDL_Quit () from /usr/lib/libSDL-1.2.so.0
#22 0x00000000004121a3 in cleanup () at main.c:190
---Type <return> to continue, or q <return> to quit---
#23 0x00007f7e84be0110 in exit () from /lib/libc.so.6
#24 0x00007f7e84bc91cb in __libc_start_main () from /lib/libc.so.6
#25 0x0000000000402859 in _start ()
(gdb)


-- 
Pekka Paalanen
http://www.iki.fi/pq/
