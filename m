From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nv04/exa: Reset destination surface offset in
 the same call of NV04EXACopy
Date: Fri, 8 Jun 2012 17:32:36 +1000
Message-ID: <20120608073236.GA2223@nisroch.redhat.com>
References: <bug-48954-8800@http.bugs.freedesktop.org/>
	<1338063320-9274-1-git-send-email-noviktor@seznam.cz>
	<20120607123627.GA3114@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120607123627.GA3114-OI9uyE9O0yo@public.gmane.org>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Jun 07, 2012 at 02:51:00PM +0200, Marcin Slusarz wrote:
> On Sat, May 26, 2012 at 10:15:20PM +0200, Viktor Novotn=FD wrote:
> > Fixes FDO bug #48954.
> > =

> > Signed-off-by: Viktor Novotn=FD <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
> > ---
> =

> Reviewed-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Thanks a lot, nice catch.  I've pushed the fix to nouveau git.

> =

> It seems this code was buggy since it was introduced in "nv04-nv40/exa: M=
ake
> the copy hook blit downwards for non-overlapping regions." (OFFSET_DESTIN=
 was
> not zeroed for the second part), only "WIP: port to new libdrm" made it m=
ore
> apparent.
> =

> >  src/nv04_exa.c |   15 ++++++++-------
> >  1 files changed, 8 insertions(+), 7 deletions(-)
> > =

> > diff --git a/src/nv04_exa.c b/src/nv04_exa.c
> > index 7ede9d9..ca92868 100644
> > --- a/src/nv04_exa.c
> > +++ b/src/nv04_exa.c
> > @@ -220,7 +220,7 @@ NV04EXACopy(PixmapPtr pdpix, int srcX, int srcY, in=
t dstX, int dstY,
> >  	int split_dstY =3D NOUVEAU_ALIGN(dstY + 1, 64);
> >  	int split_height =3D split_dstY - dstY;
> >  =

> > -	if (nouveau_pushbuf_space(push, 16, 1, 0))
> > +	if (nouveau_pushbuf_space(push, 16, 2, 0))
> >  		return;
> >  =

> >  	if ((width * height) >=3D 200000 && pNv->pspix !=3D pNv->pdpix &&
> > @@ -249,7 +249,13 @@ NV04EXACopy(PixmapPtr pdpix, int srcX, int srcY, i=
nt dstX, int dstY,
> >  		height -=3D split_height;
> >  		dstY =3D 0;
> >  		pNv->pmpix =3D pdpix;
> > -	} else
> > +	}
> > +
> > +	BEGIN_NV04(push, NV01_BLIT(POINT_IN), 3);
> > +	PUSH_DATA (push, (srcY << 16) | srcX);
> > +	PUSH_DATA (push, (dstY << 16) | dstX);
> > +	PUSH_DATA (push, (height  << 16) | width);
> > +
> >  	if (pNv->pmpix) {
> >  		struct nouveau_bo *dst_bo =3D nouveau_pixmap_bo(pdpix);
> >  =

> > @@ -258,11 +264,6 @@ NV04EXACopy(PixmapPtr pdpix, int srcX, int srcY, i=
nt dstX, int dstY,
> >  		pNv->pmpix =3D NULL;
> >  	}
> >  =

> > -	BEGIN_NV04(push, NV01_BLIT(POINT_IN), 3);
> > -	PUSH_DATA (push, (srcY << 16) | srcX);
> > -	PUSH_DATA (push, (dstY << 16) | dstX);
> > -	PUSH_DATA (push, (height  << 16) | width);
> > -
> >  	if ((width * height) >=3D 512)
> >  		PUSH_KICK(push);
> >  }
> > -- =

> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
