Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94132606A321
	for <nouveau@archiver.kernel.org>; Mon,  9 Nov 2026 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+3g/JLl
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7887510E8F7;
	Mon,  9 Nov 2026 21:43:16 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 676EB49184;
	Mon,  9 Nov 2026 21:23:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794259421;
 b=K/Ne7YryQTqsEzlOpbeAs3alcXda45FWJGknbFVImUMCcKdF6T0hEoJVFXKSw06nhU5vK
 /yJwFrUha8/ypQPyx0q2QFH/pUOxMDem4DonLKRgvFCqZUltaft23bptJJAb3A65cqhgKR5
 GxIQLU/oszr/j3ZI7tllkoarGwPWj63GdxiaRt63sNZLzh/8/+GdQcm7uUtabTrtQI8AjpW
 oGjZ+8zSvkKjSF9QJsWWRP+UwmhMiEqGrZ0Vnn3K8dchJTT0f3TnPCS83sdC3UJ5E4jq6vo
 aTZYdandJ0HsZTSaz0qs6aUk0qmcymFr3rAAr2wvfmo8Isy+hg/jnb8q7zEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794259421; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7/Tf8BQkHl6UVzxzkfSyq7osHN9OzzgsIStTSdb69F8=;
 b=QPCKYNuJx8CubTnRmgXk/ihZcCJWhw9Vp6yZ6KKAXjBYqGCHp5c6PZfPjJTyxBlZEXlYe
 x8vI6JDFKPMMdyxocECBqeY95uFNTKn46Ze5VAupwBJTggziEXdUIXbXmD5RAudjW5NOC2o
 /HDf8j3biuVq5T0F86gNTVZ/LWdVkuUWah9l46bxzta3yxhLmn0Pn9fKRW3MdQvXQ/gxPm4
 NRCtzBz8fpiH0qDeQfKZVEz272cpE+x/C7dW5deL+jG0v4cjKcm2+UHz4wteI/z9UXmp6uN
 nQDi/cM9/9RC4R/GVASDasYumEj2H3tvhU+QqzQzn6dBWn2onZBKl5Hs2yDQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7D0B147584
	for <nouveau@lists.freedesktop.org>; Mon,  9 Nov 2026 07:21:37 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 229F710F05A
	for <nouveau@lists.freedesktop.org>; Mon,  9 Nov 2026 07:41:06 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so261832f8f.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 08 Nov 2026 23:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210064; x=1794814864;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/Tf8BQkHl6UVzxzkfSyq7osHN9OzzgsIStTSdb69F8=;
        b=H+3g/JLlqpgiKafL0/6mlvOQKkvvfKo2i28QGNb8DWSxq20OECYdZ/pCHJKXeL6HuW
         8sp16x5q2JEsu6t/FFPNr0X9wUJeIkgCyB7JDD/VES8RIhVSbhfpbWxeV1LZ8XxTbAAJ
         +5CpLGIHRQ612YvncLOCdrLO1s1/QeSSivy/h/Z1n8F0LkGF58xZlCTlVzHZY2hlJPjg
         9ZJdoka43wkVfi8qnsdiVie05kFqLlikn3iIxYLc56J2ROhAp0X4MAGGwT2docxcnMWX
         b5TWuS/sUJ2BC76HwefMQ3I08N8J4Ckpact714w04qqNxoY5Lm2YPTw9GVyfKSJ8Dmc0
         X1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210064; x=1794814864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/Tf8BQkHl6UVzxzkfSyq7osHN9OzzgsIStTSdb69F8=;
        b=DcgutoT/KOKAvMUFfD6FKcR3gGvNEHrPkdXnRFO/BvhCLpnQF4W/CzIbMGhX6yZo2o
         7Qh7AU8OxgwhQSVG662OwSrehSbsbcW+KowqvTqWl+kDplmpheUzmKi907vm863GDXyU
         nozIpYu7Rt/seTu4NdoZYlZk5ksLgJwFWeU79yIfSL6Y4E3paouh5P1GHEcQewBfrg9M
         llFwrH3/tiFIsboscS8jArxSVpz0KHEp0+nIne0QsqUiKyG53Ry/PZyu3Hs7xH8TRNrc
         bh6bnkqmr0GRiAxTOtqYMIptagyzAG/E/aECeZkaYN5rA7Z/8FRD8MMjGTSxuGu8gQHZ
         aPZA==
X-Gm-Message-State: APuU4Z9VPCfVd9R1mxD+0iS4/acVe4tqRl5prWR6bAlTsv3Bx+lJWj4n
	pkNnkykS4KiH85AGhfMREo6OzvCx4PhkaRMTzNnJaKRB3B6bMQ4nkCmgOe2epYNm
X-Gm-Gg: AYBFou3mGb/abc3EdqeX/orQ1OVvI3e/hAGAmQpxatJQ//KWz51HNvkgyp9WyamTFUU
	40QJkERQ3PmDtH1ogKh18jYFN7DhTGA7RNdqQJpiUptcysQhWk9nhhbEzsogrq3gtXjGSrE6iad
	iHk90Z4yNC9e5cgtVB+NvorOaDyICRHC0UhQilf2oEumKDPVHUYNZklpomc8ogS53iruu7Kb8Dz
	dhr+6CcBkaEbKbW8PnRSmOzOg7Qk8tKwyTIIYJymWOfx2lXUMPeRQFLH4pvDiKXU8q6bRU1eYWX
	YTOBQb9hcJj61qLlFR3aUlcM5oEJc8l+h0wYIbsCh99e0vTUC+Ri1U3iV5yQ5JgNmlCM8Mso5sK
	maadSJeiQTpGyhKCkvSbvyZ8MK3ubZa5eHFRLrjZ4P7tSuSBbEZ3qZYCeKRuxoFbuCIs9qHo7xg
	mkr9TeYcwVIgWZ6BxdIOwpuM2I+P9Z9cMK6HF1SFANwXfGTcVjyphjenJ9bdHEJ+//E40LI7pqZ
	g2Gof9Me+iTXTGlC23OcrcPZQW0IdtPz2crLzMygW/q9L3I+nEkZ3XXNJgPLxPs8msY0M1slhbh
	8sIRol3/yOZpzbw1ZKnmH2Xe2Az5DmerI19o5ZNmcF91+GA5Q+WStZrteTbDj9QK8lxaVpP1qbQ
	ZuzKE9KpY
X-Received: by 2002:a05:6000:22c1:b0:48c:7387:6b88 with SMTP id
 ffacd0b85a97d-4958b5374bamr7080666f8f.37.1794210064251;
        Sun, 08 Nov 2026 23:41:04 -0800 (PST)
Received: from nest.tail012287.ts.net ([176.40.105.129])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49597652ca7sm8898526f8f.39.2026.11.08.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:41:03 -0800 (PST)
From: Yazdan Ghalavand <yazdanghalavand@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/bios/vmap: only read max2 if the header contains
 it
Date: Mon,  9 Nov 2026 10:41:02 +0300
Message-ID: <20261109074102.11997-1-yazdanghalavand@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: yazdanghalavand@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: ZORWN6K7GUQEIGOZGKYWUEOGVEZXYD3E
X-Message-ID-Hash: ZORWN6K7GUQEIGOZGKYWUEOGVEZXYD3E
X-Mailman-Approved-At: Mon, 09 Nov 2026 21:23:38 +0000
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZORWN6K7GUQEIGOZGKYWUEOGVEZXYD3E/>
Archived-At: 
 <https://lore.freedesktop.org/20261109074102.11997-1-yazdanghalavand@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

nvbios_vmap_parse() reads the id of the third "max voltage" entry
(max2) from offset 0xc of a version 0x20 voltage map table whenever
the table's *entry* length is at least 0xc. The entry length says
nothing about the size of the header, though. On a GeForce 710M
(GF117) the header is only 0xa bytes long while the entries are 0x26
bytes, so "max2" is actually read from byte 2 of the first voltage map
entry:

  header:  20 0a 26 12 01 c8 00 ff ff ff
  entry 0: 01 10 50 f8 0c 00 ...
                 ^^ read as max2 = 0x50

There is no vmap entry 0x50 (the table has 0x12 entries), so
nvkm_volt_map() falls back to interpreting the id as a voltage in
10 mV units, and nvkm_cstate_find_best() caps every cstate at 800 mV.
That is below the boot voltage (850 mV) and below what every cstate of
the board needs (900-950 mV), so no cstate is ever valid and setting
any pstate fails with -EINVAL.

Check the header length instead of the entry length before reading
max2.

Fermi reclocking is disabled upstream, so on this board the bug is
only visible with reclocking force-enabled, but the parser runs for
every GPU with a version 0x20 vmap table, including those where
reclocking is enabled.

Tested on the GeForce 710M with Fermi reclocking force-enabled locally:
without this patch, writing pstate 0f fails with -EINVAL; with it, the
pstate is accepted and the core clock goes to 774 MHz.

Fixes: 4a4555a7f1dd ("drm/nouveau/volt: Parse the max voltage map entries")
Signed-off-by: Yazdan Ghalavand <yazdanghalavand@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.c
index c228ca1..07b3b47 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.c
@@ -68,7 +68,7 @@ nvbios_vmap_parse(struct nvkm_bios *bios, u8 *ver, u8 *hdr, u8 *cnt, u8 *len,
 	case 0x20:
 		info->max0 = nvbios_rd08(bios, vmap + 0x7);
 		info->max1 = nvbios_rd08(bios, vmap + 0x8);
-		if (*len >= 0xc)
+		if (*hdr > 0xc)
 			info->max2 = nvbios_rd08(bios, vmap + 0xc);
 		else
 			info->max2 = 0xff;
-- 
2.56.0

