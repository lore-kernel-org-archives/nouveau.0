From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH v5 06/13] drm/nouveau: Call optimus_dsm
 functions after nouveau_do_suspend()
Date: Fri, 10 Aug 2018 23:35:30 +0200
Message-ID: <CACO55tskxMiK9PhA8kE04Z=7bZb04rCv6YPGgq-9QUPBpnqW6A@mail.gmail.com>
References: <20180807203914.2192-1-lyude@redhat.com> <20180807203914.2192-7-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180807203914.2192-7-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Tue, Aug 7, 2018 at 10:39 PM, Lyude Paul <lyude@redhat.com> wrote:
> It's not necessary to call these before we call nouveau_do_suspend().
> Ideally; we shouldn't have to call this at all here, but getting that to
> work will take a bit more effort. So for the time being, just move this
> call after nouveau_do_suspend() to allow us to easily be able to abort
> the runtime suspend process in nouveau_do_suspend()
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Karol Herbst <karolherbst@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 04f704b77a3c..5ea8fe992484 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -833,8 +833,8 @@ nouveau_pmops_runtime_suspend(struct device *dev)
>                 return -EBUSY;
>         }
>
> -       nouveau_switcheroo_optimus_dsm();
>         ret = nouveau_do_suspend(drm_dev, true);
> +       nouveau_switcheroo_optimus_dsm();
>         pci_save_state(pdev);
>         pci_disable_device(pdev);
>         pci_ignore_hotplug(pdev);
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
