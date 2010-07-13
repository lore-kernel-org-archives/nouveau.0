From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Strange problem with dual head on GeForce9600GT (dual
 DVI)
Date: Wed, 14 Jul 2010 09:08:04 +1000
Message-ID: <1279062484.2966.1.camel@nisroch>
References: <20100713184231.6c3ca5db@Lina>  <20100713184624.29722b49@Lina>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100713184624.29722b49@Lina>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Abelenda Diego <diego.abelenda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 2010-07-13 at 18:46 +0200, Abelenda Diego wrote:
> On Tue, 13 Jul 2010 18:42:31 +0200
> Abelenda Diego <diego.abelenda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> > Hi,
> > 
> > I am using nouveau for some time now, I am quite happy with it. I had
> > two screens connected with DVI to VGA adapters and dual screen was
> > working no problem. Today I decided to replace the DVI to VGA adapters
> > with plain DVI-I dual link cables and found out something strange, the
> > second screen doesn't display anything anymore, it stays black.
> > 
> > I am using gentoo linux with
> > Linus' kernel 2.6.35_rc4
> > libdrm 2.4.21
> > media-libs/mesa 7.8.2
> > x11-drivers/xf86-video-nouveau 0.0.16_pre20100615
> > 
> > Is it somehow related to
> > https://bugs.freedesktop.org/show_bug.cgi?id=27455 or do I need to
> > open a new bug report, with some dumps from renouveau ?
> 
> Sorry my cables are not DVI-I dual link they are DVI-D dual link (this
> might make a difference).
I doubt it's related to the bug you mentioned, the display engines are
completely different.

If you could attach your dmesg output after booting with "log_buf_len=1M
drm.debug=14 nouveau.reg_debug=0x0200" I'll take a look and see if some
of the recent fixes could apply to you.

Thanks!
Ben.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
