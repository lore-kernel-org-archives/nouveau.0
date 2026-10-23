Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ADE606A31B
	for <nouveau@archiver.kernel.org>; Fri, 23 Oct 2026 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrL9TBoy
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9060710E616;
	Fri, 23 Oct 2026 09:38:47 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 12DCA48B4A;
	Fri, 23 Oct 2026 09:19:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792747190;
 b=a+xASNiy5Wh8c532oUmcviRUhgr8x8kV1KKAQGUGfoDQlZChOMgj6SeZ/o2Hfy1OEOu0p
 VTTSpHH4GvesCK+viT0UfJX8HizqdwlfjOw0D9IRNWPd/cpHoac/jmLvJnaOvusD5Twv5Lk
 PU3F4Ev6fKWEn/ZW78WaQl6DD2iWk6IkmtEyEDCngvE6Z+AqrB7/Sdswm77bT4kwYCWxkow
 wSsjs2CAMmvZ1mJttFRelRCQNbWJKYkCx3GAtCzCgPp2aZT7Y8OATJDJb7YDXNGb3F63S0Q
 bdqE+WxBB+YnDot+HQUuESuQ2Nt5aKIOmHEv5f3rLX1vf+FxPN1RNC40ljfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792747190; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ivlu9gZUoZpAO3rDeEUhzGrJLnpEDAs/cTBRPWcuhG8=;
 b=jN1y1PDu72njE0HmSNkTrz27MyiBEFrYZkh7+rMidjzlkbUfpXRmI8JbX3wAAhq4GmDSh
 J0cX9GKgFs9/rpiDN95CeTABJfKzzSe3k2JRuUdjWA0GJksCKldNuUVYmjqOswoM6sdkCoJ
 tA8NO/KeC9kOJ2rDF6BB48Q4tLD/OS/1ZwvN0SJTLfFEIQvJVZBmGucY34FpIdHLh7OSA1b
 c9V1+/XNTw2YgfxPHLMxminfSSmjRHhuTgQXuGVA/pIdKMy/kBA6g6TwBfO0QiaCID2etgz
 Upnd4dpwl9CnX+ZpI2fbQeVkHpMlD1iaOmlhkVkgGBVrJfc+fZBsJHwjyoSw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=kernel.org policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EE082413B4
	for <nouveau@lists.freedesktop.org>; Fri, 23 Oct 2026 09:19:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 33E1A10E5DF;
	Fri, 23 Oct 2026 09:38:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56DC16024D;
	Fri, 23 Oct 2026 09:38:38 +0000 (UTC)
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792748318;
	b=o1GvNGOdaSySdRmtmL/ylJp60kMg3TkQCUoaF9jigroj+l9JS75eqTl9NlvtEBXlR72q
	 Go0J7R2PxmWOqSkSLr7g9LfcRGxOWkqy3HyS/cwkJPPgAFYS5j2mgya0Um0ST9MpvLFwj
	 wj5L3URPKelxKt5aP1YfDJ5O2P5RohAfmsuoMYUqyxJm4JNKcSFPJOfBh7amThdgJJf29
	 NqXxZjvtv2sutT1lOKt1SSw5gbuprfwtZORRbeIldL4j9VA7hed4K7DB85lFu7wiPuCjT
	 zEY9HmmOIeKyHy8+2xob6KkW8TsBb6pEYx8eFomtXkVC5VQ4wzeG7yE0pMlvHCGjyQg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792748318;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ivlu9gZUoZpAO3rDeEUhzGrJLnpEDAs/cTBRPWcuhG8=;
	b=qOnwyMJDaJpfwCn3F76cBDylH1JAGDyVADQM2MdOAOg/LFuGUpDeMYbBpMVYo+Pq3QmG
	 2ExpJFO+sS0WfFqdl9w8G1ukXjDYc5ggfy6+xrDg2AOAIjkOqTC/zn4kHzoAoNWpEnwjK
	 hbWOcDjxd0SAiunM9ricbXCA3A7MTkEggP3tb2t7ejBsIi+x9dhRdlRcBy1g6WaqceZqV
	 Zct+Zx4lbaCAP1CzCemFiF8gfwYLxwJ3nNYTGg17BbaZ9E0RKpzJv6ZhCb4ccLPSFITRl
	 xokUZ3IgySk1WG8mjc88xBjRmbkYWXjeoNk3c8XQvTSibxuqsAdSaJ6OtljsrQU/UtQ==
ARC-Authentication-Results: i=1; smtp.kernel.org;
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest
 SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7761F1F01825;
	Fri, 23 Oct 2026 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792748318;
	bh=ivlu9gZUoZpAO3rDeEUhzGrJLnpEDAs/cTBRPWcuhG8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=HrL9TBoy80ZaW5AKCY59p6fLWAvUHDO7sjAZkwEC9sHWwV14uItPHG/nX8LW7pmZR
	 7j7qttlrhKJMp0nDGEHuYh/ja/l0bxmzk4yLUNLF0aD5M7Mi3TMx/DRXHgK+sRt5Jr
	 +e2YhBbt2CA2qn6+vM69NxvEVfLo/DRDvdbxSDVy+fbPM8oFpw9vcfnfglsfv7K97u
	 vp2G+CrPnvX2tBfUhLRzHHtItTteNN+k1pUX4NsNmITp/QvXpl80E1uUaxsyx6thqg
	 ubLPY4/mYWClGGnJI3noX8Tc03A11Sx/W8WLZ2jB+zd7WtbMftLQp6xC6ogg3SY8iT
	 w8ZmEt63V1A/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C7EA944457;
	Fri, 23 Oct 2026 09:38:36 +0000 (UTC)
From: Joe Finzel via B4 Relay <devnull+joe.sudmix.de@kernel.org>
Date: Fri, 23 Oct 2026 11:38:05 +0200
Subject: [PATCH] drm/nouveau/gsp: only handle GSP interrupts routed to the
 host
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261023-nouveau-gsp-irqdest-v1-1-5dd6131faa14@sudmix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtQA8muEi0kp5qNllMRSHdPW
 r7F/wWEMpPA0BTIdLNwihW6bWDefFwJOVSDUcZqZTqM6brJX7jKjpyPQHKiV712QVPwzkIt90w
 LP/91nN73A0eequxlAAAA
X-Change-ID: 20261023-nouveau-gsp-irqdest-a0819d1eda96
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792748316; l=4484;
 i=joe@sudmix.de; s=default; h=from:subject:message-id;
 bh=b17+26F2qy81a+KL88BTwZnr9eyzHZo5HKZat40hBY0=;
 b=MbIuyuHc8Or6oZda9Wk1YBS5NKVR+tSNgUAdhPdBE3ZtOClgBMW1X93E8PHSnTQpSFYVhTLo0
 mcivfq9ZJCuAIrUbRqoyhiYIYpa/MDhEK0WuDFxf8AcprRTcqtduk3G
X-Developer-Key: i=joe@sudmix.de; a=ed25519;
 pk=vaX11uVm57me/1N8otNmzMMnsE+f0U3/Hi9TCPbnvZM=
X-Endpoint-Received: by B4 Relay for joe@sudmix.de/default with
 auth_id=1151
X-Original-From: Joe Finzel <joe@sudmix.de>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LLIDZWXEHFZUY5RQC3OM6VH77BSVGPD7
X-Message-ID-Hash: LLIDZWXEHFZUY5RQC3OM6VH77BSVGPD7
X-MailFrom: devnull+joe.sudmix.de@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Joe Finzel <joe@sudmix.de>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: joe@sudmix.de
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LLIDZWXEHFZUY5RQC3OM6VH77BSVGPD7/>
Archived-At: 
 <https://lore.freedesktop.org/20261023-nouveau-gsp-irqdest-v1-1-5dd6131faa14@sudmix.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joe Finzel <joe@sudmix.de>

The GSP's interrupt handler takes every pending interrupt the RISC-V
IRQMASK enables as its own, without looking at IRQDEST, which says
whether an interrupt goes to the host or to the GSP itself. One that
belongs to GSP-RM, pending when the host's handler runs for the message
queue, is reported as unknown, cleared and masked off with IRQMCLR,
taking it away from the firmware:

  nouveau 0000:01:00.0: gsp: intr 00040000

NVIDIA's driver reads the interrupts routed to the host as
IRQSTAT & IRQMASK & IRQDEST (kflcnRiscvReadIntrStatus_TU102() and
_GA102()). Do the same, with IRQDEST from NVIDIA's register headers
next to IRQMASK on each falcon.

Seen once in a few boots on an RTX 3070 Ti (GA104, GSP-RM 570.144),
before the login prompt. There IRQMASK reads 0x01049042 and IRQDEST
0x01000040: 0x00040000 is enabled but routed to the GSP.

Fixes: 830531e94712 ("drm/nouveau/gsp/r535: add interrupt handling")
Cc: stable@vger.kernel.org
Signed-off-by: Joe Finzel <joe@sudmix.de>
---
 drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h  | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c       | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c       | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 4 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c       | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
index 341f133dc38..eb8adaf07fe 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
@@ -63,6 +63,7 @@ struct nvkm_falcon_func {
 	int (*select)(struct nvkm_falcon *);
 	u32 addr2;
 	u32 riscv_irqmask;
+	u32 riscv_irqdest;
 	bool reset_pmc;
 	int (*reset_eng)(struct nvkm_falcon *);
 	int (*reset_prep)(struct nvkm_falcon *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index d5126fe39d2..10e2813a016 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -27,6 +27,7 @@ ga100_gsp_flcn = {
 	.enable = gm200_flcn_enable,
 	.addr2 = 0x1000,
 	.riscv_irqmask = 0x2b4,
+	.riscv_irqdest = 0x2b8,
 	.reset_eng = gp102_flcn_reset_eng,
 	.reset_wait_mem_scrubbing = gm200_flcn_reset_wait_mem_scrubbing,
 	.bind_inst = gm200_flcn_bind_inst,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index b6b3eb6f4c0..96fa26fa612 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -140,6 +140,7 @@ ga102_gsp_flcn = {
 	.select = ga102_flcn_select,
 	.addr2 = 0x1000,
 	.riscv_irqmask = 0x528,
+	.riscv_irqdest = 0x52c,
 	.reset_eng = gp102_flcn_reset_eng,
 	.reset_prep = ga102_flcn_reset_prep,
 	.reset_wait_mem_scrubbing = ga102_flcn_reset_wait_mem_scrubbing,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 94925f1590e..463e463db24 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -64,7 +64,9 @@ r535_gsp_intr(struct nvkm_inth *inth)
 	u32 intr = nvkm_falcon_rd32(&gsp->falcon, 0x0008);
 	u32 inte = nvkm_falcon_rd32(&gsp->falcon, gsp->falcon.func->addr2 +
 						  gsp->falcon.func->riscv_irqmask);
-	u32 stat = intr & inte;
+	u32 dest = nvkm_falcon_rd32(&gsp->falcon, gsp->falcon.func->addr2 +
+						  gsp->falcon.func->riscv_irqdest);
+	u32 stat = intr & inte & dest;
 
 	if (!stat) {
 		nvkm_debug(subdev, "inte %08x %08x\n", intr, inte);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 11a37963bd4..823532758af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -420,6 +420,7 @@ tu102_gsp_flcn = {
 	.enable = gm200_flcn_enable,
 	.addr2 = 0x1000,
 	.riscv_irqmask = 0x2b4,
+	.riscv_irqdest = 0x2b8,
 	.reset_eng = gp102_flcn_reset_eng,
 	.reset_wait_mem_scrubbing = gm200_flcn_reset_wait_mem_scrubbing,
 	.bind_inst = gm200_flcn_bind_inst,

---
base-commit: fb26cf4f1df40a462ea65552a3fbcc8cfafab523
change-id: 20261023-nouveau-gsp-irqdest-a0819d1eda96

Best regards,
-- 
Joe Finzel <joe@sudmix.de>


