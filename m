From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV50: xv fullscreen issues
Date: Sat, 27 Dec 2008 13:18:14 +0100
Message-ID: <49561D06.30005@gmail.com>
References: <200812260140.38609.daniel@ekloef.se>	<fc5b84ad0812261525g58be27fdrf4649ab68c8e36a2@mail.gmail.com>
	<200812271236.37993.daniel@ekloef.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <200812271236.37993.daniel-pl05T3eHY++zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Daniel_Ekl=F6f?= <daniel-pl05T3eHY++zQB+pC5nmwQ@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 12/27/2008 12:36 PM, Daniel Ekl=F6f wrote:
>> On 12/26/08, Daniel Ekl=F6f<daniel-pl05T3eHY++zQB+pC5nmwQ@public.gmane.org>  wrote:
>>      =

>>> Hi,
>>>
>>> I've been trying out nouveau for a while now and I must say I'm
>>> impressed. Performance in KDE4 in general seems better than the nvidia
>>> blob; way to go!
>>>
>>> There are a couple of annoyances though:
>>>
>>> XV in fullscreen doesn't work. I'm running in composite mode, and non
>>> fullscreen video works well enough. Going fullscreen in e.g gmplayer
>>> gives me:
>>>
>>> [ws] Error in display. -0.005 ct: -0.000  25/ 25 30% 23%  0.8% 3 6
>>>
>>> [ws]  Error code: 8 ( BadMatch (invalid parameter attributes) )
>>>
>>> [ws]  Request code: 140
>>>
>>> [ws]  Minor code: 19
>>>
>>> [ws]  Modules: flip_page
>>>
>>> xine crashes in a similar way. mplayer (non GUI version) doesn't crash,
>>> but all I get is a black screen with "BadMatch" errors spamming the
>>> console.
>>>
>>> The BadMatch is from nv50_xv.c:54
>>>
>>>         if (exaGetPixmapOffset(ppix)<  pNv->EXADriverPtr->offScreenBase)
>>>                  return FALSE;
>>>
>>> commenting out those lines stops the players from crashing, but I still
>>> get just a black screen.
>>>        =

>> I'm typing this from a mobile phone so answers will be brief sorry!
>>      =

>
> No problem! I'm grateful for any kind of answers :)
>
>    =

>> Your composite manager is probably unredirecting fullscreen windows.
>> We can't currently render directly to the scanout buffer with the 3D
>> engine, which is what the above code checks for.
>>      =

>
> Ok, good to know, thanks.
>
>    =

>>> After having crashed gmplayer (with the code lines above re-enabled), I
>>> also notice that screen updates are a bit shaky - sometimes the screen
>>> isn't updated until I press a key or move the mouse (e.g. typing 'ls'
>>> doesn't list any files until I press another key, web pages aren't
>>> displayed until I move the mouse and so on). At this point, I sometimes
>>> also see an unusually high CPU load from X (around 75%). Sometimes X
>>> freezes, sometimes not.
>>>        =

>> I don't see this on my systems, but i'll look into it when i'm back in
>> action.
>>      =

>
> After some more testing, I can say for sure that this isn't really relate=
d to
> the xv fullscreen issue. xv in fullscreen was just a way to trigger it. I=
'm
> not sure exactly what triggers it though - starting certain GUI programs
> triggers it, while other programs do not. In any case, I'm pretty sure the
> high CPU load is always there when I see the screen update issue. When th=
is
> happens, X is stuck inside nouveau_dma_wait:
>
> (gdb) bt
> #0  0x00007f63f5f18df8 in nouveau_dma_wait (userchan=3D<value optimized o=
ut>,
> size=3D2) at nouveau_dma.c:88
> #1  0x00007f63f5f4f01d in nouveau_dma_begin (userchan=3D0x241aaf0,
> grobj=3D0x241a900, method=3D4916, size=3D1,
>      file=3D0x7f63f5f5b630 "NV50EXAPrepareComposite", line=3D695) at
> nouveau_dma.h:118
> #2  0x00007f63f5f509b0 in NV50EXAPrepareComposite (op=3D<value optimized =
out>,
> pspict=3D0x3eb9210, pmpict=3D0x3bad6c0, pdpict=3D0x3543430,
>      pspix=3D0x2f21de0, pmpix=3D0x522f4c0, pdpix=3D0x5a39230) at nv50_exa=
.c:695
> #3  0x00007f63f457de6a in ?? () from /usr/lib64/X11/modules//libexa.so
> #4  0x00007f63f457f097 in exaComposite () from
> /usr/lib64/X11/modules//libexa.so
> #5  0x000000000053029f in ?? ()
> #6  0x000000000051f0ad in ?? ()
> #7  0x0000000000447ef6 in Dispatch ()
> #8  0x000000000042d82d in main ()
>
> On a side note, out of curiousity I took a look at the dma_wait code; and=
 I
> found myself wondering if the CHECK_TIMEOUT macro is really ok. My
> understanding is that it tries to avoid an expensive gettimeofday (or sim=
ilar)
> in the normal case where the DMA doesn't timeout. It does this by first
> incrementing a counter, and only checks the actual time after the counter=
 has
> reached a certain value.
>
> Two things about this:
>
> 1) the counter goes all the way up to 0xffffffff. This took ~25s on my la=
ptop
> and ~13s on my main. As a comparison, the DMA timeout value is 2s
>
> 2) It doesn't assign a value to t_start until after the counter has reach=
ed
> 0xffffffff. Again, I guess this is to avoid an expensive gettimeofday.
> However, it also means that the actual timeout value now is the time it t=
akes
> to increment the counter _plus_ the DMA timeout value.
>
> This may all be by design, but it did strike me as a bit suspiouses.
>    =


I made that change for one simple reason, to easily expose that dma wait =

is happening. I'll have a look at it soon'ish again and make changes =

where necessary. Thanks for pointing that out, I hadn't realised that =

the counter takes that long.

>    =

>>> One more odd thing is that I don't get any interrupts on the NV50 during
>>> "normal use" (as reported by /proc/interrupts). I sometimes get an
>>> interrupt storm when starting X, then nothing. I sometimes see a number
>>> of interrupts after having crashed gmplayer when trying to play a video
>>> fullscreen. But other than that, no interrupts what so ever.
>>>        =

>> Completely normal, we don't currently make use of interrupts from the
>> gpu save for error reporting.
>>      =

>
> Ok, I thought it may be something like that. The nvidia blob does generate
> interrupts occasionally, so I guess I was expecting nouveau to behave in a
> similar way.
>
>    =

>>> One last question, and this may not even be nouveau related since I also
>>> see this with the nv driver (so please feel free to yell RTFM! or just
>>> ignore it
>>>
>>> :) ). If I start X as a non-root user, it choses 1280x1024 as default
>>>
>>> resolution (the panel's native resolution is 1680x1050). I dont't see
>>> this in KDM, or when starting as root (so, I can for example start kdm =
in
>>> the correct resolution, but then when I log in, as non-root, the
>>> resolution is changed to 1280x1024). It doesn't seem to matter what I s=
et
>>> in xorg.conf. The EDID output does report 1680x1050, and xrandr also se=
es
>>> it. In fact, just opening the "Display" settings in KDE's control panel
>>> causes a switch to 1680x1050. Needless to say, the binary nvidia driver
>>> doesn't have this problem.
>>>
>>> Random system info:
>>>
>>> Linux tiny 2.6.28 #1 SMP Thu Dec 25 12:45:15 CET 2008 x86_64 AMD
>>> Athlon(tm) 64 X2 Dual Core Processor 4400+ AuthenticAMD GNU/Linux
>>>
>>> 01:00.0 VGA compatible controller: nVidia Corporation GeForce 8600 GTS
>>> (rev a1) (prog-if 00 [VGA controller])
>>>          Subsystem: ASUSTeK Computer Inc. Device 8241
>>>          Flags: bus master, fast devsel, latency 0, IRQ 18
>>>          Memory at d2000000 (32-bit, non-prefetchable) [size=3D16M]
>>>          Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
>>>          Memory at d0000000 (64-bit, non-prefetchable) [size=3D32M]
>>>          I/O ports at a000 [size=3D128]
>>>          Expansion ROM at d3000000 [disabled] [size=3D128K]
>>>          Capabilities: [60] Power Management version 2
>>>          Capabilities: [68] MSI: Mask- 64bit+ Count=3D1/1 Enable-
>>>          Capabilities: [78] Express Endpoint, MSI 00
>>>          Capabilities: [100] Virtual Channel<?>
>>>          Capabilities: [128] Power Budgeting<?>
>>>          Capabilities: [600] Vendor Specific Information<?>
>>>
>>> Using latest git libdrm and nouveau sources, xorg-7.4 (server-1.5.3). If
>>> there's any other info you need, just let me know.
>>>
>>> Regards,
>>> Daniel Ekl=F6f
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>>        =

>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>    =
