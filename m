From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Delays in DRM nouveau_bios.c
Date: Thu, 20 Aug 2009 14:57:55 +0300
Message-ID: <20090820145755.4cc63063@daedalus.pq.iki.fi>
References: <20090820144024.08c5facc@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090820144024.08c5facc-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stuart Bennett <stuart-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, 20 Aug 2009 14:40:24 +0300
Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:

> Hi,
> 
> questions will follow.

This patch builds, but I have not tried to run it.
I'm hoping Stuart or someone could comment on it.

> ---
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index 99f7bd4..13b3fb1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -40,8 +40,6 @@
>  #define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip->dev, fmt, ##arg)
>  #define LOG_OLD_VALUE(x) //x
>  
> -#define BIOS_USLEEP(n) mdelay((n)/1000)
> -
>  #define ROM16(x) le16_to_cpu(*(uint16_t *)&(x))
>  #define ROM32(x) le32_to_cpu(*(uint32_t *)&(x))
>  
> @@ -50,6 +48,15 @@ struct init_exec {
>  	bool repeat;
>  };
>  
> +static inline void bios_usleep(unsigned usecs)
> +{
> +	might_sleep();
> +	if (usecs < 1000 * MAX_UDELAY_MS)
> +		udelay(usecs);
> +	else
> +		msleep(usecs / 1000 + 1);
> +}

This function is to replace the BIOS_USLEEP() macro with something,
that works both for short and long delays. BIOS_USLEEP would truncate
all sleeps to milliseconds, meaning delays less than 1000 us would
be zero. Also, mdelay() is a busyloop delay burning CPU cycles for
nothing. msleep() is not, it will reschedule until the delay has
passed. The change raises two questions:

- Is the bios code ever called in a situation, where scheduling
is not allowed (interrupt context, pre-emption disabled, inside
spinlocks, etc.)?

- Is the delay accuracy on the msleep path critical?

>  static bool nv_cksum(const uint8_t *data, unsigned int length)
>  {
>  	/* there's a few checksums in the BIOS, so here's a generic checking function */
> @@ -262,7 +269,7 @@ static int parse_init_table(struct nvbios *, unsigned int, struct init_exec *);
>  static void still_alive(void)
>  {
>  //	sync();
> -//	BIOS_USLEEP(2000);
> +//	bios_usleep(2000);
>  }
>  
>  static uint32_t
> @@ -1608,17 +1615,18 @@ init_condition_time(struct nvbios *bios, uint16_t offset,
>  
>  	for (; retries > 0; retries--)
>  		if (bios_condition_met(bios, offset, cond)) {
> -			BIOSLOG(bios, "0x%04X: Condition met, continuing\n", offset);
> +			BIOSLOG(bios, "0x%04X: Condition met, continuing\n",
> +								offset);
>  			break;
>  		} else {
>  			BIOSLOG(bios, "0x%04X: Condition not met, sleeping for 20ms\n", offset);
> -			BIOS_USLEEP(20000);
> +			bios_usleep(20000);

It so happens, that 20000 was the maximum allowed udelay() constant time
for x86. Did the number come from that?

>  		}
>  
>  	if (!bios_condition_met(bios, offset, cond)) {
>  		NV_WARN(bios->dev,
>  			"0x%04X: Condition still not met after %dms, "
> -			"skiping following opcodes\n", offset, 20 * retries);
> +			"skipping following opcodes\n", offset, 20 * retries);
>  		iexec->execute = false;
>  	}
>  
> @@ -1851,7 +1859,7 @@ init_reset(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
>  	bios_wr32(bios, NV_PBUS_PCI_NV_19, 0);
>  	bios_wr32(bios, reg, value1);
>  
> -	BIOS_USLEEP(10);
> +	bios_usleep(10);

With the old BIOS_USLEEP, this delay would vanish.

>  
>  	bios_wr32(bios, reg, value2);
>  	bios_wr32(bios, NV_PBUS_PCI_NV_19, pci_nv_19);
> @@ -2233,8 +2241,7 @@ init_time(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
>  	BIOSLOG(bios, "0x%04X: Sleeping for 0x%04X microseconds\n",
>  		offset, time);
>  
> -	BIOS_USLEEP(time);
> -
> +	bios_usleep(time);

Can here be delay accuracy issues? How much are we allowed to exceed the
specified delay?

>  	return true;
>  }
>  
> @@ -2872,9 +2879,11 @@ static int call_lvds_manufacturer_script(struct drm_device *dev, struct dcb_entr
>  
>  	run_digital_op_script(dev, scriptofs, dcbent, head, bios->fp.dual_link);
>  
> -	if (script == LVDS_PANEL_OFF)
> +	if (script == LVDS_PANEL_OFF) {
>  		/* off-on delay in ms */
> -		BIOS_USLEEP(ROM16(bios->data[bios->fp.xlated_entry + 7]));
> +		bios_usleep(ROM16(bios->data[bios->fp.xlated_entry + 7]));
> +	}

The comment and code disagree here. Is it microseconds or milliseconds?

-- 
Pekka Paalanen
http://www.iki.fi/pq/
