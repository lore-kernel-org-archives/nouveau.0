From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH v5 10/13] drm/nouveau: Use pm_runtime_get_noresume()
 in connector_detect()
Date: Fri, 10 Aug 2018 23:39:15 +0200
Message-ID: <CACO55tubLooNbmNvRUcN3VrUf466gfj9W_=9dy=EABE-vL+6VQ@mail.gmail.com>
References: <20180807203914.2192-1-lyude@redhat.com> <20180807203914.2192-11-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180807203914.2192-11-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Tue, Aug 7, 2018 at 10:39 PM, Lyude Paul <lyude@redhat.com> wrote:
> It's true we can't resume the device from poll workers in
> nouveau_connector_detect(). We can however, prevent the autosuspend
> timer from elapsing immediately if it hasn't already without risking any
> sort of deadlock with the runtime suspend/resume operations. So do that
> instead of entirely avoiding grabbing a power reference.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Karol Herbst <karolherbst@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 2a45b4c2ceb0..010d6db14cba 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -572,12 +572,16 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
>                 nv_connector->edid = NULL;
>         }
>
> -       /* Outputs are only polled while runtime active, so acquiring a
> -        * runtime PM ref here is unnecessary (and would deadlock upon
> -        * runtime suspend because it waits for polling to finish).
> +       /* Outputs are only polled while runtime active, so resuming the
> +        * device here is unnecessary (and would deadlock upon runtime suspend
> +        * because it waits for polling to finish). We do however, want to
> +        * prevent the autosuspend timer from elapsing during this operation
> +        * if possible.
>          */
> -       if (!drm_kms_helper_is_poll_worker()) {
> -               ret = pm_runtime_get_sync(connector->dev->dev);
> +       if (drm_kms_helper_is_poll_worker()) {
> +               pm_runtime_get_noresume(dev->dev);
> +       } else {
> +               ret = pm_runtime_get_sync(dev->dev);
>                 if (ret < 0 && ret != -EACCES)
>                         return conn_status;
>         }
> @@ -655,10 +659,8 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
>
>   out:
>
> -       if (!drm_kms_helper_is_poll_worker()) {
> -               pm_runtime_mark_last_busy(connector->dev->dev);
> -               pm_runtime_put_autosuspend(connector->dev->dev);
> -       }
> +       pm_runtime_mark_last_busy(dev->dev);
> +       pm_runtime_put_autosuspend(dev->dev);
>
>         return conn_status;
>  }
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
