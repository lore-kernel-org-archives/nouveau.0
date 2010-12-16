From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: mesa: Patch that fix/add missing WAIT_RING calls
Date: Thu, 16 Dec 2010 17:20:58 +0100
Message-ID: <1292516458.2113.21.camel@Portable-Work>
References: <AANLkTinj4TObB1Mb9mG3T74OQiyKd+vK1Dk-WYuT6=Qc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinj4TObB1Mb9mG3T74OQiyKd+vK1Dk-WYuT6=Qc-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Michel,

had a short look on this, as far as i can tell at the time the patch
looks fairly good and we really need this checks.

Some small notes:

1. In loops with fixed iterations the WAIT_RING should be called before
the loop, not inside. I think it is ok if we waste a few pushbuf entries
to avoid calling libdrm too often.

See for example nvfx_push_vbo and nvfx_render_prim.

2. You decreased the size of the checks in several places. We should
review all of them before pushing this changes. I remember some of them
had some offset for some crude reason. I will review them by this
weekend if no one does it earlier.

-- lynxeye


Am Donnerstag, den 16.12.2010, 12:22 +0100 schrieb Michel Hermier:
> Hi,
> While trying to run a 3D app I needed to modify/add some WAIT_RING
> calls so the push buffer is properly checked, before we try to blindly
> push to it (sine OUT_RING don't perform this checks yet, I have a
> small patch for that for libdrm).
> I allready discussed about it with lynxeye and shining on IRC.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
