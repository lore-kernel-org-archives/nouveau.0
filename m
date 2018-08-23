From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH 1/5] drm/nouveau: Check backlight IDs are >= 0, not > 0
Date: Thu, 23 Aug 2018 14:00:25 +0200
Message-ID: <CACO55tsuJUyQULA3oGm9VxH7ufObvW1bNH_1g7WCwcpJPrVugw@mail.gmail.com>
References: <20180823012151.20099-1-lyude@redhat.com> <20180823012151.20099-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823012151.20099-2-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, stable@vger.kernel.org, Jeffery Miller <jmiller@neverware.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Patches 1-5 are Reviewed-by: Karol Herbst <kherbst@redhat.com>

I think it might be worth to test those patches on a system without
any backlight devices just to verify we don't break things, but the
code looked good already, so maybe we don't really need to test.

On Thu, Aug 23, 2018 at 3:21 AM, Lyude Paul <lyude@redhat.com> wrote:
> Remember, ida IDs start at 0, not 1!
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org
> Cc: Jeffery Miller <jmiller@neverware.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index 408b955e5c39..6dd72bc32897 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -116,7 +116,7 @@ nv40_backlight_init(struct drm_connector *connector)
>                                        &nv40_bl_ops, &props);
>
>         if (IS_ERR(bd)) {
> -               if (bl_connector.id > 0)
> +               if (bl_connector.id >= 0)
>                         ida_simple_remove(&bl_ida, bl_connector.id);
>                 return PTR_ERR(bd);
>         }
> @@ -249,7 +249,7 @@ nv50_backlight_init(struct drm_connector *connector)
>                                        nv_encoder, ops, &props);
>
>         if (IS_ERR(bd)) {
> -               if (bl_connector.id > 0)
> +               if (bl_connector.id >= 0)
>                         ida_simple_remove(&bl_ida, bl_connector.id);
>                 return PTR_ERR(bd);
>         }
> --
> 2.17.1
>
