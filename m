From: Daniel Kasak <daniel.kasak-OHsUUYflbBDsBN0MCq728g@public.gmane.org>
Subject: Fatal server error: DMA queue hang
Date: Tue, 23 Sep 2008 10:50:54 +1000
Message-ID: <1222131054.6895.12.camel@dkasak>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0576526043=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0576526043==
Content-Type: multipart/related; type="multipart/alternative"; boundary="=-TBj76IwfgRwiC3dozg7X"


--=-TBj76IwfgRwiC3dozg7X
Content-Type: multipart/alternative; boundary="=-L6+Q5+SYH2R5qMZVClYu"


--=-L6+Q5+SYH2R5qMZVClYu
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Greetings.

I have an aging GeForce4 MX ( integrated ). I just updated to
Ubuntu-8.10 without considering the consequences of moving to
xserver-1.5. Needless to say I won't be using Compiz for a while now ...

So I've tried to get nouveau drivers running ( I've been watching the
project, but mainly waiting for a release ... now my hand has been
forced ). I used the packages for Ubuntu at
http://nouveau.freedesktop.org/wiki/UbuntuPackages ... I also completely
removed nVidia's drivers. I don't have mesa drivers at this point. Do I
need them if I only want 2D? I remember reading something about some 2D
drivers requiring the 3D engine for some reason, but I don't even
remember which driver this was for. Anyway, at this point, I'm using
Ubuntu 8.10-beta's packaged mesa-7.1, which doesn't have the
nouveau_dri.so ( or whatever it's called ).

When I start X, I get a very corrupted display. The mouse cursor is OK -
everything else looks like an uninitialised memory dump. I stuff like
this in my dmesg output:

[   70.043671] nouveau 0000:01:00.0: PCI INT A -> Link[LNKE] -> GSI 16
(level, high) -> IRQ 16
[   70.045958] [drm] Detected an NV17 generation card (0x01f000a5)
[   70.045965] [drm] Initialized nouveau 0.0.11  on minor 0
[   70.478887] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[   70.478926] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into
4x mode
[   70.478976] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   71.615566] [drm] Allocating FIFO number 0
[   71.616691] [drm] nouveau_fifo_alloc: initialised FIFO 0
[   71.616734] [drm] PFIFO_DMA_PUSHER - Ch 0
[   74.414225] [drm] Allocating FIFO number 1
[   74.414856] [drm] nouveau_fifo_alloc: initialised FIFO 1
[   74.414867] [drm] PFIFO_DMA_PUSHER - Ch 0
[   75.712013] eth0: no IPv6 routers present
[   75.728013] br0: no IPv6 routers present
[   82.639930] [drm] nouveau_fifo_free: freeing fifo 1
[   84.639766] [drm:nouveau_fifo_free] *ERROR* Failed to idle channel 1
before destroy.Prepare for strangeness..
[   84.639856] [drm] PFIFO_DMA_PUSHER - Ch 0
[   84.838771] [drm] nouveau_fifo_free: freeing fifo 0
[   86.838600] [drm:nouveau_fifo_free] *ERROR* Failed to idle channel 0
before destroy.Prepare for strangeness..
[   86.838671] [drm] cleanning a channel with graph in current context
[   86.838682] [drm] PFIFO_DMA_PUSHER - Ch 0
[   90.419989] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[   90.420050] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into
4x mode
[   90.420100] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   91.363648] [drm] Allocating FIFO number 0
[   91.364532] [drm] nouveau_fifo_alloc: initialised FIFO 0
[   91.364572] [drm] PFIFO_DMA_PUSHER - Ch 0
[   91.366293] [drm] Allocating FIFO number 1
[   91.366921] [drm] nouveau_fifo_alloc: initialised FIFO 1
[   91.366929] [drm] PFIFO_DMA_PUSHER - Ch 0
[   98.062622] [drm] nouveau_fifo_free: freeing fifo 1
[  100.062456] [drm:nouveau_fifo_free] *ERROR* Failed to idle channel 1
before destroy.Prepare for strangeness..
[  100.062538] [drm] PFIFO_DMA_PUSHER - Ch 0
[  100.392112] [drm] nouveau_fifo_free: freeing fifo 0
[  102.391940] [drm:nouveau_fifo_free] *ERROR* Failed to idle channel 0
before destroy.Prepare for strangeness..
[  102.392019] [drm] cleanning a channel with graph in current context
[  102.392031] [drm] PFIFO_DMA_PUSHER - Ch 0

I also get:
Fatal server error:
DMA queue hang: dmaPut=4e9, current=0, status=0
 ... in my Xorg.0.log

Full Xorg.0.log:
http://entropy.homelinux.org/nouveau/Xorg.0.log

Full dmesg output:
http://entropy.homelinux.org/nouveau/dmesg.txt

Is this a known issue? Is there anything else I can provide? As noted, I
can't load up nVidia's drivers now to produce a dump ... I should have
thought about this before ...

Dan


Daniel Kasak / DNA
Application Developer
T: +61.2.8968.4056 / F:
+61.2.9904.5055
daniel.kasak-OHsUUYflbBDsBN0MCq728g@public.gmane.org 
24/7 Real Media
15-19 Parraween Street
Cremorne, NSW 2090
Australia 

--=-L6+Q5+SYH2R5qMZVClYu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.24.0">
</HEAD>
<BODY>
Greetings.<BR>
<BR>
I have an aging GeForce4 MX ( integrated ). I just updated to Ubuntu-8.10 without considering the consequences of moving to xserver-1.5. Needless to say I won't be using Compiz for a while now ...<BR>
<BR>
So I've tried to get nouveau drivers running ( I've been watching the project, but mainly waiting for a release ... now my hand has been forced ). I used the packages for Ubuntu at <A HREF="http://nouveau.freedesktop.org/wiki/UbuntuPackages">http://nouveau.freedesktop.org/wiki/UbuntuPackages</A> ... I also completely removed nVidia's drivers. I don't have mesa drivers at this point. Do I need them if I only want 2D? I remember reading something about some 2D drivers requiring the 3D engine for some reason, but I don't even remember which driver this was for. Anyway, at this point, I'm using Ubuntu 8.10-beta's packaged mesa-7.1, which doesn't have the nouveau_dri.so ( or whatever it's called ).<BR>
<BR>
When I start X, I get a very corrupted display. The mouse cursor is OK - everything else looks like an uninitialised memory dump. I stuff like this in my dmesg output:<BR>
<BR>
[&nbsp;&nbsp; 70.043671] nouveau 0000:01:00.0: PCI INT A -&gt; Link[LNKE] -&gt; GSI 16 (level, high) -&gt; IRQ 16<BR>
[&nbsp;&nbsp; 70.045958] [drm] Detected an NV17 generation card (0x01f000a5)<BR>
[&nbsp;&nbsp; 70.045965] [drm] Initialized nouveau 0.0.11&nbsp; on minor 0<BR>
[&nbsp;&nbsp; 70.478887] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge<BR>
[&nbsp;&nbsp; 70.478926] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode<BR>
[&nbsp;&nbsp; 70.478976] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode<BR>
[&nbsp;&nbsp; 71.615566] [drm] Allocating FIFO number 0<BR>
[&nbsp;&nbsp; 71.616691] [drm] nouveau_fifo_alloc: initialised FIFO 0<BR>
[&nbsp;&nbsp; 71.616734] [drm] PFIFO_DMA_PUSHER - Ch 0<BR>
[&nbsp;&nbsp; 74.414225] [drm] Allocating FIFO number 1<BR>
[&nbsp;&nbsp; 74.414856] [drm] nouveau_fifo_alloc: initialised FIFO 1<BR>
[&nbsp;&nbsp; 74.414867] [drm] PFIFO_DMA_PUSHER - Ch 0<BR>
[&nbsp;&nbsp; 75.712013] eth0: no IPv6 routers present<BR>
[&nbsp;&nbsp; 75.728013] br0: no IPv6 routers present<BR>
[&nbsp;&nbsp; 82.639930] [drm] nouveau_fifo_free: freeing fifo 1<BR>
[&nbsp;&nbsp; 84.639766] [drm:nouveau_fifo_free] *ERROR* Failed to idle channel 1 before destroy.Prepare for strangeness..<BR>
[&nbsp;&nbsp; 84.639856] [drm] PFIFO_DMA_PUSHER - Ch 0<BR>
[&nbsp;&nbsp; 84.838771] [drm] nouveau_fifo_free: freeing fifo 0<BR>
[&nbsp;&nbsp; 86.838600] [drm:nouveau_fifo_free] *ERROR* Failed to idle channel 0 before destroy.Prepare for strangeness..<BR>
[&nbsp;&nbsp; 86.838671] [drm] cleanning a channel with graph in current context<BR>
[&nbsp;&nbsp; 86.838682] [drm] PFIFO_DMA_PUSHER - Ch 0<BR>
[&nbsp;&nbsp; 90.419989] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge<BR>
[&nbsp;&nbsp; 90.420050] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode<BR>
[&nbsp;&nbsp; 90.420100] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode<BR>
[&nbsp;&nbsp; 91.363648] [drm] Allocating FIFO number 0<BR>
[&nbsp;&nbsp; 91.364532] [drm] nouveau_fifo_alloc: initialised FIFO 0<BR>
[&nbsp;&nbsp; 91.364572] [drm] PFIFO_DMA_PUSHER - Ch 0<BR>
[&nbsp;&nbsp; 91.366293] [drm] Allocating FIFO number 1<BR>
[&nbsp;&nbsp; 91.366921] [drm] nouveau_fifo_alloc: initialised FIFO 1<BR>
[&nbsp;&nbsp; 91.366929] [drm] PFIFO_DMA_PUSHER - Ch 0<BR>
[&nbsp;&nbsp; 98.062622] [drm] nouveau_fifo_free: freeing fifo 1<BR>
[&nbsp; 100.062456] [drm:nouveau_fifo_free] *ERROR* Failed to idle channel 1 before destroy.Prepare for strangeness..<BR>
[&nbsp; 100.062538] [drm] PFIFO_DMA_PUSHER - Ch 0<BR>
[&nbsp; 100.392112] [drm] nouveau_fifo_free: freeing fifo 0<BR>
[&nbsp; 102.391940] [drm:nouveau_fifo_free] *ERROR* Failed to idle channel 0 before destroy.Prepare for strangeness..<BR>
[&nbsp; 102.392019] [drm] cleanning a channel with graph in current context<BR>
[&nbsp; 102.392031] [drm] PFIFO_DMA_PUSHER - Ch 0<BR>
<BR>
I also get:<BR>
Fatal server error:<BR>
DMA queue hang: dmaPut=4e9, current=0, status=0<BR>
 ... in my Xorg.0.log<BR>
<BR>
Full Xorg.0.log:<BR>
<A HREF="http://entropy.homelinux.org/nouveau/Xorg.0.log">http://entropy.homelinux.org/nouveau/Xorg.0.log</A><BR>
<BR>
Full dmesg output:<BR>
<A HREF="http://entropy.homelinux.org/nouveau/dmesg.txt">http://entropy.homelinux.org/nouveau/dmesg.txt</A><BR>
<BR>
Is this a known issue? Is there anything else I can provide? As noted, I can't load up nVidia's drivers now to produce a dump ... I should have thought about this before ...<BR>
<BR>
Dan<BR>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<BR>
<TABLE BGCOLOR="#f2f2f2" CELLSPACING="0" CELLPADDING="5" BORDER="2">
<TR>
<TD>
<IMG SRC="cid:1222130466.6895.1.camel@dkasak" ALIGN="bottom" BORDER="0">
</TD>
<TD>
<B><FONT COLOR="#666666">Daniel Kasak</FONT></B><FONT COLOR="#666666"> / DNA Application Developer</FONT><BR>
<FONT COLOR="#666666">T: +61.2.8968.4056 / F: +61.2.9904.5055</FONT><BR>
<FONT COLOR="#666666"><A HREF="mailto:daniel.kasak-OHsUUYflbBDsBN0MCq728g@public.gmane.org">daniel.kasak-OHsUUYflbBDsBN0MCq728g@public.gmane.org</A> </FONT>
</TD>
<TD>
<FONT COLOR="#666666">24/7 Real Media</FONT><BR>
<FONT COLOR="#666666">15-19 Parraween Street</FONT><BR>
<FONT COLOR="#666666">Cremorne, NSW 2090 Australia </FONT>
</TD>
</TR>
</TABLE>
</TD>
</TR>
</TABLE>
</BODY>
</HTML>

--=-L6+Q5+SYH2R5qMZVClYu--

--=-TBj76IwfgRwiC3dozg7X
Content-ID: <1222130466.6895.1.camel@dkasak>
Content-Disposition: attachment; filename="247logo.gif"
Content-Type: image/gif; name="247logo.gif"
Content-Transfer-Encoding: base64

R0lGODlhOAAlAMQAAKqqqv/m1/z8/P97Jf7y6eTk5NXV1fX19czMzP9lAfr6+v91HEpJSv9aAGhn
aIyLjP+kaP+RS7m5uf+9kv/8+//s4P/7+P+BL/9vEf/Qsf/Yv//49P9oBrCwsP9pCP///ywAAAAA
OAAlAAAF/2AnjmRpnmiqilzrvnAsz/ScsF6u5+/u/8Cg0HPrcH6chHJ5FCaXiabnCa0udUVpLoGJ
TDSaSQSTCHIwg3Qaczyq3/A0FoeNBD74fCBS9iUzG4GBfEQXgoeIFhN9WXUbeZB4hDsJEJEfhAkX
l5cEC4x0R3d5Fo95nn1ECwSXmZuckBCpjUQRkBoDCxmxs7utZQkDExnEGcOQAS1zRlsTkBENmhR5
i1u2eBsVeZNUSg3O26lEdJXFGRdKA6YfGcAYo+y+mFeUEdN47T60RFBHCdd4qiUA92HDAHl8FnzS
0UJDHoPixjEzk8BhOE0W8kBoYDHAPwIbJlXi9WNfSUt52v811EPEYoZv+ICtYqllC52S9vR8Gont
QgOOeDxeCLAHGMF5QEzWufchwKcz2vBUgDBhQtQPi84Ayxmzps2J9dZl4MeFFaw8GtBN4WCxoNqk
N62tSzvgwoUBGCpQ2MuXaTgiKANGpBRXk1lsFvhq8FDXruMLhyHgTTJTKhkh+zRd5ZTMSpmr0Pwd
nRSEluGzQZXtOLMuE8APGqIMMU21qu3bVSEAOXJbbaXeg/Xd9OwZMxMsVYZ8Jc68ufPnUEQon069
+g4RIBFp3869u/ftIhSgHk++PKfwHyQ8WG/gA4D1D8QbeAAAD4IH7T8cQFBAP/8PBiCAgAEHGGDg
AR8IYED/f/otCAl6DzDggIQHTOiAA+JFyEB/HTCAAB4GACDBBwgA8KEEIvIHQAcAAGCAACLaJ6IA
eUDIwAERGjChgwcw4GN9HX5IoogHoCiBABJIcMABBbhYJAAFSPDhASJAWWMHGUpI4YQSpseABBd+
ECQeEnSQpJkdPGlik+2xKSWALnYgpJhYfqDhhh9MKEF7Ez6wowQe4iFniAMCUKQEBTDpIpwGvFlm
o2kKWmeEHWLYZwcGSHghAw8A6sADCGB6AJRNRonpgiaWqKScoyaJYn7oAeDAqA6od6EDsn4owIVg
8oqoAAgIUGSASfI3AgIHIDlgpEUKiZ4ANCaoALTQTgvJHrTURouaAAp0m8e03uLBraTammfuuZGs
oO667J4QAgA7


--=-TBj76IwfgRwiC3dozg7X--




--===============0576526043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0576526043==--
