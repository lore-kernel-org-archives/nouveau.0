Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84127C5DF94
	for <nouveau@archiver.kernel.org>; Mon, 24 Aug 2026 14:30:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 47A5810E5E6;
	Mon, 24 Aug 2026 14:30:31 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2C1BC47B75;
	Mon, 24 Aug 2026 14:13:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787580827;
 b=O1vZhvpPMxf054vNJSjvyirhhNxK4cDm/hXHE0mwIzkSoY0FHK1PzTHJFCbci0Ll8d+Oa
 Mg/gXgKI9mw/t5lukCudTobIpWb8pgH9hzgXTyFWhxSgBUKw2XBMbPCM09iZTnKidzDqgBl
 CBjyhOhbMkQHFrc6hk0voQuNo+p2SamZF1IwgvCWCAkp6o5rkbPXhQuc8U1cRK15801A4k+
 3YkWLTpkOMJWXWKTRMgYC1pTJJ3usv3mdQ4Ig4ZNTB9xVY0m+JIqcW1TXqb01Papp/NX6kn
 yISKiBQ7EKWlMfF1Ai9IAYZuxLbvSItesSSd1oeChFxp/QWx5xs0OdG+Jpmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787580827; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xjdlRm1DLNTvebAlSuRH1YR8HaAs2bnotkvt55KK5UE=;
 b=rqFoC8EI73jPcCTCimmQ7iL3ko5dhBmSCxfx2zbF/w1UXGJ+98Y8tQMLJeu3ri/QORf+n
 f5awRshq1KSyBu7SEMwJsaZOLMbubaFYZbO51OZkWZ0/YXM8TF/t52aHGyRg0Fzv4nTrcPo
 GD6GBkvjUSFXFOUGA+htwavnRpbOFVXl72iSzRpjglWk8ToO5vBts8bcxEAbcINk3lCU3WD
 MxGY2p9C1KCZV7/1iw4ak34NQm/hrF/fEi9YAk3ycxHOZ1D18+OdF4Malc2GIXkwIAfgfzr
 NA3QlhWC24kxfiBU+tMO0Orf1VM42MRWhL6LFuNwinOrYPdk2zfCGN968LRQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AE36840310
	for <nouveau@lists.freedesktop.org>; Mon, 24 Aug 2026 08:30:24 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C40610E078;
	Mon, 24 Aug 2026 08:47:07 +0000 (UTC)
X-UUID: 5ed47f549f9811f19a56ed5b684f684d-20260824
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f1e870b5-aaff-41aa-a8fe-45225e0d5b77,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:2095486799bd2b801d36fc10b4a86360,BulkI
	D:nil,BulkQuantity:0,SF:102|136|865|898,TC:nil,Content:0|15|50,EDM:-3|-100
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5ed47f549f9811f19a56ed5b684f684d-20260824
X-User: liupeng01@kylinos.cn
Received: from t14 [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liupeng01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1071178855; Mon, 24 Aug 2026 16:47:00 +0800
From: liupeng <liupeng01@kylinos.cn>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: Fix typos in comments
Date: Mon, 24 Aug 2026 16:46:56 +0800
Message-ID: <20260824084656.45328-1-liupeng01@kylinos.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: liupeng01@kylinos.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 5PBDWVTPZCUAGP4AIO7JVLCLDF3WNLXD
X-Message-ID-Hash: 5PBDWVTPZCUAGP4AIO7JVLCLDF3WNLXD
X-Mailman-Approved-At: Mon, 24 Aug 2026 14:13:45 +0000
CC: liupeng <liupeng01@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5PBDWVTPZCUAGP4AIO7JVLCLDF3WNLXD/>
Archived-At: 
 <https://lore.freedesktop.org/20260824084656.45328-1-liupeng01@kylinos.cn/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Fix misspellings of "overridden" and "particular".

Signed-off-by: liupeng <liupeng01@kylinos.cn>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 38032bb95826..10cd606d01b9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -323,7 +323,7 @@ get_fp_strap(struct drm_device *dev, struct nvbios *bios)
 	/*
 	 * The fp strap is normally dictated by the "User Strap" in
 	 * PEXTDEV_BOOT_0[20:16], but on BMP cards when bit 2 of the
-	 * Internal_Flags struct at 0x48 is set, the user strap gets overriden
+	 * Internal_Flags struct at 0x48 is set, the user strap gets overridden
 	 * by the PCI subsystem ID during POST, but not before the previous user
 	 * strap has been committed to CR58 for CR57=0xf on head A, which may be
 	 * read and used instead
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 55691ec44aba..06488c79f1a4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -531,7 +531,7 @@ nv50_dp_mode_valid(struct nouveau_encoder *outp,
 	const unsigned int min_clock = 25000;
 	unsigned int max_rate, mode_rate, ds_max_dotclock, clock = mode->clock;
 	/* Check with the minmum bpc always, so we can advertise better modes.
-	 * In particlar not doing this causes modes to be dropped on HDR
+	 * In particular not doing this causes modes to be dropped on HDR
 	 * displays as we might check with a bpc of 16 even.
 	 */
 	const u8 bpp = 6 * 3;
-- 
2.53.0

