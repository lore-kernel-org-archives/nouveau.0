From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH envytools] nvbios: Fix reading of
	ram_restrict_group_count.
Date: Sun, 31 Aug 2014 01:00:20 +0200
Message-ID: <54025784.90708@free.fr>
References: <1409418318-31648-1-git-send-email-titan.costa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1409418318-31648-1-git-send-email-titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

On 30/08/2014 19:05, Christian Costa wrote:
> The entry offset was use instead of the data it points to. Probably a regression.
> The files showing script parsing errors has been reduced from 410 to 6 with the database of 505 vbios.
> ---
>   nvbios/mem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/nvbios/mem.c b/nvbios/mem.c
> index 81f2d1b..e4797e3 100644
> --- a/nvbios/mem.c
> +++ b/nvbios/mem.c
> @@ -232,11 +232,11 @@ envy_bios_parse_bit_M (struct envy_bios *bios, struct envy_bios_bit_entry *bit)
>   
>   	if (bit->version == 1) {
>   		if (bit->t_len >= 5) {
> -			bios_u8(bios, bit->offset+2, &ram_restrict_group_count);
> +			bios_u8(bios, bit->t_offset+2, &ram_restrict_group_count);
>   		}
>   	} else if (bit->version == 2) {
>   		if (bit->t_len >= 3) {
> -			bios_u8(bios, bit->offset, &ram_restrict_group_count);
> +			bios_u8(bios, bit->t_offset, &ram_restrict_group_count);
>   		}
>   	}
>   

A very big thank you Christian for this fix! It had been bothering a few 
of us but we never really
looked into it because we always was reminded of this bug while doing 
something else.

I pushed all three patches! Looking forward to seeing what's next ;)
