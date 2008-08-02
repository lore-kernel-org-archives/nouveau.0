From: Jasper Bryant-Greene <jasper-XrxwZhJB1KNIJsTUW+i+0g@public.gmane.org>
Subject: Re: NV86 (Quadro NVS 140M) errors in dmesg
Date: Sat, 02 Aug 2008 13:31:49 +1200
Message-ID: <1217640709.3619.12.camel@luna.unix.geek.nz>
References: <1217629252.3619.5.camel@luna.unix.geek.nz>
	<1217635362.10309.2.camel@araqiel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1217635362.10309.2.camel@araqiel>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 2008-08-02 at 10:02 +1000, Ben Skeggs wrote:
> Am Samstag, den 02.08.2008, 10:20 +1200 schrieb Jasper Bryant-Greene:
> > [   22.586502] [drm:nouveau_graph_trapped_channel] *ERROR* AIII,
> > invalid/inactive channel id 128
> > [   22.586509] [drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR, nStatus:
> > [   22.586513] [drm] PGRAPH_ERROR - Ch -1/0 Class 0x0000 Mthd 0x0000
> > Data 0x00000000:0x00000000
> That's a bug - I see it on my FX570M, it'll only happen on first X
> start.  Will look into it when it annoys me enough.

OK, let me know if you need any details from me when you get around to
looking at this. It doesn't seem to actually cause any problems.

Also, is there any way to force the DPI with nouveau? I'm specifying

 -dpi 96

... on the X command line, but I still see

 (**) NOUVEAU(0): DPI set to (129, 203)

... in the Xorg.0.log, and the font sizes are all weird in X. With the
nvidia binary driver I used to have to use

 Option DPI "96 x 96"

... in xorg.conf - is there something similar with nouveau?

I'm guessing its my laptop panel reporting incorrect values for
something, but I still need to work around it :)

Cheers,
Jasper
