From: Daniel =?iso-8859-1?q?Ekl=F6f?= <daniel-pl05T3eHY++zQB+pC5nmwQ@public.gmane.org>
Subject: Re: NV50: xv fullscreen issues
Date: Sat, 27 Dec 2008 13:49:38 +0100
Message-ID: <200812271349.42624.daniel@ekloef.se>
References: <200812260140.38609.daniel@ekloef.se>
	<fc5b84ad0812261525g58be27fdrf4649ab68c8e36a2@mail.gmail.com>
	<200812271236.37993.daniel@ekloef.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <200812271236.37993.daniel-pl05T3eHY++zQB+pC5nmwQ@public.gmane.org>
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

> > > After having crashed gmplayer (with the code lines above re-enabled), I
> > > also notice that screen updates are a bit shaky - sometimes the screen
> > > isn't updated until I press a key or move the mouse (e.g. typing 'ls'
> > > doesn't list any files until I press another key, web pages aren't
> > > displayed until I move the mouse and so on). At this point, I sometimes
> > > also see an unusually high CPU load from X (around 75%). Sometimes X
> > > freezes, sometimes not.
> >
> > I don't see this on my systems, but i'll look into it when i'm back in
> > action.
>
> After some more testing, I can say for sure that this isn't really related
> to the xv fullscreen issue. xv in fullscreen was just a way to trigger it.
> I'm not sure exactly what triggers it though - starting certain GUI
> programs triggers it, while other programs do not. In any case, I'm pretty
> sure the high CPU load is always there when I see the screen update issue.
> When this happens, X is stuck inside nouveau_dma_wait:
>
> (gdb) bt
> #0  0x00007f63f5f18df8 in nouveau_dma_wait (userchan=<value optimized out>,
> size=2) at nouveau_dma.c:88
> #1  0x00007f63f5f4f01d in nouveau_dma_begin (userchan=0x241aaf0,
> grobj=0x241a900, method=4916, size=1,
>     file=0x7f63f5f5b630 "NV50EXAPrepareComposite", line=695) at
> nouveau_dma.h:118
> #2  0x00007f63f5f509b0 in NV50EXAPrepareComposite (op=<value optimized
> out>, pspict=0x3eb9210, pmpict=0x3bad6c0, pdpict=0x3543430,
>     pspix=0x2f21de0, pmpix=0x522f4c0, pdpix=0x5a39230) at nv50_exa.c:695
> #3  0x00007f63f457de6a in ?? () from /usr/lib64/X11/modules//libexa.so
> #4  0x00007f63f457f097 in exaComposite () from
> /usr/lib64/X11/modules//libexa.so
> #5  0x000000000053029f in ?? ()
> #6  0x000000000051f0ad in ?? ()
> #7  0x0000000000447ef6 in Dispatch ()
> #8  0x000000000042d82d in main ()
>

Oh, and I almost forgot; the logs are full (as in ~500M in two days) of 

Dec 26 18:29:47 tiny [drm] PGRAPH_ERROR - nSource: 
PROTECTION_ERROR,x00000000:0x000003ec
Dec 26 18:29:47 tiny [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
Dec 26 18:29:47 tiny [drm] PGRAPH_ERROR - Ch 2/0 Class 0x502d Mthd 0x08dc Data 
0x00000000:0x000003ec
Dec 26 18:29:47 tiny [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
Dec 26 18:29:47 tiny [drm] PGRAPH_ERROR - Ch 2/0 Class 0x502d Mthd 0x08dc Data 
0x00000000:0x000003ec
Dec 26 18:29:47 tiny [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
Dec 26 18:29:47 tiny [drm] PGRAPH_ERROR - Ch 2/0 Class 0x502d Mthd 0x08dc Data 
0x00000000:0x000003ec
