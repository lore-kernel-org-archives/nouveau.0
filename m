From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 04/12] drm: Nuke mode->vrefresh
Date: Sat, 22 Feb 2020 13:32:40 +0100
Message-ID: <20200222123240.GD28287@ravnborg.org>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20200219203544.31013-5-ville.syrjala@linux.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org, Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Thomas Hellstrom <thellstrom@vmware.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>, Jerry Han <hanxu5@huaqin.corp-partner.google.com>, Ben Skeggs <bskeggs@redhat.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, CK Hu <ck.hu@mediatek.com>, linux-amlogic@lists.infradead.org, Vinc
List-Id: nouveau.vger.kernel.org

Hi Ville.

Nice patch - and diffstat looks good:
>  63 files changed, 217 insertions(+), 392 deletions(-)

There is an item in the Documentation/gpu/todo.rst that
describes this.
Could you drop this from todo.rst in this patch too.

> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index bb6528b01cd0..6dca5344c0b3 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -538,7 +538,7 @@ static void mcde_dsi_setup_video_mode(struct mcde_dsi *d,
>  	 */
>  	/* (ps/s) / (pixels/s) = ps/pixels */
>  	pclk = DIV_ROUND_UP_ULL(1000000000000,
> -				(mode->vrefresh * mode->htotal * mode->vtotal));
> +				(drm_mode_vrefresh(mode) * mode->htotal * mode->vtotal));
>  	dev_dbg(d->dev, "picoseconds between two pixels: %llu\n",
>  		pclk);
>  

This just caught my eye while browsing the patch.
It looks like a backward way to get the clock.

But patch is fine, it was just a drive-by comment.

Whole patch is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
(with or without removal of todo item added)

	Sam
