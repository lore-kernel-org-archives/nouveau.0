Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB8EC5B572
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 10:26:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A3BD010E4AA;
	Thu, 13 Aug 2026 10:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QD6wAgTm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 39B0C47722;
	Thu, 13 Aug 2026 10:10:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786615802;
 b=RUb9Io+X6Jxv2GHSgsql6+I6fMLv7tOQvWCUsZpg7B6pINwcUzPkFnEft781yStI9056h
 U2dOdlm2Oa//YfXiTG8aCNMFsF0g/YUySgI6lTS3I+EajrsPbz+8P53ZnyeJBc01RB4QASv
 zy077WjcHt1tM3IymGcDNBEvGcfxyNNW5pBZSg2QZxVJ/GUN7UEixgTE8Wy9ZLnhEOpzQcE
 BWFfTH7qJhGertr0N70uRsVBoCzwyGe7Fk4Bm28UxnhOpfckRB4cIne9INcsuF/4yGIfZS7
 D5hoeEzyCJq5xcPw0gg8WgNggM066sjD2zWAGAJD1HJIw+gUcR8tcrYy47tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786615802; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CheetA0FCd2QHli7re2NKbzT3knYEe7Te2BK6UHPkW8=;
 b=m6+omkk/qcGpm7H/Jh04ULgmlQbXZ40KZ3S9xvA3t+euQME+Qn8pk6ERCKh2QUn41IfB2
 LL7Aiku3Fs3FY4BbCakEGEi6EtV4CvVF9RcuS/Yb900N3FsFT25nxSBdGZ+IxT+02SenTHY
 wF5VFH65fsYmZDzE63QJBaVI7y4dDa9iFt064zwbu0Zl5Ke02pWeJB/4EPoyMGH7TOZdIiT
 gzGwM5VTx3C5yUUXa2CKlTxW1pB/BiS8P0ETgiQzZrULb7KyW/pmjyhhka0xDwn9Ppni6FQ
 hVxHIkIP7COHtB67DoWI7sKJqSFhcL9ZKRDFeOky5Nivo5ImBPrdUvO56f+g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0E2AF473D7
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 10:10:00 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 47BC410E4A2
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 10:26:19 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2cc7e86e7aeso25899305ad.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 13 Aug 2026 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786616779; x=1787221579;
 darn=lists.freedesktop.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CheetA0FCd2QHli7re2NKbzT3knYEe7Te2BK6UHPkW8=;
        b=QD6wAgTmAZu90vE1N0Ne6sNEmzBMVw4jvWx9dqJhaM6oo10KG8ysPRiIDZboMmq5I7
         T4Of19+vsmAFFxCFEh8Ikrn5RDjNalsYSjQvY/IsRuj3t1OdqUXrWv541J+STT9btd/I
         EpGEh5JQ3R+W3Ea9gw2d0G5NwW28Yxt6vmRl7R5js6lz4miHgs7PiVIQ8EbfShUbnYPY
         VF8pgBoajCLnOguTGifqqYTg5hW8OKulApVvmeJ+OAts9rSITYGti+HipGrcs/QMXb4K
         hwECS26OwLq9P549fyO6v5cFPiMEHRslJekTcJ3faQKLFoUyn8zcHkZBdl8vZki92EOA
         wpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786616779; x=1787221579;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CheetA0FCd2QHli7re2NKbzT3knYEe7Te2BK6UHPkW8=;
        b=W4+AY2LZn/UQnChRMELRoLzpqzMUuD0SfpsN9RhGFK100cJL2yZOmRfgGP5Ki3SBS6
         CbAmLej64Mq7hucNjrxwhv1QbuwE9roQ84EQ53Imy7ktuzytiV4q0eagEYH/pIBQ8pSK
         u9HEOb+v+k8QRv+SbPvwjhwIqK+SBfwClk9zZTwbDSSD5xHjjLtbbdEF232zmyxdcxbu
         0r/P1ZMXcfGNtsoz+a/5f/E5+FUIeEIjuIVDd4z4eHKO4mxuviMy8WibzajGfO37tbQp
         0O2JFVYl8DwJ1fOtH3QecsKp6sbjr6xWwCas9pkR3UJ2UOwDQGB+jA1769Gwidq0wytZ
         3bbA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrizhOhD+frF2+Fd5JFnik//0xVCwObIBDh8IF18DzI3efGfizQPLVzPlyglkOCUKGixWXl4wuS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtzidrfxSN5FWIxmKT5BUsAqdcWh1n9AaWFuiaSvdBCd9SUB0Z
	Slacc4PVl6Dnqyv599Tw7gcblP2TWDHNyUZP+EvLCIES/MhvT51pmuZj
X-Gm-Gg: AR+sD13o1ywxrKC+I1/ezs3VZAm5Bx9a/zLCgmn0CxbXTxJfYs+s3oKnB7P12A9W+rW
	L8nfyyi0dHU9HjKVaCZI2d8dPKbSjiOB9DveXEb9LfQOI0dxVK2WM1xBMzCfI+YQKZcoGDwer/A
	f0hOZFbXI8xMG79i/ukL7tnvFFF2f/Z9bsbHBXVQv0gKgyOruxA0L7n92AQ4qApzjbq8V5R9CuV
	xsg2mURTeDmASB4qWdCPVeebD7PegGxFXXs220iohcr8DDnquAx0/SPRbL0Ue728FybesRjqOXq
	G5txpVU8X8eSzRqPyvHw5GSPx1jDKamrH0rmE+b/i0BsIZIx6ou8u+HoDScrr+nLA6BSaw0w/s2
	giOEMmhweeHno/6lU8MrQzjbj11kbNB0aZtLWmn2AULeNJVbqEEiJX0C9QOJEZyGiZmfvEqFaNL
	XK8kUo/9wYm81yP7jIa3KXN8gfMQMoQwJZl3RuIgittcpDBvI7WtBiBVrd36Y=
X-Received: by 2002:a17:903:4b28:b0:2cc:777f:d67c with SMTP id
 d9443c01a7336-2d37e856ffcmr53648995ad.13.1786616778614;
        Thu, 13 Aug 2026 03:26:18 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d37c49bd29sm7220095ad.64.2026.08.13.03.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 03:26:18 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Thu, 13 Aug 2026 18:24:26 +0800
Subject: [PATCH] drm/nouveau: disable VM_BIND once a legacy BO VMA is
 created
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-nouveau-gem-uvmm-vma-fix-v1-1-4f14d427f2c9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFmbfWoC/yXMSwqEMBBF0a1IjS2IX9StiIMkllpCoiQmNIh77
 3Q7PA/evcGTY/IwZDc4iuz5sAlFnoHepF0JeU6GUpSt6IoK7REiyYArGQzRGIxG4sIf7GaxKKn
 rplY9pPvpKM3/9Di99kHtpK9fD57nC8WTXNF8AAAA
X-Change-ID: 20260813-nouveau-gem-uvmm-vma-fix-8d0fbac454b9
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786616773; l=2346;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=yrf9imgPzO8wlFHThXUTZ35rA60+QDuQrt+uQxh0u+M=;
 b=8up90CkB3EcBEnF95pzAf697k2mBINT6B819yhVrWyqIK8onVKU51wq9dVqfe1WponwGildgE
 n1Cbg8WGmwFBxQyZiMo/7nsnzQyn6HS1V+ThAo1prd3d45OWyzzzIbM
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
Message-ID-Hash: QN74UIR6M7QZ5BNQ6K2FU7LQMZWODHZN
X-Message-ID-Hash: QN74UIR6M7QZ5BNQ6K2FU7LQMZWODHZN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QN74UIR6M7QZ5BNQ6K2FU7LQMZWODHZN/>
Archived-At: 
 <https://lore.freedesktop.org/20260813-nouveau-gem-uvmm-vma-fix-v1-1-4f14d427f2c9@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_gem_object_open() creates a legacy per-client VMA when the client
has not initialised VM_BIND (!nouveau_cli_uvmm()), but
nouveau_gem_object_close() only tears it down while the client is still not
a VM_BIND client ("if (nouveau_cli_uvmm(cli)) return;").

nouveau_gem_ioctl_new() calls nouveau_cli_disable_uvmm_noinit() to stop a
client mixing the legacy and VM_BIND uAPIs, but the prime-import and flink
GEM_OPEN paths that also run nouveau_gem_object_open() do not. A client can
thus open an object (creating a legacy VMA), call NOUVEAU_VM_INIT, then
close the handle: close() now returns early and leaks the VMA. If the BO is
flink-shared it outlives the client's freed vmm, and the next migration
walks nvbo->vma_list in nouveau_bo_move_ntfy() and dereferences the stale
vma->vmm -- a use-after-free.

Disable VM_BIND in nouveau_gem_object_open() as nouveau_gem_ioctl_new()
does; the helper is a no-op once VM_BIND is initialised, so VM_BIND-first
clients are unaffected.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 20dba02d6175..e33f76b5a239 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -108,6 +108,14 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	if (vmm->vmm.object.oclass < NVIF_CLASS_VMM_NV50)
 		return 0;
 
+	/*
+	 * Opening the object binds it through the legacy per-VMA path below.
+	 * Disable VM_BIND for this client, as nouveau_gem_ioctl_new() does, so
+	 * a later NOUVEAU_VM_INIT cannot switch the client to uvmm and leave
+	 * nouveau_gem_object_close() unable to tear this VMA down.
+	 */
+	nouveau_cli_disable_uvmm_noinit(cli);
+
 	if (nvbo->no_share && uvmm &&
 	    drm_gpuvm_resv(&uvmm->base) != nvbo->bo.base.resv)
 		return -EPERM;

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260813-nouveau-gem-uvmm-vma-fix-8d0fbac454b9

Best regards,
--  
Zhenhao Wan <whi4ed0g@gmail.com>

