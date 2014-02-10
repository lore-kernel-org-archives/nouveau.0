From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] nouveau/drm/fifo: fix ENG_RUNLIST register address
Date: Mon, 10 Feb 2014 14:25:19 +1000
Message-ID: <CACAvsv5MQPOE+uBTXyMzjiQ514++LGKgOS7oObdRTT=VQLVRRw@mail.gmail.com>
References: <1391779377-10176-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1391779377-10176-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: nouveau.vger.kernel.org

On Fri, Feb 7, 2014 at 11:22 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:
> Address of the ENG_RUNLIST register should be 0x002284 + (engine * 8),
> not 0x002284 + (engine * 4).
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Stumbled upon this one and I'm quite certain the offset was not correct.
> This is inconsequential for GK20A which only features one runlist, but
> other GPUs might run into troubles because of this. Not tested, just
> reported for your consideration.
I noticed this also while doing some other work I haven't committed
yet.  I'll push this patch ahead of that other work though.

Thanks,
Ben.

>
> FWIW, the Android GK20A driver uses the same offset calculation.
>
>  drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
> index 99c9dee..dbc3ff6 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
> @@ -112,7 +112,7 @@ nve0_fifo_runlist_update(struct nve0_fifo_priv *priv, u32 engine)
>
>         nv_wr32(priv, 0x002270, cur->addr >> 12);
>         nv_wr32(priv, 0x002274, (engine << 20) | (p >> 3));
> -       if (!nv_wait(priv, 0x002284 + (engine * 4), 0x00100000, 0x00000000))
> +       if (!nv_wait(priv, 0x002284 + (engine * 8), 0x00100000, 0x00000000))
>                 nv_error(priv, "runlist %d update timeout\n", engine);
>         mutex_unlock(&nv_subdev(priv)->mutex);
>  }
> --
> 1.8.5.3
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
