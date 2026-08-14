Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFCFC5B572
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 23:59:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DAFCF10F798;
	Fri, 14 Aug 2026 23:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h3WxaGuO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0D3D54781A;
	Fri, 14 Aug 2026 23:42:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786750966;
 b=GTWR85J3rhP+32wxi7k21C00KBT+cwXlrciry0H23cgvjJH8T+vldxYDeHUzQK6L+LTkk
 3uCp+SvhGxBG9JzerQMUudQrSR3N0xCoHQTvRV72wXCPcoYMyc9+iIEOErv6PkbPpPwuUTq
 7swlHzZ/m8ODXRrsX3ZV+BlN4wE7eH0tsKX0TnZWUov2UmJ53h7bRPe/XB9MBQruYzF60QX
 wdliaXoUS1lE+44+dZ+cx9gu+7lVjaRKSCuvC9Dv8txTxvS97YDoVgkd/3H3ZZ7FFSWD1PG
 muo72Ua8EbbeXn3QrBv6lOpv41hlskTooWlMBbq1UfCbfjdAOpR8SMfmG5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786750966; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wjOzV0q5U0Ngoj2QziahFo4rb8HC53Ty4Vt3SiFJTto=;
 b=SdP6ZM5ZCC+VRAvnf4nQlN2Q6IBNf68c9AE02lOKVaH4qSosMIMcy89NhD5OjBrHp9fW4
 kVYOe9gK4ibHF0kdzWjNujMkz7u3sDKdRAbh1eioNBEoTfQyQ5mSzY3LCiRba7oROie6SuR
 Yh9MSDen11mbytwhkjoNyDQPnFwd17gkvOp7bKlbGfWIdfwOBS3BFobpoJejCgQvS2FkM8X
 LDePqDwBheq+yUmN91U59hR7aL3sAmOdlcBJySrl6TotyPEljWC7KX9ZyRUwcQB1gI+Wh6k
 aZLcrggpqWglYCG/kMAoL0zf5AGMIQazeHbZiGIe+ll/LVJCvBesIIzQm7Hg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 69D5747815
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:42:44 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCC110F795
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:59:07 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47f7027ca11so967574f8f.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 14 Aug 2026 16:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786751945; x=1787356745;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjOzV0q5U0Ngoj2QziahFo4rb8HC53Ty4Vt3SiFJTto=;
        b=h3WxaGuOieE34RZKuwWkjRHsg6BbN70XI5L/UUhI5t2uG1gc6OIoQ/ujEaZjXiRN/d
         G0+g3o+43KCNKGaBWNfcs4ifvJugJmC42w5n4zGX+drYAzXreGnMfUYgr1BQ9xEb7z9q
         jQWSdEWkYfclUq7G12yN+IdyCQyK2YN0jGS1YKD/VVr2khvVnxMtA8eemWoMof/AVGxf
         kXMDUCm9rAIzOOkcXaly2Qn8cQXNLSJf6tx0ZyC0t4UGjA4RoXhqAOyxnocxhvxlwxoT
         8s7wYCij3nY8nXIQNm5yRewr6x1MO2BD9q/3nN2KHa7tVdHiHxqm3li8wIxbllUBkccD
         z8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786751945; x=1787356745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjOzV0q5U0Ngoj2QziahFo4rb8HC53Ty4Vt3SiFJTto=;
        b=eiPbYPXJRE6+wPbNsSIJQYxa2xYVE2vY0jQhJ4zaMz6FNhvfWiOITdRyCuPai2onIk
         oNGafn0mLFG0zCEoCmGU3BAmerDypJni9mCSxmYFLc60HJBGDpwXjjicUEqe76pSfQ0N
         W1DsUa+dk1mXLcThbkqI3dBmJBvyASlx8ijHfVdpWSOHsNjhC6LZ4MCmS1n1sDK98m0V
         yq5jYSyjGMbf5qSTAXTxNIkBAFw5YNN8s31ZWpEvsKjmVzb4ZQKs0qn8bNQc7AFLUqgl
         aMsDtnRw7FTqBLOHc+r6gAYdj54yWpY9pM3yzEY+mFa4xHNvGtFkkIDHf4y5CYbPVPBR
         jD8w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqpbGNuF20leeUoIFd/ks8p51PwzKdNprzDupL6kXNu643E5i3YqZensIKF/8s9LRB0QoYRpE+u@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3Tm8t57PlUK+b5rcvHB0vngLWXgS3zl8+QRIOTTjJbw8VnzVj
	H23l4COqrGP7TYJci9qKJ045IzWf+LzBHFJpmXc/HzTZ1+zyK0hUK/0O
X-Gm-Gg: AR+sD11KEy2T2aHZdIpfkjZL/Ue4G6HtAPdmXDv3zASj6dyJA+mknh7KFASLU/HU0qO
	JYxpkW71I5QyEzK29pZ1OU8o7R2p9q1MsIGbTGIng7K4F4P4pgtWsH32dDi/+cFmhjC4X7OsJdL
	NPZdyam40YAhTFNufuN7G+zaAEclylk6V7rR+23jHEOsr3jiw/20U2mr8omfYKJdTn2GJ8a673U
	h1GMClJo7VRttACaiwTZgEFRsRGFNPBR8Vci+zPedm6tf/aSLPU9G5bfe1WM8QPTFgs/bGno2IG
	4sKtUWFwP9bbJaJcJblkHurvm1a2q4SEs9RDboSOhuSvk9u7K32/AULqrAE9qwYvW+Bj7EBCBeL
	Pn3N7SShw8SeAUt+NgxiG8IlXiE7fMGSFOP1Y0Wvvb6jXLvhe56+YNT+s1bqQjPdcBdVK75/y10
	+ddf8L795wLK/Q2QqWi9mg6g6o4xOSM/iulW29ERsuf7391ws50ijS1n6h57dfBU4rCy8=
X-Received: by 2002:a05:600c:3114:b0:499:84fe:5f3e with SMTP id
 5b1f17b1804b1-4998795c12bmr121642805e9.9.1786751945540;
        Fri, 14 Aug 2026 16:59:05 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899753ccsm77751245e9.0.2026.08.14.16.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 16:59:04 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] nouveau/dispnv50: program pixel clocks above 2.147GHz on
 GB20x
Date: Sat, 15 Aug 2026 03:57:04 +0400
Message-ID: <20260814235705.59132-7-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
References: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AB2IUOBTEOHHOJV253GC5QPPAFDD6ROY
X-Message-ID-Hash: AB2IUOBTEOHHOJV253GC5QPPAFDD6ROY
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AB2IUOBTEOHHOJV253GC5QPPAFDD6ROY/>
Archived-At: 
 <https://lore.freedesktop.org/20260814235705.59132-7-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The HEAD_SET_PIXEL_CLOCK_FREQUENCY(_MAX) methods carry only 31 HERTZ
bits. Starting with C97D the upper bits live in separate
HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI(_MAX) methods, which nouveau never
programmed and headca7d_mode() computed m->clock * 1000 into the 31-bit
field. NVVAL's mask then silently truncates anything past 2^31 Hz, which
means that every mode scanned out at pclk modulo 2^31.

No mode nouveau can currently commit crosses the boundary (an
uncompressed HDMI FRL mode tops out around 1.78GHz at 8bpc), but this is
a prerequisite for the upcoming DSC work, which makes 2.147GHz+ modes
reachable.

Program the full value split across the low and HI methods, exactly
as OpenRM's EvoSetRasterParams9() does (nvkms-evo4.c, 31-bit low word
plus the 4 HI HERTZ bits, giving 35 bits of range).

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv50/headca7d.c   | 21 ++++++++++++++++---
 .../drm/nouveau/include/nvhw/class/clca7d.h   |  4 ++++
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/headca7d.c b/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
index eeaeb15aa664..2046e38a4d79 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
@@ -219,10 +219,11 @@ headca7d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
 	struct nvif_push *push = &head->disp->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
+	const u64 hz = (u64)m->clock * 1000;
 	const int i = head->base.index;
 	int ret;
 
-	ret = PUSH_WAIT(push, 11);
+	ret = PUSH_WAIT(push, 15);
 	if (ret)
 		return ret;
 
@@ -245,11 +246,25 @@ headca7d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 	PUSH_MTHD(push, NVCA7D, HEAD_SET_CONTROL(i),
 		  NVDEF(NVCA7D, HEAD_SET_CONTROL, STRUCTURE, PROGRESSIVE));
 
+	/* The FREQUENCY methods carry only 31 HERTZ bits; the upper bits
+	 * of anything past 2.147GHz live in the HI methods
+	 * (EvoSetRasterParams9()). Truncation here scans out at pclk modulo 2^31.
+	 */
 	PUSH_MTHD(push, NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY(i),
-		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY, HERTZ, m->clock * 1000));
+		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY, HERTZ,
+			(u32)(hz & 0x7fffffff)));
 
 	PUSH_MTHD(push, NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX(i),
-		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX, HERTZ, m->clock * 1000));
+		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX, HERTZ,
+			(u32)(hz & 0x7fffffff)));
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI(i),
+		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI, HERTZ,
+			(u32)(hz >> 31)));
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX(i),
+		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX, HERTZ,
+			(u32)(hz >> 31)));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
index 0fec6fc21d44..1ab12d91c9d9 100644
--- a/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
@@ -653,6 +653,10 @@
 #define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX_ADJ1000DIV1001                31:31
 #define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX_ADJ1000DIV1001_FALSE          (0x00000000)
 #define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX_ADJ1000DIV1001_TRUE           (0x00000001)
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI(a)                             (0x000020C0 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_HERTZ                          3:0
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX(a)                         (0x000020C4 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX_HERTZ                      3:0
 #define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS(a)                                    (0x00002030 + (a)*0x00000800)
 #define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_CURSOR                                2:0
 #define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_CURSOR_USAGE_NONE                     (0x00000000)
-- 
2.55.0

