From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: swap control
Date: Mon, 27 Sep 2010 01:08:42 +0200
Message-ID: <AANLkTimX7XL3R2kxdr3Rqv6ZFfrUbxJRVLm4yjYqDJ+P@mail.gmail.com>
References: <b67489df1001290107v43d29388paaa7f1d939d16073@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <b67489df1001290107v43d29388paaa7f1d939d16073-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

I am still annoyed by this issue so I have looked a bit again.

On Fri, Jan 29, 2010 at 11:07 AM, Xavier Chantry
<chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 1) how are we supposed to enable it ? is there an env var , or
> ~/.drirc ? is drirc/driconf still valid with dri2 ?

There is a vblank_mode env var that seems to work.
And unfortunately driconf does not work with dri2, but it's very easy
to convert, just rename driver name "nouveau" in ~/.drirc to "dri2"

> 2) is it supported by mesa/gallium ? and nouveau ?
>
> It looks like there were some related changes with dri2.2 but that
> might not concern SGI/MESA swap_control extensions.
> http://lists.x.org/archives/xorg-devel/2009-October/003209.html
>
> Anyway when running progs/xdemos/glxswapcontrol with softpipe, I get
> the following message :
> Unable to set swap-interval. =A0Neither GLX_SGI_swap_control nor
> GLX_MESA_swap_control are supported.
>
> And I do not get when using nouveau, so it seems these extensions are
> announced but not supported.
>

it indeed looks like these extensions are always enabled, in dri2 generic c=
ode.
src/glx/dri2_glx.c
dri2BindExtensions(struct dri2_screen *psc, const __DRIextension **extensio=
ns)
{
   __glXEnableDirectExtension(&psc->base, "GLX_SGI_video_sync");
   __glXEnableDirectExtension(&psc->base, "GLX_SGI_swap_control");
   __glXEnableDirectExtension(&psc->base, "GLX_MESA_swap_control");
   __glXEnableDirectExtension(&psc->base, "GLX_SGI_make_current_read");

There does not seem to be any extensions there that depend on driver
capabilities, which I find a bit surprising.
Is that too hard to implement ?
I still don't understand which component exactly is supposed to
implement that feature , is it the ddx , with support of the drm ?
But it's not possible to query this ddx capability from mesa ?
