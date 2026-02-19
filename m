Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822F9C531CB
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 20:06:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 76BCE10E748;
	Thu, 19 Feb 2026 20:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="PkXW0pxv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9E5DA43435;
	Thu, 19 Feb 2026 19:56:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771530988;
 b=mhjzKtooJh4aHgthngHJ8p+ACZ39y6rgrLf37NXh2j8lTDy3c2ylbdvS8lTla0wJPJV4i
 ajCW03OsJfYh74oPngCFwrUniAGPs0q1X1Xhii3F9GAAc+GV+q+ZSFGudNoBlz31vHdp9dC
 hDnZU/6ZOQrLyyLuxoUoiHv++lRisqo8tcxcFQXGYeAuKDmYDnH7I7OerXd5GUUWUa1pH+B
 st0yLhHpPrSxgwXXe0w5uXYXi88vdnBgVZy7SraCRd+FlyksbIulNB9e8UPwEKhSJlDd0dR
 A27Gmc5LsdmTbrsgNDOukSB1IHjraO0b3dzM7N+pmxKSqdpkKvILdGBCSXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771530988; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IIXy2pMG7ODDdjrHID85DEgKFqwPY/I8njEG3vmpfBE=;
 b=pKwdp6ojhxrKpn6Y0Dq5Dy6D4VG5qH6ZUZ81CaMpfMhVljyZsm2W7fn0F02ulCZ10oQ8M
 4A0JIDk6R/PIQsIbl42AwGRgjlCMhNCJdsn5orE1pGwC998TTx+LuvKJ8WBlnVsfcZe4tr1
 SiYE8uNhJP81PX2UxOXS4+62hgb9kRUCJhbGRozlQoJfiv0ulzWKTKCGFXjqrn4dzFzAcHl
 rpy0/Ro+sVH6woXkV1QOIZ778KB9olCOSYdP7fG8hWnFR+L1/G+7Mll//JNwAWMc8VFksJC
 GTi24qN/K/Ulgk/U0UjIfYZbNt195Jq1klFvZG/A7FjSf0Z55ogUVtVuWXeA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 64C51433BE
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 19:56:25 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA5EB10E195
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 20:06:16 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-8cb3dfb3461so136646485a.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Feb 2026 12:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771531575;
 x=1772136375; darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IIXy2pMG7ODDdjrHID85DEgKFqwPY/I8njEG3vmpfBE=;
        b=PkXW0pxv1ctPYdo+lQyFDurWRD4By00t/B2JYucru0/XIiTLlNRvwf/xWxIg7hs+Ny
         UcUG3AgioiOFy9iPY2RR7rGicugUbOUhDav4FZQ9NU2lahIZfnosde7Qa+tmJTSHP3uy
         jid8I7QN9rYYt8OdUyarmKuPx0Lib0ut7Os3vOolnboKLi+1kzImK2kkZdgR9+zY9yxG
         iVz68yVBZTuYDDRlWOhokzQunUFahUP9tBrykUgGWC8l1yWnl7B3mRUCsIYQ4/bYKOCj
         RDUuByFqOdcR/Qrl2hknVOKLuLFOXTV/8XMyiA+zHGHwG2UeWUtNkEUrSTcX6nLc6Y5A
         Ea6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771531575; x=1772136375;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIXy2pMG7ODDdjrHID85DEgKFqwPY/I8njEG3vmpfBE=;
        b=L71DKSiHkypX+12jMXi4Zvr0PQM4iUsUnxj1HB3k4YxOW6Hhtbu+zJLN0oPGIUxdkW
         TSOrzN+kyLanLdWCu/D3G/jhogmWyup5URezjGU+CEUHFjGinmxy68c1+eu8OGVEsPo6
         kXvdVS1flHT8BunR26TXTYrys9JmXH4e0Gxe6z+Q8WnBHTwWSUhzwRGdkko047uA7A5/
         MSVQMyS97U6AgQeG3o5pdZiJUU+7IX5VKPKYpB13KgAOpcE9tkFnF+DV2o/daEtOOmDp
         5OwJJVLdhlBOwnCMtp13Dq/ALn+r4AUPnU80tuQQlVHC27b3uogp/yOoqBRmmG+w7RVS
         DIAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQqUKRbxmpIAXAHNitninQ/Uy+KzSiyJhLu1C3q1Egt6VHPeVf/RnMfveo6VsD9BKV4vXO/5HW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKtr55lUP2lGzHhcbpoVwB3szcudNQF127hoHoQVTVffK6Lf19
	VbsaAKQlu1wJU9eO6N90zK+AcHxgt891XOchsn28C7Aj0+Y3DjtVa9mdixriiwtUZ+A=
X-Gm-Gg: AZuq6aLVJ7VvcjDEiRRyJVF5ECF2goX/wZkbm9cJgPrg4aQy1RBUyujLVprG6Vd1DyR
	EH7Q8DEIR3TdS0TJxVqI0wmKwxy21sPZWjPx9alBW6nAYj+WzblfFmV78VaKKgzlJ8Lh9GJBbZp
	9E87kPcHP25IpczBdmEdjM9aXOzw7MZ8VK3NFg9QV4Mcv+7HD1jrlsnwCHi4sjc4G44oTmgXkvp
	wgCmghGKtqZZ2f5Y/RAQreQwPn2HoBkElR/dCZ21P/WTV487+lzupuFZMYTy/qTQg+28ruKDoqR
	AY4hMpzGct6Q2M9FQFbf8QIiYl10zm3nLKAlAHNtuvxL2mN9nz7oy8gruX3Y/HmmtYJ+Ngw8VCe
	KWgx+ecOCMDk6sUkVM0m7JqhbWkhe3muRNJ/YeHYHzaEQhFVvZxJedqvHpgCXTR0ptM3aBu//LJ
	xl86VRBncK6BY8YMzHTMzv671Myr//N3V8g2GDOkAeEN7ZNDedzXs1eV2aJy+qsSdB4iTweApJ4
	a7iKxS2tg==
X-Received: by 2002:a05:620a:720d:b0:8cb:40ca:2f8c with SMTP id
 af79cd13be357-8cb40ca31e4mr2170465885a.31.1771531575440;
        Thu, 19 Feb 2026 12:06:15 -0800 (PST)
Received: from [96.232.40.90] (pool-96-232-40-90.nycmny.fios.verizon.net.
 [96.232.40.90])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971c8e60a0sm216675066d6.0.2026.02.19.12.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 12:06:15 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH v3 0/2] drm/nouveau: zcull support
Date: Thu, 19 Feb 2026 15:05:52 -0500
Message-Id: <20260219-zcull3-v3-0-dbe6a716f104@darkrefraction.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOQQ6CMBCF4auQWVtTpimgK+9hWNRpkYlITYuNS
 np3K1uX/8vky6wQXWAX4VitEFziyH4uoXYV0GjmqxNsSwNKbCRKLT70nCYlDrLRda3JouqgHD+
 CG/i1Qee+9Mhx8eG9uQl/6x+RUEhhSLc4qI6ovZysCbfiBENLeWNP/g59zvkLFn6cXKUAAAA=
X-Change-ID: 20260205-zcull3-9065115cd238
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3
Message-ID-Hash: 75BDEFWFWE6R4N6XUOBXVEHN7CEZQSRI
X-Message-ID-Hash: 75BDEFWFWE6R4N6XUOBXVEHN7CEZQSRI
X-MailFrom: mhenning@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/75BDEFWFWE6R4N6XUOBXVEHN7CEZQSRI/>
Archived-At: 
 <https://lore.freedesktop.org/20260219-zcull3-v3-0-dbe6a716f104@darkrefraction.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

These patches add kernel-side support for using the zcull hardware in nvidia
gpus. zcull aims to improve memory bandwidth by using an early approximate
depth test, similar to hierarchical Z on an AMD card. These patches add a
new ioctl on nouveau devices, which is currently only supported when using
gsp firmware.

Corresponding userspace changes for NVK are available here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33861

This series is also available in git:
https://gitlab.freedesktop.org/mhenning/linux/-/commits/zcull3

(v2): Split the first patch into two - one for fetching information from
      the hardware and the other for adding the UAPI. Also, drop the
      change adding DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER - it isn't
      necessary to get zcull working and will be pursued as a separate
      performance improvement in the future.

(v3): Make commit messages more verbose. Remove WARN_ON() call.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
Mel Henning (2):
      drm/nouveau: Fetch zcull info from device
      drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO

 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   | 19 +++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.c            | 29 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |  9 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   | 34 ++++++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  | 19 +++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  2 +-
 include/uapi/drm/nouveau_drm.h                     | 66 ++++++++++++++++++++++
 9 files changed, 174 insertions(+), 6 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260205-zcull3-9065115cd238

Best regards,
-- 
Mel Henning <mhenning@darkrefraction.com>

