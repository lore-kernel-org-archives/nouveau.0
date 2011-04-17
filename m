From: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Fix a complier warning in the
 card init error path
Date: Sun, 17 Apr 2011 18:27:45 -0400
Message-ID: <20110417182745.212a6516@amd64linuxmsi.rentzhouse.lan>
References: <20110417161453.0310de4d@amd64linuxmsi.rentzhouse.lan>
	<20110417211525.GA3440@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110417211525.GA3440-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 17 Apr 2011 23:18:36 +0200
Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Sun, Apr 17, 2011 at 04:14:53PM -0400, Jimmy Rentz wrote:
> > Fix an unitialized variable complier warning in nouveau_card_init.
> >     
> > Signed-off-by: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c
> > b/drivers/gpu/drm/nouveau/nouveau_state.c index 3404950..66e8037
> > 100644 --- a/drivers/gpu/drm/nouveau/nouveau_state.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
> > @@ -679,7 +679,7 @@ out_fifo:
> >  		engine->fifo.takedown(dev);
> >  out_engine:
> >  	if (!nouveau_noaccel) {
> > -		for (e = e - 1; e >= 0; e--) {
> > +		for (e = NVOBJ_ENGINE_NR - 1; e >= 0; e--) {
> >  			if (!dev_priv->eng[e])
> >  				continue;
> >  			dev_priv->eng[e]->fini(dev, e);
> 
> This code is supposed to handle the situation when one of engine
> initialization routines failed and this change will break it...
> 
> Marcin

Really?  It wasn't intentional.  I didn't see the e referenced above.
