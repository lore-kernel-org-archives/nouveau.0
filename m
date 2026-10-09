Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1BBCA9EBE
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 21:53:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 56F031122E1;
	Fri,  9 Oct 2026 21:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T1uVZL0g";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8DBED48A2C;
	Fri,  9 Oct 2026 21:35:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791581725;
 b=D3l2bG+bcP9GWTLjF694hdM6FvSJRfc8pQ/77jC2ob0qhYU2TdXJ/QJB9Wc5JcG5LHwfU
 yZn5o0WoxEZxFF+dChJ/2TmRPz4s1gS+3zPm3Jz8i5wxQi+Orc96jSq//xsuHKbykSb18Qp
 eaXDg8yy1d6CVe54xq0ti35S7GBLQ+EvY4tUgWnxhe47XMPQGHle1b6q967ru8kzIQzcn0v
 aHpEMAgUsE37gcinfoli3wfMopcZ8K10BFK/LgppMOalBTlH0tWKR8iY4eVMUPDbIg6nNHT
 tjrieRlAVgBfHRdAKh6T1Kefq5lss4FZsV0Cn36xVSW34y8+HJr/VZPKSVUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791581725; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+7ZmDM7eGMHf9jQqmIQ9W5YX2nKr2knSDAYajP9Gkig=;
 b=G3rmmbAcZnGn1l5uUOkMSeon0ZmEHDLpo33BPnmK5gZD1XTpOtvl2UDxn8g/vhyq3OEte
 pkiggQXzXGIKu7w/5xo8LhNy9L6gN+AHncnCtnQuAnoQiv5a04yucrgbNsEREP5gwqHUnL5
 ufnem93IxKBPZOnT3Zpc3R12FGWZOnBTQEe/aUGrNMWgdxHTZnznz62yNP//QniXwvUgESe
 LvSqV3gQUlUe5r/i9nHTmaIgqch85o9plRvuN1zanZGEMtwx0D6s1w/kpVeVraa2cOMah+0
 P3a8aVYVYiNJGoZSsyrSSTaUcK5h/n/EPxMwujNyQy/2kgIhZUXxHMIQLUXQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 77CF348A15
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:35:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0732F10EB3C;
	Fri,  9 Oct 2026 21:53:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3221560120;
	Fri,  9 Oct 2026 21:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538691F000FF;
	Fri,  9 Oct 2026 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791582828;
	bh=+7ZmDM7eGMHf9jQqmIQ9W5YX2nKr2knSDAYajP9Gkig=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=T1uVZL0ggAl0VPQm3eJhRvJGiAujxieV5Azk/FASvWFVeiRoJ4n/l07py6sua5Df7
	 o4zokVMYdepXjYod6t0uSKSB5acU1eyJFkGKuNVffMGka8VzHqiuXiPlCUw1RGD2ny
	 A4MSNbkPlewdgOuJexEYxYNIaFX72LnXy4WFPm2MViDiU575mS1+b9RY+L2cH2P982
	 l4vLqBtpoNHiZyKIkJkRwshI3L4tJKq/LkDkTobig0ztDT78jtw0hSN7/x0Qg46gz/
	 sKUjyyV//1JysFEjWCkhFG7jjcBtV2y0HTVvo1KE0rApx4fm9M8rBTUrTeMKL8UH8l
	 yG8CDERZDB5cQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 23:53:44 +0200
Message-Id: <DM0N3VIIXERD.PZBNSZJPSEL7@kernel.org>
Subject: Re: [PATCH v2 3/3] nouveau: Fix NULL dereference in
 nvkm_gsp_gcx_ready()
To: "Jim Cromie via B4 Relay" <devnull+jim.cromie.gmail.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
 <20261009-my-fixups-v2-3-839e2bbe514d@gmail.com>
In-Reply-To: <20261009-my-fixups-v2-3-839e2bbe514d@gmail.com>
Message-ID-Hash: UWMHHV6B7BOAH6KNX7PCTOPJ5CB3E2HI
X-Message-ID-Hash: UWMHHV6B7BOAH6KNX7PCTOPJ5CB3E2HI
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UWMHHV6B7BOAH6KNX7PCTOPJ5CB3E2HI/>
Archived-At: 
 <https://lore.freedesktop.org/DM0N3VIIXERD.PZBNSZJPSEL7@kernel.org/>
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
> Commit cb4c7603678c ("drm/nouveau/gsp/r570: Add support for
> INTERNAL_GCX_ENTRY_PREREQUISITE") hooked nvif_device_gcx_ready() into
> nouveau_pmops_runtime_suspend() to consult GSP before runtime suspend.
>
> On GPUs running without GSP-RM (e.g. Volta GV100, NvGspRm=3D0, or missing
> GSP firmware blobs), device->gsp is instantiated but gsp->rm remains
> NULL. nvkm_udevice_gcx_ready() checked "!gsp" instead of verifying
> nvkm_gsp_rm(gsp), allowing non-RM instances to invoke
> nvkm_gsp_gcx_ready(). nvkm_gsp_gcx_ready() then unconditionally
> dereferenced gsp->rm->api, causing a kernel oops:
>
>   RIP: 0010:nvkm_gsp_gcx_ready+0x10/0x30 [nouveau]
>   Code: ... 48 8b 87 70 0e 00 00 <48> 8b 40 18 ...
>   RAX: 0000000000000000 RDI: ffff8c9555fca000
>   Call Trace:
>    nvkm_udevice_mthd+0xa5/0x150 [nouveau]
>    nvkm_ioctl+0xcc/0x1d0 [nouveau]
>    nvif_object_mthd+0x110/0x1e0 [nouveau]
>    nvif_device_gcx_ready+0x36/0x60 [nouveau]
>    nouveau_pmops_runtime_suspend+0x39/0x140 [nouveau]
>
> Instruction decode shows `mov rax, [rdi+0xe70]` loads gsp->rm (0x0),
> and `<48> 8b 40 18` (`mov rax, [rax+0x18]`) faults accessing rm->api.
>
> Fix by:
> 0. Checking !nvkm_gsp_rm(gsp) in nvkm_udevice_gcx_ready() so non-RM
>    devices report GC6/GcOff ready and bypass the GSP call entirely.
> 1. Guarding gsp and gsp->rm in nvkm_gsp_gcx_ready() before inspecting
>    gsp->rm->api->gsp->gcx_ready.
>
> Fixes: cb4c7603678c ("drm/nouveau/gsp/r570: Add support for INTERNAL_GCX_=
ENTRY_PREREQUISITE")
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Isn't this fixed in commit 4d0e27041185 ("nouveau: check gsp->rm as well as=
 gsp
pointer before gcx ready") already?
