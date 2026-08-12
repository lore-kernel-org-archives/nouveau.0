Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FB2C5B56A
	for <nouveau@archiver.kernel.org>; Wed, 12 Aug 2026 14:57:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9655510F054;
	Wed, 12 Aug 2026 14:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DBMQEz3x";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F0ED2476F4;
	Wed, 12 Aug 2026 14:40:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786545648;
 b=OG7y8ro3RfkoBWeHnb10wqnLX5WdU36kwb+mAZBtYSlWGYHlV/oWAUmaW2Ew5WzZIaZWF
 dUGWrz2cqVDtA+96dtbOSL9RyqZtpM4wrPNRbKtwez8SspDebjF3Zj40ZRKg7HFuEpl+KuA
 hgJaYkFpAxzDTy5zLQ5AC91k4+WS9CQyeR3hL+gDuJoPQPUDdWjywI8/etYFVpBm5FLERV3
 jIaxJJ1+L5YCbInzqOsJjeglpx6b+VLMrvIAy5Twb/OvgAdCQpg9jStM+pUijn5GZIsGib9
 UEj0XdyvXuLy8yHBTg4Pp9G2jPpSSvK5On5mh28O0U7RQhWQORP0XnWB2iLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786545648; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YJqzV4FfWSH2549UJL4Hdtad7cbUf0wdUKVbd4knoqE=;
 b=yfs1vVxTovfNGDeVFMA0GYwz5aW0seLeEzhbvzZYjsvP7lDDPorLA7rnCKizEpRACu4vZ
 dnAHO22UNp2oxuotlbGvcakj0LgArPUf7Nil/fqStkxG/P4Bx0ea2T02/AEM1jJq9uLj7P+
 ftEqaFE67LRCf4lZNZrJZ7X5sDaqy5b2TvVAFt3DPLCba0dRxYvCZCzuKsZn3oznw5m78vL
 MPApzWTnjh87vv4DlIeRaagxSSeFM4hoXgs3jh22KWY3LFPJiwsQgEF8ICfk/51IxVYj9ek
 +yjfOpTH7HfKWCGb9j0Yy2mg4nSPo22yMw6LaorUo5Xv3CpQ33Y3WuvmpO8g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0B04E476D7
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 14:40:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8A910F04F
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 14:57:03 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2ce7d2adef4so13435205ad.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 12 Aug 2026 07:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786546623; x=1787151423;
 darn=lists.freedesktop.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YJqzV4FfWSH2549UJL4Hdtad7cbUf0wdUKVbd4knoqE=;
        b=DBMQEz3xyWkSdPrL+k49xiENJfMQBHaYKpYRfQ07qzBbSeMksM/R3arub6XvgBuTKY
         Jy+MfFZuwgoehB4KHZ0DkCeXPVmMttSZRcmyA1DPxU3FqaOxJVWXedcqTsfbMZ7xwDy/
         6/9OFTZ2tHLsbcbUBgmif/46bB4ULTooFFR42iP3sUN6Ee+5Us5YDkaFB+lnl19SOhtR
         AkBixg3Cg45Nf72JEIBHTllxBPO+PeeFVjoc/7sOkAsyDtPdhDwk/nGEHH0lNpxe+VcW
         QHjjR5t4aagZlpHaakAA/QsUOqpvgzf+du9w2YnjyVL5sd4ahKM/NZkxkJTbZc0b2VW2
         M08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546623; x=1787151423;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YJqzV4FfWSH2549UJL4Hdtad7cbUf0wdUKVbd4knoqE=;
        b=gmaOPHsVDwVtAy455r4EMvMmxa4Ek60p8wc6KSt+Fozjc4HWk3fKZRsMilWAw6ufX+
         C7sv3hVwrUVMjuOMI40aYL/+tm6y3QGvz6iB6zTQRsm3hArHcIVD40R+Wonq9g65bV9K
         ptzkVReAbIFlRwkSo+mw8B/QILQnYMf06obHzqL3wSD5totQXDR1c/U5LXve6MKNMKLc
         /NQoowUA67rJMannwVEmdnCjyjNo1cMVU6hiu6vOe6vvA2pMhtDiOIy4EIew9m5dWIfF
         /YTc0I91UN7LJWP0Felzv3XeFSwOIymCSqqo8YJYmakTxjmcurRfBQY4Mc82+PQMFvJO
         LCUA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrc+OEASjM+WZPlobRDVWNepzPR0TPQSlQWXPn9zrsPbNetW4HF68hW8u3nJPe603666hf+aOzi@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz+2kakOFCIgloJZaji+Xe7CZEjbzw0re45kFCqyvSf4X+iXWO
	hYbHdE4VBp1d69S8NwK+jInqWMnShVEBEsL6I8cSobei7jwbJ6fWyFfQ
X-Gm-Gg: AR+sD11puqD+l6P9xZn3WgNvH8BGXiBuf1pRTZxzhJPFct2S9C1aKsdMz6dmuC9Tg3/
	SoMBzL/o7NdpiaSwiJVeYpM418a2w8NWLA49y3u17INoXa3Zn/B2sjc+eL7r3kn1irQ/LujvslA
	kKfaBTx4Mj2E8IAE4loSsGZWdfNENBPD+2suv54AV1Cvch4J7dbEdZFN3HWyCu7iB9JLPe181Kx
	hEo5memGcbOElec/In2iggpk39F4YAeBiAnjG2O6fUs+lToJGk6DjAu3InWbcgvCRC1Y3U6I9Hf
	UPtz34z8jtM3l2SUjfG0R7lZUNZKnm2QtFWxi1ZEYVelm9cueRIZP5M/Ge/PcEG2QVzSL4OyuEf
	8JjntZOtXnj7i9cpeja/meEwJMBdkSWqvIsa4zYVKkCKuTzAu3Tphw3qtQ+4gRlsfQ8lMhzAdbl
	4/Uw75eacWVHyk/+zm2lv48bUKhcoAouVllhlWlu5fB21wd9G0YYLpuVobvnw=
X-Received: by 2002:a17:903:324d:b0:2ca:4f33:e86f with SMTP id
 d9443c01a7336-2d3455870eamr75737575ad.12.1786546622846;
        Wed, 12 Aug 2026 07:57:02 -0700 (PDT)
Received: from LAPTOP-N3B6U5LC.localdomain ([117.147.100.52])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d352208543sm8003165ad.60.2026.08.12.07.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:57:02 -0700 (PDT)
From: Zhenhao Wan <whi4ed0g@gmail.com>
Date: Wed, 12 Aug 2026 22:56:46 +0800
Subject: [PATCH] drm/nouveau/uvmm: reject zero-length range in
 validate_range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-nouveau-uvmm-pt-fixes-v1-1-ab3a823f946e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK2JfGoC/yXMQQqDMBCF4avIrB1IImjrVcRFjGM7BaNkTBDEu
 5vq8uPxvwOEApNAWxwQKLHw4jN0WYD7Wv8h5DEbjDK1emmDfomJbMSY5hnXDSfeSfDdqHq02qr
 KTZDbNdA95LTrH0scfuS2/xmc5wUrhSUxeQAAAA==
X-Change-ID: 20260812-nouveau-uvmm-pt-fixes-9706da1a03cf
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786546618; l=1968;
 i=whi4ed0g@gmail.com; h=from:subject:message-id;
 bh=FdyxRhhBKZiYZz3arqKV848UtUVhcBBrpdMBwG2g/dM=;
 b=ar5RYS5eT7jVtxn2WyhdU/5ZUt+UbSy5eflTkgD7wLRWZEeSTi2xLVN1+tdVDVmKDg8elm2v3
 1ZlEgthYLiQCWaVIbnBvP5OHkT64+EpC1XNJ887M4atJGbdz4l+31Wx
X-Developer-Key: i=whi4ed0g@gmail.com; a=ed25519;
 pk=zRTKlstE0LmilshGwJsFYEVjiT6RiXMBXK8Og6VmuVQ=
Message-ID-Hash: LZTC2PWFJZMWDVTX3OR63NHWO32CHDVV
X-Message-ID-Hash: LZTC2PWFJZMWDVTX3OR63NHWO32CHDVV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LZTC2PWFJZMWDVTX3OR63NHWO32CHDVV/>
Archived-At: 
 <https://lore.freedesktop.org/20260812-nouveau-uvmm-pt-fixes-v1-1-ab3a823f946e@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_uvmm_validate_range() rejects misaligned addresses and ranges and
defers the remaining bounds check to drm_gpuvm_range_valid(), but neither
rejects a zero range: 0 is page-aligned and addr + 0 does not overflow, so
a zero-length VM_BIND request from userspace passes validation. It then
reaches the generic GPUVA interval-tree insertion, where the node last key
is computed as addr + range - 1. With range == 0 this underflows to
addr - 1, producing an interval whose end lies below its start. The
resulting malformed node corrupts the augmented interval tree and misleads
the overlap checks of later map/unmap operations on the same VM.

drm_gpuvm_range_valid() intentionally leaves the zero-range rejection to
its callers; drm/imagination does exactly this with an explicit "size != 0"
test next to its drm_gpuvm_range_valid() call. nouveau simply omitted it.

Reject range == 0 alongside the existing alignment test.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index f5e4756b4de4..0efedd9ecc75 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1008,7 +1008,7 @@ nouveau_uvmm_validate_range(struct nouveau_uvmm *uvmm, u64 addr, u64 range)
 	if (addr & ~PAGE_MASK)
 		return -EINVAL;
 
-	if (range & ~PAGE_MASK)
+	if (!range || range & ~PAGE_MASK)
 		return -EINVAL;
 
 	if (!drm_gpuvm_range_valid(&uvmm->base, addr, range))

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260812-nouveau-uvmm-pt-fixes-9706da1a03cf

Best regards,
--  
Zhenhao Wan <whi4ed0g@gmail.com>

