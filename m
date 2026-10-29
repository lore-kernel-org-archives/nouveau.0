Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47A7606A31A
	for <nouveau@archiver.kernel.org>; Sat, 31 Oct 2026 02:08:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AF258112A2B;
	Sat, 31 Oct 2026 02:08:22 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3D1C248C17;
	Sat, 31 Oct 2026 01:49:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793411349;
 b=mVvYmg7aGgwY4ayZv59KCeBOf9yDpM8aDalmUtQNaJk2uhUuTQ7OYVrOil1mneQRX9xQX
 nNZdAbe/oipJX/uwDUbib9ApA8n4nObh18Bg61/IfS/v0nHFZjS3xxkHxxtpKuAn3UDVx9O
 8Z03GmiwyAsicWW67f34ruYOBKdxgRuJZBttNq2qF7nk7nSZKJTcRtaTSkKAKvkzho4/g5N
 LUuxzYwr6LtjazzbfmbvQe5x4rtBdHkyuyPPu8TTdVBeua0M/u6EQp0R92CTDl2AF4fGJgk
 rNoRPDyt8LcN9XukZz9R3prvISB6/IeS8ok/g0jVSbLVmCC+1hsJcQdNe63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793411349; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3qAG2o3ko8PoWBmrG3Va0eNZxNccB7JjZx7iVudfhMo=;
 b=JPTagAQ+yslZ4uuQv/tQo2GAi+NTt1vt5oLTw7y1BwKfD76Q46G0/o4uiHmhmKhmmZywU
 FvXRaQCFWad3irjJxU5QIw/GSGtbewyTLNuyqzt4hGpgn3aJ6sOLT9/fKXWbPzkYtsA8XM2
 iUKBraw3K9QYeOItL4oQQh22xqc+/v9jY0ZBt2MRKKEbKYziFQZD9VlvIso++w86HJnmDzR
 ZcTlwyl4uLXKnOVyx0xORbPK49ImzYsqpk3bNziM0eLZMryUIXCukT/OsJlsLk6krWSF25e
 PTACLSz135QoAoOxl0jTc5lngKaymkJXS1jQ0eSNQ3GqaNxB8JD9KHw+gZ7w==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3157D46BCB
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 05:23:35 +0000 (UTC)
X-Greylist: delayed 2313 seconds by postgrey-1.36 at gabe;
 Thu, 29 Oct 2026 05:42:44 UTC
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com
 [185.226.149.38])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6506D10E778;
	Thu, 29 Oct 2026 05:42:44 +0000 (UTC)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <martin.roukala@mupuf.org>)
	id 1xMIJ6-00GDZn-Rh; Thu, 29 Oct 2026 06:04:08 +0100
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <martin.roukala@mupuf.org>)
	id 1xMIJ5-0002Xo-Jg; Thu, 29 Oct 2026 06:04:07 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1057822)]
  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xMIIs-00Gwma-JZ;
	Thu, 29 Oct 2026 06:03:54 +0100
Message-ID: <1c76eb81-feac-419c-bcb8-bb505788e549@mupuf.org>
Date: Thu, 29 Oct 2026 07:03:54 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/therm: mask the update bit when reading back
 the fan PWM duty
To: Alex <xnderv@yandex.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20261025101640.49779-1-xnderv@yandex.com>
Content-Language: en-US
From: Martin Roukala <martin.roukala@mupuf.org>
In-Reply-To: <20261025101640.49779-1-xnderv@yandex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: martin.roukala@mupuf.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: ZG4C6ET5XRQO53GSH4RAHXWS6OJFMQXY
X-Message-ID-Hash: ZG4C6ET5XRQO53GSH4RAHXWS6OJFMQXY
X-Mailman-Approved-At: Sat, 31 Oct 2026 01:49:06 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZG4C6ET5XRQO53GSH4RAHXWS6OJFMQXY/>
Archived-At: 
 <https://lore.freedesktop.org/1c76eb81-feac-419c-bcb8-bb505788e549@mupuf.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alex,

On 25/10/2026 12:16, Alex wrote:
> nv50_fan_pwm_set() and gf119_fan_pwm_set() write the fan duty cycle to
> 0xe118 with bit 31 set.  Normally the bit reads back clear, but when
> the register is read back shortly after such a write it can still be
> set, and nv50_fan_pwm_get() and gf119_fan_pwm_get() return it as part
> of the duty cycle.  nvkm_fanpwm_get() then takes divs = max(divs, duty),
> so divs becomes 0x8000xxxx too, and duty * 100 wraps around in u32
> (0x80000000 * 100 == 0 mod 2^32): the fan speed reads as 0%.
> nvkm_fan_update() uses that as the current speed and steps up from it,
> so it writes 3% to the fan and then ramps it back by 3% per bump
> period.

Ooops, I never saw the update bit being sticky! I thought this was a 
write-only bit :s Anyway, the code is:

    Acked-by: Martin Roukala <martin.roukala@mupuf.org>

Now, let's talk about the commit message: LLMs love to talk don't 
they?Let's trim the commit message to the just the above as it provides 
everything anyone bisecting to this change could ever want to know.

Whatever comes after (but not including the `Fixes:` and `Cc:` trailers) 
could be sent outside of the commit message, just as part of the email. 
It is valuable to the reviewer, as it allows us to see how you found the 
issue, figured out how to fix it, and how you tested it.

Anyway, thanks for your contribution. I am happy that you are taking 
over this old project of mine (back when I was contributing as Martin 
Peres, before I took my now-wife's name) :)

Thanks,
Martin Roukala
> 
> The reads that hit this come from the two therm timers.
> nvkm_therm_alarm() (the 1 s poll) and nvkm_fan_alarm() (the bump
> alarm) both call nvkm_fan_update(), which reads the duty cycle before
> it writes a new one.  When the two alarms fire within microseconds of
> each other, the second one reads 0xe118 right after the first one
> wrote it.  On the board below the bump period is 500 ms, so this
> happens again and again while the temperature target keeps moving.
> 
> Seen on a GeForce GTX 560 Ti (GF114, nv50 PWM path) while the
> temperature changed quickly under load: a bpftrace probe on
> nv50_fan_pwm_get() saw 7 of 239 reads in two minutes come 7-25 us after
> the other timer's write with bit 31 still set (e.g. 0x800001e1 with
> divs 0x21c), and each of them was followed by a drop to 3%.
> 
> gm107_fan_pwm_get() and the PTHERM path of gf119_fan_pwm_get() already
> mask their duty reads; do the same for 0xe118.
> 
> Testing: with this change the same workload and probe gave no such
> reads in 155 and no fan drops.  The board was running out-of-tree
> reclocking patches; the therm and fan code was unmodified.  The gf119
> hunk changes the same register in the same way but was not tested on
> GF119 or later hardware.  Both files build without warnings.
> 
> The problem was found and analysed, the bpftrace probes were written,
> and this fix and changelog were drafted with an AI assistant (Claude
> Opus 5.5 by Anthropic) during an interactive debugging session.  I
> reviewed the change and ran the tests on my card.
> 
> Fixes: cb9fa62671ac ("drm/nv50/pm: add support for pwm fan control")
> Fixes: bc79202f4c8f ("nvd0/therm: implement more appropriate pwm fan control functions")
> Cc: stable@vger.kernel.org
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c | 6 +++++-
>   drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c  | 6 +++++-
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
> index 684aff7..f56e763 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
> @@ -74,7 +74,11 @@ gf119_fan_pwm_get(struct nvkm_therm *therm, int line, u32 *divs, u32 *duty)
>   	else if (indx < 2) {
>   		if (nvkm_rd32(device, 0x00d610 + (line * 0x04)) & 0x00000040) {
>   			*divs = nvkm_rd32(device, 0x00e114 + (indx * 8));
> -			*duty = nvkm_rd32(device, 0x00e118 + (indx * 8));
> +			/*
> +			 * Bit 31 is the update trigger set by pwm_set();
> +			 * it can still read back as set after a write.
> +			 */
> +			*duty = nvkm_rd32(device, 0x00e118 + (indx * 8)) & 0x7fffffff;
>   			return 0;
>   		}
>   	} else if (indx == 2) {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c
> index 9cf16a7..9272256 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/nv50.c
> @@ -72,7 +72,11 @@ nv50_fan_pwm_get(struct nvkm_therm *therm, int line, u32 *divs, u32 *duty)
>   
>   	if (nvkm_rd32(device, ctrl) & (1 << line)) {
>   		*divs = nvkm_rd32(device, 0x00e114 + (id * 8));
> -		*duty = nvkm_rd32(device, 0x00e118 + (id * 8));
> +		/*
> +		 * Bit 31 is the update trigger set by pwm_set();
> +		 * it can still read back as set after a write.
> +		 */
> +		*duty = nvkm_rd32(device, 0x00e118 + (id * 8)) & 0x7fffffff;
>   		return 0;
>   	}
>   

