Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6B2606A327
	for <nouveau@archiver.kernel.org>; Tue, 24 Nov 2026 21:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qQkI5z2W
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EC4AF10F0F1;
	Tue, 24 Nov 2026 21:34:55 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CB695403B8;
	Tue, 24 Nov 2026 21:34:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795556090;
 b=rZQOAILSnOjruCnRlkYHHRK/JKfhUMTNPGaMVntFtX33m5M3C3+dwesXUIjwNpeKlGEr6
 oKpziMYthU3cCCE3ETB8eXAf7yW+wwqd3PWteaU65eAyyxLl0YMLD//SYUCkrTJ8n01rN6k
 2ibC+PKxpzgy42Caf+tHWruEN/4TDlxeHD5pdhO+jnO+xHdNo2u3eBOLL8pTlS5a6XWwMjj
 WHgc7fedO9debM0HVtvI6B8J7gpLAUYSh6yZ0zdt2ru2MINjgI7faECnUxjQlqDSZKb/LaR
 uOQCBy9EAn22LXqp9Ko3mKu8r0AXkXYfU7gtNth1+lj+gg392tLCMfvVDXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795556090; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PyyQwKmFe9iM2Cp50Hb1UepVeU0i/+dyb3nhRaBGF3U=;
 b=XtO2TcVHQFlFpVhJvoIL55amI/DcJGw3aeO8jenysfX5pRSz5jJysI9KzJq3y6lToqwL4
 qODMefIV+R3WZcM7+nNdkDsqMhTwfgP75LZMUfpDDsOTkIhz5OHVjKu77ltoBTdt4LUX+sp
 pDA+wQM52/pKeujCHFytJRWfYrBOGAzV7fpALQ7YMo/XDnqi1XZqHoYhFVFpeOH37Mob7ln
 ewQhk0wrYPTt0nGEnKHqlobNL1RWH+0CVASYwiH8fuIMGgtLp1dsEiuBclY7w8e1QO4Pazc
 l4G+oi6W5ShxixOiTS0JJXBEe+I0s/Po4iZGuzo3/gTHj3mAXZNWS7eUwNLQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
 arc=none;
 dmarc=pass header.from=gmail.com policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 30429402F9
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 21:34:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F10610E5A0
	for <nouveau@lists.freedesktop.org>; Tue, 24 Nov 2026 21:34:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so43325785e9.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 24 Nov 2026 13:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556081; x=1796160881;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PyyQwKmFe9iM2Cp50Hb1UepVeU0i/+dyb3nhRaBGF3U=;
        b=qQkI5z2WvQaleb3qgq9ltd1CIj8V2hvbMrX4p+XcyPOuLwbzQTWYJQkfdyO7o77D+e
         C7eLE4InAZ2O7X7vXMCFqYnW9vLkPk5QeRToCt0e5IoGauFlESYYdC6tugM6USou6AEV
         fkxxB3/I4gts7xto/7jAAieljsfp+4uMf8JGsnQm4Jgjymg+HcdGYOuQmK4ahWpB/a3s
         vKKNwGPIhCNPhfwNDShZxjuWTWdBv+cPSxbU9tDVQor5ORH6xPgWQx7ZGkbWFXq2vu/H
         HihdVnzZLcfGS+PX4QSQKuQ5Fy0d2K29SrKqGFqg3YI+zBCfg7KgRMkfxfXCqwhLlCN0
         0nBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556081; x=1796160881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PyyQwKmFe9iM2Cp50Hb1UepVeU0i/+dyb3nhRaBGF3U=;
        b=WLyzMAQqgE/wB3DsItLQuDyfWTP4iKaTwtAbdjip2AkJT7yoWwFZBQtY3hCdZ3EdMp
         FMT5SCUfTTs7xJsoTKezbEOVBOvTrcJz+5RDI4s7PmmK3lLgmFHTCgaqtSWKov8DnYJZ
         ETMbVPhVitDkJr7Tb9vFgLGlzcU8v4xAE3yEkEDjUZXreG7N8TElG78qo9A8MFV4e5a3
         4hOObzY0XjHq7H5wJWx2avwjcIMFTk1yMhPm+BjYDpX9iP5+qqUKktvQN0tkNonxwkkA
         x+PR8Z1oQPYe+zqpvoUzatzqsq6zUOJnTl5wbegl9E/+93Mtk4plasMyTx84SXUjGxxE
         kAPw==
X-Forwarded-Encrypted: i=1;
 AL+hErEo9UiaJJ9XMb3ZRi+25EuTL/7E8XdsXMQz+YEbDm2FggifWYBazDNn+y2aCEfafoBRHLelxOMQ@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/tNR33B01ShG2+SO9sI9aDJy9DDhPVKkVs1qRiu1Y7aSkCfpeo
	mvfsRfWM98OgGpD1PJJ48typCJxHDwipWxJaF6DrZg02ZTHfBxDv2Uf6
X-Gm-Gg: AZFdTZdDESzXDkhqWoPI0qo32ktLVqU0yes1NtLqa7y68m3RcXDpYD+owWRtnfsYLQH
	THymajPZmjz/o9xmvQ7JzOrWJXQMDg0cvQ4VsI9sIGGgAnOae3Wbwkffmsi0gnrxZJLYIgwWQ/x
	mUd5Z40LXFH+OxQ+/7DHzj8wP3PcPzYOx79rdnRpF6LN/fKNJ49JwsSvg2MKd8Xzl/InYKS/bGL
	NGWNWtJdfH/18zmjBnau9nOpgV7ZdTOPBf4qUeI4d2bwtOJ3DTCYhA6hapGWs/urYO+ru/lLqiZ
	wTmF8byXfmwdn+JQdTPHi5rov3muhl1yXVTiqzA8QEBYfU6HINMJGB0YpUSkMZ0CmklEVi1x1be
	xGgu4iL76WUw4zpzNm4KYl9DOB2WeE/PQKolCFye0+q53EyYTQdQrEGtcWnTuMN5w3xcrOgCuNS
	fdc1DG8z8I/kOGG/mzLSzfeVbtwx5Q/JvHWnNRMrXSDuYeL5WMQAdbXtO10C5hjoq4WHhKA1AvP
	RSMq7lMC5OK7aCgR94wswO2mFAWc81jLRr33Lwbpqpg6a9aOjTL+TEgqphGjeD7NLzBuWggWyhT
	ZJwIa+gcajHqSiigNVAxU3JVWTjSng==
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id
 5b1f17b1804b1-4bb8881b9d7mr328897525e9.19.1795556081300;
        Tue, 24 Nov 2026 13:34:41 -0800 (PST)
Received: from fra-x8664 ([151.83.244.218])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb90660cb4sm403974515e9.2.2026.11.24.13.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:34:40 -0800 (PST)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] drm/nouveau/devinit/gf100-: fix POST being skipped on GPUs
 without display
Date: Tue, 24 Nov 2026 22:34:30 +0100
Message-ID: <20261124213430.9525-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZMXD2NXKKXRQ2CY2TBSM7UDKP5BJZHCU
X-Message-ID-Hash: ZMXD2NXKKXRQ2CY2TBSM7UDKP5BJZHCU
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
CC: Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZMXD2NXKKXRQ2CY2TBSM7UDKP5BJZHCU/>
Archived-At: 
 <https://lore.freedesktop.org/20261124213430.9525-1-postadelmaga@gmail.com/>
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

Commit 2139cb633d48 ("drm/nouveau/devinit/gf100-: try to avoid
double-running vbios scripts") skips devinit if VGA CRTC register 0x00
or 0x1a is non-zero, unless the display engine is disabled.  It detects
the latter from the return value of nvkm_devinit_disable(), which is
always 0: the strapped-off engines are removed with
nvkm_subdev_disable() instead.  So the VGA registers are always read.

On a GM108 (GeForce 940MX: no display engine, not POSTed by the
firmware) those reads fault and return 0x13.  devinit is skipped, the
GPU is used uninitialised and the machine panics at boot:

  nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at 00000000001a1000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason 04 [UNBOUND_INST_BLOCK] on channel -1
  mce: CPUs not responding to MCE broadcast (may include false positives): 1,3
  Kernel panic - not syncing: Timeout: Not all CPUs entered broadcast exception handler

Check device->disp instead, once nvkm_devinit_disable() has removed the
disabled engines, like nv50_devinit_preinit() does.

Fixes: 2139cb633d48 ("drm/nouveau/devinit/gf100-: try to avoid double-running vbios scripts")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---

Notes:
    v7.3.4 boots on this machine; v7.3.5, which has the stable backport
    (992f7f5f34f8), panics.  Tested on v7.3.5: with this patch the GM108 is
    POSTed again at probe and on runtime resume.  Not tested on a board
    that has a display engine.
    
    Read at preinit on this board: 0x2240c = 0x00000000, CR00 = CR1A = 0x13,
    0x021c04 = 0x00000001 (display strapped off).
    
    The regression was analysed and the patch drafted with an AI coding
    assistant (Claude Code); I tested it on the hardware above.

 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
index 186e09ea0c..b256404c24 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
@@ -107,12 +107,12 @@ gf100_devinit_preinit(struct nvkm_devinit *base)
 	 * VBIOS multiple times may have detrimental effects.
 	 */
 	if (base->post) {
-		u64 disable = nvkm_devinit_disable(base);
+		nvkm_devinit_disable(base);
 		/* magic to detect whether or not x86 vbios code has
 		 * executed the devinit scripts to initialise the
 		 * board. only works if there's a display engine.
 		 */
-		if (!(disable & (1ULL << NVKM_ENGINE_DISP))) {
+		if (device->disp) {
 			if (nvkm_rdvgac(device, 0, 0x00) ||
 			    nvkm_rdvgac(device, 0, 0x1a)) {
 				base->post = false;

base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.56.1

