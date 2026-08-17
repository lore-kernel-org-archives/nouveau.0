Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967EFC5DF79
	for <nouveau@archiver.kernel.org>; Mon, 17 Aug 2026 06:50:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5178910E65E;
	Mon, 17 Aug 2026 06:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oQHfE9h0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 58AC747893;
	Mon, 17 Aug 2026 06:34:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786948459;
 b=tmi/Bokj9VzcMZhppUlMBzACbcSUlFc/kQj4rqnGVij8hU77us3Zy4a+XuDDrFV8JBEOC
 AuDsS/fhxrZ4xbz9Az26HqfEpT+fVkAT8Ak2Rage1e9Y/epKYWbB8cIO7AjtvxKlyrHmYW9
 HPwx+TxRoEP6g70ojJ1ecNEv1Y3BJJQYhB/vT4gbwE5oJZ3pQRdPJV9W4xElSB7uBf7/8hj
 pdbZJXEUn5OHmVQK5fWdCWBTQ1r+uDmjhkVeeYke1kbKDrqteyTWZhrhtmRdqQ2IOVjHHNw
 d/o4zJs6zIsrd8anQkVf7Bhs28KdolaVHIsCUQpK6i1uDX9nj1S2DPKuRQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786948459; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QGOR4munWljbr0KiH3UmKpUCkPPoj4pNbwUXbdA6+k4=;
 b=JB/7JPjobSCnPvRDhyVGUYqN6jtsFR3ileFUNse0aZw9URltuCa+bOZfggoflLWIsXzJm
 iX3P3Mx1oa3sZfpYV+YWrZTMz/2nmTZKgBSObSj2qDmBTx9bYUFTPSGgIQVZdjUXFEw+/b4
 eNf9gjsg3PdXjDSdd2MspZxuVcWL0V24ucuFJ8FJlY3ZGdoNb2zD6MdvTPcFESt73yam0qB
 HPFiq0O2KD7Vbjs0yrmBD/71SnaxfTpByF/mSTFTWgniPEQs7+/ZldhlAmJtvuTxnyyWfNs
 PiRllDiUqODFp5TUw2sW9YneSAQyF4tRkZsb6XU+3SWw2NnGypnv4l0J4Qtw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 68B0E414F8
	for <nouveau@lists.freedesktop.org>; Mon, 17 Aug 2026 06:34:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 24E6310E648;
	Mon, 17 Aug 2026 06:50:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0707A41B5F;
	Mon, 17 Aug 2026 06:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2937C2BCB3;
	Mon, 17 Aug 2026 06:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786949442;
	bh=u/VaKggcAOLEcGn3Y0lUjyHfOlHj39Ku/qCdC+XjX+M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oQHfE9h04Fb5MICfUSIokRTDbI2UqOnZfklYwq15HIiDRGX9yIfaIsF57i0VZEVP1
	 SHcqREuVIz0ShnqobyCSELwcWnR+sBV7COkxCl1RpdtM1q5nwpzKfSEt0mQG2tZaJy
	 +YYCSknN2lqxJ7TMh1T9lVgmhHFYCD1chgUDtL8vOx1mwtx6K02ZJO9xYQ93XP0ZpA
	 V8hYpil8CpytroBzBjsHRnGvcSHPklbt4feOXN1vapMjsJfLb3FfH09ZcLgszFHkzv
	 YoBPXRuEv1TXbzM6IIN3uUvBMxUxTbFzjMSzEoLuQCKvc3E7pAmolddV4GM80HvUbq
	 RSWchTuwSQ5zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1ACC5DF74;
	Mon, 17 Aug 2026 06:50:42 +0000 (UTC)
From: Junrui Luo via B4 Relay <devnull+moonafterrain.outlook.com@kernel.org>
Subject: [PATCH 0/2] drm/nouveau: fix out-of-bounds VRAM access and VM_BIND
 page-size mismatch
Date: Mon, 17 Aug 2026 14:50:39 +0800
Message-Id: <20260817-nouveau-fixes-v1-0-f518d0c735f3@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD+vgmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nz3bz80rLUxFLdtMyK1GJdI2MLc3MLE9Nk48QkJaCegqJUsARQS3R
 sbS0AIPyWx18AAAA=
X-Change-ID: 20260817-nouveau-fixes-23877845c3ab
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Balbir Singh <balbirs@nvidia.com>, Mary Guillemard <mary@mary.zone>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 James Jones <jajones@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=u/VaKggcAOLEcGn3Y0lUjyHfOlHj39Ku/qCdC+XjX+M=;
 b=owJ4nJvAy8zAJVb4wiKgu++DA+NptSSGrKb1DskN65l1HvV2Gn0WWd6l+6pxq8KdBMs357hnN
 vsvjuD/u6yjlIVBjItBVkyR5XjBpW8Wvlt0t/hsSYaZw8oEMoSBi1MAJjLvKMN/n93uaXl7lH71
 1PQdu5PkcFuIQ8bm/rFZF7nfTKpRul9yg5HhSv2bRfWmDg8lLzxYPynz1d1VPnPquyp/v2qXF2n
 qm72bGwBBAE9E
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-Endpoint-Received: by B4 Relay for moonafterrain@outlook.com/default with
 auth_id=909
X-Original-From: Junrui Luo <moonafterrain@outlook.com>
Message-ID-Hash: DO6NKZ3YRK33G24IZ3JWU7BGOIOIIP5Y
X-Message-ID-Hash: DO6NKZ3YRK33G24IZ3JWU7BGOIOIIP5Y
X-MailFrom: devnull+moonafterrain.outlook.com@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Junrui Luo <moonafterrain@outlook.com>,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: moonafterrain@outlook.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DO6NKZ3YRK33G24IZ3JWU7BGOIOIIP5Y/>
Archived-At: 
 <https://lore.freedesktop.org/20260817-nouveau-fixes-v1-0-f518d0c735f3@outlook.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Two unrelated fixes; they touch different files and can be applied
independently.

Patch 1 sizes the VRAM buffer object backing a device-private region to
the region it actually backs. The region grew to DMEM_CHUNK_SIZE *
NR_CHUNKS while the buffer object stayed at DMEM_CHUNK_SIZE, so
nouveau_dmem_page_addr() resolves every page past the first chunk to VRAM
outside the object.

Patch 2 rejects a VM_BIND that replaces a mapping with one using a
different page size. A new mapping takes over the page tables of the
mappings it replaces, which only holds while they all use the same page
size. Since select_page_shift() started deriving one per mapping it no
longer does, and the new mapping ends up mapping at a size its page
tables were never built for.

Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
Junrui Luo (2):
      drm/nouveau/dmem: pin VRAM for the whole registered range
      drm/nouveau/uvmm: reject replace across page sizes

 drivers/gpu/drm/nouveau/nouveau_dmem.c |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 33 ++++++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 3 deletions(-)
---
base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
change-id: 20260817-nouveau-fixes-23877845c3ab

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>


