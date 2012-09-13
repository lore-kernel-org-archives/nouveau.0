From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: add default debug level override
Date: Thu, 13 Sep 2012 13:31:53 +0200
Message-ID: <20120913113153.GB3243@joi.lan>
References: <20120912225006.GC8067@joi.lan>
 <50516236.6000405@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50516236.6000405-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Sep 13, 2012 at 06:33:58AM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> Op 13-09-12 00:50, Marcin Slusarz schreef:
> > Useful when we don't know which subsystem is failing.
> >
> > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/core/core/option.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/core/core/option.c b/drivers/gpu/drm/nouveau/core/core/option.c
> > index 62a432e..fde06b0 100644
> > --- a/drivers/gpu/drm/nouveau/core/core/option.c
> > +++ b/drivers/gpu/drm/nouveau/core/core/option.c
> > @@ -22,9 +22,16 @@
> >   * Authors: Ben Skeggs
> >   */
> >  
> > +#include <linux/module.h>
> >  #include <core/option.h>
> >  #include <core/debug.h>
> >  
> > +MODULE_PARM_DESC(debug_level, "nv_printk level (0-"
> > +		__stringify(CONFIG_NOUVEAU_DEBUG) ", default "
> > +		__stringify(CONFIG_NOUVEAU_DEBUG_DEFAULT) ")");
> > +static int nouveau_debug_level = CONFIG_NOUVEAU_DEBUG_DEFAULT;
> > +module_param_named(debug_level, nouveau_debug_level, int, 0400);
> Why make default 0400? 0600 or 0644 would make more sense..

No particular reason. I copied it from other module parameter (_all_ of
them use 0400). 0644 sounds ok.

Marcin
