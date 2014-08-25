From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH envytools] Don't try to use bios->pars if NULL
 (parse_pcir function has probably failed).
Date: Mon, 25 Aug 2014 15:09:23 -0400
Message-ID: <CAKb7UvhnRp55JtHgW7WOxmwUXWeUO_Ow4ub0LoGHWMhTx005rg@mail.gmail.com>
References: <1408993096-18883-1-git-send-email-titan.costa@gmail.com>
 <1408993096-18883-7-git-send-email-titan.costa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408993096-18883-7-git-send-email-titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Aug 25, 2014 at 2:58 PM, Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> ---
>  nvbios/info.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/nvbios/info.c b/nvbios/info.c
> index 87a33d8..6b8d209 100644
> --- a/nvbios/info.c
> +++ b/nvbios/info.c
> @@ -119,6 +119,10 @@ int envy_bios_parse_bit_i (struct envy_bios *bios, struct envy_bios_bit_entry *b
>                         bios->chipset_name = "G72";
>                         break;
>                 case 0x0573:
> +                       if (!bios->parts) {
> +                               ENVY_BIOS_ERR("Failed to detect board (bios->pars is NULL, parse_pcir function has probably failed)\n");

parts

> +                               break;
> +                       }
>                         /* yeah, ain't this one hilarious... */
>                         if ((bios->parts[0].pcir_device & 0xfff0) == 0x7e0) {
>                                 bios->chipset = 0x63;
> --
> 1.9.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
