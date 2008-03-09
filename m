From: Bernhard Kaindl <bk-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [patch] add nv50 voodoo
Date: Sun, 9 Mar 2008 01:09:37 +0100 (CET)
Message-ID: <alpine.LNX.1.00.0803090055260.18975@jbgna.fhfr.qr>
References: <20080308234138.GD10221@martell.zuzino.mipt.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20080308234138.GD10221-QDJVlCTZ4KWTKS93B3g+7KFoa47nwP16@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 9 Mar 2008, Alexey Dobriyan wrote:
> 
> Hi, this is from mmio-traces. After startx I see mouse cursor which
> moves, background split into black and garbage areas. First area
> consists of repeated pattern of something. Surrealistic picture, and
> after several seconds box locks up hard, monitor turns off.
> However much improvement against non-starting X. :-)

Great stuff!

BTW, does this change if you first start the blob and then only
change Driver "nvidia" to "nouveau" in xorg.conf and start nouveau
without rebooting first?

I ask because my nv84 was in a similar shape like you got it with
the voodoo now (my nv84 had already a voodoo in nv50_graph.c), but
when I started the blob before starting nouveau, it worked then :-)

What fixed this then completely so that I could start nouveau fresh
from boot was this patch:

	http://users.on.net/~darktama/nv84_ctxvals.patch

BTW: ppl, could you apply it to the tree please until darktama made
progress with his voodoo generator?

http://nouveau.freedesktop.org/wiki/HonzaHavlicek says:
* The INSTANCE_WR writes in *_graph_context_init are setting up the
  default graphics context.

You may be able to extract the nv50 ctxvals which you likely miss
for working nouveau from your mmiotrace or it seems from a REnouveau
dump, this page says:

	http://nouveau.freedesktop.org/wiki/CtxInit

Bernhard

PS: There is also http://nouveau.freedesktop.org/wiki/Nv20GraphInit,
but I guess the CtxInit page is what you need.

PPS: If have trouble with the instruction on the CtxInit page (e.g.
patch not working and you can't adapt it, come to the IRC channel
or as darktama for help...
