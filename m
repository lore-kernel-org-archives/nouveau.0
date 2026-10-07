Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90D9CA5FFC
	for <nouveau@archiver.kernel.org>; Wed,  7 Oct 2026 15:06:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 824E610E5D6;
	Wed,  7 Oct 2026 15:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="L6UDcIG0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C411B460BC;
	Wed,  7 Oct 2026 14:48:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791384511;
 b=rRXUReTajuRXOhh8AtybAGU9KMud6RHKno5irPGJ+ntRBYdRW+aFZKKPwhLRlIxJJ1duG
 OMBP0IyC5bINxXg/ItGNxfb1zoHjmJc0mHf6ZvU/KBG83RCCM+FGRry+Lq1PUZ2NxUiXTuW
 dTBs0APpSUXqBouj/ughqeeuXs6uOYLD8afLfxaqccQMsusEk9byE+xKXFW159zlVAjn73N
 qnTYWdZsx3dw2i9P9FQATy5uLAZ63XQMPwkG32rYWBuYYRmWy06IlBI0yyCPmpPyFkaUQnY
 R7JlPih3cYyf4dxR+0IGkjDLxPvPYaDemYDpP3OfhwcCHFChMvfUCHaxSNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791384511; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DOJ+U00SQUr8WtqW1eYXxWRmcTZQxyCqqDPj+vlUgm8=;
 b=fMuOp2BUyky8/HsJu5rHFPpXgkNVMXQ/ca7lFR+vr5Ljj8U/CbgBBfe/nADEWNiokB2eM
 AzLvatVZCQURHKRn+zMf9jYot3aClG/ViR8Djf3eZDkVEVENxtqcI8GhyyWgVl4ucGaK7fk
 +eBly5juL2ue+NDqby4DHo5E05inp0JKv1fU0pAQTMfBrIZL3sim+0wdHwBknLLnmbXu7WP
 RXbqkw7kGZeKwFfbe81DaqUQJM+e3BkznM57ugDi8XPtrS6frkpGX1jEFIIAf9XmuzQeH7i
 N4cDy04T8fK9IjlOv2fm8ZsOHYcJNIDbgDb9n4NudS/M3n89+m/leTiIfEsw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=mary.zone;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=mary.zone
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=mary.zone;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=mary.zone
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1F29E4204A
	for <nouveau@lists.freedesktop.org>; Wed,  7 Oct 2026 14:48:28 +0000 (UTC)
X-Greylist: delayed 2166 seconds by postgrey-1.36 at gabe;
 Wed, 07 Oct 2026 15:06:49 UTC
Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 18B9710E204
	for <nouveau@lists.freedesktop.org>; Wed,  7 Oct 2026 15:06:48 +0000 (UTC)
X-Envelope-To: nouveau@lists.freedesktop.org
DKIM-Signature: a=rsa-sha256; bh=k9AnQ5XvJt8ZcIfhZU8VWP5jz5T3cT4ex6UF/oaPJlM=;
 c=simple/simple; d=mary.zone;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791385607; v=1; x=1791990407;
 b=L6UDcIG0uNhUrf+qOoe2VmAvqnrErGnn0CGaRfaUBNEukNeR1qrR9jKppj4iuvmsGmA8R/2Q
 7XajkA1wpHVnZEqiCk/PSpHjG49QIoo27cibfvPeyoqzaXaAstFalJdVM/itXTJk4N7TjDeht7B
 5SQM5LOrp+lvmvHPw5p1lyGawmRpks/99BCJt0rf/k7o7sAdbC8BhUYMYVah7ecfUVD5hV/utdh
 xdEEnsyhDEEzj/hRGDCnwRrYTe4UCAmVVms7woXKXVW0DjWbX68iqbML02j6L2+TPJgytQjCgAA
 RlWi5S1+dMbSsIJiVqc2fzZdJEftoEPorDYKJ5ya8AtaQ==
X-Envelope-To: nouveau@lists.freedesktop.org
Received: by smtp.migadu.com with ESMTPS id c8ba96c4795c968d;
	Wed, 07 Oct 2026 14:30:33 +0000
X-Mizu-Trace-ID: c8ba96c4795c968d
X-Migadu-Flow: FLOW_OUT
From: Mary Guillemard <mary@mary.zone>
Date: Wed, 07 Oct 2026 16:30:15 +0200
Subject: [PATCH] drm/nouveau: Skip the Turing CE workaround object for
 non-GR channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-turing-async-ce-fix-v1-1-12ee6ccd1a3c@mary.zone>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bkFFkvpKdBDdbC8WWlGEf086z
 sDMC4UyU4FRvJDp4sJbaqA6AX51KRJyaAxa6l5JafE4M6eIrjzJoydc+EajSdmBtA3GQSv3TE3
 /12mu9QNVwD9XZQAAAA==
X-Change-ID: 20261007-turing-async-ce-fix-42e179e27d4a
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
Message-ID-Hash: TXILTQW5H6WWQCC7W6CWGC7FYG4RZCNT
X-Message-ID-Hash: TXILTQW5H6WWQCC7W6CWGC7FYG4RZCNT
X-MailFrom: mary@mary.zone
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TXILTQW5H6WWQCC7W6CWGC7FYG4RZCNT/>
Archived-At: 
 <https://lore.freedesktop.org/20261007-turing-async-ce-fix-v1-1-12ee6ccd1a3c@mary.zone/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This workaround is here for the old Gallium driver and predate async CE
and NVDEC.  Instead of only skipping it for NVDEC, let's only apply it
in case of GR channels.

This should make async CE work properly on Turing by stopping the assign
of a GRCE. (here CE0)

Signed-off-by: Mary Guillemard <mary@mary.zone>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index e907c1d07887..e876f154963d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -488,7 +488,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 			goto done;
 		break;
 	case NV_DEVICE_INFO_V0_TURING:
-		if (engine != NV_DEVICE_HOST_RUNLIST_ENGINES_NVDEC) {
+		if (engine == NV_DEVICE_HOST_RUNLIST_ENGINES_GR) {
 			ret = nvif_object_ctor(&chan->chan->user, "abi16CeWar",
 					       0, TURING_DMA_COPY_A, NULL, 0,
 					       &chan->ce);

---
base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
change-id: 20261007-turing-async-ce-fix-42e179e27d4a

Best regards,
-- 
Mary Guillemard <mary@mary.zone>

