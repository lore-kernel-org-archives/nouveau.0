Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2DED6AAFD
	for <nouveau@archiver.kernel.org>; Thu,  2 Apr 2026 19:05:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA57210F294;
	Thu,  2 Apr 2026 19:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WKfetsz5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A74BA45535;
	Thu,  2 Apr 2026 18:54:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775156068;
 b=wgtgQSgYh7sblqnW9UrxIecmlsma9O2ukJOwMaEKu6Wr3fXtQODHQ5iqqGC+lm7cEiEGg
 yt2QL9wYDRNcrLofMM+oLdsf57APILZpeappGjLKWD7KQSWvE8KlI9sHgEwn1dpKBL2VBb/
 r80rP0CAee1zYhAMkbCVw47RnQTU87TYCFeVbZkzwrck42Uger8oMdke0orvAxEU0rsWRkv
 P323/KAvIkjBZEikt0scIlGUHJGqmNkNCpe5AEOh2qGYJzyZaMyyAFvkOIN3k67ZPoUII2L
 XeVKlT+qwQEGC8lnOH6vCjw0q4uTH1S7BKsa6vxUZxuwPVMZOL19ysKVHqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775156068; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5dsxv+9N5UYtyRA+mf9GFE+J/Zg8wMxB4zS2+EjOGQc=;
 b=PL+zbr7KzXslIIENGw9rZXv7zpb8jUfFt9he7228F4bziHDWQI9vL+5ObPqOJAxOHfHKb
 osCoHhXb+D80VKTTTBP3aaLiKckab2WJ5Ks7V9g7P+ogUeKmKBGH7D9r32dBhSwv3IPozRr
 LCEdBphjzKmzNTJvFjtPSjBCmRfAuVRsC2vTt4aUfTmb0+hIOKa8lTwmRlvXyX053euFuZH
 Az0eq8ztaLJ0u/KgU16tR/BG1onKEqo3s6lg46oJDb4jmQ9lO0lyhVOyKWdPDhXBx8a/ZpY
 TRNXvFvmqOMmjICV/eL9bG4P6xRv3EXkq4QzmTRs8KIisVmxNbzsNBhduF/w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1F1EE41B4D
	for <nouveau@lists.freedesktop.org>; Tue, 31 Mar 2026 10:26:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0FC710EA45
	for <nouveau@lists.freedesktop.org>; Tue, 31 Mar 2026 10:37:50 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-487012ce896so34120925e9.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 31 Mar 2026 03:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774953469; x=1775558269;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5dsxv+9N5UYtyRA+mf9GFE+J/Zg8wMxB4zS2+EjOGQc=;
        b=WKfetsz5wa+vbWx/siW2zMBGd4sZdVfXCEbRdfpmOrCg6gdKs35yyDM35USV1wzBIb
         UPCanYfX7umHWKoHkwobhCBSML+Ea+5ctxDMkYiJwcvTgvqDMLrI9L/blNQV+HwdJoSY
         E3ADDKAy83qiEDR/XoD6Dbgj0d818lHaaCnLM0szuH3i7yxKiB+PQe7Q998BrcGb+zJ2
         8g0ZuGPQNiqIBtYJi76tU+3KVSVAqLzWpKOChecmbwSinSiM6sURiIqKHHXvQXptV/lS
         EUVnLF2BNLj9anpGTI6dXmLwJk31ivAjeXr3DHEEAz1COezL627nFmNq3FYKfe04j2Po
         rafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953469; x=1775558269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dsxv+9N5UYtyRA+mf9GFE+J/Zg8wMxB4zS2+EjOGQc=;
        b=er1466XRgdALF9Kz/JHoOQvi58gcOonV8lLMJ4TUkCDrRjFOCvrcxo7KLb0Ji47rdt
         J8tvJsfhAN66TqQBHsdZX0X7KZjenUYNlGS71/sDRNO+c9OICJ4eEXcgYUgbpzWzDEpZ
         TFOOk0Ll1h95vbTjbdytkjZj1nWXoTuHD9znY+nk127uNtBjTUC7SY+2Gt+NJ+whqjUp
         IVO/TusDVm+ze9qdedflLM4F4MeJ4E4qCHB+GxZLQ/sBBW44HpB1RP2drrEwDlqneKBz
         u3z9d2JC5rH525JZLesLxqsgzFkkpNeoDLXt8rETUFIPRWfGyGu8Dy2cYw4t5/mDoazR
         yguQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxSIXiHbjQzSPtm1bmo/x7anxVy7qDGzhljQ1qv4zdAyMJoKAFOljCSItj/vNdVDxKVl4pGjJK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOFNnxFiv14BQ1aebJEAHAzj8aVI/zM59RuLlCxttTeb+/HsVr
	Jm4ydXaWPzMAg07lz1MyeGX69p4rH+auava4hLpNmv36PWJdkWOVQJyZ
X-Gm-Gg: ATEYQzyAOyHfszp3Lk0W8lYG4oRSoOADmUoXKwBmNPoLqBGC6Ntgzy9wzPCexXzPQa2
	me01j+eTeCw1XvIzciOeiay48nWuWK9V1qT8d/gf7ILdj/8itNJ2ZY7IOxFRpKqCLeYCGiTGiyf
	/Ef6eHm8iBd3raXvS+Pz6u3JMUtvPBPfl+w0H7e3J0jbC5VXE3RWAJyo6qiP4pfRfzmVkA/i1TE
	aVDfFpiECwUamfpHJrotJ7SyhsSjmsjkZRCmPQL+d8xdyF/oZOq9PK4XD2L9nHJ6zySYF3BeoNO
	HvHP3IJubMeGXJv8DIlbfbyl9Nt58RBYny9qqKaUQziFNxAhZDQk/QDb7Zpzs86VLfpdmtcbE8n
	dvij20RLRlNpEWR2et+hFJNoAZs86CuNEZ/liDNMmaKQBQ94e30cPDOckw3gI0tkaQVGLFBAALs
	lfXFSo/I9QdX7sXKNQwXIqsW6SAo+kmdUOkGjV/mxDKqF8ts8S8hkPoUrvlA37UFWe6yUPUG07W
	9+xJoVRys1q
X-Received: by 2002:a05:600c:c493:b0:471:700:f281 with SMTP id
 5b1f17b1804b1-48727ef16f4mr261484875e9.25.1774953468721;
        Tue, 31 Mar 2026 03:37:48 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e93c0cfsm29703585e9.9.2026.03.31.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:37:48 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	nouveau@lists.freedesktop.org
Subject: [PATCH] gpu: nova-core: fix missing colon in SEC2 boot debug message
Date: Tue, 31 Mar 2026 11:37:44 +0100
Message-ID: <20260331103744.605683-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: devnexen@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 3R3FRZDVHVAUGEH6Y4FWICZT2ZVMGNNV
X-Message-ID-Hash: 3R3FRZDVHVAUGEH6Y4FWICZT2ZVMGNNV
X-Mailman-Approved-At: Thu, 02 Apr 2026 18:54:27 +0000
CC: David Carlier <devnexen@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3R3FRZDVHVAUGEH6Y4FWICZT2ZVMGNNV/>
Archived-At: 
 <https://lore.freedesktop.org/20260331103744.605683-1-devnexen@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The SEC2 mailbox debug output formats MBOX1 without a colon separator,
producing "MBOX10xdead" instead of "MBOX1: 0xdead". The GSP debug
message a few lines above uses the correct format.

Fixes: 5949d419c193 ("gpu: nova-core: gsp: Boot GSP")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 6f707b3d1a54..18f356c9178e 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -195,7 +195,7 @@ pub(crate) fn boot(
             Some(wpr_handle as u32),
             Some((wpr_handle >> 32) as u32),
         )?;
-        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
+        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
 
         if mbox0 != 0 {
             dev_err!(pdev, "Booter-load failed with error {:#x}\n", mbox0);
-- 
2.53.0

