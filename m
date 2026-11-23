Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C40606A31A
	for <nouveau@archiver.kernel.org>; Mon, 23 Nov 2026 16:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gGv8K8A4
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19E6610EC5C;
	Mon, 23 Nov 2026 16:54:17 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 02ACB403AC;
	Mon, 23 Nov 2026 16:54:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795452851;
 b=ocy7crLktC/ZZJwF9kpNAME/zh5N9H/jTX/HGGtJauAZ5Ouc3WONeJ+iTR2HvLv3neBBF
 CUM8sdqs4XM0tKwO1xfj5vJjacdOn9Z7cNLqsYRM5VTtldISh1qAiPUXUWs9TMestCYU35J
 d4G0tQmjtWF/zBsT4cQM8tUGgsH1eCB02OBGOO83EzIWwp4WfRks4uRiZI/mG4OoW7jvcX6
 V1QDNdAkYVNiFA/IUEbcquJu8uVeQnikDtuPOaYNf8w4VCCwX8fSbpHqDPJ5S6mtT9xbrcU
 OO3n3y7rHdXho5GTz8l0huul5pt9hVUlpO1R7bGc2Br8HdBEJ4KC0CFqjcbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795452851; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+s+2JqGfV/wt1208sMgNo78UahYBAE4HE3ngb4zFNXI=;
 b=TWainDeDMTmpwFhBn1dGQwFeg/CHWqLnmPLTPwkg1tY9Kwhw8rz4GdsDn1InBnFVDuuGz
 FRnISOtqcm81gRIniRLjYxrcWkaxNAQDaV5Ugs3GbFjgLM7NBwjHBZcxMwfvX/ogHLfjra4
 aJ3SLdjNObiuQj/yHw721rm2RRTvavA0S1+j31RkpP1foGFol+XfWnangIuFdb+oMoLaTcM
 HE/hwCxabRoEeyGh58zVM1H4/eKKOm55KSFfPBaO1p2weWFnl8r0XZTottBaTFSMjJbw3z5
 foQMPHx65CK1YXF3IZIQhGc7BULxlHRHeaTXIyGw/XJaCUWQsZ2TpUHafe8Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
 arc=none;
 dmarc=pass header.from=kernel.org policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DD29740346
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 16:54:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C151B10E064;
	Mon, 23 Nov 2026 16:54:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DB80409F4;
	Mon, 23 Nov 2026 16:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7032B1F000CA;
	Mon, 23 Nov 2026 16:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452842;
	bh=+s+2JqGfV/wt1208sMgNo78UahYBAE4HE3ngb4zFNXI=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=gGv8K8A4oKtmEseyLt+MAwYOjkPv5tc5XyC8c6rXsbZrHp3mIv2MsNMU3GFkROkfq
	 35zpB3HhWPMLyG7Hzf83LdFZ4mYhg18is9I4JZxpTA8436qLoe5Sm7SvYEohRwP0d6
	 qEkBR4ubg1F3VP80xAYG0PdCus+iFtOEV/Es3SeAX1Jmed4gH2NNMcDkGYHQf4Jqao
	 YqAeeqrOe9eplb1Fm4bdIuGH5LtclnEFM4g4VyRs+qwlige1FOWTlGDPiQrqf/rbFV
	 vFIxy3tmVxmAR/bcxt8yo4Cn9aqqDWDpZ7i39EZsRcL6nQ5RtSpfIYacSNrJaMljaq
	 vnkg96Ax+/hRQ==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 17:53:59 +0100
Message-Id: <DN2QWVWVB2FP.2DL4ZSBMYRXEC@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 3/3] nova-core: only bind to GPUs when explicitly
 requested
To: "Dave Airlie via B4 Relay" <devnull+airlied.redhat.com@kernel.org>
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-3-5e8c27aa8555@redhat.com>
 <DN2OVF03FAL6.2EKLEYINW79YO@kernel.org>
In-Reply-To: <DN2OVF03FAL6.2EKLEYINW79YO@kernel.org>
Message-ID-Hash: 4QFASEYCBDEPWMWDA6GG4PTJGIL2C2WL
X-Message-ID-Hash: 4QFASEYCBDEPWMWDA6GG4PTJGIL2C2WL
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
CC: airlied@redhat.com, Alexandre Courbot <acourbot@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 nova-gpu@lists.linux.dev
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4QFASEYCBDEPWMWDA6GG4PTJGIL2C2WL/>
Archived-At: 
 <https://lore.freedesktop.org/DN2QWVWVB2FP.2DL4ZSBMYRXEC@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon Nov 23, 2026 at 4:18 PM CET, Danilo Krummrich wrote:
> On Mon Nov 23, 2026 at 3:50 AM CET, Dave Airlie via B4 Relay wrote:
>> @@ -30,3 +30,24 @@ config NOVA_CORE_SELFTESTS
>>  	  logs its failure and lets the probe continue.
>> =20
>>  	  If unsure, say N.
>> +
>> +config NOVA_CORE_BIND_GSP
>> +	bool "Make nova-core the default driver for GSP-capable GPUs"
>> +	depends on NOVA_CORE
>> +	default n
>> +	help
>> +	  Make nova-core bind to all NVIDIA GPUs it supports by default.
>> +
>> +	  By default nova-core does not bind to any GPU and leaves NVIDIA
>> +	  GPUs to other drivers, such as nouveau. Say Y here, or boot with
>> +	  nova-core.bind_gsp=3D1, to make nova-core claim NVIDIA GPUs
>> +	  instead.
>> +
>> +	  nova-core is work in progress and may not be functional, so this
>> +	  is intended for nova developers and testers only. When enabled,
>> +	  nouveau must not bind to the same (GSP-capable) GPUs, i.e.
>> +	  CONFIG_DRM_NOUVEAU_BIND_GSP=3DN or nouveau.bind_gsp=3D0 is required.
>> +	  Otherwise both drivers compete for the same devices and
>> +	  whichever is loaded first wins.
>
> I think this is a bit unsatisfying, for the Kconfig at least it would be =
nice to
> avoid the possibility of being able to configure
>
> 	- NOVA_CORE_BIND_GSP=3Dy && DRM_NOUVEAU_BIND_GSP=3Dy
>
> 	- NOVA_CORE_BIND_GSP=3Dn && DRM_NOUVEAU_BIND_GSP=3Dn
>
> since I wouldn't consider them valid combinations of Kconfig options.
>
> Maybe something like this:
>
> 	config NVIDIA_GSP_DEFAULT_NOVA
> 	bool "Use Nova by default for GSP-capable NVIDIA GPUs"
> 	depends on DRM_NOUVEAU !=3D n && NOVA_CORE !=3D n
> 	default n
> 	help
> 	  When both Nouveau and Nova are built, use Nova by default
> 	  for GSP-capable (Turing and later) NVIDIA GPUs.
> 	  When only one driver is built, that driver is used by
> 	  default. Older GPUs use Nouveau.
> =09
> 	  Override this default using the nouveau.bind_gsp and
> 	  nova-core.bind_gsp module parameters.
> =09
> 	  Nova is work in progress and may not be functional.
> 	  This option is intended for developers and testers only.
> =09
> 	  If unsure, say N.
>
> I think for the module parameters it is probably fine to not restrict thi=
s
> ambiguity.
>
> We've also discussed whether we can detect vGPU mode in order to pass GPU=
s with
> vGPU mode enabled to nova-core regardless. I think this requires an FSP r=
equest
> via EMEM (at least on Blackwell), so it should be possible to implement t=
hat
> with the existing infrastructure in nouveau as well, but I'm not convince=
d it's
> worth it.
>
>> +	  If unsure, say N.
>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/dri=
ver.rs
>> index d6bc972d47c7..66208a244cab 100644
>> --- a/drivers/gpu/nova-core/driver.rs
>> +++ b/drivers/gpu/nova-core/driver.rs
>> @@ -105,6 +105,19 @@ fn probe<'bound>(
>>          dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
>> =20
>>          try_pin_init!(NovaCore {
>> +            // Only bind when explicitly requested through the correspo=
nding
>> +            // Kconfig option or module parameter. By default, leave NV=
IDIA
>> +            // GPUs to other drivers, such as nouveau.
>> +            _: {
>> +                if !crate::module_parameters::bind_gsp.value() {
>> +                    dev_info!(
>> +                        pdev,
>> +                        "Not binding to GPU; make nova-core the default=
 NVIDIA driver with CONFIG_NOVA_CORE_BIND_GSP=3Dy or nova-core.bind_gsp=3D1=
\n"
>> +                    );
>> +                    Err(ENODEV)?;
>
> I'd prefer this to be wrapped in an associated function of NovaCoreModule=
, e.g.
> NovaCoreModule::check_bind_allowed(). I'd also move it before try_pin_ini=
t!().

Actually, please disregard the latter, I want to avoid the need for
pin_init_scope().
