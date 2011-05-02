From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: printk info about disabled
 modesetting
Date: Mon, 2 May 2011 19:42:03 +0300
Message-ID: <20110502194203.317a9442@farn.lan>
References: <20110404172735.GA8979@joi.lan> <20110501220341.GI6742@joi.lan>
	<1304319078.23168.1.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1304319078.23168.1.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 02 May 2011 16:51:14 +1000
Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Mon, 2011-05-02 at 00:03 +0200, Marcin Slusarz wrote:
> > On Mon, Apr 04, 2011 at 07:27:35PM +0200, Marcin Slusarz wrote:
> > > ... to make it obvious why nouveau refused to drive the hardware.
> > > 
> > > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  drivers/gpu/drm/nouveau/nouveau_drv.c |    4 +++-
> > >  1 files changed, 3 insertions(+), 1 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
> > > index f658a04..515c656 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drv.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
> > > @@ -445,8 +445,10 @@ static int __init nouveau_init(void)
> > >  			nouveau_modeset = 1;
> > >  	}
> > >  
> > > -	if (!nouveau_modeset)
> > > +	if (!nouveau_modeset) {
> > > +		printk(KERN_INFO "nouveau: modesetting disabled by kernel parameter\n");
> > >  		return 0;
> > > +	}
> > >  
> > >  	nouveau_register_dsm_handler();
> > >  	return drm_init(&driver);
> > > -- 
> > 
> > ping
> I just wonder how this is useful.  I don't find it hard when looking at
> people's logs to scroll to the top and look at the kernel commandline.

The kernel command line does not show module parameters.

It appears, that recently something has started to add KMS-disabling
options to modprobe.conf or equivalent, and those can be further
hidden in initramfs.

Otherwise we have to start asking to dig the parameters from sysfs
on mysterious does-not-work problems.

> Really, that should be done *anyway* as there are many more options that
> are relevant to what nouveau does/does not do as well...

Then maybe we need debug options for those, too, or does the drm core
already print the core options for some value of drm.debug?


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
