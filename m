From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] bios: fix a potential NULL deref in the PROM
 shadowing function
Date: Tue, 27 May 2014 11:15:57 +0200
Message-ID: <538457CD.5080208@free.fr>
References: <1396555961-2252-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1396555961-2252-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Le 03/04/2014 22:12, Martin Peres a =E9crit :
> Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> ---
>   nvkm/subdev/bios/base.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/nvkm/subdev/bios/base.c b/nvkm/subdev/bios/base.c
> index 3de7d81..5f8643d 100644
> --- a/nvkm/subdev/bios/base.c
> +++ b/nvkm/subdev/bios/base.c
> @@ -183,10 +183,11 @@ nouveau_bios_shadow_prom(struct nouveau_bios *bios)
>   		goto out;
>
>   	bios->data =3D kmalloc(bios->size, GFP_KERNEL);
> -	if (bios->data) {
> -		for (i =3D 0; i < bios->size; i +=3D 4)
> -			((u32 *)bios->data)[i/4] =3D nv_rd32(bios, 0x300000 + i);
> -	}
> +	if (!bios->data)
> +		goto out;
> +
> +	for (i =3D 0; i < bios->size; i +=3D 4)
> +		((u32 *)bios->data)[i/4] =3D nv_rd32(bios, 0x300000 + i);
>
>   	/* check the PCI record header */
>   	pcir =3D nv_ro16(bios, 0x0018);
>

This patch never got reviewed or pushed. It should also be sent as a fix =

for the next 3.15 rc, if possible.
