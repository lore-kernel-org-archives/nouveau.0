Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58053C5B572
	for <nouveau@archiver.kernel.org>; Sun, 16 Aug 2026 13:09:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBF910E2CB;
	Sun, 16 Aug 2026 13:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hHgKN8hZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C8CAD4786F;
	Sun, 16 Aug 2026 12:52:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786884763;
 b=AM5cTBdFtvWQ7/2kKoG0mD5UBPusG4+s4tKBFM1W3rjVMjG1+25rFm4l18nGc8K8v7z8W
 AmAhtxUBhqeoi81Egw4H/CTstH9cF6OM88ZLhK2ausokepx7Rki8cLfe+k4S68nFUraz9VK
 GQ56TFe/Wnrgx7s4qcHApyearRFTtrpoRUCe1Y1NadfR6HQ7KI02R49QCxriVPOIymnXmYn
 z4bGIJ/tYZrO7X6maKxmkn7qFsfHmAkgm7K9eD5XsSXv+berimtrH6sVtY3mCbojnpWd2J/
 ZPxcy0d/YsiUXvSSVuwrO3qddaUOMMqzFQrk3iVjbg0LD2Qa985HFwFRIH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786884763; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uV4eLziIu7+6QdHB29PuLklAT6W4mEnmwjhDwjBVNpo=;
 b=tGEHqTcELIfIUjRAEBrq9Gvx4D4uvOJgIs+dwWqgT4fnXXTHClancmsW+BdDlPINK7I9n
 KxOGVovJISrpFChS+DM7s9N5dXFBql/tS3Bi5+xGmW6++RpwxiAiye5kcsomDNaI/VNxjFI
 7iVXlAxnde7d6rPXe8GPw8FNxL0Q867H0+yK6kmk2QT+PslqPS1tnkzN5t81H/kswMHP/ZU
 LKPRT55Nt2LXW1pst3wIxwP0mNBrrJJCO2wKYrfkJjNE9f/kjTsDBuuRg3bXkeIYuKKSPHU
 1L67WvFhYt+Ucl2a8hlEa+bd+OVWRHf0gjVNbrIKn3hwFpBDtAJNS8vgZfGQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 52A7B46D2B
	for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2026 12:52:41 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4D110E2C5
	for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2026 13:09:07 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47fe45db360so311397f8f.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 16 Aug 2026 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786885745; x=1787490545;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uV4eLziIu7+6QdHB29PuLklAT6W4mEnmwjhDwjBVNpo=;
        b=hHgKN8hZ4kK/3isIadrFNAuqtlXU6T6EbXh79ggTj0TMFGQv0bki4rp3ESonIeImKM
         hZv3BqvgXqg5/+sUFElY9jdGOFKtJjSRb8bhogXu0KxH6h/lMLHxeZYbSqlAtKbtdlqK
         2d8D/QxHsZSb9Vx6K4Qd/Bi/biQ9tQul7+WRmDpLP2zDvAvm8n5azqlvxIhb7m5XzzAv
         7kyKfZmLZxOvYSZ/+0Uq41yxkOWx8iO8VT/PPBUIBaGEimj7qMgVSuuAZvVf2L5KBY8K
         MhJ928RzkyHjuGU0HRfmojLTgZWpA6obPuClXF/YUKBm8TimZBKwMBN380eIypt11tnj
         QKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786885745; x=1787490545;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uV4eLziIu7+6QdHB29PuLklAT6W4mEnmwjhDwjBVNpo=;
        b=nLXq2VwoR7vTrorU3Weq4ArK1Feru+v/QUzhrcdPWIDFNWxuMdUjA2AXPBP8nDQJuK
         s8sAXdoR4k/XllJTsYzYh6yXDUdMiE3Va68IBnTVa04ZeyHM5oaF5ZUWyEV4kpK3BznY
         cojbPGsGLrUIKpiJDsrB7RnrDh/23BmtUFzqDOINIIs8FfE2YjEjWoNc8DfezfEjqGIu
         nVBE/ppXnetEdQPYWFu30emE5dZdh2DJl+E4HaUJiuRybETa0I5kJUM4NVfmf+SpZdYi
         rbmknkS+gIaeRV1cUw7IsUu4xaD07CkLr2gwqHZfoWmWcrWG7SSIoiKs/4EDzvg0kZwv
         s+HQ==
X-Gm-Message-State: AOJu0YwGgUdTKV8ZdY6ufas3Sz4jRMwIYn9Osl34U8uUWLA2sj4P/8Vf
	90+UvdYI6ePFR3SpHk81yYMnMr6l7BKFOR86A86tkE10xGO8rTxrpE83uAvkc+XC
X-Gm-Gg: AR+sD11Jbgg8NZiAMOqReSmLX909uZjlq1Mqsg0GgwWANoQuxmq1Y3eSmQ9uu0bBHvt
	byrjQEZUzaKZ7EFtYa3N3mCtaRolvlE26BKMfRgNHZc1ILpIDbsCNUkLFkmU5nRmN+YJd/TKUZa
	xkIzxIuECUSgDwDA+aheVCXkZOxi4JFs9EMb/kWJGa8xXsSxk89D22RSeD6qMo5rMsLLEHZ/uKz
	4gOwITORv2xhoNM50Z36Sqi1CTLeiRr+i3jr802xuLCUuVzVtK5YvqkKIgcSdSzkqCnHwQqjL6w
	kDuZ8Y5CpddQh+iJRrwohjWGXQ3UHjelqP2yvnmVN0RH1fFvCygbgd42uG0+9++uU10Wo1OdcI7
	4LG+vxNImOfv+Ybofb8JrJ8SmD+byfDkXZ/HTpLOvX4si8FwW9xgBnByMejHxnWS7Q1iQDHAmyC
	Xq64v26lteShXO1BvxlZ9X3zBSy9QfLMs0QKUiMmvB+BOgpK0NxnZbZjQJgwOGlypeAopeHrroW
	LPI1xk9PBFdNw8yJeuAt6wpm8+rpg/YLA0oWLdfFg==
X-Received: by 2002:a05:600c:a0d:b0:498:1371:660c with SMTP id
 5b1f17b1804b1-499878d5e0dmr133443125e9.0.1786885745481;
        Sun, 16 Aug 2026 06:09:05 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996105c0bsm66548375e9.4.2026.08.16.06.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:09:05 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] drm/nouveau: NVAC (MCP79) stability: MSI rearm and a
 NULL crtc guard
Date: Sun, 16 Aug 2026 15:09:04 +0200
Message-ID: <178688574400.522643.6695278742335367229@gmail.com>
X-Mailer: python-smtplib
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID-Hash: LZMG67NMY7SM23ZEUHQUI7XAFT2P4KKP
X-Message-ID-Hash: LZMG67NMY7SM23ZEUHQUI7XAFT2P4KKP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LZMG67NMY7SM23ZEUHQUI7XAFT2P4KKP/>
Archived-At: 
 <https://lore.freedesktop.org/178688574400.522643.6695278742335367229@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

This is v4 of two NVAC (MCP79) stability fixes.  v3 went out on 11 June
and has had no replies:

  https://lore.kernel.org/all/20260611124535.527275-1-mczernohous@gmail.com/

Nothing in either patch changed.  Same diffs, same reasoning, same
trailers.  The reason this is a v4 and not a ping is that 2/2 no longer
applies to mainline, so a ping would have pointed at a series nobody can
test.

What moved was somebody else's context, not this code.
Commit 5164f7e7ff8e ("drm: Rename struct drm_atomic_state to
drm_atomic_commit") changed the callback signature, so
nv50_sor_atomic_disable() now takes a struct drm_atomic_commit *state.
2/2 is rebased onto that by hand.  1/2 applies unchanged and is
byte-identical to v3.

Both bugs are still live in c21bb4193868.  dispnv50/disp.c:1568 still
does nv50_head(nv_encoder->crtc) with no NULL check, and there is no
guard anywhere in the function.  Immediately below it, :1570 takes
nv50_outp_get_old_connector() and :1572 dereferences the result without
checking it.

1/2 drm/nouveau/pci: use config-space MSI rearm on MCP79/MCP7A (NVAC)

    NVAC re-arms MSI through the MMIO mirror of PCI config space, which
    is unreliable on this IGP.  A missed re-arm leaves the interrupt
    line dead, submission times out and the GPU looks hung until
    reboot.  Give NVAC its own pci func that re-arms through real
    config space, the way commit 5112abc6a433 ("drm/nouveau/pci/g92:
    Fix rearm") already did for g92.  Only NVAC is switched, because
    that is the part this was validated on.

2/2 drm/nouveau/kms: guard NULL crtc in nv50_sor_atomic_disable()

    Restore the NULL check that
    commit f575f2bdb6c3 ("drm/nouveau/kms/nv50-: Remove
    (nv_encoder->crtc) checks in ->disable callbacks") removed, as a
    drm_WARN_ON_ONCE() rather than a silent return, since a NULL crtc
    here is a state-tracking inconsistency worth seeing.  The guard is
    hoisted above the backlight teardown so the old connector is only
    used after it has been checked; without that the oops would just
    move a few lines down.

Testing.  The MSI change continues to run here on the Mac mini as a
daily driver, and Fab Stz confirmed it independently on an iMac9,1.
Both Tested-by tags are carried over unchanged from v3; the
diffs they were given are the diffs sent here, apart from the mechanical
rebase of 2/2.  For v4 I rebuilt 2/2 with CONFIG_DRM_NOUVEAU_BACKLIGHT
set to y and to n, because the patch splits the #ifdef block in two and
that is where a change of this shape tends to break.

If something about the shape of the series is what is holding it up, I
would rather hear that than keep rebasing it.

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


base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86
-- 
2.54.0

