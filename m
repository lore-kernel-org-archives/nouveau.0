From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Accumulating CPU load from Xorg process with DRI3
Date: Thu, 13 Aug 2020 18:47:50 -0400
Message-ID: <CAKb7UvjFzbjWOLhC+pQ-G5fUCt_HAYw0xvtabQVKn1apx3mWPw@mail.gmail.com>
References: <202008140136.33013.randrianasulu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <202008140136.33013.randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andrew Randrianasulu <randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

I'm aware of this issue, and am experiencing it myself.

The issue is that drmmode_event_handler takes up more and more CPU
time. It seems like some events are being "left behind". I haven't had
time to debug it further yet though.

I also have DRI3 enabled, but only very rarely do I make use of my
secondary GPUs, and I'm pretty sure I've seen the problem happen
without any PRIME usage.

Cheers,

  -ilia

On Thu, Aug 13, 2020 at 6:45 PM Andrew Randrianasulu
<randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> I observed this bug for quite some time, but so far I workarounded it
> with just setting DRI2 (default) in xorg.conf.d/20-nouveau.conf
>
> Now with two GPU i iwsh to use DRI3, so right now it set up like this:
>
> cat /etc/X11/xorg.conf.d/20-nouveau.conf
> Section "Device"
>     Identifier "Card0"
>     Driver "nouveau"
>     Option "PageFlip" "1"
>     #Option "AccelMethod" "glamor"
>     Option       "DRI"           "3"
>
> But just after two hours of uptime X already eating some CPU:
>
>
> op - 01:30:49 up  2:45,  1 user,  load average: 1,12, 0,93, 0,84
> Tasks: 210 total,   1 running, 209 sleeping,   0 stopped,   0 zombie
> %Cpu(s): 12,1 us,  3,9 sy,  0,0 ni, 81,7 id,  0,7 wa,  0,0 hi,  1,6 si,  0,0 st
> MiB Mem :  11875,3 total,   6416,4 free,   1634,8 used,   3824,1 buff/cache
> MiB Swap:   1145,0 total,   1145,0 free,      0,0 used.   9969,7 avail Mem
>
>   PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
>  1198 root      20   0  146160  78828  28160 S  35,8   0,6  30:41.37 Xorg
>  1285 guest     20   0   59776  17332  13756 S  11,6   0,1  16:12.83 xmms
>  4006 guest     20   0 1743952 919312 120628 S  10,9   7,6  20:51.01 seamonkey
>  1278 guest     20   0  101508  48528  30496 S   3,0   0,4   4:03.21 ktorrent
>  1274 guest     20   0   43368  31784  23684 S   2,0   0,3   0:29.43 konsole
>  1259 guest     20   0   43092  28232  23640 S   1,3   0,2   0:21.53 kicker
>  1255 guest     20   0    6560   4160   2720 S   1,0   0,0   1:00.90 kompmgr
>  1293 guest     20   0   40164  21328  18636 S   1,0   0,2   1:30.50 gkrellm
>  1254 guest     20   0   31616  21832  18944 S   0,7   0,2   0:06.49 kwin
>
> in ~1 day it will eat full core from my AMD FX-4300 and X will become sluggish ...
>
> I tried to trace it with operf 1.2.0:
>
> operf --pid 1198
>
> operf: Press Ctl-c or 'kill -SIGINT 7787' to stop profiling
> operf: Profiler started
> ^C
> Profiling done.
>
> root@slax:~# opreport
> Using /root/oprofile_data/samples/ for samples directory.
> CPU: AMD64 family15h, speed 3800 MHz (estimated)
> Counted CPU_CLK_UNHALTED events (CPU Clocks not Halted) with a unit mask of 0x00 (No unit mask) count 100000
> CPU_CLK_UNHALT...|
>   samples|      %|
> ------------------
>     78166 100.000 Xorg
>         CPU_CLK_UNHALT...|
>           samples|      %|
>         ------------------
>             62905 80.4762 nouveau_drv.so
>              5648  7.2256 kallsyms
>              4186  5.3553 Xorg
>              1419  1.8154 libpixman-1.so.0.38.0
>              1038  1.3279 nouveau
>               687  0.8789 libc-2.30.so
>               632  0.8085 libexa.so
>               510  0.6525 libdrm_nouveau.so.2.0.0
>               402  0.5143 libfb.so
>               259  0.3313 drm
>               230  0.2942 ttm
>               108  0.1382 libpthread-2.30.so
>                47  0.0601 libdrm.so.2.4.0
>                34  0.0435 [vdso] (tgid:1198 range:0xf7fbf000-0xf7fbffff)
>                27  0.0345 evdev_drv.so
>                 7  0.0090 snd_hda_codec
>                 5  0.0064 r8169
>                 5  0.0064 snd_pcm
>                 5  0.0064 libXfont2.so.2.0.0
>                 3  0.0038 snd_aloop
>                 3  0.0038 libglx.so
>                 2  0.0026 kvm
>                 2  0.0026 snd_timer
>                 1  0.0013 snd_hda_core
>                 1  0.0013 snd_hda_intel
>
> so, nouveau_drv itself is major CPU eater ....
>
> I'll try to rebuild it with debug symbols enabled, and hopefully it will be enough
> for at least seeing who eats all those cycles ....
>
> Sorry for so many emails, just i keep discovering new bugs as I try new things!
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
