From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix vbios load and check
 functions on PowerPC
Date: Wed, 14 Apr 2010 14:44:50 +0200
Message-ID: <20100414124450.GA3624@joi.lan>
References: <1269364147-4092-1-git-send-email-tacconet@libero.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1269364147-4092-1-git-send-email-tacconet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: tacconet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 23, 2010 at 06:09:07PM +0100, tacconet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org wrote:
> From: Andrea Tacconi <tacconet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org>
> 
> Subject: [PATCH] drm/nouveau: fix vbios load and check functions on PowerPC
> 
> On PowerPC the Bios signature reports a wrong lenght of video rom.
> Fix this by reading the correct size from Open Firmware.
> 
> Set Pramin as primary vbios searching method, because it's the only working method on PowerPC.
> 
> The nv_cksum function always fails.
> Fix this by Calculating and adding checksum byte at the end of vbios.
> 
> Signed-off-by: Andrea Tacconi <tacconet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org>
> ---
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index 6b6c303..c234b45 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -69,12 +69,29 @@ static bool nv_cksum(const uint8_t *data, unsigned int length)
>  static int
>  score_vbios(struct drm_device *dev, const uint8_t *data, const bool writeable)
>  {
> +	int bios_size = 0;
> +#if defined(__powerpc__)
> +	struct device_node *dn = NULL;
> +#endif
> +
>  	if (!(data[0] == 0x55 && data[1] == 0xAA)) {
>  		NV_TRACEWARN(dev, "... BIOS signature not found\n");
>  		return 0;
>  	}
> +#if defined(__powerpc__)
> +	/*
> +	 * The Bios signature reports a wrong lenght of rom.
> +	 * The correct size is read from Open Firmware.
> +	 */
> +	dn = pci_device_to_OF_node(dev->pdev);
> +	of_find_property(dn, "NVDA,BMP", &bios_size);
> +	/* added checksum byte */
> +	bios_size++;
> +#else
> +	bios_size = (data[2] * 512);
> +#endif
>  
> -	if (nv_cksum(data, data[2] * 512)) {
> +	if (nv_cksum(data, bios_size)) {

how about factoring bios_size calculation to another function?

#if defined(__powerpc__)
int fun()
{
}
#else
int fun()
{
}
#endif

>  		NV_TRACEWARN(dev, "... BIOS checksum invalid\n");
>  		/* if a ro image is somewhat bad, it's probably all rubbish */
>  		return writeable ? 2 : 1;
> @@ -183,11 +200,22 @@ struct methods {
>  	const bool rw;
>  };
>  
> +#if defined(__powerpc__)
> +	/*
> +	 * For now PRAMIN is the only working method on PowerPC
> +	 */
> +static struct methods nv04_methods[] = {
> +	{ "PRAMIN", load_vbios_pramin, true },
> +	{ "PROM", load_vbios_prom, false },
> +	{ "PCIROM", load_vbios_pci, true },
> +};
> +#else
>  static struct methods nv04_methods[] = {
>  	{ "PROM", load_vbios_prom, false },
>  	{ "PRAMIN", load_vbios_pramin, true },
>  	{ "PCIROM", load_vbios_pci, true },
>  };
> +#endif

it pramin is the only method why do you need to redefine this array with different order?
doesn't it fallback to next method when earlier fails?

>  
>  static struct methods nv50_methods[] = {
>  	{ "PRAMIN", load_vbios_pramin, true },
> diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
> index 58b4680..35d35cc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_state.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
> @@ -607,19 +607,49 @@ int nouveau_firstopen(struct drm_device *dev)
>  static void nouveau_OF_copy_vbios_to_ramin(struct drm_device *dev)
>  {
>  #if defined(__powerpc__)
> -	int size, i;
> -	const uint32_t *bios;
> +	/*
> +	 * Copy BMP Bios to RAMIN, calculate its checksum and append it to Bios.
> +	 */
> +	int size, i, j, unread_bytes, size_int;
> +	uint8_t sum = 0;
> +	uint8_t checksum = 0;
> +	uint32_t last_bytes = 0;
> +	const uint32_t *bios = NULL;
>  	struct device_node *dn = pci_device_to_OF_node(dev->pdev);
> -	if (!dn) {
> -		NV_INFO(dev, "Unable to get the OF node\n");
> -		return;
> -	}
>  
> +	size_int = sizeof(uint32_t);
>  	bios = of_get_property(dn, "NVDA,BMP", &size);
> +	/* write bios data and sum all bytes */
>  	if (bios) {
> -		for (i = 0; i < size; i += 4)
> -			nv_wi32(dev, i, bios[i/4]);
> -		NV_INFO(dev, "OF bios successfully copied (%d bytes)\n", size);
> +		for (j = 0, i = 0; j < (size / size_int); j++, i += 4) {

you are using uint32_t, nv_wi32, incrementing by 4, so why do you need size_int?

> +			nv_wi32(dev, i, bios[j]);
> +			sum += (bios[j] & 0xFF000000) >> 24;
> +			sum += (bios[j] & 0xFF0000) >> 16;
> +			sum += (bios[j] & 0xFF00) >> 8;
> +			sum += (bios[j] & 0xFF);
> +		}
> +		unread_bytes = size % size_int;

unwritten_bytes?

> +		switch (unread_bytes) {
> +		case 0:
> +			/* all bytes were read, nothing to do */
> +			break;
> +		case 3:
> +			sum += (bios[j] & 0xFF00) >> 8;
> +			last_bytes |= (bios[j] & 0xFF00);
> +		case 2:
> +			sum += (bios[j] & 0xFF0000) >> 16;
> +			last_bytes |= (bios[j] & 0xFF0000);
> +		case 1:
> +			sum += (bios[j] & 0xFF000000) >> 24;
> +			last_bytes |= (bios[j] & 0xFF000000);
> +			break;
> +		}

comment about "fall through" to the next case would make this code easier to read.
you could move case 0 as the last one

> +		/* the checksum is the two's complement of the sum */
> +		checksum = ~sum + 1;
> +		/* add checksum (1 byte) in the correct position */
> +		last_bytes |= (checksum << (24 - unread_bytes * 8));
> +		nv_wi32(dev, i, last_bytes);
> +		NV_INFO(dev, "OF bios successfully copied (%d bytes) checksum 0x%x\n", size, checksum);
>  	} else {
>  		NV_INFO(dev, "Unable to get the OF bios\n");
>  	}
