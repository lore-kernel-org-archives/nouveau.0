Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CE3606A324
	for <nouveau@archiver.kernel.org>; Sun,  1 Nov 2026 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M5mUDqQ+
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A0B5210E466;
	Sun,  1 Nov 2026 20:04:40 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4362C48C6D;
	Sun,  1 Nov 2026 19:45:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793562323;
 b=TZfftHM0jj438WeATp3CMAfpxTwQ/P9W6Ds7rnkeynECAOlankHH09DEaxchPnLm6Crxn
 ZcCa0GyNoFoMXxkXUvW8bbWsBsYbz7ISL5qUpCntLsJEf86dKIKyXNCq93G10Xl43dadLw1
 abTokXZu06yHlHIFBLE9q/YajN0w/tsFS066hDOg//F8DhtnrdOzA4uifYhwSqUzQKKBVNw
 tvNcJLk1IcchRhDfZn8qvQF4mksyQP3TdQpTZb+ICbA7uveqGQKfgHfRsLY677kbJJ5Bczv
 wHcSaMOYwz7YGfqjhHhRrEx+IzYWIPCeaoGOyamEuxKm7LOd3Eic75nC2doQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793562323; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EADMVsLqtl7UawIMCnC7ocVxqfEpyyxisoL1Jal/32g=;
 b=vGJokZqjNfobgdqyuP1ou3q0/VsjN1gw0E519K6T2m7l7bmGO9DOz673AclW3slGNXoMp
 KmkKurGGeDWFIxtRPunWskcMGIO5mbZaKCJ6bnp7tzfHdDVi2SYAI0aIpTTlifEvfR+Rnul
 8AL9z9v9OlO2c381xHVDoIU6p5jndItvYK0jWW9psiILRpaHD/ikdGU2K2kpu5tbRLjkI8M
 N7YWvXSurLTj4d2gvxsi181aWusRCSPlRR8poz+TH40Wrop4S9K5zE9zYTqg1gITo7MHUqi
 TSHG4vCvvUr9Vx2lBUf9EIbMZeC54tDHaTgRNFKJhY6RIJkQj70LfhOUoi7w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4D8C64347D
	for <nouveau@lists.freedesktop.org>; Sun,  1 Nov 2026 19:45:20 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 69D6F10E459
	for <nouveau@lists.freedesktop.org>; Sun,  1 Nov 2026 20:04:32 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-353804b591eso4135402eec.0
        for <nouveau@lists.freedesktop.org>;
 Sun, 01 Nov 2026 12:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793563472; x=1794168272;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EADMVsLqtl7UawIMCnC7ocVxqfEpyyxisoL1Jal/32g=;
        b=M5mUDqQ+dXKyHPBw0BcHCI1P+qffb/kQJksXoMFJ5eXFjN2OfR459QgKljbtW5wIPQ
         jpvFl1n6fP9lhtJ8n+ChBucg3ECHyfgXYT6Qg/PmpBv74xMp01IT+7NzbW9HvbkUGRKU
         8c+ZVMLoPhm31xNcm+7bkrZYQTroNIEJp943S3Egh2MoaydKcgxHWClK1tsvv7Knbaix
         L4EY0+LLCRV41oo/T4vckc+pIJrYVKDlhqOUFWmAbFwIWKn5ddxfpLiDQ7306KUiiFLW
         DEfZz8rOQKBx9Um/mtCa5DwoQEnTXdZ5NRF9PXKF2sD9O0JEI0C/OaQbQ6jBd517PFFu
         7khQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563472; x=1794168272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EADMVsLqtl7UawIMCnC7ocVxqfEpyyxisoL1Jal/32g=;
        b=Vbjv+gGlLcYtbwSNhBPUrKb8CgB0MesUENx2Gsnjumqs0tzQz0YS7fJJnWJrezqOWG
         cM8bXtfQWrvnntVJyCbvOijq8rsSEtv3nkhvryr2ORnWiksczOBFvIdJs91ssSM3NtRQ
         NUeI7TFC4n5fmqlaIgMJH4Adu5PGjk9draWwtm1ynlZm957bZQvVff4tDE2qCIP0qMwp
         D47Pfympnzbf2fRFo/ESCCEzeLZsqWciLq7Z85oXcQ778t4IXttHsrqIoaJyujqL72lv
         Q/tZvRoiggQRQaCnbXo24SqBTBkyTbk2wTh2VimtJiMvb+7nb94kEj9nX9876GycJa8W
         pT2g==
X-Gm-Message-State: APuU4Z9bFiT9KXtL5rPwoYNNBgJ5vokF6rW4N7+Z4Yj5PLlRJpN0TmtJ
	WNiPel2qTATty1/9uJSoTWfS99K33QUUf06Uh75uDK7+51RA21LzDX8hbtmoCA==
X-Gm-Gg: AYBFou0PGNUst/P8qYYbWto4cTTapIE50BdWpKZ2np7EnUFw7f+ifTdLcypm6jU7vFp
	9YrUpuVdAPq5ZZsIDF4RzgTqCszndbAb/v/O5s1B+QdCopo05lqU5qmSxv/hJVjg7L0fpTHUpcP
	0wgv4Rc8cMc44+aJ6Q7vl+A7RQIUjcrzSZmsKQBoRtvS/Zh3BSutzbsUyOGp6WgKbUmlcYIv2an
	lYOQtv9hZ8qgMAJwsjOHa9MMhEowFti6Ddl+SaWaLjxgOF9W2vzmOwUsLyYUdn+UocA3dh9LGW8
	KOhOdUy6655yU9lZM6YtIuyiDCsq9BO3cMgJWQchDNPnYH55sZMNfUvn/Pj9T50zDQjIhJ8pdUt
	gcd6Eb/rLt1ZEPV1T3I4eQYF2Z39oBv+D9t9QthCNgvG68wA0fniCmdERWKwckiiNdkOY7nVaNV
	HS36tz2B+YpM92RiuGjHVhqik6MYAj0zbzahinPPfqCq9YleCO/BP91GaZCHQHCv9QYM+zIMgWn
	5aHMHrpyeuLNKTaveN5C/3Gg/qUOv5buV7sozj47GjY07yFdOm/jA58LhhFljFhfkYu/TNcDj5U
	d2lNycg1LSsEOBRabEJ0T1JVJQb9NXrKXXY4aVWlydrWcxnlgWvWpEuOHcaQbz65JDHn63cjSoE
	brTvrhOteJlZB7BgjiakVJnHUCnKSk1aCDT/h3fkb/SN0V022nTIena4KcTYVMgPxj4nQp1jYgS
	jHaQ==
X-Received: by 2002:a05:7301:6787:b0:361:306f:c32a with SMTP id
 5a478bee46e88-36a42345b05mr16145992eec.11.1793563471296;
        Sun, 01 Nov 2026 12:04:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a42a98f65sm29251211eec.28.2026.11.01.12.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:04:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/nvkm: clear use.enabled when subdev init fails
Date: Sun,  1 Nov 2026 12:04:28 -0800
Message-ID: <20261101200428.16959-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ACGLQ3XHAP4UZMNMSJVIBWMQIS6GGADT
X-Message-ID-Hash: ACGLQ3XHAP4UZMNMSJVIBWMQIS6GGADT
X-MailFrom: rosenp@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ACGLQ3XHAP4UZMNMSJVIBWMQIS6GGADT/>
Archived-At: 
 <https://lore.freedesktop.org/20261101200428.16959-1-rosenp@gmail.com/>
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

On Kepler boards without the video decode falcon firmware installed
(msvld/mspdec/msppp), every other VA-API decode attempt binds to an
engine with no ucode loaded. The submitted work never completes, which
leads to a context switch timeout, a channel recovery that cannot reset
the engine, and eviction waits on fences that never signal. The process
ends up stuck in D state, or killed by SIGBUS when it touches a buffer
evicted after the wait times out:

  msvld: unable to load firmware data
  msvld: init failed, -19
  fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
  vo[5444]: channel 14 killed!
  WARNING: drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:117 at nvkm_runl_rc+0x2a4/0x3b0 [nouveau]
  [TTM] Buffer eviction failed
  WARNING: drivers/gpu/drm/nouveau/nouveau_bo.c:1092 at nouveau_bo_move_ntfy.part.0+0x9b/0x100 [nouveau]

Tracing nvkm_subdev_ref() and nvkm_subdev_init_() shows the pattern:
a reference taken with enabled=0 runs nvkm_falcon_init(), which
returns -ENODEV; the next reference sees enabled=1 and succeeds
without running it.

Clear use.enabled when init() fails, so that every later reference
retries init and fails cleanly.  The other readers of use.enabled are
fini() handlers that use it to skip teardown, which they now also do
after a failed init().

On a GK107 (Quadro K1100M) without video firmware, playing H.264 with
mpv --hwdec=auto: without this patch the GPU channel is killed within a
minute and mpv hangs; with it, VA-API decoder creation fails, mpv falls
back to software decoding, and no faults are logged.

Fixes: 8478cd5a740a ("drm/nouveau/nvkm: add locking to subdev/engine init paths")
Cc: stable@vger.kernel.org
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
index aab5a73f467a..ff6858f5e5d3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/subdev.c
@@ -157,6 +157,7 @@ nvkm_subdev_init_(struct nvkm_subdev *subdev)
 		ret = subdev->func->init(subdev);
 		if (ret) {
 			nvkm_error(subdev, "init failed, %d\n", ret);
+			subdev->use.enabled = false;
 			return ret;
 		}
 	}
-- 
2.56.0

