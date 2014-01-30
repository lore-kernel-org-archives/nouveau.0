From: Jan <janjanjanx@gmail.com>
Subject: Re: [PATCH] drm/nouveau: set irq_enabled manually
Date: Thu, 30 Jan 2014 02:50:15 +0100
Message-ID: <CAM1qvvhZhCAx5dPVppmgTJ4a0cjkgPZpc1+v25gebht5-zkyLw@mail.gmail.com>
References: <1391043180-27875-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1391043180-27875-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

I can confirm that this patch fixes the problem. (had to change spaces
to tabs, but that was probably just screwed up by mail)

2014-01-30, Ilia Mirkin <imirkin@alum.mit.edu>:
> Since commit 0fa9061ae8c ("drm/nouveau/mc: handle irq-related setup
> ourselves"), drm_device->irq_enabled remained unset. This is needed in
> order to properly wait for a vblank event in the generic drm code.
>
> See https://bugs.freedesktop.org/show_bug.cgi?id=74195
>
> Reported-by: Jan Janecek <janjanjanx@gmail.com>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: stable@vger.kernel.org # 3.10+
> ---
>
> TBH, not sure why this fixes things, as irq_enabled == false should have
> caused the vblank wait to not wait, since the condition would be
> immediately true.
>
> Jan, mind double-checking that this version of the patch fixes things
> for you? Not 100% sure where you stuck the irq_enabled=true line when you
> tried it out.
>
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index bfd02410..3ba7b62 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -376,6 +376,8 @@ nouveau_drm_load(struct drm_device *dev, unsigned long
> flags)
>  	if (ret)
>  		goto fail_device;
>
> +	dev->irq_enabled = true;
> +
>  	/* workaround an odd issue on nvc1 by disabling the device's
>  	 * nosnoop capability.  hopefully won't cause issues until a
>  	 * better fix is found - assuming there is one...
> @@ -475,6 +477,7 @@ nouveau_drm_remove(struct pci_dev *pdev)
>  	struct nouveau_drm *drm = nouveau_drm(dev);
>  	struct nouveau_object *device;
>
> +	dev->irq_enabled = false;
>  	device = drm->client.base.device;
>  	drm_put_dev(dev);
>
> --
> 1.8.3.2
>
>
