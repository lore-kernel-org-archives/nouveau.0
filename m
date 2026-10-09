Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7A6CA9EBB
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 21:47:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A99D91122E2;
	Fri,  9 Oct 2026 21:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V0y2aEKw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DA45048A21;
	Fri,  9 Oct 2026 21:29:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791581357;
 b=RNwl3E5O3GEZ3spCm/Ar//mNerLCFppv/JWOHFph0MZ7SC97cuF1w5Xf2AVPT//L7GBUG
 wyapQHDeAFzNj36J98QG/p4z8abAoldC/5G82uPEf22/c+yiqxWgKkvYdp9CQLDT/jRxTil
 /8LSlWnYDLZAcySnU8VHWgQEEPHVsLrqzrtCNtuNm1fcVBX5NDB0jB90N5zjGJfpk7/3HHy
 +NkMm2s8bY2sBE0kTZM1AZJF9j2VMUABR0jP5APh1JfR7Cl8CWWk6Cm+pi6Fwv7byBMx50s
 R0h5KZN7R8YJM0nFV7Gm7u1EXb+IrD6q5QkNQ6bDOpdhklJ8L2Rk0pGHDvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791581357; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=suwJGILMccxLxos8LqCKfSO7hRPSeKli3vME6xF73Lk=;
 b=Ej9TSm6IeOuRGcalCBYdmX4s2l184tqlRMCyyC5+5JtSo9fZj6oWZHmkHCLfdzgsEuenF
 VfWL/hv1dTmOCFNY4m85EFSsCbi3835IT9DTYjnVdVidjs5C0Pvo/oG47M0Y1EguU5RvFeT
 uDWklG+vcB2lUQS7WqiFG1B6OQM37W8oT8tWw5FTQi26HZ1e9fNlOSfFx8S3iBwdhqTTFRA
 HRM6sTgNYJZX4t5AFdSHTO4C5P+5pq4mbqBi21wpGchu4oBKuBXIw0fkcmh9JYuSij2VZCO
 8tJ88nfZ/VSRoiCOXJYWbqjNWnchrHkLcAXXsTMnc0LhbEUyLp0WIa/9jjcw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 01E0E48299
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:29:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 35ED510E0EB;
	Fri,  9 Oct 2026 21:47:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE9D0436E8;
	Fri,  9 Oct 2026 21:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1C11F000FF;
	Fri,  9 Oct 2026 21:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791582460;
	bh=suwJGILMccxLxos8LqCKfSO7hRPSeKli3vME6xF73Lk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=V0y2aEKwxiohi5Nm+RiAI/Ea5J9jtC0EZ7bdD8fVEePKMy1YmHqecBW3NC3rPGRtb
	 yrflB4WzIJNtTSCCEmYq266ibzwBYqxyPxYfrnY1tYvgDZD0XkqpXiPoDJvSMWUfzj
	 QJBTgeRlI7ERzbNH4zv3EOXaRL2WRwwcTrkPESLjRIpgK+qiyvf4Glo+TPTX2Tri3t
	 LdbbDmjn3P6mQatxlE1ZXQHDMrGohm3mBBQ0MqxrCMah1INinTKsWmNrlujb5OCmOB
	 ZlxS02SwmmpXqgdDmgBWXzjL/pc8Stf+4sYuFpn0F0pPSwGJkchfiAB8vwz2Ffu9cW
	 ZhLP0wGtVUNfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 23:47:36 +0200
Message-Id: <DM0MZ6DRWX8E.6AK134LAA45Y@kernel.org>
Subject: Re: [PATCH v2 1/3] nouveau: Fix NULL pointer dereferences in
 GETPARAM ioctl
To: "Jim Cromie via B4 Relay" <devnull+jim.cromie.gmail.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
 <20261009-my-fixups-v2-1-839e2bbe514d@gmail.com>
In-Reply-To: <20261009-my-fixups-v2-1-839e2bbe514d@gmail.com>
Message-ID-Hash: ONPYIZG2APKABSOQVFSV5NAL5GHXIM4S
X-Message-ID-Hash: ONPYIZG2APKABSOQVFSV5NAL5GHXIM4S
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: jim.cromie@gmail.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Campos Ramos <Capitain_Jack@yahoo.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ONPYIZG2APKABSOQVFSV5NAL5GHXIM4S/>
Archived-At: 
 <https://lore.freedesktop.org/DM0MZ6DRWX8E.6AK134LAA45Y@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Oct 9, 2026 at 7:44 PM CEST, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>
> When hardware or firmware initialization fails, the graphics engine
> (gr) or device functions may remain NULL. Attempting to access these
> during the GETPARAM ioctl (e.g., NOUVEAU_GETPARAM_GRAPH_UNITS) results
> in a kernel NULL pointer dereference, causing a crash when userspace
> (GNOME/Mesa) attempts to probe the device.
>
> Add safety checks for 'gr', 'gr->func', and 'nvkm_device->func' in the
> ioctl handler. Return -ENODEV to signal the missing hardware state to
> userspace, and use NV_ERROR_ONCE to provide diagnostic proof in the
> kernel log without risking a console flood.
>
> NOTE:
>
> I encountered these crashes while booting unrelated code (in
> dynamic-debug) on real HW.  There was also some fwupd updates around
> this time, so it could all be transient/unreproducible.  But it did
> happen, and could happen again in unforseen circumstances.
>
> @Capitain_Jack tested the error path in v1 by deleting the FW
>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> Tested-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>

Do they need to be separate patches? Do we need a Fixes: tag? Why not CC st=
able?

> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/no=
uveau/nouveau_abi16.c
> index 4542d5f4ded8..3f130cd4fbcd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -306,6 +306,11 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>  		getparam->value =3D 1;
>  		break;
>  	case NOUVEAU_GETPARAM_GRAPH_UNITS:
> +		if (!gr || !gr->func) {
> +			NV_ERROR_ONCE(drm, "GETPARAM_GRAPH_UNITS: no gr engine or func\n");
> +			return -ENODEV;
> +		}
> +
>  		getparam->value =3D nvkm_gr_units(gr);
>  		break;
>  	case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
> @@ -315,10 +320,23 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>  		break;
>  	}
>  	case NOUVEAU_GETPARAM_VRAM_BAR_SIZE:
> -		getparam->value =3D nvkm_device->func->resource_size(nvkm_device, NVKM=
_BAR1_FB);
> +		if (!nvkm_device || !nvkm_device->func || !nvkm_device->func->resource=
_size) {

How can any of those ever be NULL?

> +			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_BAR_SIZE: no device func\n");
> +			return -ENODEV;
> +		}
> +
> +		getparam->value =3D
> +			nvkm_device->func->resource_size(nvkm_device, NVKM_BAR1_FB);
>  		break;
>  	case NOUVEAU_GETPARAM_VRAM_USED: {
> -		struct ttm_resource_manager *vram_mgr =3D ttm_manager_type(&drm->ttm.b=
dev, TTM_PL_VRAM);
> +		struct ttm_resource_manager *vram_mgr =3D
> +			ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
> +
> +		if (!vram_mgr) {

Same here, how can this ever be NULL?

> +			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_USED: no vram mgr\n");
> +			return -ENODEV;
> +		}
> +
>  		getparam->value =3D (u64)ttm_resource_manager_usage(vram_mgr);
>  		break;
>  	}
>
> --=20
> 2.56.0

