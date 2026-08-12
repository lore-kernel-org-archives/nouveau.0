Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D34C5B572
	for <nouveau@archiver.kernel.org>; Wed, 12 Aug 2026 15:00:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C61B10F055;
	Wed, 12 Aug 2026 15:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fr+4dxhS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 64C85476F9;
	Wed, 12 Aug 2026 14:44:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786545859;
 b=m2YXPjaMsjSLr0nB046Qr+O4EgZxEQB9fZW/YzdEMuG2hEIEcjwVQTzXQ193fUufgRrkA
 BXKP1yLU4G0I76QYQEbLCagtnL5KGo8kXdFfpdEflzKlsiTm019DRR5f/Y17ASmd2v2U325
 uIBvvs+do9+LA9dqf9OPwOHko4ApzmJZbCPpPv8JGMu/B4aLsCnTp1LKzktDSYM9Sm5gt4e
 CTSlXQ1exzubbUhBIQ7zMYee5+wrbuzRdAdsKu13VXZ/bFTlNKYOlzOXQth154uJVApuXin
 Uo5rDAf8OTw1WtBoppbFjzIHRkxqYwIb/CcbErMHX7IuVF6j3IGTNt33McuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786545859; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bsSNRPwXgz4YmhClD9/CFwQgfHi8L4hudE3tc+zdeok=;
 b=iCE686agrVAJF47uhx1w+b5vlkH+vtjhXrZDVArp6neYAen8XW4qGjU6a33grNPxnqYrh
 asIVMhxdHGx4Y21CXUlmj4jbYBp7It+tt5UNv9toE1IgmPcKg7sP2bIYdcnKaqu60YW9lbO
 ii7GiFS2fFXWCLDOCrEfB/pDpxRCcO8WEdDift/7qhqI8r/ZqbPovYRzoggjT07ZD7Z35ch
 UnfeMI+JT1lehI5xTL3n0cYh4YWM7B7OtcGhrqMHtUsE0MPRnETrSnKpZj8cseTbTbnoY1q
 S7ji48WzfPOAXo/UvGr3sDAX3TavocFkLUq6qhPfMUCNhewYP8o/vm/qYfCg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B0C7745261
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 14:44:15 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 20D4F10F04F
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 15:00:33 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3856d6fbcb3so1188175a91.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 12 Aug 2026 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786546833; x=1787151633;
 darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bsSNRPwXgz4YmhClD9/CFwQgfHi8L4hudE3tc+zdeok=;
        b=Fr+4dxhSer2An64ADigHeGhfMZJEMa35q1ZuMe+SM+9zMpmmyT/7tUJ6Zsbr8LSy92
         +PQMp+L+fOhqmUH2eB3fff54Kg86CNDvGO+liAyglzuuv/PO+2eQDH3iq7LWVssfRmQ+
         YY+t3ipef+tUGaK5k2p32Ohs0SMmQjaHqmo4WTIuA8TZtT6Z6oEaXN1yeYPwLL3wUMAA
         bnBBSuOtAzJ1b1g+XMaEnS0OTzXIZoMkT9FuAgkPjDdZh58M2AqomQyz4gMDIbUzG3+T
         Sso7LiQxZ1A4d4ophOib2NxPtBaMNBXrLx1xiouCToUNbK4eTxKHWYWh37D6PcdH4jkG
         Gu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546833; x=1787151633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bsSNRPwXgz4YmhClD9/CFwQgfHi8L4hudE3tc+zdeok=;
        b=qKk1szgWrbex+0FMOgggcYIR4zsEoKGDNDxVvumj3r6BHheKPE4RMhe3E6Qcr42XvD
         3yb55WsAHRT1Uubdu2a5eBhspdtb3M24dsRDcwuoIMAYv1YNxaN2UizvP7FKJSH4ruh4
         08kzRyoYjePRc165X3vBLraohPOAniAAyJA1fhUUPR2TBONsDoY3/lMJZaqlCkalzU2n
         EU+EpeOAJY3heADBd/0aPNHVobPLoRaHVAbNCv3wKEq3+rmuDDG1zgYO4LI/SU4olty+
         gRZs1yScHjdLgg1w/QjrDtaxDUdyWITXGFc0nyjhN2BMNGCyo49+pDIkzT5NBWNu8iTf
         MnMA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrUSYy1lNuCeD3tzY6toA/X2IXnASQlhTWrU/i0Lxtkt3nFZ2MQ9FLFAYtM1lIG4GDSYu+I3WCj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYZN1/p8/M3bTW9DKH1MMSsSgwRM1oU/0EOP+w9JXSE/BTaToE
	DT4I+1/hpxHj/o4IMqhxCAPR7QSc/qOIvM0QoYdJZngj+SCXhEJQ95Y7
X-Gm-Gg: AR+sD12mAO3TS3CgcFXR//9PcVZUvwxb7XWVw5cvN4Z6VXDtgNL1Gx9Low1hYwwwssj
	ComJ7CSsJN7hN+X6tT4ibBz+pb7uisiwffmoyK3OIeoKA/S3PKflVvT5HqQJA5rOrB3rXwv3wDV
	Z80mcgV5BC3xMKhu1yIVh9cX2LbAMgAsSFXMuhdRjGZ31yDbDNjf8uX6Ht+AkFfGLFI3oufqqNo
	p+vmmUMaF0SLGVPmOfo1nHIGrSzBIhmuUtyrOd5hKDWLLP3p9lrbDC7gTyuVwwt7eBGeVGdTeY9
	kEazxWjlm3OU9cbCyq0NoAcy1yoKeogZBsO7oKmQ6V5V7z/+WZF13LFF8/IER5HmrE97AcmSbzZ
	5CIwA0dLKPmhxYMRhVTl/A19CuS2ECgtMVH6v5TvL0qE676o+wnJb20LVc9S29PQIqFgC5dH+yb
	aG+wT00AS3OosY5Nyc6w==
X-Received: by 2002:a17:90b:528a:b0:37f:e1b6:4c7d with SMTP id
 98e67ed59e1d1-39301287f66mr6968430a91.6.1786546832312;
        Wed, 12 Aug 2026 08:00:32 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-392f935f73csm3896491a91.6.2026.08.12.08.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:00:31 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Subject: [PATCH 0/2] drm/nouveau: guard two render-node NULL derefs of
 absent NVKM subdevices
Date: Wed, 12 Aug 2026 23:00:03 +0800
Message-Id: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHOKfGoC/yWNywrCMBBFf6XM2oE0tFL8FXGRx1RH61SSJgil/
 +7ULs+Be+4KmRJThkuzQqLKmWdRaE8NhIeTOyFHZbDGns3QWpS5VHIFpb7e6HwmWTAXH6milGn
 CSIlGHHsbfR9s15kBtPVRyd//z/V2sI6eFJY9Dtv2AyjbMc+JAAAA
X-Change-ID: 20260812-nouveau-nvkm-absent-subdev-null-deref-f52db5c24408
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786546828; l=1909;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=9ZuFZsbGjnuxi4gxJ6gdaTdFRQu5GUSAhJ89zKR0YI4=;
 b=ElzEuFopoAhqiGv9INlGlqScomht2xFPIi93NufKAn1DNkZgTULNfaJV8/oZt+WbKtSpDl6Sw
 eDE++5uEgHRAeL36Y9JM6kVgJxmbBIj+FxNbkntO4u8h5M94nPrFYqu
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
Message-ID-Hash: CC4DKR3VCST2RYPTY6KPRRUCFR73CC4P
X-Message-ID-Hash: CC4DKR3VCST2RYPTY6KPRRUCFR73CC4P
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CC4DKR3VCST2RYPTY6KPRRUCFR73CC4P/>
Archived-At: 
 <https://lore.freedesktop.org/20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Two NULL-pointer dereferences are reachable by an unprivileged local user
holding a /dev/dri/renderD* fd when an optional NVKM component is legitimately
absent after probe.

When a subdevice/engine constructor returns -ENODEV, the NVKM device
constructor (NVKM_LAYOUT_ONCE) treats it as an optional absent component: it
deletes the subdevice, leaves the device-> pointer NULL, and continues probing.
disp can also be NULLed by nvkm_subdev_disable() (strap-driven) on a headless
card. nouveau still completes init and unconditionally registers a render node,
so two method sinks that assume the subdevice is present become reachable:

  - the NV50/GF100 sw-class vblank methods load device->disp->vblank.index_nr
    (disp == NULL on a headless card);
  - GETPARAM_GRAPH_UNITS calls nvkm_gr_units(gr), which reads gr->func
    (gr == NULL when GR construction returned -ENODEV).

Either yields a NULL read -> kernel oops -> panic-class local DoS.

Both fixes extend tolerance that neighbouring code already proves is expected:
the sw channel constructors already guard disp, and nvkm_gr_units() already
returns 0 when the engine exposes no units callback. No new control-flow paths
are added.

There is no Fixes: tag: these are long-standing bugs predating the nvkm
reorg, so they are sent to stable without one.

---
Zhenhao Wan (2):
      drm/nouveau/sw: prevent NULL deref of disp in vblank methods
      drm/nouveau: prevent NULL deref of gr in GETPARAM_GRAPH_UNITS

 drivers/gpu/drm/nouveau/nouveau_abi16.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260812-nouveau-nvkm-absent-subdev-null-deref-f52db5c24408

Best regards,
--  
Zhenhao Wan <whi4ed0g@gmail.com>

