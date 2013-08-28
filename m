From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "Stuttering" display, NVA0 chipset.
Date: Wed, 28 Aug 2013 23:32:27 +0100
Message-ID: <521E7A7B.4030409@gmail.com>
References: <cone.1377727433.415855.3656.1000@monster.email-scan.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <cone.1377727433.415855.3656.1000-eRFusrvvrKWtZOM0fQ182pBYcbvojoGw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 28/08/13 23:03, Sam Varshavchik wrote:
> I'm running xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64 and
> xorg-x11-server-Xorg-1.14.2-9.fc19.x86_64
> 
> On the following chipset, the display suffers from "stuttering":
> 
> 06:00.0 VGA compatible controller: NVIDIA Corporation GT200b [GeForce
> GTX 285] (rev a1) (prog-if 00 [VGA controller])
>        Subsystem: Gigabyte Technology Co., Ltd Device 34c9
>        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr+ Stepping- SERR+ FastB2B- DisINTx-
>        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>        Latency: 0, Cache Line Size: 256 bytes
>        Interrupt: pin A routed to IRQ 24
>        Region 0: Memory at f7000000 (32-bit, non-prefetchable) [size=16M]
>        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
>        Region 3: Memory at f8000000 (64-bit, non-prefetchable) [size=32M]
>        Region 5: I/O ports at dc00 [size=128]
>        Expansion ROM at f6f80000 [disabled] [size=512K]
>        Capabilities: <access denied>
>        Kernel driver in use: nouveau
> 
> [   531.742] (--) NOUVEAU(0): Chipset: "NVIDIA NVA0"
> 
> By "stutters" I mean that at random intervals, at least several times a
> minute, the entire display completely freezes, for an interval ranging
> between about quarter of a second, to sometimes as long as 5-6 seconds.
> 
> By "freezes" I mean that it just stops updating. No artifacts, just a
> frozen display.
> 
> When the display eventually becomes unstuck, it's completely up to date.
> Everything that should be rendered, to that point, is rendered. It's as
> if the framebuffer continues to get updated normally, but the display is
> not being refreshed. Except for the mouse pointer! When the display is
> not refreshing, the mouse pointer continues to be responsive.
> 
> Basically, if I'm playing some video, the audio keeps going, the video
> stops for 1-6 seconds, then continues running, synchronized with the
> audio. Or, if I'm typing something on the terminal, after the display
> unsticks itself, everything that was typed in the interim, is where it
> should be. That's the best way I can describe it.
> 
Hello Sam,

To be honest I've experienced something similar although my issue was
caused by the kernel swapping like crazy. There is a memory leak
somewhere on my system that causes X to consume ~800MiB of RES memory
after ~10days.

That said you could try connecting remotely to the system (ssh) and see
what is causing the issue - htop and perf would be some of the tools you
can use.

> I see no complaints in /var/log/messages, nor in Xorg.0.log
> 
When you say "complains" I'm not sure what exactly you are looking for
or expecting to see. Nouveau kernel Errors and warnings are indicated as
"nouveau E" and "nouveau W" respectively.
In general the output of dmesg is more reliable source of information
than /var/log/messages.

> I have the same kernel, nouveau, and Xorg version running on different
> hardware with an NVC1 chipset, no issues there. That display is smooth
> as butter.
> 
> I'm fairly certain that this is a recent regression. I've had this
> hardware for at least three years, and this problem is fairly recent.
> Can't quite recall at which kernel/Xorg/nouveau version this started
> happening.
> 
How that is a pain, I guess you can try one piece at a time. I seriously
doubt that the X server is responsible, with that said I would suspect
the mesa/gallium driver (nouveau_dri.so) to be related.

> I don't think it's a bad DVI cable. If I drop out of X, and to som work
> on the console terminal (VESA framebuffer display only), the display
> does not appear to stutter at all.
> 
Hmm AFAIK nouveau kicks out the VESA framebuffer driver.

Cheers
Emil
