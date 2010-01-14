From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [libdrm PATCH 1/4] nouveau: add
	nouveau_resource_destroy
Date: Fri, 15 Jan 2010 00:02:25 +0100
Message-ID: <6d4bc9fc1001141502l78f40a00n1074cdd4bf00a815@mail.gmail.com>
References: <20100112143128.GA2984@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100112143128.GA2984-OI9uyE9O0yo@public.gmane.org>
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

Is everyone ok with this api addition (naming ok?)?

On Tue, Jan 12, 2010 at 3:31 PM, Marcin Slusarz
<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Subject: [libdrm PATCH] nouveau: add nouveau_resource_destroy
>
> ---
> =A0nouveau/nouveau_resource.c | =A0 =A09 +++++++++
> =A0nouveau/nouveau_resource.h | =A0 =A03 +++
> =A02 files changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/nouveau/nouveau_resource.c b/nouveau/nouveau_resource.c
> index 6bef756..7acaf7d 100644
> --- a/nouveau/nouveau_resource.c
> +++ b/nouveau/nouveau_resource.c
> @@ -41,6 +41,15 @@ nouveau_resource_init(struct nouveau_resource **heap,
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +void
> +nouveau_resource_destroy(struct nouveau_resource **heap)
> +{
> + =A0 =A0 =A0 if (!*heap)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 free(*heap);
> + =A0 =A0 =A0 *heap =3D NULL;
> +}
> +
> =A0int
> =A0nouveau_resource_alloc(struct nouveau_resource *heap, unsigned size, v=
oid *priv,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_resource **res)
> diff --git a/nouveau/nouveau_resource.h b/nouveau/nouveau_resource.h
> index 988d246..b760dfb 100644
> --- a/nouveau/nouveau_resource.h
> +++ b/nouveau/nouveau_resource.h
> @@ -38,6 +38,9 @@ int
> =A0nouveau_resource_init(struct nouveau_resource **heap, unsigned start,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned size);
>
> +void
> +nouveau_resource_destroy(struct nouveau_resource **heap);
> +
> =A0int
> =A0nouveau_resource_alloc(struct nouveau_resource *heap, unsigned size, v=
oid *priv,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_resource **);
> --
> 1.6.6.rc3
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
