From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [MESA PATCH] Fix nv40_miptree_layout pitch
Date: Fri, 25 Dec 2009 21:33:42 -0500
Message-ID: <586c2acd0912251833x1665b258ica2a55ccfff629f6@mail.gmail.com>
References: <ff13bc9a0912251659v27b69ea5he53c912cf86939b7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <ff13bc9a0912251659v27b69ea5he53c912cf86939b7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Dec 25, 2009 at 7:59 PM, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> wro=
te:
> This patch fixes two issues in nv40_miptree_layout.
>
> First, pt->width0 is used, which is the size of the whole texture,
> while width, which is the size of the mipmap level, should be used.
>
> Second, the current code does not 64-byte align the pitch of swizzled
> textures. However, on my NV40 this causes a pgraph error regarding the
> pitch register (and sometimes a system lockup too), which is fixed by
> this patch.
> I'm not sure how small mipmaps could have worked with the previous code.
>
> Also the offset code below may need some review.
> And furthermore, wide_pitch is set for any kind of texture usage, so
> maybe it should be made unconditional (what's the point of allocating
> a texture that the GPU can't use in any way?).
>
> diff --git a/src/gallium/drivers/nv40/nv40_miptree.c
> b/src/gallium/drivers/nv40/nv40_miptree.c
> index b974e68..9f54187 100644
> --- a/src/gallium/drivers/nv40/nv40_miptree.c
> +++ b/src/gallium/drivers/nv40/nv40_miptree.c
> @@ -31,8 +31,8 @@ nv40_miptree_layout(struct nv40_miptree *mt)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0for (l =3D 0; l <=3D pt->last_level; l++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (wide_pitch && (pt->tex_usage & NOUVEAU_=
TEXTURE_USAGE_LINEAR))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mt->level[l].pitch =3D alig=
n(util_format_get_stride(pt->format,
> pt->width0), 64);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (wide_pitch)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mt->level[l].pitch =3D alig=
n(util_format_get_stride(pt->format, width), 64);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mt->level[l].pitch =3D uti=
l_format_get_stride(pt->format, width);

Hi,

Width0 is actually the correct value as far as I know. All mip levels
of a linear texture are padded out to the pitch of the base level so
they can be used by the 3D engine. I haven't run into the 64-byte
pitch error for swizzled textures myself, if you can reproduce it and
have a patch for it it would be appreciated.

The wide_pitch flag is set for textures the 3D engine will sample from
or render to, but for temporary textures that are used to do swizzled
texture transfers the 2D engine doesn't care (or will complain, I
don't remember), so it saves a bit of memory.
