Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B381ACD98D1
	for <nouveau@archiver.kernel.org>; Thu, 11 Jun 2026 07:26:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6D010ED31;
	Thu, 11 Jun 2026 07:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Scm9pmix";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D0C7E46A30;
	Thu, 11 Jun 2026 07:12:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781161965;
 b=pDyW4diKRB/ZSpwK3OuL6G6o5o00/7AYrXPS9rkV16N3USrOnhruXK0dlyKMJhIotTMfA
 La1wegJHHK9JuQS2rdWG14CJTQDcRRQXufy0cZw8KwSseYgpnOSSaf5QbWxASB8x7vwINPq
 tQi4ie5csOt6avMrrQ1hW2S6t2k2euftblrAFl2G1TXzeVVt+oQsrf5oNdZujhCmXKrGS16
 VIQZd9+rV9jXHSMP1b/4fuvuvi6eHfiX8QIFcBhkv+njr133vQUw7JkJkXsczMRZOn7Xh8x
 w81SLKKbYbGrbw/oNbJLYZgkgMvpdyEyDpYejBXU/e7onIKqhn5Iszau7TOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781161965; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jlBSAof3dxTHn+vmJPVfCbz7wQyEQetNaXJtCkbufXA=;
 b=h7zbKBWz8IYf4gS4o68kvYx48eW15Gk9r4C7DIc2I03Ai+LBgKOE5QcIbaf3QALw7N2nB
 lZazAzXb3v4dUcL+dVKVf8E4LmjrbOk6Qs54VIS9PB/jDHhPJ/aJg5jgpUf13rSb8iyeYV8
 EdcYeBue75HlTvZjPRrDnIwHF/dy14QpRQBBP7QuMf5+mrt8sQW/UXoMfGg1dk0DI3ZXPo6
 bm4U9vNB0qLRl12mOBNzpBomFEblQhMFbGWPv1a9ep2jc6Mag3UEVFtsmxHRAUZLzgvs2BI
 GhcN6ce0T4OowN2/ih4oSGlDXPC4MsyhdW/hq0azdZhN79NZm3HOE4bABEpQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0E4C846980
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 07:12:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3863210ED21
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 07:26:41 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490b8adf813so7968245e9.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 11 Jun 2026 00:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781162800; x=1781767600;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlBSAof3dxTHn+vmJPVfCbz7wQyEQetNaXJtCkbufXA=;
        b=Scm9pmixasVGuw2yi8xvV7YXu8kJpv8aOtjFhrCIFl+DUFSc1ntHz/RfAIB/5u/NsH
         etuP/9B084o9VmXNJUMJzr6jGfVUY66UaFRzEgDM5uM2ovta5vXzEuyDNyXorhhAIPaG
         V/ieGnXvhAE7g0F6Cbp7OanT+SgUFpnZpaTweYD2xKiUztbEmh37Qjq+TRmRU+cnlwHi
         YakSNs8rfSvcBdkGzlBwEPxJEVG9W/lLkmc/JVPtXTsNYbQN+uJwfzGlbDEoMvTqJNqs
         CWI3QLE6DhKSD0divH1rIPzBBnwR9o7rKhEDMNhTpVisyvEwjg7iVOfrVaMkx8PR+Avd
         lgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781162800; x=1781767600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jlBSAof3dxTHn+vmJPVfCbz7wQyEQetNaXJtCkbufXA=;
        b=jhBuCBbBbQkGY/PDnBDAirdFdK+SEgYKHQgSeXT4jOLV3EFRzE+XlOr41tIB24jHFD
         j/PIGkvuz1tveBWTBMhoX+sZpqgCsHXVDy4czGxjSByYNW3/iaTTFHGaoTZ9K4h7t61o
         eVBnvywTphHJ49Jx0aY8pm+p9uXUwLfDqLjWZCBHdmG+ieM1QNFdpwWYm1HIJ9YbGKW9
         VbLlyWqQMTJ8rlNDoO+I0kT21WAHLUEh2P4furNF7e44/msYSgpuk4h5v0lUTDKPPHQl
         oC7epUxqigj2j+xpCyyQXo03z+mQ8Gz3WKJESY2UmoyA73JFD941Vmtd/4p9RMnpznvv
         KDYQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Q/hDYpQj9UGzHUUrbAkNCzwNiWrBEqBfKOr3qbv9SSq2YTdHnx6OCAPtcIGYgU+1huapO+1qy@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7EHzN/wXANbt6SmO2fXqAvZY6XxCAzIoYAzvXWINq57d3a8p3
	WC3kB3ZtPeMll15lbuO286qj0vaDhBqD8jPsm75L5wmp0WmmhdTOdAgpFbrgvYGl8Yo=
X-Gm-Gg: Acq92OEzcJDPry0XxCk6PbYsdDeVVgH9WbqSbEVHWD1sgEHBfRqz3kRxUwLf+E1kWnm
	4RMMjRc0I5i+hcHlP/2RcHS6fyMqiT3pf4ZjKODZZyEhNLE8h1sCRjhLMvn/E228gRZazck/INw
	Ry71Ye5FBuAEUFXh4zid6SAJKwV2g6GXcbmn6R5Ei7siZZ93/apbvNUP8NPxCmjRGRBcQpOUBul
	fv8Sw+AdwETHa5SnY2M4bYEl7rW1zvii4Y41Eg/vk29RhLxmnht1wyqMk47V0jGB0x8YKNmR9cP
	0QcevE1ey2BbTppw/oU1iR50VG8z65T3l62V0SpZKD9ZiTZWVFa6+v+uvKCvaGdlodcFz+rjNlR
	A+GpGIZ1VZ+xImFL8bmty8vtfjMEKwnI4g86iUTRNDyLURx9T+Y4HT22WDWo0u7Gdfo+UCY+oa+
	omWTkkrhOuh01NvDyXDpcE1T7XTDbsUDbEOpcEXsb57WJp72kcaOFaJCjD0LtSl+HfjWNxQD9V4
	Bd/YLye0W+U7VYephnetjNCCA==
X-Received: by 2002:a05:600c:1f83:b0:490:3fdd:d344 with SMTP id
 5b1f17b1804b1-490e558813fmr7830845e9.1.1781162799452;
        Thu, 11 Jun 2026 00:26:39 -0700 (PDT)
Received: from localhost.localdomain
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c7ea21sm42585795e9.1.2026.06.11.00.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 00:26:38 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 2/2] drm/nouveau/kms: guard NULL crtc in
 nv50_sor_atomic_disable()
Date: Thu, 11 Jun 2026 09:26:34 +0200
Message-ID: 
 <66ea307dd4fa080db27b2b9a0caa31b562d72c2b.1781162589.git.marek@czernohous.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781162589.git.marek@czernohous.de>
References: <cover.1781162589.git.marek@czernohous.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L7GJNICSERO5GLSBVON6WJSB5VQF24JK
X-Message-ID-Hash: L7GJNICSERO5GLSBVON6WJSB5VQF24JK
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Fab Stz <fabstz-it@yahoo.fr>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L7GJNICSERO5GLSBVON6WJSB5VQF24JK/>
Archived-At: 
 <https://lore.freedesktop.org/66ea307dd4fa080db27b2b9a0caa31b562d72c2b.1781162589.git.marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <mczernohous@gmail.com>

From: Marek Czernohous <marek@czernohous.de>

nv50_sor_atomic_disable() unconditionally computes
nv50_head(nv_encoder->crtc) and dereferences the result a few lines
later.  nv_encoder->crtc is nouveau's own shadow pointer, set in
.atomic_enable and cleared at the end of .atomic_disable.
Commit f575f2bdb6c3 ("drm/nouveau/kms/nv50-: Remove (nv_encoder->crtc)
checks in ->disable callbacks") removed the NULL check here,
reasoning that the atomic helpers never call ->disable without a
crtc.  On NVAC (MCP79) under
Wayland sessions (observed with Weston's DRM backend and with
labwc/wlroots) we have hit the NULL case in practice during session
teardown and VT switches: disable runs without (or after) its matching
enable, and because nv50_head() is container_of(), the NULL does not
stay NULL but becomes a small bogus pointer, so the subsequent head
dereferences fault and the kernel oopses.

Restore the guard, as drm_WARN_ON_ONCE() instead of a silent return:
a NULL crtc here still indicates a state-tracking inconsistency that
should stay visible.  Return without touching the output; in this path
either enable never ran (nothing to tear down) or an earlier disable
already did the teardown, and the encoder release is handled by the
commit_tail release loop in both cases.

Fixes: f575f2bdb6c3 ("drm/nouveau/kms/nv50-: Remove (nv_encoder->crtc) checks in ->disable callbacks")
Cc: <stable@vger.kernel.org>
Tested-by: Fab Stz <fabstz-it@yahoo.fr>
Assisted-by: Claude:claude-opus-4-7
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
v1 -> v2: dropped the nvif_outp_release() call from the early return
(the release is owned by the commit_tail release loop; calling it here
released twice and detached the OR before the disable flush); turned
the silent return into drm_WARN_ON_ONCE(); reworded the commit message
(the v1 "race between atomic_check and atomic_commit" wording did not
match the mechanism).
v1: https://lore.kernel.org/nouveau/20260409172126.115441-3-marek@czernohous.de/

 drivers/gpu/drm/nouveau/dispnv50/disp.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 6c3a871..597bc64 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1565,14 +1565,28 @@ static void
 nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nv50_head *head = nv50_head(nv_encoder->crtc);
+	struct nv50_head *head;
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
 	struct nouveau_backlight *backlight = nv_connector->backlight;
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	int ret;
+#endif
+
+	/* nv_encoder->crtc is the driver's shadow pointer, set in
+	 * .atomic_enable and cleared at the end of this function.  NULL here
+	 * means disable-without-enable or a double disable; bail before
+	 * container_of() turns it into a bogus head pointer (checking the
+	 * result would not work, container_of(NULL) is never NULL).  The
+	 * encoder release is handled by the commit_tail release loop, so
+	 * there is nothing to clean up here.
+	 */
+	if (drm_WARN_ON_ONCE(encoder->dev, !nv_encoder->crtc))
+		return;
+	head = nv50_head(nv_encoder->crtc);
 
+#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	if (backlight && backlight->uses_dpcd) {
 		ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
 		if (ret < 0)
-- 
2.53.0

