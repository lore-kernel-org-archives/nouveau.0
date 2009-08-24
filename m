From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] man page: Fix the supported fb depths.
Date: Tue, 25 Aug 2009 08:54:09 +1000
Message-ID: <1251154451.2486.0.camel@keine.ath.cx>
References: <1251122638-17936-1-git-send-email-currojerez@riseup.net>
	<6d4bc9fc0908240707p40f1af97xcc60971b63ae2af@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0908240707p40f1af97xcc60971b63ae2af-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 2009-08-24 at 16:07 +0200, Maarten Maathuis wrote:
> On Mon, Aug 24, 2009 at 4:03 PM, Francisco Jerez<currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wrote:
> > Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
> > ---
> >  man/nouveau.man |    7 ++++---
> >  1 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/man/nouveau.man b/man/nouveau.man
> > index 87f645a..5c4e4ae 100644
> > --- a/man/nouveau.man
> > +++ b/man/nouveau.man
> > @@ -13,9 +13,10 @@ nouveau \- NVIDIA video driver
> >  .fi
> >  .SH DESCRIPTION
> >  .B nouveau
> > -is an __xservername__ driver for NVIDIA video cards.  The driver supports 2D
> > -acceleration and provides support for the following framebuffer depths:
> > -(15,) 16  and 24.  TrueColor visuals are supported for these depths.
> > +is an __xservername__ driver for NVIDIA video cards.  The driver
> > +supports 2D acceleration and provides support for the following
> > +framebuffer depths: 16, 24 and 30.  TrueColor visuals are supported
> 
> 30 is only supported for nv50 iirc.
Yes, and only supported while KMS is enabled also.

Ben.
> 
> > +for these depths.
> >
> >  .SH SUPPORTED HARDWARE
> >  The
> > --
> > 1.6.3.3
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
