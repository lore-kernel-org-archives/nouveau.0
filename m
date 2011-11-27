From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH to drm/nouveau] nouveau: Mark nouveau
 subchannel unbound nouveau_grobj_free
Date: Sun, 27 Nov 2011 11:38:43 -0500
Message-ID: <CAMVNhxT5NcuZ1cSN4jfT=VJVo9qFOxh8DeWZ4kJGOyfUwYM9uA@mail.gmail.com>
References: <4ECE41E5.3090608@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4ECE41E5.3090608-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Nov 24, 2011 at 8:08 AM, Maarten Lankhorst
<m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Valgrind throws warns about a user-after-free if you try to bind a
> new subchannel after the old one in that slot was freed,
> so remove it from the channel list.
>
> Signed-off-by: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> --- a/nouveau/nouveau_grobj.c
> +++ b/nouveau/nouveau_grobj.c
> @@ -100,12 +99,13 @@ nouveau_grobj_free(struct nouveau_grobj **grobj)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_nouveau_gpuobj_free f;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0FIRE_RING(&chan->base);
> -
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0f.channel =3D chan->drm.channel;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0f.handle =A0=3D nvgrobj->base.handle;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0drmCommandWrite(nvdev->fd, DRM_NOUVEAU_GPU=
OBJ_FREE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&f, sizeof=
(f));
> =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 if (nvgrobj->base.bound !=3D NOUVEAU_GROBJ_UNBOUND)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chan->base.subc[nvgrobj->base.subc].gr =3D =
NULL;
> =A0 =A0 =A0 =A0free(nvgrobj);
> =A0}
>
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

Pushed, thanks.
