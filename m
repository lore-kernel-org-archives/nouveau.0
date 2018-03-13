From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH] drm/nouveau/secboot: remove VLA usage
Date: Tue, 13 Mar 2018 16:10:03 +0000
Message-ID: <6977788dfbac4b70b54fd56310cc27fe@AcuMS.aculab.com>
References: <20180313144812.GA30043@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313144812.GA30043@embeddedgus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "'Gustavo A. R. Silva'" <gustavo@embeddedor.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

From: Gustavo A. R. Silva
> Sent: 13 March 2018 14:48
> In preparation to enabling -Wvla, remove VLA. In this particular
> case directly use macro NVKM_MSGQUEUE_CMDLINE_SIZE instead of local
> variable cmdline_size. Also, remove cmdline_size as it is not
> actually useful anymore.
...
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
> index 6f10b09..2da147b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/ls_ucode_msgqueue.c
> @@ -80,12 +80,12 @@ acr_ls_msgqueue_post_run(struct nvkm_msgqueue *queue,
>  			 struct nvkm_falcon *falcon, u32 addr_args)
>  {
>  	struct nvkm_device *device = falcon->owner->device;
> -	u32 cmdline_size = NVKM_MSGQUEUE_CMDLINE_SIZE;
> -	u8 buf[cmdline_size];
> +	u8 buf[NVKM_MSGQUEUE_CMDLINE_SIZE];
> 
> -	memset(buf, 0, cmdline_size);
> +	memset(buf, 0, NVKM_MSGQUEUE_CMDLINE_SIZE);
>  	nvkm_msgqueue_write_cmdline(queue, buf);
> -	nvkm_falcon_load_dmem(falcon, buf, addr_args, cmdline_size, 0);
> +	nvkm_falcon_load_dmem(falcon, buf, addr_args,
> +			      NVKM_MSGQUEUE_CMDLINE_SIZE, 0);

I think I'd use 'sizeof (buf)' in both those lines.

	David
