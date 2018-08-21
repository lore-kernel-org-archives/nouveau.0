From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Fix GM107 disp dmac chan init on
 ThinkPad P50
Date: Tue, 21 Aug 2018 12:53:33 -0400
Message-ID: <7ca062538b41a4190eb6ef78c3f729ab784cfd40.camel@redhat.com>
References: <20180820172030.10963-1-lyude@redhat.com>
         <20180820172030.10963-3-lyude@redhat.com>
Reply-To: lyude@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180820172030.10963-3-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Karol Herbst <karolherbst@gmail.com>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

As a note: I don't think this patch is ready /just/ yet now as I just hit this
problem again this morning (and it looks like I'm checking the wrong mask for
dmac, it appears to be slightly different from the core), looking into this now

On Mon, 2018-08-20 at 13:20 -0400, Lyude Paul wrote:
> Just like how the P50 will occasionally leave the disp's core channel on
> before nouveau starts initializing, it will occasionally do the same
> thing with the rest of the dmac channel in addition to the core channel.
> Example:
> 
> [    1.604375] nouveau 0000:01:00.0: disp: outp 04:0006:0f81: no heads (0 3 4)
> [    1.604858] nouveau 0000:01:00.0: disp: outp 04:0006:0f81: aux power ->
> always
> [    1.605354] nouveau 0000:01:00.0: disp: outp 04:0006:0f81: aux power ->
> demand
> [    1.605815] nouveau 0000:01:00.0: disp: outp 05:0002:0f81: no heads (0 3 2)
> [    1.607289] nouveau 0000:01:00.0: disp: chid 0 mthd 0000 data 00000400
> 00001000 00000002
> [    1.608818] nouveau 0000:01:00.0: disp: chid 1 mthd 0000 data 00000400
> 00001000 00000002
> [    1.609500] nouveau 0000:01:00.0: disp: chid 2 mthd 0000 data 00000400
> 00001000 00000002
> 
> Which of course, later causes other parts of the card to start timing
> out and failing. Closer inspection shows the same thing happening as
> with our core channel; 0x610490 + (ctrl * 0x10) always has the same
> unknown 0x000a0000 mask set when the phantom mthd failures start
> appearing.
> 
> So, implement the same workaround we use for the core disp channel to
> the rest of the disp channels.
> 
> This along with the previous patch fix random initialization failures
> observed with the Thinkpad P50.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Karol Herbst <karolherbst@gmail.com>
> Cc: stable@vger.kernel.org
> ---
>  .../drm/nouveau/nvkm/engine/disp/dmacgf119.c  | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgf119.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgf119.c
> index edf7dd0d931d..7bc91f260e27 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgf119.c
> @@ -35,8 +35,8 @@ gf119_disp_dmac_bind(struct nv50_disp_chan *chan,
>  				 chan->chid.user << 27 | 0x00000001);
>  }
>  
> -void
> -gf119_disp_dmac_fini(struct nv50_disp_chan *chan)
> +static bool
> +gf119_disp_dmac_deactivate(struct nv50_disp_chan *chan)
>  {
>  	struct nvkm_subdev *subdev = &chan->disp->base.engine.subdev;
>  	struct nvkm_device *device = subdev->device;
> @@ -52,7 +52,16 @@ gf119_disp_dmac_fini(struct nv50_disp_chan *chan)
>  	) < 0) {
>  		nvkm_error(subdev, "ch %d fini: %08x\n", user,
>  			   nvkm_rd32(device, 0x610490 + (ctrl * 0x10)));
> +		return false;
>  	}
> +
> +	return true;
> +}
> +
> +void
> +gf119_disp_dmac_fini(struct nv50_disp_chan *chan)
> +{
> +	gf119_disp_dmac_deactivate(chan);
>  }
>  
>  static int
> @@ -63,6 +72,12 @@ gf119_disp_dmac_init(struct nv50_disp_chan *chan)
>  	int ctrl = chan->chid.ctrl;
>  	int user = chan->chid.user;
>  
> +	/* shut down the channel if it was left on, probably by the VBIOS */
> +	if ((nvkm_rd32(device, 0x610490 + (ctrl * 0x10)) & 0x000a0000) ==
> 0x000a0000 &&
> +	    WARN_ON(!gf119_disp_dmac_deactivate(chan))) {
> +		return -EBUSY;
> +	}
> +
>  	/* initialise channel for dma command submission */
>  	nvkm_wr32(device, 0x610494 + (ctrl * 0x0010), chan->push);
>  	nvkm_wr32(device, 0x610498 + (ctrl * 0x0010), 0x00010000);
