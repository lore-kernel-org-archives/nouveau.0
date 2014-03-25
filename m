From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 4/4] vbios/prom: fetch the vbios using only
 aligned 32-bit accesses
Date: Tue, 25 Mar 2014 18:24:59 -0400
Message-ID: <CAKb7Uvhahzo7S-B63V=tQQK=gbXhV4qv13qbF-ePBOP8d2Ce1g@mail.gmail.com>
References: <1395785480-2932-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395785480-2932-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Mar 25, 2014 at 6:11 PM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
> Other kind of accesses are unreliable on Maxwell cards. As advised by NVIDIA,

Maxwell or Kepler?

> let's only use 32-bit accesses to fetch the vbios from PROM.
>
> This fixes vbios fetching on my nve7 which failed in certain specific
> conditions.
>
> I suggest we Cc stable, for all kernels they still maintain after the big
> rewrite.

Just throw in the Cc :) Easier to just have it there than to have to
go in and edit the commit description to remove this comment and add
the Cc line...

>
> Suggested-by: Christian Zander <czander-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> ---
>  nvkm/subdev/bios/base.c | 35 +++++++++++++++++++++++------------
>  1 file changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/nvkm/subdev/bios/base.c b/nvkm/subdev/bios/base.c
> index 5608530..baa5687 100644
> --- a/nvkm/subdev/bios/base.c
> +++ b/nvkm/subdev/bios/base.c
> @@ -157,6 +157,10 @@ nouveau_bios_shadow_prom(struct nouveau_bios *bios)
>                 pcireg = 0x001850;
>         access = nv_mask(bios, pcireg, 0x00000001, 0x00000000);
>
> +       /* WARNING: PROM accesses should always be 32-bits aligned. Other
> +        * accesses work on most chipset but do not on Kepler chipsets
> +        */
> +
>         /* bail if no rom signature, with a workaround for a PROM reading
>          * issue on some chipsets.  the first read after a period of
>          * inactivity returns the wrong result, so retry the first header
> @@ -164,31 +168,38 @@ nouveau_bios_shadow_prom(struct nouveau_bios *bios)
>          */
>         i = 16;
>         do {
> -               if (nv_rd08(bios, 0x300000) == 0x55)
> +               if ((nv_rd32(bios, 0x300000) & 0xffff) == 0xaa55)
>                         break;
>         } while (i--);
>
> -       if (!i || nv_rd08(bios, 0x300001) != 0xaa)
> +       if (!i)
>                 goto out;
>
> -       /* additional check (see note below) - read PCI record header */
> -       pcir = nv_rd08(bios, 0x300018) |
> -              nv_rd08(bios, 0x300019) << 8;
> -       if (nv_rd08(bios, 0x300000 + pcir) != 'P' ||
> -           nv_rd08(bios, 0x300001 + pcir) != 'C' ||
> -           nv_rd08(bios, 0x300002 + pcir) != 'I' ||
> -           nv_rd08(bios, 0x300003 + pcir) != 'R')
> +       /* check the PCI record header ("PCIR") if its address is aligned */
> +       pcir = nv_rd32(bios, 0x300018) & 0xffff;
> +       if ((pcir % 4) == 0 && nv_rd32(bios, 0x300000 + pcir) != 0x52494350)
>                 goto out;

So if pcir % 4 != 0, it's all OK? Perhaps you meant

if (pcir & 0x3 || nv_rd32(...) != ...)
  goto out

>
>         /* read entire bios image to system memory */
> -       bios->size = nv_rd08(bios, 0x300002) * 512;
> +       bios->size = ((nv_rd32(bios, 0x300000) >> 16) & 0xff) * 512;

You already read this out once, might as well save it. BTW, is CPU
endianness affected here? i.e. does nv_rd32 do a le32 -> be32
conversion on a be cpu? I would assume it must since everything
assumes that 32-bit reads read in integer values... but then your
logic is all wrong, since the bytes are laid out in a different order
on be.

>         if (!bios->size)
>                 goto out;
>
>         bios->data = kmalloc(bios->size, GFP_KERNEL);
>         if (bios->data) {
> -               for (i = 0; i < bios->size; i++)
> -                       nv_wo08(bios, i, nv_rd08(bios, 0x300000 + i));
> +               for (i = 0; i < bios->size; i+=4)
> +                       nv_wo32(bios, i, nv_rd32(bios, 0x300000 + i));
> +       }
> +
> +       /* check the PCI record header again, now that we can make
> +        * un-aligned accesses

Why bother with the two separate mechanisms? In practice, is PCIR ever
at a non-mod4 location? (Should be easy to check our bios
collection...)

> +        */
> +       if (bios->data[pcir + 0] != 'P' ||
> +           bios->data[pcir + 1] != 'C' ||
> +           bios->data[pcir + 2] != 'I' ||
> +           bios->data[pcir + 3] != 'R') {
> +               bios->size = 0;
> +               kfree(bios->data);
>         }
>
>  out:
> --
> 1.9.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
