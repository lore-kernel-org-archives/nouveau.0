From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [RFC PATCH] drm/nouveau: split off nvc0 compilation
Date: Fri, 14 Feb 2014 21:32:32 -0500
Message-ID: <CAKb7UvgUDWucYMK05DK6_-AJUmN0iSKiKdcQs_Sa2_RU1hSUOw@mail.gmail.com>
References: <1392424686-9828-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1392424686-9828-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Fri, Feb 14, 2014 at 7:38 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> So... I was wondering what the impact of splitting up the card compilation by
> e.g. generation would be. Depending on the split things would get fairly
> intertwined, so I thought I'd start small. This just splits NVC0 from
> everything else. I figure that for the people this matters the most to, NVC0
> is the least relevant card -- people with sub-1GB of RAM, older hardware.
>
> With my config options and everything compiled, the total size of nouveau.ko
> is 1343324 bytes (incl symbols), which is split up
>
>    text    data     bss     dec     hex filename
>  579171  184264     480  763915   ba80b ./drivers/gpu/drm/nouveau/nouveau.ko
>
> Turning off nvc0+ gives us 995667 bytes, split up
>
>    text    data     bss     dec     hex filename
>  472244   59528     480  532252   81f1c ./drivers/gpu/drm/nouveau/nouveau.ko
>
> So we lost 100K of text and 130K of data (probably all that pgraph fw), and
> the remaining 100K must be symbols. (I'm not stripping because nobody in their
> right mind strips these kernel modules.)

In a local patch that also lops off pre-nv50 cards (with one small
problem that involves moving a function somewhere -- seems like
nouveau_crtc_set_config is defined in dispnv04 but used outside of it
-- which I haven't done yet) the module size goes down to 721366,
split up as:

   text    data     bss     dec     hex filename
 346212   34727     480  381419   5d1eb ./drivers/gpu/drm/nouveau/nouveau.ko

So another 130K of text, 26K of data, and 130K in symbols (?). I
didn't have to do anything too dirty, with the mild exception of the
device/base.c file which had that giant if statement, which will have
to be done a bit more cleverly now to not end up as a maze. My final
exercise will be to try to lop off nv50 as well, making the driver
~useless, but still interesting as it would allow one to only compile
one of the 3 categories (or any combo).

>
> The impact to the code is pretty minor. Depending on the situation it's easier
> to either ifdef out code or to provide stubs for functions.
>
> What do people think about this? It shouldn't be too difficult for me to
> extend this to categories like <pre-nv50> <nv50-nvc0> <nvc0-nve0> <nve0+>, or
> maybe even more fine-grained, esp since nvd0 is when a lot of changes
> happened. Or maybe less-fine-grained and keep the nvc0/nve0 cards under one
> option.
>
> Feedback appreciated.
>
> Not-Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
>
> ---
>
>  drivers/gpu/drm/nouveau/Kconfig                   |  11 +-
>  drivers/gpu/drm/nouveau/Makefile                  | 136 +++++++++++-----------
>  drivers/gpu/drm/nouveau/core/engine/device/base.c |   2 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c             |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_fbcon.h           |  16 +++
>  5 files changed, 98 insertions(+), 71 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index 7cf787d..927fc38 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -26,9 +26,14 @@ config DRM_NOUVEAU
>         help
>           Choose this option for open-source nVidia support.
>
> +if DRM_NOUVEAU
> +
> +config DRM_NOUVEAU_NVC0
> +       bool "NVC0+ (Fermi / Kepler)"
> +       default y
> +
>  config NOUVEAU_DEBUG
>         int "Maximum debug level"
> -       depends on DRM_NOUVEAU
>         range 0 7
>         default 5
>         help
> @@ -48,7 +53,6 @@ config NOUVEAU_DEBUG
>
>  config NOUVEAU_DEBUG_DEFAULT
>         int "Default debug level"
> -       depends on DRM_NOUVEAU
>         range 0 7
>         default 3
>         help
> @@ -56,8 +60,9 @@ config NOUVEAU_DEBUG_DEFAULT
>
>  config DRM_NOUVEAU_BACKLIGHT
>         bool "Support for backlight control"
> -       depends on DRM_NOUVEAU
>         default y
>         help
>           Say Y here if you want to control the backlight of your display
>           (e.g. a laptop panel).
> +
> +endif
> diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
> index d310c19..a1e8513 100644
> --- a/drivers/gpu/drm/nouveau/Makefile
> +++ b/drivers/gpu/drm/nouveau/Makefile
> @@ -25,7 +25,7 @@ nouveau-y += core/core/subdev.o
>
>  nouveau-y += core/subdev/bar/base.o
>  nouveau-y += core/subdev/bar/nv50.o
> -nouveau-y += core/subdev/bar/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/bar/nvc0.o
>  nouveau-y += core/subdev/bios/base.o
>  nouveau-y += core/subdev/bios/bit.o
>  nouveau-y += core/subdev/bios/boost.o
> @@ -53,7 +53,7 @@ nouveau-y += core/subdev/bus/nv04.o
>  nouveau-y += core/subdev/bus/nv31.o
>  nouveau-y += core/subdev/bus/nv50.o
>  nouveau-y += core/subdev/bus/nv94.o
> -nouveau-y += core/subdev/bus/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/bus/nvc0.o
>  nouveau-y += core/subdev/clock/base.o
>  nouveau-y += core/subdev/clock/nv04.o
>  nouveau-y += core/subdev/clock/nv40.o
> @@ -61,8 +61,8 @@ nouveau-y += core/subdev/clock/nv50.o
>  nouveau-y += core/subdev/clock/nv84.o
>  nouveau-y += core/subdev/clock/nva3.o
>  nouveau-y += core/subdev/clock/nvaa.o
> -nouveau-y += core/subdev/clock/nvc0.o
> -nouveau-y += core/subdev/clock/nve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/clock/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/clock/nve0.o
>  nouveau-y += core/subdev/clock/pllnv04.o
>  nouveau-y += core/subdev/clock/pllnva3.o
>  nouveau-y += core/subdev/devinit/base.o
> @@ -76,7 +76,7 @@ nouveau-y += core/subdev/devinit/nv84.o
>  nouveau-y += core/subdev/devinit/nv98.o
>  nouveau-y += core/subdev/devinit/nva3.o
>  nouveau-y += core/subdev/devinit/nvaf.o
> -nouveau-y += core/subdev/devinit/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/devinit/nvc0.o
>  nouveau-y += core/subdev/fb/base.o
>  nouveau-y += core/subdev/fb/nv04.o
>  nouveau-y += core/subdev/fb/nv10.o
> @@ -98,8 +98,8 @@ nouveau-y += core/subdev/fb/nv84.o
>  nouveau-y += core/subdev/fb/nva3.o
>  nouveau-y += core/subdev/fb/nvaa.o
>  nouveau-y += core/subdev/fb/nvaf.o
> -nouveau-y += core/subdev/fb/nvc0.o
> -nouveau-y += core/subdev/fb/nve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/fb/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/fb/nve0.o
>  nouveau-y += core/subdev/fb/ramnv04.o
>  nouveau-y += core/subdev/fb/ramnv10.o
>  nouveau-y += core/subdev/fb/ramnv1a.o
> @@ -112,15 +112,15 @@ nouveau-y += core/subdev/fb/ramnv4e.o
>  nouveau-y += core/subdev/fb/ramnv50.o
>  nouveau-y += core/subdev/fb/ramnva3.o
>  nouveau-y += core/subdev/fb/ramnvaa.o
> -nouveau-y += core/subdev/fb/ramnvc0.o
> -nouveau-y += core/subdev/fb/ramnve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/fb/ramnvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/fb/ramnve0.o
>  nouveau-y += core/subdev/fb/sddr3.o
>  nouveau-y += core/subdev/fb/gddr5.o
>  nouveau-y += core/subdev/gpio/base.o
>  nouveau-y += core/subdev/gpio/nv10.o
>  nouveau-y += core/subdev/gpio/nv50.o
> -nouveau-y += core/subdev/gpio/nvd0.o
> -nouveau-y += core/subdev/gpio/nve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/gpio/nvd0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/gpio/nve0.o
>  nouveau-y += core/subdev/i2c/base.o
>  nouveau-y += core/subdev/i2c/anx9805.o
>  nouveau-y += core/subdev/i2c/aux.o
> @@ -129,14 +129,14 @@ nouveau-y += core/subdev/i2c/nv04.o
>  nouveau-y += core/subdev/i2c/nv4e.o
>  nouveau-y += core/subdev/i2c/nv50.o
>  nouveau-y += core/subdev/i2c/nv94.o
> -nouveau-y += core/subdev/i2c/nvd0.o
> -nouveau-y += core/subdev/ibus/nvc0.o
> -nouveau-y += core/subdev/ibus/nve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/i2c/nvd0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/ibus/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/ibus/nve0.o
>  nouveau-y += core/subdev/instmem/base.o
>  nouveau-y += core/subdev/instmem/nv04.o
>  nouveau-y += core/subdev/instmem/nv40.o
>  nouveau-y += core/subdev/instmem/nv50.o
> -nouveau-y += core/subdev/ltcg/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/ltcg/nvc0.o
>  nouveau-y += core/subdev/mc/base.o
>  nouveau-y += core/subdev/mc/nv04.o
>  nouveau-y += core/subdev/mc/nv40.o
> @@ -145,17 +145,17 @@ nouveau-y += core/subdev/mc/nv4c.o
>  nouveau-y += core/subdev/mc/nv50.o
>  nouveau-y += core/subdev/mc/nv94.o
>  nouveau-y += core/subdev/mc/nv98.o
> -nouveau-y += core/subdev/mc/nvc0.o
> -nouveau-y += core/subdev/mc/nvc3.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/mc/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/mc/nvc3.o
>  nouveau-y += core/subdev/mxm/base.o
>  nouveau-y += core/subdev/mxm/mxms.o
>  nouveau-y += core/subdev/mxm/nv50.o
>  nouveau-y += core/subdev/pwr/base.o
>  nouveau-y += core/subdev/pwr/memx.o
>  nouveau-y += core/subdev/pwr/nva3.o
> -nouveau-y += core/subdev/pwr/nvc0.o
> -nouveau-y += core/subdev/pwr/nvd0.o
> -nouveau-y += core/subdev/pwr/nv108.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/pwr/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/pwr/nvd0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/pwr/nv108.o
>  nouveau-y += core/subdev/therm/base.o
>  nouveau-y += core/subdev/therm/fan.o
>  nouveau-y += core/subdev/therm/fannil.o
> @@ -167,7 +167,7 @@ nouveau-y += core/subdev/therm/nv40.o
>  nouveau-y += core/subdev/therm/nv50.o
>  nouveau-y += core/subdev/therm/nv84.o
>  nouveau-y += core/subdev/therm/nva3.o
> -nouveau-y += core/subdev/therm/nvd0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/therm/nvd0.o
>  nouveau-y += core/subdev/timer/base.o
>  nouveau-y += core/subdev/timer/nv04.o
>  nouveau-y += core/subdev/vm/base.o
> @@ -175,7 +175,7 @@ nouveau-y += core/subdev/vm/nv04.o
>  nouveau-y += core/subdev/vm/nv41.o
>  nouveau-y += core/subdev/vm/nv44.o
>  nouveau-y += core/subdev/vm/nv50.o
> -nouveau-y += core/subdev/vm/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/subdev/vm/nvc0.o
>  nouveau-y += core/subdev/volt/base.o
>  nouveau-y += core/subdev/volt/gpio.o
>  nouveau-y += core/subdev/volt/nv40.o
> @@ -185,15 +185,15 @@ nouveau-y += core/engine/xtensa.o
>  nouveau-y += core/engine/dmaobj/base.o
>  nouveau-y += core/engine/dmaobj/nv04.o
>  nouveau-y += core/engine/dmaobj/nv50.o
> -nouveau-y += core/engine/dmaobj/nvc0.o
> -nouveau-y += core/engine/dmaobj/nvd0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/dmaobj/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/dmaobj/nvd0.o
>  nouveau-y += core/engine/bsp/nv84.o
>  nouveau-y += core/engine/bsp/nv98.o
> -nouveau-y += core/engine/bsp/nvc0.o
> -nouveau-y += core/engine/bsp/nve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/bsp/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/bsp/nve0.o
>  nouveau-y += core/engine/copy/nva3.o
> -nouveau-y += core/engine/copy/nvc0.o
> -nouveau-y += core/engine/copy/nve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/copy/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/copy/nve0.o
>  nouveau-y += core/engine/crypt/nv84.o
>  nouveau-y += core/engine/crypt/nv98.o
>  nouveau-y += core/engine/device/base.o
> @@ -204,8 +204,8 @@ nouveau-y += core/engine/device/nv20.o
>  nouveau-y += core/engine/device/nv30.o
>  nouveau-y += core/engine/device/nv40.o
>  nouveau-y += core/engine/device/nv50.o
> -nouveau-y += core/engine/device/nvc0.o
> -nouveau-y += core/engine/device/nve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/device/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/device/nve0.o
>  nouveau-y += core/engine/disp/base.o
>  nouveau-y += core/engine/disp/nv04.o
>  nouveau-y += core/engine/disp/nv50.o
> @@ -213,20 +213,20 @@ nouveau-y += core/engine/disp/nv84.o
>  nouveau-y += core/engine/disp/nv94.o
>  nouveau-y += core/engine/disp/nva0.o
>  nouveau-y += core/engine/disp/nva3.o
> -nouveau-y += core/engine/disp/nvd0.o
> -nouveau-y += core/engine/disp/nve0.o
> -nouveau-y += core/engine/disp/nvf0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/nvd0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/nve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/nvf0.o
>  nouveau-y += core/engine/disp/dacnv50.o
>  nouveau-y += core/engine/disp/dport.o
>  nouveau-y += core/engine/disp/hdanva3.o
> -nouveau-y += core/engine/disp/hdanvd0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/hdanvd0.o
>  nouveau-y += core/engine/disp/hdminv84.o
>  nouveau-y += core/engine/disp/hdminva3.o
> -nouveau-y += core/engine/disp/hdminvd0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/hdminvd0.o
>  nouveau-y += core/engine/disp/piornv50.o
>  nouveau-y += core/engine/disp/sornv50.o
>  nouveau-y += core/engine/disp/sornv94.o
> -nouveau-y += core/engine/disp/sornvd0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/disp/sornvd0.o
>  nouveau-y += core/engine/disp/vga.o
>  nouveau-y += core/engine/fifo/base.o
>  nouveau-y += core/engine/fifo/nv04.o
> @@ -235,20 +235,20 @@ nouveau-y += core/engine/fifo/nv17.o
>  nouveau-y += core/engine/fifo/nv40.o
>  nouveau-y += core/engine/fifo/nv50.o
>  nouveau-y += core/engine/fifo/nv84.o
> -nouveau-y += core/engine/fifo/nvc0.o
> -nouveau-y += core/engine/fifo/nve0.o
> -nouveau-y += core/engine/fifo/nv108.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/fifo/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/fifo/nve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/fifo/nv108.o
>  nouveau-y += core/engine/graph/ctxnv40.o
>  nouveau-y += core/engine/graph/ctxnv50.o
> -nouveau-y += core/engine/graph/ctxnvc0.o
> -nouveau-y += core/engine/graph/ctxnvc1.o
> -nouveau-y += core/engine/graph/ctxnvc3.o
> -nouveau-y += core/engine/graph/ctxnvc8.o
> -nouveau-y += core/engine/graph/ctxnvd7.o
> -nouveau-y += core/engine/graph/ctxnvd9.o
> -nouveau-y += core/engine/graph/ctxnve4.o
> -nouveau-y += core/engine/graph/ctxnvf0.o
> -nouveau-y += core/engine/graph/ctxnv108.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvc1.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvc3.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvc8.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvd7.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvd9.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnve4.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnvf0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/ctxnv108.o
>  nouveau-y += core/engine/graph/nv04.o
>  nouveau-y += core/engine/graph/nv10.o
>  nouveau-y += core/engine/graph/nv20.o
> @@ -259,15 +259,15 @@ nouveau-y += core/engine/graph/nv34.o
>  nouveau-y += core/engine/graph/nv35.o
>  nouveau-y += core/engine/graph/nv40.o
>  nouveau-y += core/engine/graph/nv50.o
> -nouveau-y += core/engine/graph/nvc0.o
> -nouveau-y += core/engine/graph/nvc1.o
> -nouveau-y += core/engine/graph/nvc3.o
> -nouveau-y += core/engine/graph/nvc8.o
> -nouveau-y += core/engine/graph/nvd7.o
> -nouveau-y += core/engine/graph/nvd9.o
> -nouveau-y += core/engine/graph/nve4.o
> -nouveau-y += core/engine/graph/nvf0.o
> -nouveau-y += core/engine/graph/nv108.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvc1.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvc3.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvc8.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvd7.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvd9.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nve4.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nvf0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/graph/nv108.o
>  nouveau-y += core/engine/mpeg/nv31.o
>  nouveau-y += core/engine/mpeg/nv40.o
>  nouveau-y += core/engine/mpeg/nv44.o
> @@ -279,19 +279,19 @@ nouveau-y += core/engine/perfmon/nv40.o
>  nouveau-y += core/engine/perfmon/nv50.o
>  nouveau-y += core/engine/perfmon/nv84.o
>  nouveau-y += core/engine/perfmon/nva3.o
> -nouveau-y += core/engine/perfmon/nvc0.o
> -nouveau-y += core/engine/perfmon/nve0.o
> -nouveau-y += core/engine/perfmon/nvf0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/perfmon/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/perfmon/nve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/perfmon/nvf0.o
>  nouveau-y += core/engine/ppp/nv98.o
> -nouveau-y += core/engine/ppp/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/ppp/nvc0.o
>  nouveau-y += core/engine/software/nv04.o
>  nouveau-y += core/engine/software/nv10.o
>  nouveau-y += core/engine/software/nv50.o
> -nouveau-y += core/engine/software/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/software/nvc0.o
>  nouveau-y += core/engine/vp/nv84.o
>  nouveau-y += core/engine/vp/nv98.o
> -nouveau-y += core/engine/vp/nvc0.o
> -nouveau-y += core/engine/vp/nve0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/vp/nvc0.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += core/engine/vp/nve0.o
>
>  # drm/core
>  nouveau-y += nouveau_drm.o nouveau_chan.o nouveau_dma.o nouveau_fence.o
> @@ -299,12 +299,14 @@ nouveau-y += nouveau_vga.o nouveau_agp.o
>  nouveau-y += nouveau_ttm.o nouveau_sgdma.o nouveau_bo.o nouveau_gem.o
>  nouveau-y += nouveau_prime.o nouveau_abi16.o
>  nouveau-y += nv04_fence.o nv10_fence.o nv17_fence.o
> -nouveau-y += nv50_fence.o nv84_fence.o nvc0_fence.o
> +nouveau-y += nv50_fence.o nv84_fence.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += nvc0_fence.o
>
>  # drm/kms
>  nouveau-y += nouveau_bios.o nouveau_fbcon.o nouveau_display.o
>  nouveau-y += nouveau_connector.o nouveau_dp.o
> -nouveau-y += nv04_fbcon.o nv50_fbcon.o nvc0_fbcon.o
> +nouveau-y += nv04_fbcon.o nv50_fbcon.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_NVC0) += nvc0_fbcon.o
>
>  # drm/kms/nv04:nv50
>  include $(src)/dispnv04/Makefile
> @@ -323,4 +325,4 @@ endif
>  nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
>  nouveau-$(CONFIG_DEBUG_FS) += nouveau_debugfs.o
>
> -obj-$(CONFIG_DRM_NOUVEAU)+= nouveau.o
> +obj-$(CONFIG_DRM_NOUVEAU) += nouveau.o
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/base.c b/drivers/gpu/drm/nouveau/core/engine/device/base.c
> index dd01c6c..c66953b 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/device/base.c
> @@ -205,9 +205,11 @@ nouveau_devobj_ctor(struct nouveau_object *parent,
>                 case NV_30: ret = nv30_identify(device); break;
>                 case NV_40: ret = nv40_identify(device); break;
>                 case NV_50: ret = nv50_identify(device); break;
> +#ifdef CONFIG_DRM_NOUVEAU_NVC0
>                 case NV_C0:
>                 case NV_D0: ret = nvc0_identify(device); break;
>                 case NV_E0: ret = nve0_identify(device); break;
> +#endif
>                 default:
>                         ret = -EINVAL;
>                         break;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 9c9ce4d..875c6a0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -138,7 +138,7 @@ nouveau_accel_init(struct nouveau_drm *drm)
>         struct nouveau_device *device = nv_device(drm->device);
>         struct nouveau_object *object;
>         u32 arg0, arg1;
> -       int ret;
> +       int ret = -ENODEV;
>
>         if (nouveau_noaccel || !nouveau_fifo(device) /*XXX*/)
>                 return;
> @@ -150,7 +150,9 @@ nouveau_accel_init(struct nouveau_drm *drm)
>         else if (device->card_type < NV_50) ret = nv17_fence_create(drm);
>         else if (device->chipset   <  0x84) ret = nv50_fence_create(drm);
>         else if (device->card_type < NV_C0) ret = nv84_fence_create(drm);
> +#ifdef CONFIG_DRM_NOUVEAU_NVC0
>         else                                ret = nvc0_fence_create(drm);
> +#endif
>         if (ret) {
>                 NV_ERROR(drm, "failed to initialise sync subsystem, %d\n", ret);
>                 nouveau_accel_fini(drm);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.h b/drivers/gpu/drm/nouveau/nouveau_fbcon.h
> index fdfc0c9..b4ff8d5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.h
> @@ -51,10 +51,26 @@ int nv50_fbcon_copyarea(struct fb_info *info, const struct fb_copyarea *region);
>  int nv50_fbcon_imageblit(struct fb_info *info, const struct fb_image *image);
>  int nv50_fbcon_accel_init(struct fb_info *info);
>
> +#ifdef CONFIG_DRM_NOUVEAU_NVC0
>  int nvc0_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
>  int nvc0_fbcon_copyarea(struct fb_info *info, const struct fb_copyarea *region);
>  int nvc0_fbcon_imageblit(struct fb_info *info, const struct fb_image *image);
>  int nvc0_fbcon_accel_init(struct fb_info *info);
> +#else
> +#define _STUB(name, type) \
> +static inline int name(struct fb_info *info, const struct type *t) \
> +{ \
> +       return -ENODEV; \
> +}
> +_STUB(nvc0_fbcon_fillrect, fb_fillrect)
> +_STUB(nvc0_fbcon_copyarea, fb_copyarea)
> +_STUB(nvc0_fbcon_imageblit, fb_image)
> +#undef _STUB
> +static inline int nvc0_fbcon_accel_init(struct fb_info *info)
> +{
> +       return -ENODEV;
> +}
> +#endif
>
>  void nouveau_fbcon_gpu_lockup(struct fb_info *info);
>
> --
> 1.8.3.2
>
