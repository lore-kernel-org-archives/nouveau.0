From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH v5 08/13] drm/nouveau: Don't ignore
 nouveau_do_suspend() ret value
Date: Fri, 10 Aug 2018 23:37:12 +0200
Message-ID: <CACO55tv+QLcNRj7UDK=7NnoxTxpKHWd2GqU=Eftc-suhUn4J6A@mail.gmail.com>
References: <20180807203914.2192-1-lyude@redhat.com> <20180807203914.2192-9-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180807203914.2192-9-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Tue, Aug 7, 2018 at 10:39 PM, Lyude Paul <lyude@redhat.com> wrote:
> Otherwise, how will we roll everything back?
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Karol Herbst <karolherbst@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index db56e9b6b6af..f79b435368ec 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -842,6 +842,9 @@ nouveau_pmops_runtime_suspend(struct device *dev)
>         }
>
>         ret = nouveau_do_suspend(drm_dev, true);
> +       if (ret)
> +               return ret;
> +
>         nouveau_switcheroo_optimus_dsm();
>         pci_save_state(pdev);
>         pci_disable_device(pdev);
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
