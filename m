From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau-cvs] xf86-video-nv: Branch 'master'
Date: Fri, 03 Apr 2009 20:13:59 +1000
Message-ID: <1238753639.1366.8.camel@localhost.localdomain>
References: <20090403042615.8CCE910096@kemper.freedesktop.org>
	<6d4bc9fc0904030143q216add58s4b2125f14fbe47c2@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0904030143q216add58s4b2125f14fbe47c2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Ben Skeggs <darktama-PlYeExAEIo6UevrW7tnuMEsOKLKoXr+P@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, 2009-04-03 at 10:43 +0200, Maarten Maathuis wrote:
> You need these ports for LVDS?
> 
> Because i know these ports are correct for dvi and friends.
> 
> So if you changed them for lvds, we need to seperate port 4 and 5 into
> lvds and non-lvds.
Why doesn't xf86-video-nv do this?  There's a RH bug (492289) where the
ddx doesn't get any modes (on DVI), but kms (which has the old values)
does.  I didn't actually hear from the reporter yet, but seeing as nv
uses the old values I figured that could be a likely culprit...

Did your change actually fix anything?  Your commit message was a vague
 "some minor modesetting changes" seemingly without reason.

Ben.
> 
> Maarten.
> 
> On Fri, Apr 3, 2009 at 6:26 AM, Ben Skeggs
> <darktama-PlYeExAEIo6UevrW7tnuMEsOKLKoXr+P@public.gmane.org> wrote:
> >  src/nv50reg.h |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > New commits:
> > commit 11be9a982073d66a68cd3db2bfc611eb58d3ea81
> > Author: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Date:   Fri Apr 3 12:22:04 2009 +1000
> >
> >    nv50: fix i2c port addresses
> >
> > diff --git a/src/nv50reg.h b/src/nv50reg.h
> > index b3125ce..4e21220 100644
> > --- a/src/nv50reg.h
> > +++ b/src/nv50reg.h
> > @@ -50,8 +50,8 @@
> >  #define NV50_PCONNECTOR_I2C_PORT_1                     0x0000e150
> >  #define NV50_PCONNECTOR_I2C_PORT_2                     0x0000e168
> >  #define NV50_PCONNECTOR_I2C_PORT_3                     0x0000e180
> > -#define NV50_PCONNECTOR_I2C_PORT_4                     0x0000e254
> > -#define NV50_PCONNECTOR_I2C_PORT_5                     0x0000e274
> > +#define NV50_PCONNECTOR_I2C_PORT_4                     0x0000e240
> > +#define NV50_PCONNECTOR_I2C_PORT_5                     0x0000e258
> >
> >  /* 0x00610024 is the state register to read, all it's bits also exist in 0x0061002C in the form of interrupt switches. */
> >  #define NV50_DISPLAY_SUPERVISOR                0x00610024
> >
> > ------------------------------------------------------------------------------
> > _______________________________________________
> > Nouveau-cvs mailing list
> > Nouveau-cvs-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
> > https://lists.sourceforge.net/lists/listinfo/nouveau-cvs
> >
