From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nouveau/bios/therm: handle vbioses
 with duplicate entries (mostly nva5)
Date: Wed, 4 Sep 2013 11:55:11 +1000
Message-ID: <CACAvsv5VTQvVcQhB0_=GY4Jjx=3-EAd+QMqzemR7qsDeh7KxzA@mail.gmail.com>
References: <1377907131-15099-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1377907131-15099-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: Martin Peres <martin.peres-/ze9ptdxDJdQFI55V6+gNQ@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Aug 31, 2013 at 9:58 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
> From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
>
> Some vbioses have extra useless entries after "the end" of the table. This is
> problematic since all of the vbios I found with this issue redefine the
> pwm freq divider to insane levels (52750 Hz instead of 2500), thus breaking
> fan management.
>
> The first solution to solve this mess would be to change the length of the
> table. The solution I choose was simply to avoid setting the pwm freq twice
> as the other redefinitions are harmless with our current parser.
I'm still *really* not convinced we're using the thermal table correctly....

However, this makes sense for our current handling, so, merged.

Thanks,
Ben.

>
> Signed-off-by: Martin Peres <martin.peres-/ze9ptdxDJdQFI55V6+gNQ@public.gmane.org>
> Reported-by: Mariusz Bialonczyk <manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org>
> Tested-by: Mariusz Bialonczyk <manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/subdev/bios/therm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/therm.c b/drivers/gpu/drm/nouveau/core/subdev/bios/therm.c
> index 22a2057..22ac6db 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/bios/therm.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/bios/therm.c
> @@ -184,7 +184,8 @@ nvbios_therm_fan_parse(struct nouveau_bios *bios,
>                         cur_trip->fan_duty = value;
>                         break;
>                 case 0x26:
> -                       fan->pwm_freq = value;
> +                       if (!fan->pwm_freq)
> +                               fan->pwm_freq = value;
>                         break;
>                 case 0x3b:
>                         fan->bump_period = value;
> --
> 1.8.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
