Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14996C5AD5A
	for <nouveau@archiver.kernel.org>; Sat, 15 Aug 2026 17:31:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA7B10E213;
	Sat, 15 Aug 2026 17:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lP9bg+zC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 93F7D47837;
	Sat, 15 Aug 2026 17:14:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786814081;
 b=BAJAUXrRwhSxPlXDBLdGf7ARLp/hCafq0yw6J4zMGDz3UFUspgUSUwqu78jnAb3rpVKGv
 31NP4Ow5x1WwqQl2qrnyY/M5nfFEnsAuY3/36bv0nIIowWbjY13Yw2DM/Aqu9jlar8OCBCp
 YG5mlvuSiG7D3ULxowIrWgLf1oR40QREMG7NlUHTFhyQYW5Z3x2rV71Zoy1eoBZKhA8K7o5
 gayto0ILJ3KDyEy8t9mUg75WRX1oxu/AQeyi7xFWKmOOnZtTKV5VWrMktvxDI13hgMi41ae
 obeAn8HBa1TOWtppyEMZyoZSlT0M6cqfCj5DGrPP6x4MiArWOIcu96DmI/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786814081; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BkvQvNk2oNgW6GeNnclUP07CB2P6+HO4+248oqvobEI=;
 b=brIwcmMMqNFpW5+4ai7vv8dX3z16DqfUEmnHM9vd4oiO4nSdTMdtiBw+/1TInxN9yF0oZ
 TlSJWOa+G4NYh4uQNQd8RtQPPXpRGJ5XMzuskD0yUJ6SyHr2Yu8NCk4UU9YHXtSt7NO2jpN
 7NmXHRgndqKaK4x5DFQzm1gXe+GbfG+3SRWePW8nR1TOoaVwkXF4hOs6maPO5TT3F8vWhgT
 +8by0iHxJFNbFiRyKI+Q7dcIzSXf9yw3rMfbMqN5bkQBIUaKEEc54OkOBZG91bRm1SsjLmJ
 Ivn9fzl6655K/WU5E/otwFDcuhCq6n/6fq6FbUYsHVvdrLm5alY7+jSV5+CA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C74DF47818
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 17:14:38 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0E70310E1EE
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 17:31:03 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-6b0b7464c99so1346075eaf.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 15 Aug 2026 10:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786815062; x=1787419862;
 darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BkvQvNk2oNgW6GeNnclUP07CB2P6+HO4+248oqvobEI=;
        b=lP9bg+zCrIJBYXw4/wl1WxsWdSKDlZ6ItMBxLCZw8Wja11ALXJPkMIMvl3oUZrKFqJ
         4u0M6gcBx39TmpmGWP6eI1bHZUIGD8UpRzmGGa6ZWmoSGPVx9lFNx1CWgsDtbrUg4M3e
         s89YtiJKOHKT2RTLe81HJh35stlo5wW8x6LwBfnoE7XIFccJiWJb7mOTxVzG1cfGPK0C
         O0fz0gYIUqJTeyA8N4TLekodlgmxdD/aA5wnZGGaEItt/R5+nk1jM3WYixHueg+QnZhM
         Gape0uQE9Ghw6L9a6a8bMA9cXBfzACMHszbkepQKJD63YoRxI1lWYEM1shhbmLi3QqEl
         YGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786815062; x=1787419862;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BkvQvNk2oNgW6GeNnclUP07CB2P6+HO4+248oqvobEI=;
        b=gD5y6iJ1fAanoazyXx0S1zRgeUl5+B3PtDjxo3c3smWBtN2dw/XfGmGoCne/z1TmvE
         ow7jVjFuSVv7SqE06DUAZOusOetc723PGF8A9eQ3OfLrki2+jNHRzYguIM8tBnnE6UM/
         LvevSsAwc+EOZBCfEH0J6lJsh4Xr0VMJLXeOzHxWYCDQADD7Yfdui4BbtzKhEmdPTI0e
         3UqE0EAhIJ3wAuASXk8UxLtJ0ZN2Eo4TwKQYiEXqLB+syC6tGSBPj/1sLjPMd+advtDm
         whBkj1H7+DDGTEloDnBhrZ6Jaj8+PbnSXRQyRxocnJkDHHd5fvisAdI1ptGiTy7CAHwH
         qrZA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpyPVk9iZzosYAqHLH30tv6sr/P9jG9JARWZDswV0n8jA5tcMTs2rFIhXUNCIT+d1GtwPjrlAmY@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3RXuBI9U/qtU2cRv/y8RKlAWe3HovOdWNYAklntnynhEr1i2T
	noJRmD3ExjgMXbGv4sdBDbQtGBwu6V5LJAtN5RNZwKs7xpCWGsWQDEXP+AIMbjA5
X-Gm-Gg: AR+sD13kTTAsBfD6yXKdZ4gqPgcESQBTJXWvi+DvdSfh6wdZmEEVrw9umdoCC/g5e+E
	rtbgF9Hwv//sp64QZDBlOKaZklVyfKjJ2+eRCbV3LZXPpmpR8xGXsD3Dr7Yiy7ihz08nKUxk6WQ
	cNRWG7VL+NqEFjavsxP9LpRWzVQWHZYtbzr8OkC5EC+DuQCETqBn948V2G2VxGkFBhHAH8UbxYd
	FOzatRyK2thnGt093kWUZUzLbTgEjhxK+DsdH0V3w5nGERisR6tKxQZa/M1UKv8M/Up+9CToLc/
	1yA8+QoUqeRo7y9/t0hzy8bkt7/7PJc921O87+pL10XSMLxHwO5FO5fQ+nfppQMuLAM+eIRYzkb
	VimKSp+Il3syONuStBPPRON56jksoJKleXGGyvSfFnn98I2chXgOwuQ38A5LqGhShKZjupS5Pep
	+E3zFgn72lzp25Ws8Jvh9pSC3V0pmOlkR2X0WudM/fy9tkze5uDI+f4YgqYzNTtc/p471gGPSLE
	1jW+hKtXdXZH8qeVlhArr4WvPDHosA5kb9YtS/EZNAZDZxE2kntQVMqFqsS7gmR7W6EJibYgshN
	Laeo4FbFdD9Scw==
X-Received: by 2002:a05:6820:824:b0:6ae:33fb:4556 with SMTP id
 006d021491bc7-6b0d613f35cmr12820634eaf.8.1786815061905;
        Sat, 15 Aug 2026 10:31:01 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net.
 [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7f3e86686c4sm4029328a34.23.2026.08.15.10.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 10:31:01 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 0/2] drm/nouveau: Fix NULL pointer dereferences in GETPARAM
 and GET_ZCULL_INFO ioctls
Date: Sat, 15 Aug 2026 11:30:51 -0600
Message-Id: <20260815-null-fixes-v1-0-0df9dda951fb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0NT3bzSnBzdtMyK1GJd01TLVAszIEg0TVECaigoSgVLANVHx9bWAgA
 SyjqrXAAAAA==
X-Change-ID: 20260815-null-fixes-5e9e86666a5d
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786815060; l=1411;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=tPxLL2CoSb3VmYmM9nMkXK7+/WPpCTFrGxjaNQhP7T0=;
 b=ow67/bAtMilaNqTNhXn9xssO8EWonROESywYsPc8eyHqPukYeVyCG6eQljyq13IoLA+1qIwJd
 1XrwYYuHaGHB+joMnCmjldMvmwC6l/3grGgzowk9fT8r30auMBLOnr/
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
Message-ID-Hash: XZJYCFKSUDYRDYHB6HRUAHTOFCXKV5M3
X-Message-ID-Hash: XZJYCFKSUDYRDYHB6HRUAHTOFCXKV5M3
X-MailFrom: jim.cromie@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XZJYCFKSUDYRDYHB6HRUAHTOFCXKV5M3/>
Archived-At: 
 <https://lore.freedesktop.org/20260815-null-fixes-v1-0-0df9dda951fb@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

When Nouveau initialization is incomplete (e.g. firmware microcode fails
to load or graphics engine initialization aborts early), userspace display
servers (GNOME/Mesa) probing device capabilities trigger fatal kernel NULL
pointer dereferences in the Nouveau ioctl handlers.

This 2-patch series fixes two distinct NULL pointer crash paths:

1. drm/nouveau: Fix NULL pointer dereferences in GETPARAM ioctl
   - Prevents NULL dereference of gr, gr->func, and nvkm_device->func in
     nouveau_abi16_ioctl_getparam(). Returns -ENODEV cleanly.

2. drm/nouveau: Fix NULL pointer dereference in GET_ZCULL_INFO ioctl
   - Checks that gr is non-NULL before inspecting gr->has_zcull_info at
     offset 0xf0 in nouveau_abi16_ioctl_get_zcull_info().

Both bugs were reproduced and verified fixed on GA107 (NVIDIA GeForce
RTX 3050 Mobile) running 7.2-rc7 under GNOME Wayland desktop initialization.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Jim Cromie (2):
      drm/nouveau: Fix NULL pointer dereferences in GETPARAM ioctl
      drm/nouveau: Fix NULL pointer dereference in GET_ZCULL_INFO ioctl

 drivers/gpu/drm/nouveau/nouveau_abi16.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260815-null-fixes-5e9e86666a5d

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>

