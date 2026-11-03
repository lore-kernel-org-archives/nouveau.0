Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C8D606A329
	for <nouveau@archiver.kernel.org>; Tue,  3 Nov 2026 19:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wo41QOxd
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F04B10F7EF;
	Tue,  3 Nov 2026 19:28:32 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5C96B48CEF;
	Tue,  3 Nov 2026 19:09:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793732942;
 b=fy1oddyp8ZZZwJZ5YgPnmZudLZRz8/2hQXHnJJ+tFNsRSQJW9SZLosb28H+mc6jWbeuLO
 Vv+4EzMa8J1ZTYRbzBd/4nZ5X4BmcIgMQbt86FLJZQzW/bPAAdfWs3RKb33TJjNLMR6m2ch
 O4CEPT2ZHe0E/aNYQmm4ZXtQQ5tFhx4T0VLV+c9PQYIKD51VP+JHGvH+mLd1XXUa4JM6pgL
 FsIA4IyGzd38CjaXRW2HjIs0+iM8mL161A0gJ8ovSk5TFUwVp0wKWt/YCfGN23oh6kEPAEl
 2gsgnbufR53KyliClkLF72nm1/SS+toYeYPLlbbjFJgwnFajq3nPLPGCPQMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793732942; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zuEYFaLmVg/iLLrHIfXW07NtXiDvrmAt5+qGwHGIFjg=;
 b=m6FQwGIm+eIcYtn7WLPMdOMRVVVWnkc8owIl0/T1K6luUhrn+qwCPH+q25daE/2NW30eC
 lKioohoBRQOAALMSPY/1qY6WzadJWI//PNW8L0IIlJhGEwMMid9aZXZYsqqB67lD7w1wLI9
 13Y30CmZv3F28W6yLpGZLCxlVkgiBwEwk1PQ5Nt15byf6MymV/OLPM8OoF/CEtsfRQsWsfv
 m0kCBZxbWBmLj896+saDfX5Ln4Al5OM0hxs/573n3TA9nl809kkAYH9ATQ2qgPMkmdlBZ+1
 acJaB8geRkkOsn3OmLs7Oov3yhcCyzecUZORga3GeiDkzqTiqVYq1wwHyDiQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=pass;
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=pass;
 dmarc=fail (Used From Domain Record) header.from=kernel.org policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3999048CD4
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 19:08:59 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9E44710F7B5;
	Tue,  3 Nov 2026 19:28:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C114160136;
	Tue,  3 Nov 2026 19:28:14 +0000 (UTC)
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793734094;
	b=s37wJa9wG6OrxU+wBgaXf1Gzhum0+lRqHgxnKl6bDmSIRyImtOWZFX4huxpgyaoWEOGk
	 D/Tlj5LIN+b4r0CYISQ/oZcuGnBR3WPW9jWShSQNBvs2BUF6HyxM4b8e++S+Ipa+yLru3
	 xPs8GAMUJaHwET1A85dqNRKX6wE5nBfg1I7hl90vGexvXwJy+IbG/LNp1D7kO21bUaooa
	 vR2tC1JJk4l2Z53rgT+PRRhIt4TJ6PXjIZluYIeEcF4VRKtmgb9M1mbGW67LCiaRj0nuX
	 AP37Au8TMdX3qRPaJaDffG0Hpa6elsl6rUgbFP2MhoAmCgDf7WNpwJlY9S9xrOgDUzQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793734094;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zuEYFaLmVg/iLLrHIfXW07NtXiDvrmAt5+qGwHGIFjg=;
	b=rgHCy1kTaBIt7i4IbQZbqiSVlERciky/wXR5uafixBwTYRTAd4vSiT/0hlR6v5KBiJvd
	 seXH3eD+5MtGWpEP0sjaeCPLc4AdYnsnjbrl9CLwcD9AkmWHoDIP8vvdHejrcKMiGuNZc
	 AzjpO4lS1NxruLOeyfhsxN8VA9vmQcSvBbVmLWd3QJRci8n/nWkDGiWLhlRBcTtYs3mlP
	 5YCVlVnhymqKEUAu8brLLY8pPQapoElQF5bqWf+xKLdZ50yT8xFReUk/FmR9hz0EYCnTb
	 j2nd4WyLzl5S/fKCsLcl7aR+hAFn8j+N9Xafn3IrMDxsTA5V+HZUl8hTq1SMo767a9g==
ARC-Authentication-Results: i=1; smtp.kernel.org;
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest
 SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 650501F0093A;
	Tue,  3 Nov 2026 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793734094;
	bh=zuEYFaLmVg/iLLrHIfXW07NtXiDvrmAt5+qGwHGIFjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Wo41QOxdi+Rx0EvCtXi4Xw52XSVPn24QYzz6gsylsm2M2rDeytrR1NG3IkPKmAtb2
	 WL7fB/E2mZrTbREqym+kUtCopGoKYqav1np4jE2NUyJu1Ca2/xNwJW4+W52Pi7hlRQ
	 484uCrS+/AbwkMolrZIxiYvQu/Iag6/DbsBzl1YSH1bEJ89XmvgxMPssExYFjd4cFR
	 fRLqZPyBLmGwccCHm5j9WPJZN42e1Rc49pYTzjgtnxTf61ZBa/fkaGxg3OulbO99HC
	 78divx2sfqf37ZZpiRjHVcfPB1Mnb5PgGVMUz5YnmZAOVFV83od4sYHBfKLcKQ/72Z
	 kb4o7xpyAd9Mw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E274C46AC7;
	Tue,  3 Nov 2026 19:28:12 +0000 (UTC)
From: "David R. Hedges via B4 Relay"
 <devnull+linuxdev844.thelittleman.net@kernel.org>
Date: Tue, 03 Nov 2026 13:28:02 -0600
Subject: [PATCH 2/5] drm/nouveau/gsp: don't report failed DP AUX transfers
 as completed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-nouveau-dp-fixes-v1-2-892f4bd357cd@thelittleman.net>
References: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
In-Reply-To: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793734092; l=2363;
 i=linuxdev844@thelittleman.net; s=20261103; h=from:subject:message-id;
 bh=VnhFFCJgwU5i55xG5SnKSfbRyrndYBR8/9ZzNzwvcvc=;
 b=FvGKLCExeTq/wzKIWyYwo1rYcl1ZNPwjfmlGJ9iRJBjjjUCu0eUeEa1Bfv5QXetBKXpDgnJXF
 yayxYdUuTsrDUdBzi3pocWEpW6KG++byU15FYqnfgrHstlChLrGGO5h
X-Developer-Key: i=linuxdev844@thelittleman.net; a=ed25519;
 pk=Cynzuei/w0GLdh3LuNJdvH7aaszLrHSxY5UyujS7l+g=
X-Endpoint-Received: by B4 Relay for linuxdev844@thelittleman.net/20261103
 with auth_id=1397
X-Original-From: "David R. Hedges" <linuxdev844@thelittleman.net>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OKLRTTH3QIUVTPVFYEDIO7Z44VEEUHJF
X-Message-ID-Hash: OKLRTTH3QIUVTPVFYEDIO7Z44VEEUHJF
X-MailFrom: devnull+linuxdev844.thelittleman.net@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "David R. Hedges" <linuxdev844@thelittleman.net>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: linuxdev844@thelittleman.net
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OKLRTTH3QIUVTPVFYEDIO7Z44VEEUHJF/>
Archived-At: 
 <https://lore.freedesktop.org/20261103-nouveau-dp-fixes-v1-2-892f4bd357cd@thelittleman.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "David R. Hedges" <linuxdev844@thelittleman.net>

Commit 9776c0a75a1a ("nouveau/dp: handle retries for AUX CH transfers
with GSP.") put the NV0073_CTRL_CMD_DP_AUXCH_CTRL call in a retry loop
and dropped the check for the call failing.  When RM fails it with
anything other than a retry request, r535_dp_aux_xfer() ignores the
error and returns the reply fields as if a transaction had completed:
replyType becomes the AUX reply, and size and data are copied out.
NVIDIA's own DisplayPort library (EvoAuxBus::transaction() in
open-gpu-kernel-modules) treats a failed AUXCH_CTRL call as a NACK and
ignores the reply.

RM does fail these calls.  On a GA102 with GSP-RM 570.144, replugging
a DP monitor that hasn't come back from DPMS off produces bursts of

  gsp: cli:0xc1d00001 obj:0x00730000 ctrl cmd:0x00731341 failed: 0x0000ffff

(NV_ERR_GENERIC, occasionally NV_ERR_INVALID_DATA), one per AUX
transaction, and the DPCD and EDID reads made during a burst are
judged on whatever the reply fields happen to contain.

Return the error from the control call again, as r535_dp_aux_xfer()
did before the retry loop was added.

Fixes: 9776c0a75a1a ("nouveau/dp: handle retries for AUX CH transfers with GSP.")
Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/drm/nouveau/-/work_items/515
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: David R. Hedges <linuxdev844@thelittleman.net>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index f5f22173fc2c..953392504413 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1101,9 +1101,12 @@ r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *psize)
 			msleep(ctrl->retryTimeMs);
 			nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
 		} else {
-			memcpy(data, ctrl->data, size);
-			*psize = ctrl->size;
-			ret = ctrl->replyType;
+			/* The reply only describes a transaction if RM completed one. */
+			if (ret == 0) {
+				memcpy(data, ctrl->data, size);
+				*psize = ctrl->size;
+				ret = ctrl->replyType;
+			}
 			nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
 			break;
 		}

-- 
2.55.0


