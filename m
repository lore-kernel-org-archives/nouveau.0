Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C00DC88E72
	for <nouveau@archiver.kernel.org>; Mon, 14 Sep 2026 14:07:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0A210EEDC;
	Mon, 14 Sep 2026 14:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c7nnbJyl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4609D48050;
	Mon, 14 Sep 2026 13:49:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789393794;
 b=WzQzQQXin0SUEhR35MKDxgEuhxJu3OFpm7jJnTLaiSFbGaRhq75toXiKBdULFos120W+1
 eorgjHl+iLeIifatzJrf5qmyMenEbCWnqFxq0GGbCutsFnBLGTBUKYnXilfiyyIFkJPQzYR
 qa4tkSgXA52FRTCsCMI83hb5+O2efrXEJ0a3+qUyM96FJ4yeOal+tiScHCmsL6tMpK7mgut
 +XXFDBzlwZ1sUxzbmAS1hPz2Vk2yY0QLkmiIcFRjEedLrA7Sv5QylfBrPGpPHu5WmbJvXKJ
 XY2zKrr1mxS7O/liRlD+5ycDsHLm2+BGL65PaadjGmzfEhM8MlCWwCIPTjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789393794; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Pa8OFY4TTfkGf1f2ba0w2jmPlViOEeXI2aNAgx40u2c=;
 b=JlC3HXO2PnHGoswG9DiSmm2SNz1zgm6nCbIPeiaX4GO6qiLqjuE0Hb0mXBgteyicbhsCj
 u2MciAS8Ff1g7WRa5PwTGSDVOdd+ZCI358qugSbA+ChIWGyHI4QLpHt6sSyfngIM1huIwZe
 45/FT5jihRFbvWqFJ8ymRcdGsjXLd+PCIhcwJEBc4LLWt6Amoo4dAdzcBlFN9Bni2RewKH1
 l1bJwMXD+Zl2dxeUfwS3m9pGNG3CQMZ/i3yrVvNSMcLlsMYub7Ch/MOr6oQOtD+QDUrSYlR
 kadU8ZGdCUfGjaUrG5lbHmO8noYp97oNvEYaEDLjo0ex0LiwRkJcLuWtl8Sw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DCDE646F1F
	for <nouveau@lists.freedesktop.org>; Sun, 13 Sep 2026 19:55:38 +0000 (UTC)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com
 [74.125.229.204])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D10B710E471
	for <nouveau@lists.freedesktop.org>; Sun, 13 Sep 2026 20:13:07 +0000 (UTC)
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b5e4f1744fso1779197e87.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 13 Sep 2026 13:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789330386; x=1789935186;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pa8OFY4TTfkGf1f2ba0w2jmPlViOEeXI2aNAgx40u2c=;
        b=c7nnbJyl65ZllrxYXqtn3LAv7f3ID0ibIfE0JoHMm5BaGuJTDoOYobM4g+8nCed+f5
         D7HTf1Kq7f/GRlDZcnm1FNxisHtYc3kUSAbir1ibKhZbrRp4i3QoF0eUF/VZ3oWqqDEi
         PYq8I7g+4tcJGcO/nMEsnJ7ZXJfj9tKhm0110bZ7cnavZdMf6w2q3PFddd9JLKgiVPKw
         BxDJmRT4KLu2PVGUgnQJBOCXfFu761UeSV9ioTelCQU+G7+sYT1bR7ZHq5a885iE+dUJ
         h4LjbmHvbatkmMbYVU0xG6IrUbjAD2Bl4qQ5iAtFokOB9X7RRBxlzpzYa5omHo/9mWNv
         8ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330386; x=1789935186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pa8OFY4TTfkGf1f2ba0w2jmPlViOEeXI2aNAgx40u2c=;
        b=ruh2pcUfSHHwyD9/oH+nmEXA2brX+Jp9FW9R5jpqPmKTJq1V2prjHljn+zM1gR18pj
         QsxXx6mzElyxCKbpDeyjB25ah8MU6r8hK0jhk0d4jh5NuHq1SH2j9MaAoYSgt7PaSyN0
         j8uK65xgtdLVVP2jRJpAsndGVjX54XI2PAwFDXStSmua9tKPrs2h1vQdaTsH/SZIiis3
         np6NQNwZz2BllZ4YI6uGd3fJ8dG/mQ/X8L9N5HE5SbuhL19NgPgMjFKarX3cSzO4PJul
         4WqtwMTxX7oLJoulGKsBcnT6xwUotnkzZv3o774kU4SlCZ0506db1HcBuAtxYDpYR3dq
         DXyw==
X-Gm-Message-State: AFuF++kpr8wvkmSTDmp5+BKAavuW3rvkF/4oPc92NUvkduAaAzfP4DVc
	BzFnA9Nz31wOD0CGZk2GNafy62akJVPXwXIA5x82u0asqgOebh15McpG
X-Gm-Gg: AYBFou1jmUoGAkXXexuqlwcfhf4r4IRP6nQKGv1dB62KuaHNzGlJjNszqKdUrF0Ywv3
	YLSoOvJ/XqTZeKpcoRjSx6HqYC2WjYJIT6R1EdssLF/IL6pNJX9hG+dDM1UMUq3Dy2GPXkmBAtz
	tcs0si7jSg09J5gz2eEetdBKgSff/41/YhwKqY8t5rVZtgg9DFMSMfZnK3g7EcfuRcVP6aqv8Dv
	r48GpzAc6RoSmybrJrV58ujbnD3FgD7CYAcTm6weGNUPKHoUXQc4HnGfPS/wsBOdDgkn0wCI18h
	P1f2MNGGGMBQXlZ64wWjsS7seGHAy7EUdWZlG/nFkL/DB9FBFyJKMiByetfxzzdf6JflGKXjnWx
	3f27cxtZNLVFcZFJL5i9LOhzDl5Gka4+U4kXunsqwuw86qcy890JtV70VAGLzh4I6ofmOiBhDS0
	NauA5otvRvNlCAOyLkVgtz6HkzZeA4wsggkp3qgTNHqWpisqPj7DD5gB27TOm4RbPejVY65lb7e
	hxF41d51YHL6Ke3X95b5fVHzCjxG8mKs8g5PCgk04Oa
X-Received: by 2002:a05:6512:3e15:b0:5b6:183c:5ca2 with SMTP id
 2adb3069b0e04-5b8a8f0064bmr1551667e87.64.1789330385733;
        Sun, 13 Sep 2026 13:13:05 -0700 (PDT)
Received: from tallipc.shacknet.nu (91-157-240-22.elisa-laajakaista.fi.
 [91.157.240.22])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8a03a85cesm2003345e87.1.2026.09.13.13.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:13:05 -0700 (PDT)
From: Risto Pajula <or.pajula@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/2] drm/nouveau: fix GK107 VDPAU regressions
Date: Sun, 13 Sep 2026 23:12:23 +0300
Message-ID: <20260913201225.5975-1-or.pajula@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: or.pajula@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: KUGTFNMFXDKWYCX4ZIWDOQV6DF7F45TY
X-Message-ID-Hash: KUGTFNMFXDKWYCX4ZIWDOQV6DF7F45TY
X-Mailman-Approved-At: Mon, 14 Sep 2026 13:49:52 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Risto Pajula <or.pajula@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KUGTFNMFXDKWYCX4ZIWDOQV6DF7F45TY/>
Archived-At: 
 <https://lore.freedesktop.org/20260913201225.5975-1-or.pajula@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi,

This series fixes two independent Nouveau regressions affecting VDPAU
hardware video decoding on NVIDIA GK107 (Kepler).

Patch 1 fixes engine context mappings for the legacy MSVLD, MSPDEC and
MSPPP video engines. Since commit 8ab849d6dd4c
("drm/nouveau/fifo: add new engine context handling"), privileged engine
context mappings cause FIFO PRIV_VIOLATION faults and kill the channel
during VDPAU decoding on GK107.

Patch 2 fixes a fence/progress hang introduced by commit 55e1a5996085
("drm/nouveau/fifo/ga100-: add per-runlist nonstall intr handling").
Legacy FIFO implementations use a single global nonstall event at
index 0, while channel event registration was changed to use runl->id
unconditionally. This can leave fence completion waiting for an event
that is never signalled.


Tested on NVIDIA GK107 with a Linux 7.3-rc2 based drm-misc tree,
Mesa 25.0.7 and mpv using VDPAU_DRIVER=nouveau and vdpau-copy.

With both patches applied:

  H.264 1920x1080:        PASS
  MPEG-2 1920x1080:      PASS
  VC-1 Advanced Profile: PASS

All three tests completed using VDPAU hardware decoding. No Nouveau
faults were reported in dmesg.


Thanks,
Risto

Risto Pajula (2):
  drm/nouveau/fifo/gk104: fix legacy video engine context mappings
  drm/nouveau/fifo: use global nonstall event on legacy FIFO

 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c | 14 ++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c |  3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.47.3

