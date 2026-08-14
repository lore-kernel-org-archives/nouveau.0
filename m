Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D426EC5CFC1
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 10:00:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9EABC10F4B0;
	Fri, 14 Aug 2026 10:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ITcQ2BW7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0D718477AC;
	Fri, 14 Aug 2026 09:44:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786700641;
 b=N7GIZNFWahWxQpVf+BReHf6FSO7HLw2jeq7ud6t0hbkVJXnulfs5tp7GLD3KL3VBmRvQp
 HjjWZmPjXyJv75JoD8ueja8ysENIrt82PEseQJo7jUYi4S1KExpxO2NZg+8W0hBoQozZZRY
 9jCkmg1fth2icao/SnMLrHUKAeh71+tkbyAQlkJEh6BFCLyYY+XGMezmvVEXV24unx7yD+0
 13cqqECBNOrPQxMsvdAZyo3mhrCckDMXhg7ZwDb6aau6gcmrKriqo/n7j21gFYeduiBM6uF
 W7iDRO5rus7t4Mr7cAtbj3QFQH96UYk5NRYe00QXCBlcwt403LGVlB5yh66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786700641; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CEq/gI0mam4/U63KJoUcke2lMf2q5gb8Kb5V1dW24Zo=;
 b=sywprM5NMCh0KrPausSBjzkuKI6DDg+tDhWCa9MqEFrYiNWyG5Be6U21tSRzQ1gmM0PTe
 uKNpQrhC1ZA3/hRzSFjUXKk3kyjdEUo7cEAqhqKKpoD108kp5Cym99tcyE4jlMKnOdwHME6
 Q/VKXc1OXap6lYPZ5L5FBkUmqqlTTkay9hrb1qRM59wVH0y04VEuvjA3DXZYvqRg3KXkffc
 FL5dc4l+d2xfLrXgOGoCHJm/FQYiJesvDdmZNOOWS8PnqGtC0eUwQuOx+/vRvn7x0ogTVlw
 Nv6Sq7HohcsXP6p81iK/RxxLOaOzDX9826u9Wai5SwU50DabWM0ROeV+Sd0Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E533C476EE
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 09:43:59 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4C15D10E550
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 10:00:21 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-8487b7b3fc8so712859b3a.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 14 Aug 2026 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786701621; x=1787306421;
 darn=lists.freedesktop.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CEq/gI0mam4/U63KJoUcke2lMf2q5gb8Kb5V1dW24Zo=;
        b=ITcQ2BW77HJNZswSmi18W+PVGCgdaMEl8pQE99lU1fXeeWtenKYObfRpsLxw8XdQzJ
         I89ZImlGyTolUPaZXwLBaKwZud4bEl/VOcXmaPcjNI8iOhpGpmpHfz0uyAeK17/Oju3v
         lM46g48delpIweBHIrjbIvgRphAkz+RmDOUchfG4o+rSg55gqF4OY4AUSAEqqfxZ9IZI
         clEmXIpQ/e5Mjz2DCuJckbHByeP5JnrBv0ZK+Ab3BRbC6z87q+onuVtkh7kXQXXo7pXR
         6VwINULPyxDZYsaOuvAOFyl4bj4jSD4KqfNfYcMaQ/flyUFBezLSzpLDzUdhf6x+z3FC
         FvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701621; x=1787306421;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CEq/gI0mam4/U63KJoUcke2lMf2q5gb8Kb5V1dW24Zo=;
        b=AMinNXvafq3ykRuzaSl3LY0PM8J2GoIR6Xa6rA5WncCZXxPsFa8j0qQo1WV0D4LKcV
         /6N8GO9I3RFEGkzZOC1JrapdsFAxjkPpAJdZCPqdv0Id+SQfbj0/xPZ7bC1Avp4gMiKi
         McK7rbKoCtgjKY2/gvWOLrkiQfBHeHUa90t1qE71gLADgSH+i1QvLPmY1Y9E0gMy4rdL
         64wE50IhywFS2rfqEy95MMhW7/eyw14Q0qKufPmpfEO2W455NvVw5JTHi3d/Uuw11XoI
         PoMNvXyYSeMgBSpwAV8ug9JZJPRCeTZHPVfqV2rN62djV95FrO3bmtr1KC15cjaB3Zd8
         RmQQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rovd1Rnl79royMtupfdvYUr57mQnBjjMVOJpeVt1m12x9CMutuR0EaY+NV7+PWXpt5W4hZsr8U2@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+vZoA3XpTSYCP+0IdWNmPIJTCkhHQKghd8c6AxFM3b6Ja/KpU
	A4jI5N3E1btiDvNwNYeSYpznA4FagkOXFzjhO9NEgSoBsPDyxrynMu3L
X-Gm-Gg: AR+sD12lrz29INkWH7km3nAueeFCs1sYjgSs9Wsdsd4jtoK+cbwyxgfYlzt0SAz1Qd2
	Fc7aBzBgcW0u69J4K/cJbv7h3HMOsUvEuA7K2TA35FYJoFPadQc3ODd9E1/IgYDHZ4lPiRnB9nx
	cW4AKZtOQmLqNbMHJFpfMnNpQy0rS6FA1heGOBDLMsPce5MlNPZQjd1YkwRvVz8FtLB3dymZd8Q
	NHKpavYv1NVq/kLhUGAlo1IGCxS9SHg2wzbTwRQSR0bJz2cZKAst44vjKeyXmQQ4UwP7iT5Y55Y
	8XBH9xJClAHdotyYoDoh/1vhcl7APUTGLzMHXfasPbWJGGk9p9riumqAnzTKSoBvRfvnfjfI9+V
	sjWQosy+jpcZchhDPEVmaujh4sjSUUFXmhi8fiJPNhOCTaTD7TzopJk9i0puG/nZ8Bdh7Y6Ltrd
	nilmW1qq/GZUlz1Wp+cyn3qS5KgTZfY7PLnO25E5h5fwTCh/lIXKIUXXnBOZizTD8G
X-Received: by 2002:a05:6a00:338f:b0:848:467d:293a with SMTP id
 d2e1a72fcca58-84fde38d267mr5281242b3a.35.1786701620572;
        Fri, 14 Aug 2026 03:00:20 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8517cfeb3cesm243681b3a.3.2026.08.14.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 03:00:20 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Fri, 14 Aug 2026 18:00:05 +0800
Subject: [PATCH v2] drm/nouveau/svm: drain fault handler before freeing
 svmm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-nouveau-svm-svmm-uaf-v2-1-8e6590519f07@gmail.com>
X-B4-Tracking: v=1; b=H4sIACTnfmoC/4WNQQ6CMBBFr0Jm7RjaKhpX3sOwGMoANZaSljYaw
 t2leAAXf/GS//9bILA3HOBWLOA5mWDcuIE8FKAHGntG024MspRVeRUKRxcTU8SQbI7FSB02je5
 UJaszEcE2nTx35r3fPuofh9g8Wc/5KzcGE2bnP7s3idz7o0gCBcpWCSFbpos63XtL5nXUzkK9r
 usX6v8BRsoAAAA=
X-Change-ID: 20260813-nouveau-svm-svmm-uaf-bbcf36265aaa
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786701615; l=3566;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=Xa5VtHj3w4sPlc/TppIcRh1BbFj+6tLTdDnsIWhMORY=;
 b=TBxXokJK8M7vP1OhEP1hGzukGoCRT8H3Zet+dNfTg4l0/uLvvpsPxPmHtEGUTfqyZsKlDo9E4
 ofOpy7NU5suA8CQXNc7SFLTq0vitYWUEzCqlR4zth9V1vglhRYM545G
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
Message-ID-Hash: S4QQELK4ECV7OPTQBFOWV2A4KMFWNCBA
X-Message-ID-Hash: S4QQELK4ECV7OPTQBFOWV2A4KMFWNCBA
X-MailFrom: whi4ed0g@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org, Zhenhao Wan <whi4ed0g@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S4QQELK4ECV7OPTQBFOWV2A4KMFWNCBA/>
Archived-At: 
 <https://lore.freedesktop.org/20260814-nouveau-svm-svmm-uaf-v2-1-8e6590519f07@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The SVM fault handler nouveau_svm_fault() looks up each fault's
nouveau_svmm under svm->mutex, caches it in the fault array, then drops
svm->mutex and dereferences the svmm across blocking faults
(mmu_interval_notifier_insert(), hmm_range_fault()).

nouveau_svmm is not refcounted. On DRM file close nouveau_svmm_fini() ->
mmu_notifier_put() frees it asynchronously via call_srcu() without
waiting for the handler, and mmget_not_zero() pins the mm, not the svmm.
flush_work() on the fault buffer otherwise runs only at device removal
and suspend, never on close, so a fault handled concurrently with a close
can dereference a freed svmm.

The instance is already unlinked by nouveau_svmm_part() earlier in the
same close, so no new fault can resolve to it. Drain the handler in
nouveau_svmm_fini() before the free, guarding the flush with a NULL check
on drm->svm: on device teardown nouveau_svm_fini() runs first and frees
drm->svm (NULL) after blocking the notify and flushing the buffer, so the
handler is already drained; on per-client close drm->svm is alive and the
flush runs.

Fixes: eeaf06ac1a55 ("drm/nouveau/svm: initial support for shared virtual memory")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
Changes in v2:
- Fix a NULL deref introduced in v1: guard flush_work() with a NULL
  check on drm->svm.  On device teardown nouveau_svm_fini() frees
  drm->svm before the per-client svmm teardown, so nouveau_svmm_fini()
  would deref NULL (reported by Sashiko AI review); the handler is
  already drained there, so there is nothing left to flush.
- Tighten the commit message and the code comment; no functional change.
- Link to v1: https://patch.msgid.link/20260813-nouveau-svm-svmm-uaf-v1-1-2d3112dea734@gmail.com

To: Lyude Paul <lyude@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index dcc92131488e..a87406d3da30 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -304,6 +304,19 @@ nouveau_svmm_fini(struct nouveau_svmm **psvmm)
 {
 	struct nouveau_svmm *svmm = *psvmm;
 	if (svmm) {
+		struct nouveau_svm *svm = svmm->vmm->cli->drm->svm;
+
+		/* The fault handler caches svmm pointers under svm->mutex and
+		 * dereferences them after dropping it, across blocking faults.
+		 * The instance is already unlinked (nouveau_svmm_part), so drain
+		 * the handler before the free to release any in-flight reference.
+		 *
+		 * On device teardown nouveau_svm_fini() ran first and freed
+		 * drm->svm (NULL) after draining the buffer; nothing to flush.
+		 */
+		if (svm)
+			flush_work(&svm->buffer[0].work);
+
 		mutex_lock(&svmm->mutex);
 		svmm->vmm = NULL;
 		mutex_unlock(&svmm->mutex);

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260813-nouveau-svm-svmm-uaf-bbcf36265aaa

Best regards,
--  
Zhenhao Wan <whi4ed0g@gmail.com>

