Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202BE606A32C
	for <nouveau@archiver.kernel.org>; Tue,  3 Nov 2026 19:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7dlbEIg
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F39ED10F7E7;
	Tue,  3 Nov 2026 19:28:31 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 165D648CD2;
	Tue,  3 Nov 2026 19:09:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793732941;
 b=BWzaa6qkqTO8y7UnGQm7asHf+Jbm528b+anRq+SNImWlsztkM3eWf5abpWQQAhfIXQY2E
 OEnompGIT7TgkWRt3XrESuQhRqm3NCcIbqxk8WBRdfarxNzvKZ2WzzBnLlHFF+0csehGRaL
 kCa5lCZ6gNrN6QOQYJ59aiAYE4Y5sFGc3HdH/imvuyuoG585+I8EiFn0aNY4pL1smBhzNqd
 7U7U8sVr70+XFHtp0A57gPlr4bZRV09pZe99ju68dul+eTbqM/b9rJ/6wJZ5cbLQiUam7Q4
 unfn6PWArG6Jp0dXax5+aXybcHmD2q6ZLcpg3ueVeJ7RQ57X52WI0a/k50cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793732941; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jDqMXdXQV0seI/2seqMLVAg1/wTaKczEtza/EKhX4/8=;
 b=jJUEeqRHOQ5B+VF0lWoyhFN6rOWsFHXCU+25nfSGk1dmmsBogabgZiLbeL+GEOAhUwJsa
 QJcTOy2LqviL/OjqQXYUldZikLmQERGlrJX8SQxrISBb/qdj4EyAlKB14dJQQwWsRNANvA+
 khw2c0bY+Xh2/UHu3K6So7lscsw1MjaHPOprPEHslk/OTfBM/IL/PjGfY2DU1yRvw6qeCwi
 MG2i69HVq9Kwk/tX60O3Wh7h5Wi736KzPxCw7qcpjhn85yMonJtmt9awP8Q7UQ4kIGqtI+z
 zI35UV88PSLgE08kwxCnTtwfcscz9PURULY0uWuTiVlctEbiRzh0iS0F5n/A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=pass;
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=pass;
 dmarc=fail (Used From Domain Record) header.from=kernel.org policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 70CD748CD3
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 19:08:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ED8EA10E823;
	Tue,  3 Nov 2026 19:28:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE80743F83;
	Tue,  3 Nov 2026 19:28:14 +0000 (UTC)
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793734094;
	b=ap60G6Cd7mtdu1rmzfleyxgVXo8lQaAs394OLt2BmzsaN2E2BhQZ2pCGHcrIw81JyLbb
	 +Xz43q5pRoyW+Vv4Tko/77E8+irkDoqUlcQhNQPmnCOpYHlres/9UFMLlAy31i9TKUha4
	 8t/RrKLOL+jOHdagQO45pR1ctS5hKMeJemYCpQka7NSvXIZhVqQf7z4KVJqsmi0+FB4ZD
	 7lgVtWRL8jufGjU3dTn5VzofAe1Q8a0R5RoiUa1jkBPbnklF5//S79p4QzIxrxJv29pGY
	 ckuuDiSvcjUln1A98EPQaYyEIosvCDBhY3l4bxqLDObhmPrqnD4FJ4ulAxvAt0KZIRw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793734094;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jDqMXdXQV0seI/2seqMLVAg1/wTaKczEtza/EKhX4/8=;
	b=nUsxM1RH3lX1anJe5wnz/iZe6VM5XQOdrkkYewyCTeyU94ix3ckAnJSSc8SyZtsr0sFm
	 QEnNWxUr+wfn09mkrsDcUB4tEZHwqOvFR+WO7ynA2FeNO2LhRjp/Zc8L3IGw21n+moS39
	 Pt6BMCxbFSJbp+VpXh1qiUlrGifR3W2wOW3G9x8VF4hCPHeBN8gzciGC/DSEHYEAao/y7
	 FtQ4dwfssR20dfs/9iUeA8CqSsKqng+WuFHIRhiPPKAKIMXOk0LxILcU5q4N7FpjbxEjB
	 f8zV+hp2wTXNC9RHp3OSSpaljpZi7Dgxm/m+CiUxvibqyEmSaTvYBzEr+CV7I3tm+1A==
ARC-Authentication-Results: i=1; smtp.kernel.org;
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest
 SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DA711F00A15;
	Tue,  3 Nov 2026 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793734094;
	bh=jDqMXdXQV0seI/2seqMLVAg1/wTaKczEtza/EKhX4/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=D7dlbEIgpIBkyckbED1ncwxJoSTK6DfnMJu/0DbfggsjLC9i2ANjHHFHuu7w2ogLa
	 EDs5/qwyqnB7ZlvL+dJddv+CEoDDc3cN90Ua/B7jHPGCtIZ508SS8GwHc8mqPKnMpC
	 fW/r3GDPfRDndANDpeXzYiXv1m6seZtzFtxGiOs7coHuzmOg8FxlraqlXFvRaSDywa
	 dAVmkj+no59YlgTAwc/jUR4ZX3sufVJ0jBogVR6N1SKM2rr3sLMxtZlH6rAzSyFm8V
	 SiceVfrXdM1QeCQPdEcaVP4Es2FQnfaj4v583fkvjf/dQuAIJdz+ee44fLtTgJXNQr
	 fBKGDxD1sn7sQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0783146ACF;
	Tue,  3 Nov 2026 19:28:13 +0000 (UTC)
From: "David R. Hedges via B4 Relay"
 <devnull+linuxdev844.thelittleman.net@kernel.org>
Date: Tue, 03 Nov 2026 13:28:04 -0600
Subject: [PATCH 4/5] drm/nouveau/kms/nv50-: don't drive outputs at 0 bpc
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-nouveau-dp-fixes-v1-4-892f4bd357cd@thelittleman.net>
References: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
In-Reply-To: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793734092; l=2679;
 i=linuxdev844@thelittleman.net; s=20261103; h=from:subject:message-id;
 bh=Y8v/DP3NOf5boFL10j0leqHt5FR44DRl4gjR9gPSoac=;
 b=+gfw9HJYdTUWBbNvL/5bE6j3pQ5M2dXlma30T3x0/6svDsBcr376nzMJYo9HEWDj21DWbIhVB
 W5lYu0HUogyD3E8e+nQnlm5I3q1zaW67LFVgvN5alhEUva/Mr8gOH9q
X-Developer-Key: i=linuxdev844@thelittleman.net; a=ed25519;
 pk=Cynzuei/w0GLdh3LuNJdvH7aaszLrHSxY5UyujS7l+g=
X-Endpoint-Received: by B4 Relay for linuxdev844@thelittleman.net/20261103
 with auth_id=1397
X-Original-From: "David R. Hedges" <linuxdev844@thelittleman.net>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: X5YKOUDARFLK2Z6MMK4YYI7PHUXTN7EJ
X-Message-ID-Hash: X5YKOUDARFLK2Z6MMK4YYI7PHUXTN7EJ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X5YKOUDARFLK2Z6MMK4YYI7PHUXTN7EJ/>
Archived-At: 
 <https://lore.freedesktop.org/20261103-nouveau-dp-fixes-v1-4-892f4bd357cd@thelittleman.net/>
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

When nouveau_connector_detect() can't read an EDID it clears the
connector's EDID, which resets display_info.bpc to 0.  A default is
only filled back in by nouveau_connector_detect_depth(), from
->get_modes(), so if the HPD worker's probe loses the EDID and
userspace commits a modeset before it next fetches the mode list,
nv50_outp_atomic_check() sets or.bpc to 0.

For DP, nouveau_dp_train() then computes a minimum link rate of 0, and
nv50_sor_dp_watermark_sst() computes 0 symbols per line and fires

  WARNING: drivers/gpu/drm/nouveau/dispnv50/disp.c:1678 at nv50_sor_dp_watermark_sst.isra.0+0x2ab/0x2c0 [nouveau]

This was seen on a GA102 right after "DDC responded, but no EDID for
DP-3" from the HPD worker, while replugging a DP monitor.

Fall back to 8 bpc when the connector doesn't provide a value, which is
nouveau_connector_detect_depth()'s own default for outputs that are
neither eDP nor LVDS, and do the same in nv50_msto_atomic_check(),
which takes or.bpc from the MST connector the same way.  Calling
nouveau_connector_detect_depth() from ->detect() instead isn't an
option, as for LVDS it depends on the native mode that ->get_modes()
sets up.

Fixes: ac2d9275f371 ("drm/nouveau/kms/nv50-: Store the bpc we're using in nv50_head_atom")
Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/drm/nouveau/-/work_items/515
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: David R. Hedges <linuxdev844@thelittleman.net>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 2c66e480b511..a265fd971c99 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -418,8 +418,11 @@ nv50_outp_atomic_check(struct drm_encoder *encoder,
 	if (ret)
 		return ret;
 
+	/* display_info.bpc is reset to 0 when a probe loses the EDID, and
+	 * isn't given a default again until ->get_modes() runs.
+	 */
 	if (crtc_state->mode_changed || crtc_state->connectors_changed)
-		asyh->or.bpc = connector->display_info.bpc;
+		asyh->or.bpc = connector->display_info.bpc ?: 8;
 
 	/* We might have to reduce the bpc */
 	nv50_outp_atomic_fix_depth(encoder, crtc_state);
@@ -989,7 +992,7 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
 	if (!state->duplicated) {
 		const int clock = crtc_state->adjusted_mode.clock;
 
-		asyh->or.bpc = connector->display_info.bpc;
+		asyh->or.bpc = connector->display_info.bpc ?: 8;
 		asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3 << 4);
 	}
 

-- 
2.55.0


