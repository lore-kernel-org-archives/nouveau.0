From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] platform: fix compilation error
Date: Wed, 13 Aug 2014 17:07:59 +1000
Message-ID: <CACAvsv4WzV0Mv6KNvfcZHkUuqYjKwOdOZLb=9kAEKdvT180nyg@mail.gmail.com>
References: <1407881813-18713-1-git-send-email-acourbot@nvidia.com>
 <1407881813-18713-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1407881813-18713-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Aug 13, 2014 at 8:16 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> nouveau_platform.c was still using the old nouveau_dev() macro,
> triggering a compilation error. Fix this.
Hey Alex,

Apologies for missing this.  I rebased on top of your patches, and it
got missed in the grep.

Thank you,
Ben.

>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Hi Ben,
>
> This one should probably go for 3.17 as Linus' tree currently does not
> compile if NOUVEAU_PLATFORM is selected. :(
>
>  drm/nouveau_platform.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drm/nouveau_platform.c b/drm/nouveau_platform.c
> index 0ffeb50d0088..246a824c16ca 100644
> --- a/drm/nouveau_platform.c
> +++ b/drm/nouveau_platform.c
> @@ -149,7 +149,8 @@ power_down:
>  static int nouveau_platform_remove(struct platform_device *pdev)
>  {
>         struct drm_device *drm_dev = platform_get_drvdata(pdev);
> -       struct nouveau_device *device = nouveau_dev(drm_dev);
> +       struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +       struct nouveau_device *device = nvkm_device(&drm->device);
>         struct nouveau_platform_gpu *gpu = nv_device_to_platform(device)->gpu;
>
>         nouveau_drm_device_remove(drm_dev);
> --
> 2.0.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
