From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [libdrm PATCH] nouveau: fix memory leak in
	nouveau_channel_free
Date: Thu, 14 Jan 2010 23:30:01 +0100
Message-ID: <6d4bc9fc1001141430g6a8afa20jadcdf855993fb446@mail.gmail.com>
References: <20100112143239.GB2984@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100112143239.GB2984-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Could you resend these (not just this one) patches as proper git
send-email patches, those have authorship too, so they can be used
with git am.

Maarten.

On Tue, Jan 12, 2010 at 3:32 PM, Marcin Slusarz
<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Subject: [libdrm PATCH] nouveau: fix memory leak in nouveau_channel_free
>
> ---
> =A0nouveau/nouveau_channel.c | =A0 =A04 ++++
> =A01 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/nouveau/nouveau_channel.c b/nouveau/nouveau_channel.c
> index 638aee3..14cf4c6 100644
> --- a/nouveau/nouveau_channel.c
> +++ b/nouveau/nouveau_channel.c
> @@ -102,6 +102,7 @@ nouveau_channel_free(struct nouveau_channel **chan)
> =A0 =A0 =A0 =A0struct nouveau_channel_priv *nvchan;
> =A0 =A0 =A0 =A0struct nouveau_device_priv *nvdev;
> =A0 =A0 =A0 =A0struct drm_nouveau_channel_free cf;
> + =A0 =A0 =A0 int i;
>
> =A0 =A0 =A0 =A0if (!chan || !*chan)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> @@ -115,6 +116,9 @@ nouveau_channel_free(struct nouveau_channel **chan)
> =A0 =A0 =A0 =A0nouveau_bo_unmap(nvchan->notifier_bo);
> =A0 =A0 =A0 =A0nouveau_bo_ref(NULL, &nvchan->notifier_bo);
>
> + =A0 =A0 =A0 for (i =3D 0; i < nvchan->drm.nr_subchan; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 free(nvchan->base.subc[i].gr);
> +
> =A0 =A0 =A0 =A0nouveau_grobj_free(&nvchan->base.vram);
> =A0 =A0 =A0 =A0nouveau_grobj_free(&nvchan->base.gart);
> =A0 =A0 =A0 =A0nouveau_grobj_free(&nvchan->base.nullobj);
> --
> 1.6.6.rc3
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
