Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22E5C5B572
	for <nouveau@archiver.kernel.org>; Sun, 16 Aug 2026 13:09:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2F610E2E1;
	Sun, 16 Aug 2026 13:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GhWHg+2N";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5052947873;
	Sun, 16 Aug 2026 12:52:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786884769;
 b=TSvDhlP+QDddI2jRImcvwiER020x9acIuR8ChcdfeoIk5kJmiBSdDHQ+z5g5B+eb10im/
 SYGB+OJZXhcD7pNlopolw9H7hv/41mI/TWtyhI6hEljCKmHl3zdeRCRj8oubJ7iuaynbnYk
 sSNSn1d8LG98tnbBEI74QbqjJgmjoYfbaRBDnfMC8KUx9XdkyubJHStAxrqx4h/RO10OjmX
 orTNMrMgodxN8EfqYkUNEFFP9ApUqichpxG3cC6NGFDp4bK/Huf8WoXnYOuhrnJL6nAgegL
 c1YcTn5j8I/QtMsi7Fc9PbExdJoqsHncSBdVF+BrPDfZ8uBnymWq0Lobr9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786884769; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=N7ModForEGzdaliJRz1t1lN04ZfOQCHIzWf+H/xEqzc=;
 b=tohYGx9rgiYAKugXr2fYOeZvaBzzy5XD/z+IHgImDEMzle6+ggNyU3/I653NsUazUYUvA
 /eTG67MZM6pb7gpXaQ5ZadIV7Vv/sPfkJOyuLZGRAyO6sCVQ3w5u9EY12gf0ntD5/exPSz+
 hGLOlbCtBkTAACTt4hFre+cEsUug4z2/5z8sMzjSkSze4igxWi4bg3jseId4fmD7CWDSCgd
 ojiYkW3zsBZpeXLSfFj9pT+m/mbKtNZZZQAsG206YjXXb62Y7kmWBo6xKc/TR3QfQuWU4uk
 Hs5ZvdklDwra3mMhLzjEhuInInP+5NDfOXyK3E1I8SBL3coaS0sJmzYLrCHA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DB2B446D2B
	for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2026 12:52:46 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 07BEF10E2D4
	for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2026 13:09:13 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47f611b3af9so281117f8f.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 16 Aug 2026 06:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786885751; x=1787490551;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7ModForEGzdaliJRz1t1lN04ZfOQCHIzWf+H/xEqzc=;
        b=GhWHg+2N/Yo7HvZ1MFmG823ru4VwGApAomc6xkxJMeEKf8XVfNXoUP+tUYV/974LG2
         krL1ZRowm9EH8ycFSxquB+07aNiKxva75h1QIBoDc11UeTBb7S+Neol+OOeub3K2nf7m
         1xVfYU6sQ9SdktqXUyMhLIiPYCqyCJgzVBlb7Yi9ZnpnFaKu7ohEK2QFf2fvZFnpVpTf
         e3JrlA4QggGfJaxEzbrmAbeJ3xixVzzyYkl2gMi8890JSQCz7DIfRjn6+GJkArzlcaH5
         14W2d+TD3NSeCjd4ydbP0s+FGGT4inrKqjQ3QAxWcnb1QlXFMMbYQ7hDW7GSBcwlNQye
         b5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786885751; x=1787490551;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7ModForEGzdaliJRz1t1lN04ZfOQCHIzWf+H/xEqzc=;
        b=IDQmrD+CQqpEi4DRFzN9sEvSxbJ1C3S9y1K1E0rqcQn3w+PMa0CFydVZ5cxPAYSRPQ
         Igj+dH0VGPc8d/dawZFHID8UsxdhCMda6R60QDNNsYz6PS0LAZvznmODkX+snm8KsRn6
         IUzSp3YmstswgAiqxjPPUgBGc+Udf63ZuRtf4Emr1LwpdTF/4zWFxKI+yp+dpPf8BEG0
         fqVM7LbM3BjP0pVTPXG9SEl1w6cDdC6paDlwt6hU9FRm+Qzmiv4vtjaJi9S2PVNH6sXM
         tMF2TgyFFtgWuSD7jqpYQZF9rC2jwx7hze2bwzWgxWrgyVr45hnUVAJy8bFUPKNK8W8x
         X4Ng==
X-Gm-Message-State: AOJu0YwOFQTxkq9HgkKzRYDj5zweUSxK1fiw9qkc0C15cmcf+xvkxU3u
	dSjs1VcdaiPd4Q304k3+y0DRSxvstu02eLKM4YI5NQFe5hli1HSHdY7M0NLkTzan
X-Gm-Gg: AR+sD13eSPe2/U+urwnR7e+N5xC7ZckWMw54GnPl8g/nfpvrAT0Bd3Ko0UvN9EqgGua
	0v5njfLbeXkHgwFf5OM8bjfYqeuIYZIKLR3RK8WJgR369+CaTzgwrEqIDXEl2kKFz76TKCUnAkQ
	cAEnyLkuhc1sHhbSv7Sa+aCQVsg6XdOFRURQGBzcGHciyd4Ej0+ZviJdS1P5lmmDU2RDhN5YdgP
	xxlHmAArBdE38OcuPPxTihabBt79f4KgvOAtYT+epNADwJkCW8Hqg9V+78VoxpeP6Vg49ym2JG+
	wNcTZx95PKN9mdVjShzNzy0+agWJxv/Q3LJhwsiK5KD9BtAV7pWFK0yy0V3r3I9XAK7xPa3zUwk
	ez5QA1sj6NuexX3ZB6/lCyuH+/QpdBXTjT+Nh5cgcqyWiyi6a///QyqVCX4+Dh1TAB3/EENDVkc
	/QaeoI3tjzOPP5IXToLf0bmKEHLRHa5JB6s22xJ4//m6ucl+HrTJRikR4o8KvxUblbdKDHjpK26
	5w2xEEjnhLO8mrRJ9Ms1AYlIT79xOO6Qww0opijiQ==
X-Received: by 2002:a05:600c:1385:b0:496:c249:ddb1 with SMTP id
 5b1f17b1804b1-499879759bbmr135946405e9.4.1786885751312;
        Sun, 16 Aug 2026 06:09:11 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996105c0bsm66548375e9.4.2026.08.16.06.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:09:10 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: 
 [PATCH v4 2/2] drm/nouveau/kms: guard NULL crtc in nv50_sor_atomic_disable()
Date: Sun, 16 Aug 2026 15:09:04 +0200
Message-ID: <178688574402.522643.5471719764843371376@gmail.com>
X-Mailer: python-smtplib
In-Reply-To: <178688574400.522643.6695278742335367229@gmail.com>
References: <178688574400.522643.6695278742335367229@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID-Hash: 5SF5ES7R5Y6NFDZHNHXACVUAG3VDOJUW
X-Message-ID-Hash: 5SF5ES7R5Y6NFDZHNHXACVUAG3VDOJUW
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5SF5ES7R5Y6NFDZHNHXACVUAG3VDOJUW/>
Archived-At: 
 <https://lore.freedesktop.org/178688574402.522643.5471719764843371376@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

nv50_sor_atomic_disable() unconditionally computes
nv50_head(nv_encoder->crtc) and dereferences the result a few lines
later.  nv_encoder->crtc is nouveau's own shadow pointer, set in
.atomic_enable and cleared at the end of .atomic_disable.
Commit f575f2bdb6c3 ("drm/nouveau/kms/nv50-: Remove (nv_encoder->crtc)
checks in ->disable callbacks") removed the NULL check here,
reasoning that the atomic helpers never call ->disable without a
crtc.  On NVAC (MCP79) under Wayland sessions (observed with Weston's
DRM backend and with labwc/wlroots) we have hit the NULL case in
practice during session teardown and VT switches: disable runs without
(or after) its matching enable, and because nv50_head() is
container_of(), the NULL does not stay NULL but becomes a bogus
non-NULL pointer, so the subsequent head dereferences fault and the
kernel oopses.

Restore the guard, as drm_WARN_ON_ONCE() instead of a silent return:
a NULL crtc here still indicates a state-tracking inconsistency that
should stay visible.  Return without touching the output; in this path
either enable never ran (nothing to tear down) or an earlier disable
already did the teardown, and the encoder release is handled by the
commit_tail release loop in both cases.  (That loop then rejects the
release of a never-acquired output with -EINVAL in the nvif layer,
which is harmless; the vanilla code oopsed before ever reaching it.)

The same inconsistent-state path can also leave the encoder without an
old connector state, in which case nv50_outp_get_old_connector()
returns NULL while the backlight teardown dereferenced it
unconditionally, so the oops would only have moved there.  Hoist the
guard above all of that and look at the old connector only after
checking it.

Fixes: f575f2bdb6c3 ("drm/nouveau/kms/nv50-: Remove (nv_encoder->crtc) checks in ->disable callbacks")
Cc: <stable@vger.kernel.org>
Tested-by: Fab Stz <fabstz-it@yahoo.fr>
Assisted-by: Claude:claude-opus-4-7
Assisted-by: Claude:claude-opus-4-8
Assisted-by: Claude:claude-opus-5
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 30 ++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 364227f5456f..f532b0ed8880 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1565,16 +1565,36 @@ static void
 nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_commit *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nv50_head *head = nv50_head(nv_encoder->crtc);
+	struct nv50_head *head;
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
-	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
+	struct nouveau_connector *nv_connector;
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-	struct nouveau_backlight *backlight = nv_connector->backlight;
-	struct drm_dp_aux *aux = &nv_connector->aux;
+	struct nouveau_backlight *backlight;
 	int ret;
+#endif
 
+	/* nv_encoder->crtc is the driver's shadow pointer, set in
+	 * .atomic_enable (and by the boot-time hardware readback) and
+	 * cleared at the end of this function.  NULL here
+	 * means disable-without-enable or a double disable; bail before
+	 * container_of() turns it into a bogus head pointer (checking the
+	 * result would not work, container_of(NULL) is never NULL).  The
+	 * encoder release is handled by the commit_tail release loop, so
+	 * there is nothing to clean up here.
+	 */
+	if (drm_WARN_ON_ONCE(encoder->dev, !nv_encoder->crtc))
+		return;
+	head = nv50_head(nv_encoder->crtc);
+
+#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
+	/* The same inconsistent-state path can leave us without an old
+	 * connector state, so check before touching it.
+	 */
+	nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
+	backlight = nv_connector ? nv_connector->backlight : NULL;
 	if (backlight && backlight->uses_dpcd) {
-		ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
+		ret = drm_edp_backlight_disable(&nv_connector->aux,
+						&backlight->edp_info);
 		if (ret < 0)
 			NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
 				 nv_connector->base.base.id, nv_connector->base.name, ret);
-- 
2.54.0

