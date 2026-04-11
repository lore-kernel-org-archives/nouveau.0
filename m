Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412ACF3ED58
	for <nouveau@archiver.kernel.org>; Sat, 11 Apr 2026 15:52:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F3A1C10EA1F;
	Sat, 11 Apr 2026 15:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TBRxtZxc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3A1EF45803;
	Sat, 11 Apr 2026 15:41:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775922066;
 b=zRK87qQCtc9A/Of0xZ2OVIJBjbbuqiEi4U0wd1KQX5PYnxpaOzF7klaGkI1j8Kod4h8Ql
 qRkHotOq6HgfFCK9Ssb0brBXuNYyjkZ3VeLRaWJSyEbkidIhP3bUBazjYJTi4BtllkaKJjs
 J9XQoEm7jmDNx2R+0wXYMmmYaADH05TiomrEyU61iqrFu7XzvgZX5fa8uVEjeotzPt977HO
 +N4+fQKfRzh7UK2wsJQfgByGoGxzCZNomng3Dc4VaLjWfjycdCziWk5j4tLrtOocucKbkom
 /Gonz9XtoTJf2zCSdBudIfBL/t9K0zy9qqM43/FTt1eTrIsdqlYdfCiwZzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775922066; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6Mp+f+a+GerC2oFr3qxw4PkE1viVQhwuT7MAD4+L/Nw=;
 b=W1+A0iLa5IfoHn5qvrJywrVo5mia+LzNpBJT4NY+PhpI/oxOaoGfa/mDj6ywOEkBhh1rV
 gXeUmR50jcmfJ8SAhpztv8chtw5wx88wk0KlGBX5k7ppO9VFn6oCm6qYMo+tXD/0Da08GpF
 Y5YzoDpn2nekf2AE/uoo5s1Rmi3S7UssgyWJ6OhM4OflrmFPDaszrm6RMtmGRq1x1Er2vyL
 +UtXWXHBWMGyewz+eMem7rS8sEwAjKcoU6GN3iBxzCQLSN1L1kBEHtlyP2dN0ANfHohwPZ8
 UfB81+T7BMsHmmuEBAruQ/sZlYxcyiwhzNQDE+BBxD4R+HCK9nhGvfhTneuA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 38F4D400B6
	for <nouveau@lists.freedesktop.org>; Sat, 11 Apr 2026 06:18:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CFA0410E19D
	for <nouveau@lists.freedesktop.org>; Sat, 11 Apr 2026 06:29:43 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso21071285e9.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Apr 2026 23:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775888982; x=1776493782;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Mp+f+a+GerC2oFr3qxw4PkE1viVQhwuT7MAD4+L/Nw=;
        b=TBRxtZxcvax85SXqM7Sv/EVIPeFsXL8EhHAIllaiYbCQT6NcMgoddcbHZmF4+imoaD
         T6JYqN9G2rilcyk8isyNcC/H24wSebNPV0k0VhFy24TBhEJFhS8NkVAaMSKWBtXCz2Mx
         of9+BePnFucfjiEwwxyAz+kh8BKH/RwNgjsa1QrIcipabr8fSctHxHIDMRNGQ0LqLiyy
         b2UOaDgCgcEt/ia/67i1dXnhfYNRfFUydJTY/6ijUR1mSHfXPKdx0h/qECc3EcFJgJgW
         XHBvi6VmdBzDo+DPvv5yWcoUGKJnxK9KCa8dxc/Ef39buSk+SyHk6G2FqCn13MLh2P8n
         Z0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775888982; x=1776493782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Mp+f+a+GerC2oFr3qxw4PkE1viVQhwuT7MAD4+L/Nw=;
        b=Y9Z5a6FQ8EvSAcehf7SMZK3mCmhOOYrMkyWQq7e3GMjmN3EstNLhQshiTScJ42gRew
         l9JcFL1SRL3PpLZPALzfzAYpqDbxgT9TLULYW/6ppkrt0OXnBF+srFA7BarXmu4ZY9Ja
         bf7KTemVPOUbwPKmL+vfv8mu1x37/uF8zqHQAAbnDrTVM92WSe9xrmZp95TI7EH17aiM
         Shn7AXWilJPevIMMHlsfxrApX0hws23lfreUlsaaATwON58SSfq5LK92OqVgzOdYtQxn
         aguRffkSFhDEsLRFAAs0193ZOxEmEGrOB+76BXTZaAJ8vv5GQNEyDi57xwGKYwwIh+4q
         vamA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkapBcne/nROdxCLprwMgYnqoFrSFCL4beguAqT2Yj4J4ACks+0zqAj4g6DaaNWy1zXcwd2tm/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyIg/l1iwvumrkoTOBCGx8xihsVcUJ5QPYT01fLFczCJvqtHhN
	NZzumU7sBMGpBq9z/7LolChCGzNVTYTnqvQ2xHoPPImtLOpUydjzxI/F
X-Gm-Gg: AeBDiev0R8Bq/19LvdLtPG/c4hdI8Mh05PhZ6u2j3Ap5h1cK+Riop+jPeE/RvbekzUm
	r7WMp8TzE+lkDxBxTtsYXaKd7DdUfAgh2yjoUoCtKhpK2yxrBBX9X2tQ4PCjqro3IB/0MRnVrmX
	4tdBELWEOGLxl9KzmhF1iKTf6NeHyTFu8JNbo19Z/PSqAK7ZTI0E52ESIon/jJfC8ARB4a4HdCv
	G6CxyXlXPTMI7FfHZ410lBpbphsbfXlbPRjTVOcfi/ywmP6UHD9i88iS+SxbWXygtSNigzdpsAh
	m9jXcQjqD+RBPahhmo+DvevstPbasSQpSi9hkGdRRjhSc5viD4ikW30FsEhQHc+A7Nn11d13IQP
	UyweCl9q5HlM3yjkFwCQROF9djBwMizhkJFXu75fHE0oMUCRqEObg1IZT5KurX1oIUaqoCevZLb
	E0DIJjNRVA5w+sJzsQhIO+aB6VVan7rv/6p5Qm0HjWbCox3Fj5bxzTJYPtXgEoPnxZnjplW94d4
	ZrDzqBEoKjo
X-Received: by 2002:a05:600c:45cf:b0:483:8062:b2f with SMTP id
 5b1f17b1804b1-488d67b8dddmr73834715e9.6.1775888982043;
        Fri, 10 Apr 2026 23:29:42 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5888a97sm149666695e9.2.2026.04.10.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 23:29:41 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: dakr@kernel.org,
	lyude@redhat.com
Subject: [PATCH] drm/nouveau: fix nvkm_device leak on aperture removal failure
Date: Sat, 11 Apr 2026 07:29:38 +0100
Message-ID: <20260411062938.22925-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: devnexen@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: HSQLMOK6G3YHXUBULQCRUR3HKXCBYTOB
X-Message-ID-Hash: HSQLMOK6G3YHXUBULQCRUR3HKXCBYTOB
X-Mailman-Approved-At: Sat, 11 Apr 2026 15:41:04 +0000
CC: mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 bskeggs@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Carlier <devnexen@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HSQLMOK6G3YHXUBULQCRUR3HKXCBYTOB/>
Archived-At: 
 <https://lore.freedesktop.org/20260411062938.22925-1-devnexen@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

When aperture_remove_conflicting_pci_devices() fails during probe, the
error path returns directly without unwinding the nvkm_device that was
just allocated by nvkm_device_pci_new(). This leaks both the device
wrapper and the pci_enable_device() reference taken inside it.

Jump to the existing fail_nvkm label so nvkm_device_del() runs and
balances both. The leak was introduced when the intermediate
nvkm_device_del() between detection and aperture removal was dropped
in favor of creating the pci device once.

Fixes: c0bfe34330b5 ("drm/nouveau: create pci device once")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5d8475e4895e..517ff2c31dce 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -875,7 +875,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	/* Remove conflicting drivers (vesafb, efifb etc). */
 	ret = aperture_remove_conflicting_pci_devices(pdev, driver_pci.name);
 	if (ret)
-		return ret;
+		goto fail_nvkm;
 
 	pci_set_master(pdev);
 
-- 
2.53.0

