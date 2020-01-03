From: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/bios: fix incorrect kfree in
 platform_init
Date: Fri, 3 Jan 2020 12:58:23 +0100
Message-ID: <fd3273d3-5814-be43-dbec-e49bc7990705@spliet.org>
References: <1578039033-6458-1-git-send-email-wuxu.wu@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1578039033-6458-1-git-send-email-wuxu.wu-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "wuxu.wu" <wuxu.wu-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

(re-sending as plain text)

NACK. The before and after of this patch are functionally identical. The 
if-block returns unconditionally ("return priv;"), so the kfree will 
only ever be reached if the condition in the if-statement evaluates to 
false. Explicitly writing out an else-block is thus superfluous.

Op 03-01-2020 om 09:10 schreef wuxu.wu:
> Hi, I think there has a incorrect kfree in pcirom_init function. In
> pcirom_init function priv porinter could be free only when priv != null
> and priv->rom is null.
> 
> Signed-off-by: wuxu.wu <wuxu.wu-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
> index 9b91da0..d776e01 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
> @@ -70,8 +70,9 @@ pcirom_init(struct nvkm_bios *bios, const char *name)
>   			    (priv->rom = pci_map_rom(pdev, &priv->size))) {
>   				priv->pdev = pdev;
>   				return priv;
> +			} else {
> +			    kfree(priv);
>   			}
> -			kfree(priv);
>   		}
>   		pci_disable_rom(pdev);
>   	}
> 
