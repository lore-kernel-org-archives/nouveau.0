Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0C7FF886F
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 15:53:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 749F510ED29;
	Tue, 28 Apr 2026 15:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z+Mz2CCn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0112045CAE;
	Tue, 28 Apr 2026 15:40:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777390856;
 b=fcmpxeSMyIllcgaRXbdLVb0OMCdL1n7Nw3dyzJwI4ukvBaOismjoWXlXu2RIzGbsCMAiL
 2DUuWIjyBG5MnYXIreO7UggktZ0Hqe2NGvInq7sf7XdJQ8simI7xhZgwhSx9JQau5T6vamO
 zUNK9ZDvaS9+GTHjrY6cwRRneDTg15gL3OIDTY3nrMAtrQ7/A4UsL4YS57UheifdjdBEJ8p
 s0BUZgWLMVdC5Whf9+4vi3R9mauGRL1YCDxC3+fDlhQTc9fC70Mwl297dREXoiePkNLV4S0
 +nZNqCfvMd8KrzqKxnfHueTTFEcod/NfaTa2keyQ9X52qmXHb+qZFtMeMFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777390856; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JZdmQQJxN1qrXbZz1B2po+SfZ74QMlW3OprcS/7PqZU=;
 b=zBwsB4pXG6XVpL2+1cSjptKUvREi6q8/0jR8dvYRO6D23/msyb19s+451DApFoAjFDn2R
 BuQwivE9VCu+Bu2UUjnhpWD1DGkgCDb20JPaAAMDPs9viIMobbpbdPrM1okJO6Hg8x7V1Xt
 wzu53kEPoZaEvKyPUCU04c4AIEvMkg3NgMT+uJRLSGCh71S0Nl/Fb1Lrh86TVQ1uonRHTwb
 o5duPPvM5EEL74Ss/yjBuLpgUy5DVNnMM+pfyDjllYvgHZoJp94kIzwoOPK1OEB7M5L4OwA
 5eGaHDaCKY5CRW6yZrXouaL1kH26E1/Jxe9q4irqChYL02FMhegvnZIaBNdw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3E17A45C82
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 15:40:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8034110ED5B
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 15:53:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 386D144377;
	Tue, 28 Apr 2026 15:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDE7C2BCB5;
	Tue, 28 Apr 2026 15:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777391596;
	bh=7MDRwOM9Q0iI6myAAVGPCrvQeSykSgS+GJwRdNXKmhY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Z+Mz2CCnWCvuWGoVb6HBzCE+zScCuPRC8qeyRXf6PuVf7z+0stEy1CQXOm4h0P9vz
	 ZE/S7DS3hd0DFX7BiFzH62+JGza6MZI2lZ5+StmOuOESqZg85U7PBGO+tsO2vol2Z4
	 R6giXAhH9BfRRCL3XYzjzwZxieavrj5bOYfqsemznpVjXfgrKcbeh8nfJ1aTxCS4cH
	 d0UDMSl1nERv9YlA69HPAj9PqV84NRxjCEe+MXaQ3siILXMOXzFrIg0ZhN9WAKRr6/
	 EtTy2wzBwx7Ae1LYQn+wrgyfmQsiHGLL/EjN5KUX+qaHxIEpPQUIfH02DJUOjEz/d0
	 eIslqe8bzYERA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 17:53:13 +0200
Message-Id: <DI4WQHWHRT4Z.10GC877YXSKWJ@kernel.org>
Subject: Re: [PATCH] drm/nouveau: expose VBIOS via debugfs on GSP-RM systems
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260407185306.3024695-1-ttabi@nvidia.com>
In-Reply-To: <20260407185306.3024695-1-ttabi@nvidia.com>
Message-ID-Hash: 7QPCBBF5ZO73VUSAQ5SYBFCHPX4765BE
X-Message-ID-Hash: 7QPCBBF5ZO73VUSAQ5SYBFCHPX4765BE
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7QPCBBF5ZO73VUSAQ5SYBFCHPX4765BE/>
Archived-At: 
 <https://lore.freedesktop.org/DI4WQHWHRT4Z.10GC877YXSKWJ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Apr 7, 2026 at 8:53 PM CEST, Timur Tabi wrote:
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nou=
veau/nouveau_bios.c
> index c8335f5b49db..28bcf38cdddf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -2085,10 +2085,24 @@ nouveau_bios_init(struct drm_device *dev)
>  	int ret;
> =20
>  	/* only relevant for PCI devices */
> -	if (!dev_is_pci(dev->dev) ||
> -	    nvkm_gsp_rm(nvxx_device(drm)->gsp))
> +	if (!dev_is_pci(dev->dev))
>  		return 0;
> =20
> +	if (nvkm_gsp_rm(nvxx_device(drm)->gsp)) {
> +		struct nvkm_bios *nvkm_bios =3D nvxx_bios(drm);

Can this pointer ever be NULL? Before we had a nvkm_gsp_rm() check and I th=
ink
that some GSP chipsets can have a nvxx_bios() return a NULL pointer.

> +
> +		/*
> +		 * The VBIOS data was already read by the nvkm layer during
> +		 * nvkm_bios_new(). Point the legacy DRM-level VBIOS structure
> +		 * at the same buffer so that any remaining legacy code can
> +		 * access it. This exposes the VBIOS via the DRM debugfs entries.
> +		 */
> +		bios->data =3D nvkm_bios->data;
> +		bios->length =3D nvkm_bios->size;
> +
> +		return 0;
> +	}
> +
>  	if (!NVInitVBIOS(dev))
>  		return -ENODEV;
> =20
> --=20
> 2.53.0

