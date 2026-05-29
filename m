Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6205CCD6E45
	for <nouveau@archiver.kernel.org>; Fri, 29 May 2026 04:43:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 88F4A10F882;
	Fri, 29 May 2026 04:43:46 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 38FE94669B;
	Fri, 29 May 2026 04:30:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780029016;
 b=ygQrUzP0QcZghBk81vTXwYrGl0nE7Be0Gq5tvBC8pe69Ttx3G4YUSraiwiTVdyP03/ee8
 LMV4V2IOYV0flE8jUt3dQQq2Uh8tdOIBwg2TSafRvq0VKhdZZl3URSe5tVDwS3JJ1dUW26q
 30ul1DandAHNU1HCxLmOLSt11MQXr82YvUMPcYGx6YzJtUQaoE7II20hl6D2PF85jSiODTh
 Qfmi9flAoai0BafKOYGJhPrVXlj1MpGs0IdM/8/todKwUI0E9COCSjO5M4bupyLzD9gg2Jm
 R3WTYlLKQIEmh4dE9hea0E0xah3BjtK6AxVT3emDRUDmVfhOYgp8fMSmECUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780029016; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ALcrCPaWwVRhjwjlJ1vmfWaxUMnwCk6sqb/4Cp9MHA8=;
 b=wG/sRV4LVBOzKXMZprRLbhsSDbJe7mFeF+cWhYXUl67BPKlknU+ZgPNcb25qng+eP9+7S
 9XPRyul3inL7YcB2E6ZWfoNw+F4g8BiI+6jlWJkoByjlJIdW8rdWbVOkwzYMHfJIXhjWUJW
 74bjufgWbgyksblqvbAdOCKqNS+XfWEBKc3rO73CN5JBbxRASq2bOYUAd/8TB4OhVa5k2SE
 Bw1lE0HY5+Gu2kBTjOC6OVHDHrbkDkIzEBAppLdMapQq09cay3F6l77EwzANhcEKupczCyx
 c730n8EjNHZiZpRadhA6kM7PjV0v7YyD/XF2eN8amqBLDii/5c7JeQgEupPQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 368C944C91
	for <nouveau@lists.freedesktop.org>; Fri, 29 May 2026 04:30:14 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 77DB710F87A;
	Fri, 29 May 2026 04:43:43 +0000 (UTC)
X-UUID: f4b46b205b1811f1aa26b74ffac11d73-20260529
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b145bf94-5b2a-4fa2-bebc-6556a60e8fbe,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:76aae8069c6d673d2c1e12c0709a837c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f4b46b205b1811f1aa26b74ffac11d73-20260529
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 118597435; Fri, 29 May 2026 12:43:36 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: lyude@redhat.com,
	dakr@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	airlied@redhat.com,
	ttabi@nvidia.com,
	bskeggs@nvidia.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] nouveau/gsp: Fix NULL pointer dereference and cleanup
 IS_ERR_OR_NULL
Date: Fri, 29 May 2026 12:43:23 +0800
Message-Id: <20260529044330.96832-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KVX5RA7GW7SMFSHBUE5522WF6NTEOYNQ
X-Message-ID-Hash: KVX5RA7GW7SMFSHBUE5522WF6NTEOYNQ
X-MailFrom: zenghongling@kylinos.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KVX5RA7GW7SMFSHBUE5522WF6NTEOYNQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260529044330.96832-1-zenghongling@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patch series fixes NULL pointer dereference bugs introduced in the
previous IS_ERR_OR_NULL cleanup series and adds documentation as requested
by Danilo Krummrich.

Background

The previous IS_ERR_OR_NULL cleanup series introduced serious bugs that
caused actual kernel crashes:

  BUG: kernel NULL pointer dereference, address: 000000000000002c
  RIP: 0010:r535_gsp_rpc_rm_ctrl_push+0x60/0x110 [nouveau]

The root cause was that underlying functions (r535_gsp_msgq_recv() and
r535_gsp_msg_recv()) could return NULL, but the upper layers only checked
with IS_ERR(), missing the NULL cases.

Changes in V2

Compared to the previous series, this version:

1. **Fixes underlying functions first** (Patch 1)
   - r535_gsp_msgq_recv(): Return ERR_PTR(-EINVAL) instead of NULL
   - r535_gsp_msg_recv(): Return ERR_PTR(-EIO) instead of NULL
   
2. **Adds documentation** (Patch 2, per Danilo's request)
   - Kernel-doc comments for all affected functions
   - Clear return value contracts: "never NULL"
   
3. **Safe cleanup** (Patches 3-7)
   - IS_ERR_OR_NULL() -> IS_ERR() now safe
   - No NULL pointer dereference risks

Hongling Zeng (7):
  nouveau/gsp/rm: Fix NULL return values in message receive  functions
  nouveau/gsp: Add documentation for RPC functions return  values
  nouveau/gsp: cleanup IS_ERR_OR_NULL in rpc_rd
  nouveau/gsp: cleanup IS_ERR_OR_NULL in rm_alloc functions
  nouveau/gsp: cleanup IS_ERR_OR_NULL in core  implementation
  nouveau/gsp/rm: cleanup WARN_ON(IS_ERR_OR_NULL)
  nouveau/gsp/rm: cleanup remaining IS_ERR_OR_NULL usage

 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  8 +--
 .../nouveau/nvkm/subdev/gsp/rm/r535/alloc.c   |  4 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c |  2 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c    |  2 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 55 ++++++++++++++++---
 5 files changed, 55 insertions(+), 16 deletions(-)

-- 
2.25.1
