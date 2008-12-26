From: Daniel =?iso-8859-1?q?Ekl=F6f?= <daniel-pl05T3eHY++zQB+pC5nmwQ@public.gmane.org>
Subject: NV50: xv fullscreen issues
Date: Fri, 26 Dec 2008 01:40:38 +0100
Message-ID: <200812260140.38609.daniel@ekloef.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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
List-Id: nouveau.vger.kernel.org

Hi,

I've been trying out nouveau for a while now and I must say I'm impressed. =
Performance in KDE4 in general seems better than the nvidia blob; way to go!

There are a couple of annoyances though:

XV in fullscreen doesn't work. I'm running in composite mode, and non fulls=
creen video works well enough. Going fullscreen in e.g gmplayer gives me:

[ws] Error in display. -0.005 ct: -0.000  25/ 25 30% 23%  0.8% 3 6         =
                                               =

[ws]  Error code: 8 ( BadMatch (invalid parameter attributes) )            =
                                               =

[ws]  Request code: 140                                                    =
                                               =

[ws]  Minor code: 19                                                       =
                                               =

[ws]  Modules: flip_page

xine crashes in a similar way. mplayer (non GUI version) doesn't crash, but=
 all I get is a black screen with "BadMatch" errors spamming the console.

The BadMatch is from nv50_xv.c:54

       if (exaGetPixmapOffset(ppix) < pNv->EXADriverPtr->offScreenBase)
                return FALSE;

commenting out those lines stops the players from crashing, but I still get=
 just a black screen.

After having crashed gmplayer (with the code lines above re-enabled), I als=
o notice that screen updates are a bit shaky - sometimes the screen isn't u=
pdated until I press a key or move the mouse (e.g. typing 'ls' doesn't list=
 any files until I press another key, web pages aren't displayed until I mo=
ve the mouse and so on). At this point, I sometimes also see an unusually h=
igh CPU load from X (around 75%). Sometimes X freezes, sometimes not.

One more odd thing is that I don't get any interrupts on the NV50 during "n=
ormal use" (as reported by /proc/interrupts). I sometimes get an interrupt =
storm when starting X, then nothing. I sometimes see a number of interrupts=
 after having crashed gmplayer when trying to play a video fullscreen. But =
other than that, no interrupts what so ever.

One last question, and this may not even be nouveau related since I also se=
e this with the nv driver (so please feel free to yell RTFM! or just ignore=
 it :) ). If I start X as a non-root user, it choses 1280x1024 as default r=
esolution (the panel's native resolution is 1680x1050). I dont't see this i=
n KDM, or when starting as root (so, I can for example start kdm in the cor=
rect resolution, but then when I log in, as non-root, the resolution is cha=
nged to 1280x1024). It doesn't seem to matter what I set in xorg.conf. The =
EDID output does report 1680x1050, and xrandr also sees it. In fact, just o=
pening the "Display" settings in KDE's control panel causes a switch to 168=
0x1050. Needless to say, the binary nvidia driver doesn't have this problem.

Random system info:

Linux tiny 2.6.28 #1 SMP Thu Dec 25 12:45:15 CET 2008 x86_64 AMD Athlon(tm)=
 64 X2 Dual Core Processor 4400+ AuthenticAMD GNU/Linux

01:00.0 VGA compatible controller: nVidia Corporation GeForce 8600 GTS (rev=
 a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 8241
        Flags: bus master, fast devsel, latency 0, IRQ 18
        Memory at d2000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at d0000000 (64-bit, non-prefetchable) [size=3D32M]
        I/O ports at a000 [size=3D128]
        Expansion ROM at d3000000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] MSI: Mask- 64bit+ Count=3D1/1 Enable-
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel <?>
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information <?>

Using latest git libdrm and nouveau sources, xorg-7.4 (server-1.5.3). If th=
ere's any other info you need, just let me know.

Regards,
Daniel Ekl=F6f
