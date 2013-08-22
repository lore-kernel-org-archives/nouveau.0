From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] drm/nouveau: avoid null deref on bad arguments to
	nouveau_vma_getmap
Date: Thu, 22 Aug 2013 16:41:06 +1000
Message-ID: <CACAvsv4zNrgnBkaJOJyDyDq1bnW37eccjsT=c4yfBJHcNgaaWQ@mail.gmail.com>
References: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, =?ISO-8859-1?Q?Pasi_K=E4rkk=E4inen?= <pasik@iki.fi>, Maarten Lankhorst <maarten.lankhorst@ubuntu.com>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Thu, Aug 22, 2013 at 10:10 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> The code expects non-VRAM mem nodes to have a pages list. If that's not
> set, it will do a null deref down the line. Warn on that condition and
> return an error.
>
> See https://bugs.freedesktop.org/show_bug.cgi?id=3D64774
>
> Reported-by: Pasi K=E4rkk=E4inen <pasik@iki.fi>
> Tested-by: Pasi K=E4rkk=E4inen <pasik@iki.fi>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: <stable@vger.kernel.org> # 3.8+
> ---
>
> I don't exactly understand what's going on, but this is just a
> straightforward way to avoid a null deref that you see happens in the
> bug. I haven't figured out the root cause of this, but it's getting
> well into the "I have no idea how TTM works" space. However this seems
> like a bit of defensive programming -- nouveau_vm_map_sg will pass
> node->pages as a list down, which will be dereferenced by
> nvc0_vm_map_sg. Perhaps the other arguments should make that
> dereferencing not happen, but it definitely was happening here, as you
> can see in the bug.
>
> Ben/Maarten, I'll let you judge whether this check is appropriate,
> since like I hope I was able to convey above, I'm just not really sure :)
>
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index cdc3282..191145d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -963,6 +963,12 @@ nouveau_vma_getmap(struct nouveau_channel *chan, str=
uct nouveau_bo *nvbo,
>         struct nouveau_mem *node =3D mem->mm_node;
>         int ret;
>
> +       /* If we ever get here for a non-vram mem node that doesn't
> +        * have pages, we will end up doing a null deref in
> +        * nouveau_vm_map_sg. */
> +       if (WARN_ON(mem->mem_type !=3D TTM_PL_VRAM && !node->pages))
> +               return -EINVAL;
My guess here is that this is a mapping that requires the use of
map_sg_table() (see nouveau_bo_move_ntfy() for the condition).

I'm not entirely sure this should even be happening to be honest.  I
guess TTM is trying to move a shared buffer from GART to VRAM for some
reason (userspace probably asked for it?).. And well, this really
shouldn't be allowed.. The other device won't be able to touch it
then.

If you can confirm this is indeed what's happening, we should find out
why and fix it (and have the kernel completely reject such attempts).

Ben.

> +
>         ret =3D nouveau_vm_get(nv_client(chan->cli)->vm, mem->num_pages <<
>                              PAGE_SHIFT, node->page_shift,
>                              NV_MEM_ACCESS_RW, vma);
> --
> 1.8.1.5
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
