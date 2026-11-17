Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8437606A331
	for <nouveau@archiver.kernel.org>; Tue, 17 Nov 2026 21:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6hFVOnc
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B802310F97F;
	Tue, 17 Nov 2026 21:44:39 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 072D1494CD;
	Tue, 17 Nov 2026 21:24:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794950686;
 b=B0dAIA0BUt7adFrk9a25nGcrePJXNUNSOffMx+dewcclwnoI02DT9wYd86XyoxzN9o7hF
 uB0dGArjtaUT6KENpA+3yIB1yFyK9fy8JlEsjjFXh2PtvBDVduf0BXZ6n3a2jxWwwwOOeFh
 VprgjF77aG15zsNCzcPwyG7wIO0V8DHPddBDsnD5TELepKNJuHxdOD0D1l/R00pqiynMkag
 0RsZaptIXC3qpUxpXnAW7tGFCS/XTvxSywgAN2JjHCi89nZT5ezuCrQTZxf0HK04n18khnz
 a4KNWe0TRQrJGZnuRbfZoseuesxQS9O2/i+IAED5vtuDrtH4RG8G/4FUSs1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794950686; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=d6UTl8IcRMHJ8o1AzBnaOrrvZJhPc7DJaM7kqbvB2L0=;
 b=zUJaYU9NUjH2yiSu+41EG2DVC+HAWcVCS+Z4gj961az6VJt4uJEwkqSJ2dhHROp2y+mrP
 GZLebFvU5TFgT/ybW2Or1F8CC5x3WtCgOrEFNZqeYQYPbmqcYYgFxW4sNeBWpMsAYNFO8HU
 4C+g8U1XnyOdJwecYRKBirpkSQMr+BZ691aTjHg6rPkM+PDZ+7KqsVF0h4dcoEeHcuyEmFA
 aAjKhjh2aGcGaOZdvQ28/CZSJGKH5tQBk/VC7Qxb+uFk8gNlKYDOWSyhzJd0/GuQTUNDn5Y
 S/cOG6SPmiaBkSDS/b695SwxM+2kMAOgmkUSIqix+7JkLZ38EUCmioXpjQ1Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F733494CA
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 21:24:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC6E10E6BE
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 21:44:31 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so3508475e9.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 17 Nov 2026 13:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951869; x=1795556669;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6UTl8IcRMHJ8o1AzBnaOrrvZJhPc7DJaM7kqbvB2L0=;
        b=U6hFVOnck9D5kaa+omcNDYwbmurHh/5XNs7lfOKHpd7ZhTHCCl5tBMwTCabw3+HOhB
         VSlJV5Mc8dK5MK/W+ETBVzLulOqS9AxJi53eNp8NMUBP+c4xVBeQUzIT+Y/FveZDLk2n
         GmSLu+rv9OPCdCWxFL+wKfWP4BTuXB3PAJMt+862tR3WvTtwdqx2JwAk3SsKQC6jUPFZ
         ZDMRKBjxo6UhSbT7U8DWc1kdu4RnHpvCAwWwfcaHVLZrM1MEJ1qqH54LCy3jRMGG/h+f
         wMc0fRSOhPZoicCMYkgaKMMZDC3IvGJKexgGS7jWZ23gv37tqEG+A5vnDiOaidbdQ+kD
         TfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951869; x=1795556669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d6UTl8IcRMHJ8o1AzBnaOrrvZJhPc7DJaM7kqbvB2L0=;
        b=IVvfC7CFnPSXROH+vS0X3QfC5pp1UGOQTpIl63BXlZaDHUsnHNHXuUA57Z9rQxr+y8
         Nf7RS+xNxilNH97M5t/JTO8wNURawl2TW8LdDSjdJBhiR1uFfMOJSiPnraf4NMzPBtA4
         XRSIv3yQijIj7Orp2xELQ1/pdrabVu0TDhyFpS8XZyBHgb1GZvItET5SQZeohM+HcBbH
         dtUiZL3lBE/2sVAXZgvWTwGWiJRSpzJu09xwGXZEf3MmL2EIKk900NaX6BGrz6fBfv0M
         FQAASz2ZsPtOAUg3qHaymWB1+ILk+qS1FxXuggXCRaP7DdHY+Slnwy8UwzzPV6JlT9Fs
         NPtw==
X-Forwarded-Encrypted: i=1;
 AL+hErFolG8JItShTCIYlkAQL+BdIURTFWoPF3dfFC8a3HHxjgfaMdzsxoIPtpXAkA0eyGUno97KnHJu@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/vhV+1hbORJXEpvO4aXpucUOYoHJXZnnp4MP+AXEO+awgXxXoi
	sWHOuG0BPKrfgNoJZ8jj/rNo6LfxjJVHcepCbEgLkfnY6XOxV4dhS4rZ
X-Gm-Gg: AYBFou0tIUBTk/tsoliz4j5eeAImpnVlZxTPm8nQwr6Meeu5G9ZoJaH8Pz4D6bzieqa
	rXwjfQRw/ikg5v3FquTFaHGzHl3fFLo0ZvaUJ4O6DNUFTVWnhDlPor7a8l4IINN2S87PJcLXCEC
	Opk8ywR1/FfZMgs/2+06VeWBftpM4OhrT23mFAPT6rovQPpCgZhcCbt5N9gt8A6mTW43w8ef9iw
	mIvJMMENqhI5FoIgdzpyPR3524lmtn0y9E5j3pEF42qDi4uAaE/uKOQYuP5FRwKiZ7k0ZHWcF3g
	D3vFb1FoJCt6xWDc82JR6YxZYZvcWkoolQ8SQZ9qpeFefw5xDGuPw8ct4RUOAvxl77GK/yJEGFE
	p8neVOCiOErs/Np3vyfsNDmObJGqGkQQVQrNdaOIjuwE8fjch4aVCfpHBrKWb4advTST7nHLNQb
	vQV0Iz5WWLt/BTZCcQySyc4XgH7Z/MQqnMVTcH3aHWmMvXusQ5OPTlR9WKd2BXFsEK9cQ9rGaX0
	Ep7vUfiQTVP+miJmtdA6jct6PZKEgHRXybRE2bsfz4QKWd4B5T4x7ycSx45NXwutzLJ+lfCylTd
	pGhax3gsGBVUDEFNWl+nhowm14deljUZ64Uc1lxFPcr2tO/lBhYjBKX0HlyQsw==
X-Received: by 2002:a05:600c:524d:b0:4a3:59c9:a758 with SMTP id
 5b1f17b1804b1-4bb7da46d69mr8423315e9.32.1794951869309;
        Tue, 17 Nov 2026 13:44:29 -0800 (PST)
Received: from fedora ([94.200.248.157])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb784231basm95069675e9.11.2026.11.17.13.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:44:27 -0800 (PST)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/nouveau: do not return early from a synchronous
 VM_BIND
Date: Wed, 18 Nov 2026 01:43:50 +0400
Message-ID: <20261117214352.337961-2-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
References: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SP2SJO2YYEUHKY4XOE7X5F4RGN4THXFS
X-Message-ID-Hash: SP2SJO2YYEUHKY4XOE7X5F4RGN4THXFS
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Thomas Andersen <phomes@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SP2SJO2YYEUHKY4XOE7X5F4RGN4THXFS/>
Archived-At: 
 <https://lore.freedesktop.org/20261117214352.337961-2-mohamedahmedegypt2001@gmail.com/>
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

A synchronous VM_BIND waits for its job with an interruptible wait and
ignores the result. On a signal the ioctl returns 0 while the job is
still queued. Userspace can then use the new mappings before the page
tables are written, and the channel can take an MMU fault.

Wait uninterruptibly. A synchronous job takes no syncobjs, so only the
jobs queued before it on the same scheduler can delay it.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Tested-by: Thomas Andersen <phomes@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index b3f02c490ecb..680ddffefca1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -328,7 +328,11 @@ nouveau_job_submit(struct nouveau_job *job)
 	mutex_unlock(&sched->mutex);
 
 	if (done_fence) {
-		dma_fence_wait(done_fence, true);
+		/* The job is queued and its VA space changes are applied. It
+		 * can neither be restarted nor reported as failed, so wait
+		 * until it has run.
+		 */
+		dma_fence_wait(done_fence, false);
 		dma_fence_put(done_fence);
 	}
 
-- 
2.56.1

