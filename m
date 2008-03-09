From: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] add nv50 voodoo
Date: Sun, 9 Mar 2008 15:56:36 +0300
Message-ID: <20080309125635.GA5102@martell.zuzino.mipt.ru>
References: <20080308234138.GD10221@martell.zuzino.mipt.ru>
	<alpine.LNX.1.00.0803090055260.18975@jbgna.fhfr.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.1.00.0803090055260.18975-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Bernhard Kaindl <bk-l3A5Bk7waGM@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Mar 09, 2008 at 01:09:37AM +0100, Bernhard Kaindl wrote:
> On Sun, 9 Mar 2008, Alexey Dobriyan wrote:
> > 
> > Hi, this is from mmio-traces. After startx I see mouse cursor which
> > moves, background split into black and garbage areas. First area
> > consists of repeated pattern of something. Surrealistic picture, and
> > after several seconds box locks up hard, monitor turns off.
> > However much improvement against non-starting X. :-)
> 
> Great stuff!
> 
> BTW, does this change if you first start the blob and then only
> change Driver "nvidia" to "nouveau" in xorg.conf and start nouveau
> without rebooting first?

This doesn't help. :-(

> I ask because my nv84 was in a similar shape like you got it with
> the voodoo now (my nv84 had already a voodoo in nv50_graph.c), but
> when I started the blob before starting nouveau, it worked then :-)
> 
> What fixed this then completely so that I could start nouveau fresh
> from boot was this patch:
> 
> 	http://users.on.net/~darktama/nv84_ctxvals.patch

I wonder, how these were extracted? I took everything from big block of
0x2 writes upto first read from NV04_PTIMER_TIME_1 and it doesn't help.

And just for fun, garbled pictures at the top of screen are actually
Asus P5B-E full-screen logo seen at start of bootup.
