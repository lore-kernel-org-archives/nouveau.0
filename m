From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: nv50: fix ->pseudo_palette usage
Date: Sat, 9 Jan 2010 17:52:28 +0100
Message-ID: <6d4bc9fc1001090852t4d19a77bv50caa5795ff9c95@mail.gmail.com>
References: <20100103091742.GA11518@x200> <1262557056.18387.6.camel@nisroch>
	<20100109160524.GA4258@x200>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100109160524.GA4258@x200>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is the patch
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=3Daac125bb84c73a76=
37de5e85a6cc23ab81357552

Maybe a rebased patch went upstream (no idea if this happened already)?

Maarten.

On Sat, Jan 9, 2010 at 5:05 PM, Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Jan 04, 2010 at 08:17:36AM +1000, Ben Skeggs wrote:
>> On Sun, 2010-01-03 at 11:17 +0200, Alexey Dobriyan wrote:
>> > Sometimes struct fb_fillrect::color is color, sometimes palette index.
>> This doesn't apply on current git, which already has a similar (though,
>> not quite the same) patch applied. =A0We may yet need some additional
>> fixes from your patch, I'll look at testing that soon.
>
> Ehh?
> They're the same except I haven't changed nv04, because of no hardware.
>
>> > --- a/drivers/gpu/drm/nouveau/nv50_fbcon.c
>> > +++ b/drivers/gpu/drm/nouveau/nv50_fbcon.c
>> > @@ -10,6 +10,7 @@ nv50_fbcon_fillrect(struct fb_info *info, const stru=
ct fb_fillrect *rect)
>> > =A0 =A0 struct drm_device *dev =3D par->dev;
>> > =A0 =A0 struct drm_nouveau_private *dev_priv =3D dev->dev_private;
>> > =A0 =A0 struct nouveau_channel *chan =3D dev_priv->channel;
>> > + =A0 uint32_t color;
>> >
>> > =A0 =A0 if (info->state !=3D FBINFO_STATE_RUNNING)
>> > =A0 =A0 =A0 =A0 =A0 =A0 return;
>> > @@ -31,7 +32,12 @@ nv50_fbcon_fillrect(struct fb_info *info, const str=
uct fb_fillrect *rect)
>> > =A0 =A0 =A0 =A0 =A0 =A0 OUT_RING(chan, 1);
>> > =A0 =A0 }
>> > =A0 =A0 BEGIN_RING(chan, NvSub2D, 0x0588, 1);
>> > - =A0 OUT_RING(chan, rect->color);
>> > + =A0 if (info->fix.visual =3D=3D FB_VISUAL_TRUECOLOR ||
>> > + =A0 =A0 =A0 info->fix.visual =3D=3D FB_VISUAL_DIRECTCOLOR) {
>> > + =A0 =A0 =A0 =A0 =A0 color =3D ((uint32_t *)info->pseudo_palette)[rec=
t->color];
>> > + =A0 } else
>> > + =A0 =A0 =A0 =A0 =A0 color =3D rect->color;
>> > + =A0 OUT_RING(chan, color);
>> > =A0 =A0 BEGIN_RING(chan, NvSub2D, 0x0600, 4);
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
