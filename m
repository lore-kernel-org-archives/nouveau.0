From: soulpatch <soulpa7ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: module parameter description fix
Date: Thu, 25 Feb 2010 22:31:16 -0700
Message-ID: <1267162276.9424.7.camel@Tachyon>
References: <1267159017.7524.17.camel@Tachyon>
	<add883141002252123l424a4095x79f9551726dc5266@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <add883141002252123l424a4095x79f9551726dc5266-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Tavian Barnes <tavianator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 2010-02-26 at 00:23 -0500, Tavian Barnes wrote:
> On 25 February 2010 23:36, soulpatch <l337_sp33k-FFYn/CNdgSA@public.gmane.org> wrote:
> > I found a bug in the nouveau kernel module. It looks like a cut and
> > paste error on the definitions of some module parameters in
> > nouveau_drv.c. The bug exhibits when displaying module parameter
> > information with the modinfo utility. Here's a patch:
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
> > index da3b93b..874adf5 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drv.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
> > @@ -75,11 +75,11 @@ MODULE_PARM_DESC(ignorelid, "Ignore ACPI lid status");
> >  int nouveau_ignorelid = 0;
> >  module_param_named(ignorelid, nouveau_ignorelid, int, 0400);
> >
> > -MODULE_PARM_DESC(noagp, "Disable all acceleration");
> > +MODULE_PARM_DESC(noaccel, "Disable all acceleration");
> >  int nouveau_noaccel = 0;
> >  module_param_named(noaccel, nouveau_noaccel, int, 0400);
> >
> > -MODULE_PARM_DESC(noagp, "Disable fbcon acceleration");
> > +MODULE_PARM_DESC(nofbaccel, "Disable fbcon acceleration");
> >  int nouveau_nofbaccel = 0;
> >  module_param_named(nofbaccel, nouveau_nofbaccel, int, 0400);
> >
> >
> > Cheers,
> >        soulpatch
> >
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> 
> Looks like 933236b4a6ae9cb917f80ef1effe964323d7f25a just fixed this yesterday.
> 

Yeah, I fixed it yesterday too. I guess I should have done another pull
before generating the diff today. Glad it got fixed though.

soulpatch
