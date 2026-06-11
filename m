Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D68DCD98D6
	for <nouveau@archiver.kernel.org>; Thu, 11 Jun 2026 12:45:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6902A10EEFF;
	Thu, 11 Jun 2026 12:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NKEBPmWP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 86A6246A63;
	Thu, 11 Jun 2026 12:31:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781181102;
 b=tIvG0zZb5PdHSUaJThyyGqGgr/xy0/+Uz0qwQgcBrjKke687J8mS6NWgl6yyjyv3FObLG
 +yDtr+eCW51j5F4JzkMwfJ2mab+eWF9yUca0cXwDKDP9/GgBk7iRVR1oLMjrX/y/NuYimeA
 zDTQ1a+NxXjm8zkeA7dn3y0l5He/2xihZVZSmy/sfke9nwDMEwcFNnHOD/Y59vvElqnLjkK
 aXvhTBr91b6htDhYvHpsGvVuySXHAKqo0CtXKT8S5UFe+c7V1vPRwDpzknSrrL5EjJ2OvO1
 z9ARY5oHdtEYINI4K+vmqKSb7Tk2YzoMJ7P+LQhu/+H+00LHw+0JYsRJkQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781181102; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hC/dkIeX3rG+bUwxYjAdonivB+9Nfr2TugEmLAKhT0w=;
 b=cJyLVPxSKn6t0qW6Zgc36FQgWvTFrDyLERBppWSeIzks8aHHEDGZru7Dloo08uOpwZtNX
 MEEgFda6TfoudvLrEzR64tZJoXqbT+bPJxLILa/idLOR5kQ7NE5iKr0D1zhWm1Cn4AYo+HB
 gArYCU+eL3tBjcumjtU8Z3SxPjMtjcy+Fahr46tbWvjDUfU9W2R6e0Oe0MpnXfY6/Ym3vnc
 b8DQqH7CJL/NLyI6dhFpGaF9FX0B67pwenuJD7uahJW6/GvNkb2qXXQro6ztERVrSjwtTnU
 bJj2SkBMOzJysH9WFyEWQhs0fm976+2IM6SrWKKZpRWoeC/hiq4+HNH/DjFQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A2268469E8
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 12:31:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D61310EEE7
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 12:45:39 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490a767521dso8074335e9.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 11 Jun 2026 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781181938; x=1781786738;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hC/dkIeX3rG+bUwxYjAdonivB+9Nfr2TugEmLAKhT0w=;
        b=NKEBPmWPVfLv0N23TtSkz4zN/8mR20t3urXFZUotTGOjUxune3sydFmuSKt3+qxJSh
         UD2RvR6E/R0bKvGCyanob7vHHg5FR+pGsvgj9CPAyblSHDmcBxA5b3UJ23HZjGVdejnu
         pMGOrE7mAtj37zFgt29U0tDqq6E7b67+nQy1fR5k3HwHLveLuU+4ItXnm6PxR8/TKt4U
         LeBrlh9r2DNDC+7pm3k4O1MHKaYuRAMf6fXW4XZAfbmnSviRY1KOvHIVogZf8v48EWJS
         Yn5WqHWg1LJUebvs40L5mVB6JlBj9gOF105xN6T95VrEU7xX1ndwwa+KgAcqbeaMC8H5
         P03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781181938; x=1781786738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC/dkIeX3rG+bUwxYjAdonivB+9Nfr2TugEmLAKhT0w=;
        b=Ca/3bz97MceztKNPWvKORZdjnxdBpEgeUeYyxRMn8ZMFf0J7STuUbKTrQ10U4dcJn1
         fnHlRTPBeS9T8k7Aai4MSueFTGlpgIdF3+v9EOK/nUkBKWj5ZKRUNCU1DleP2pvCzL7r
         qKsZ34nKogpAhK8MstdbAn/f5DhgkwM6F3Zttw6Vliicnj7cyf+O0IOwIkPqYokVq0gB
         /y5H3//r+t9Wmhwr8OwOWHEWPVQARjT8rZIS2Vf90bhJ9Rx+7bkZHZCNL0W93dHp/XoV
         VBRmkjUX5qi4mGFC/sKCe7bdA9QLJQkZwljOs4cbt9Emnc4hCUWf7LOF0mtIWgq0aQ6i
         jCOA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8DJW1uogL6KwiQXmGxF5Ct1fD/wPuol0R/STP/NJWT/AUt4risBA15LhgWj26b3U9fAKxEVXhW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3Kug69alKb01dSVeH4sevUFLiLJVILmXaAaNNbP/3Ge+4aD3L
	NHg1TuW+qvGmEwiyVTHjxM0mRjKl4Ckv7dfxRM1QFDoSTBJbhUE2U9DG
X-Gm-Gg: Acq92OGvUqccGYLPLymWWG3IsZLYFBup/jqc5ddYuJ/+56wT3VjYBSOfxbTRB037iVD
	Llp53zGagu4rZ4bq2MGUYTxot9SnJScxnW68I8/vSF74ZbVl5ret+u0NnWdFsS+/j+qZ+9GWUdA
	DvGKyQhDR2xeIjagCDYV8zpkuqew4BrGHavsDh3u6p1l9SJFhG+JQRS0qM1j30V9BdctajjpehE
	IQSoSChEywHtr1lSeQcdTjME9WnhFEq8yjew9Bn0KuRFhiEZaznR+TBSDe1xFfSnNhXaDlt/wE+
	Lr1XFsbbD4U2eRpiowe49LFoGCOIJ0ABUpUExUM0xPT5euQSqQGN7qRaovx7kHYHb81BIcsNFoZ
	s6XXkVrhI5cWhhUGDxMRye9isnj/eL4SR/7vy+BIhuXMJAIIa73wRstogjmN0p/nDMWcqyuKXuO
	oYUMubY/nBKnSMmU536fQ97Io84/986J77aDkYpCN3fpjQ1Ip+CCwpEIhJZzyL7RzgJgRdA9b9z
	vc5oQUaax/AHyydGe2gi8ijo4mB
X-Received: by 2002:a05:600c:46d5:b0:490:c123:3b7a with SMTP id
 5b1f17b1804b1-490e562490cmr17760225e9.4.1781181937355;
        Thu, 11 Jun 2026 05:45:37 -0700 (PDT)
Received: from localhost.localdomain
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e532c778sm48697645e9.14.2026.06.11.05.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:45:36 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 0/2] drm/nouveau: NVAC (MCP79) MSI rearm + SOR-disable NULL
 guard
Date: Thu, 11 Jun 2026 14:45:33 +0200
Message-ID: <20260611124535.527275-1-mczernohous@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 74S2SOHYQDECEUCOI3VW7BZHBFWTLM2S
X-Message-ID-Hash: 74S2SOHYQDECEUCOI3VW7BZHBFWTLM2S
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/74S2SOHYQDECEUCOI3VW7BZHBFWTLM2S/>
Archived-At: 
 <https://lore.freedesktop.org/20260611124535.527275-1-mczernohous@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

(v3 follows up on this morning's v2 posting twice over: those mails
went out with a duplicated in-body From: line and broken threading due
to a send-email misconfiguration on my side, and the Sashiko AI review
correctly pointed out that the new guard in 2/2 sat below a connector
dereference it was meant to protect.  Patch 1 is unchanged; please
disregard the earlier copies.  Previous posting:
https://lore.kernel.org/all/cover.1781162589.git.marek@czernohous.de/ )

This is v3 of the NVAC (MCP79/MCP7A) stability series, narrowed to the
two changes that are genuinely stable material and reworked after review
plus an independent second-machine test.

The original v1 [1] was a three-patch series. Since then it has had a
two-month daily-driver soak on my Apple Mac mini (early 2009, MCP79) and an independent
test by Fab Stz on a second machine (iMac9,1 / MCP79, 6.12.90, X11/KDE 6),
who confirmed the system is more stable with the series and provided a
Tested-by. After an internal review pass:

  Patch 1 (MSI rearm): NVAC re-arms MSI through the MMIO mirror of PCI
    config space, which is unreliable on this IGP; a missed re-arm leaves
    the interrupt line dead and the GPU wedges. v1 switched the whole
    shared g94_pci_func (ten chipsets); v2 narrows this to a dedicated
    mcp79 pci func so only the tested chipset (0xac) changes, matching the
    existing g92 precedent.  The stable tag is annotated v6.16+ (the new
    file uses the .cfg member added there); older LTS trees want the
    era-specific one-line msi_rearm switch instead, offered in 1/2.

  Patch 2 (SOR disable NULL guard): nv50_sor_atomic_disable() can run with
    a NULL nv_encoder->crtc under Wayland session teardown / VT switches,
    and because the deref goes through container_of() the NULL becomes a
    bogus pointer that faults. v2 restores the guard as drm_WARN_ON_ONCE()
    and, unlike v1, does not call nvif_outp_release() in the early return
    (that path is owned by the commit_tail release loop; the v1 form could
    release twice and detach the OR before the disable flush).

The v1 patch 3 (HPD link-check retry) is intentionally dropped from this
series: it is a behavioral workaround that sleeps under mode_config.mutex,
not an obviously-correct fix, so it does not meet the stable bar. I will
revisit it separately if it is still needed.

Both patches carry Fixes: and Cc: stable tags. Per-patch changelogs
are under the --- in each patch.

Disclosure: this work was done with assistance from an AI coding assistant
(Anthropic's Claude, Opus 4.7 and 4.8); the analysis and conclusions are
mine and have been verified on hardware. Each patch also carries an
Assisted-by trailer to that effect.

[1] https://lore.kernel.org/nouveau/20260409172126.115441-1-marek@czernohous.de/

Marek Czernohous (2):
  drm/nouveau/pci: use config-space MSI rearm on MCP79/MCP7A (NVAC)
  drm/nouveau/kms: guard NULL crtc in nv50_sor_atomic_disable()

 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 30 +++++++++++++---
 .../gpu/drm/nouveau/include/nvkm/subdev/pci.h |  1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c   | 35 +++++++++++++++++++
 5 files changed, 63 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c

-- 
2.53.0

