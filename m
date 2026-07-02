Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D6DC43458
	for <nouveau@archiver.kernel.org>; Fri,  3 Jul 2026 15:17:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 74C0A10E621;
	Fri,  3 Jul 2026 15:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lsv+b7d2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9078C46EB7;
	Fri,  3 Jul 2026 15:02:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783090970;
 b=aYQbOqOAN9+9Tyj3IL7K9W8dlvOS+7AJjW0XASJAthkpIZ8UuYuu87d1jGrcPzPQBlF8k
 F6d6//B/J6XCRGQpsN1j5FVxWVmW6ykdaRfQL4mk2N5pMhPhmKPE5s2FMfLux3SMhGrjC4u
 BxVcpRW9/IQHzCn3fdhRLMl8/3298l55MUziiDYVvowUy1OVh0Rz+bjIhe2mDgKxCTEIoTJ
 eJr+VGav/Dy9P05feru8IHxpJ04z9+D8eWhRzOjlk4uKNjEtAU4qWmlecidqCQP25auBgxR
 uqMPHf3WGbzkgHAoWLjmxd8Nuo1XbmcG2HJKzX98zLxrw0VtLGSj/WKIdLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783090970; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cly/nd+WtRjsO5TA3lU7g6oCqpic1LOhtM2jPoyTuQk=;
 b=JXD9XOtabc8emvxS9mPE5NIZRrgheyE6HNFGZWApyffXprRerLe+WH7L/KkdlfGRvqbrX
 Lc6wVsmjSrkIsYLbj9IIEhNQNnCF2Q5nF9DJIRlvr8jn7tkA0304nUydciloeSYlmFAzoCI
 gbU5FvSW/oLIQ4gJVJ1vyviV5md8DxXUazVHYO4fOgn3O+J+b1bdm2iyLMWt71BSD3KKCPC
 qr5msZuwNMg4VEtURpZStfzwvNA3edBj1P8cB0cCxXN3Ut+KIi+Nn2nFaXqVWIa2hWh07ed
 Lx6TqS3To40z/bd/NoXT8hnpq+0hJ7ByjymX4FL4HWq/Qai3q+Vzwk7akwkg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AFDD04004C
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 19:31:00 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A00D10F562
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 19:45:47 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-37c5dabff14so337893a91.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 02 Jul 2026 12:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783021547; x=1783626347;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cly/nd+WtRjsO5TA3lU7g6oCqpic1LOhtM2jPoyTuQk=;
        b=Lsv+b7d2fGYvWRIU+v84/0i4zb7u5Ux4eay+Z7CEG3/bNxE3ve12H+HVFG2mzK77K3
         WGHKUxrA3mXZmnAXnb/zaNiS+JeqDIefgYlZ0PY4i7bBaInL6wJBYtYDAodBANkp6L3I
         ypsi2OyQ8BU+cjMZNEeHO7HxSi02eBBTrTEtCtiZrLxZZE89WhAGbAtzCsulSOjkjeHT
         NlGFSJme1ddmfaB5MuczKwWMIDSH4rzz22kkUZZeofrg1igh8VnslEllmCjlEvnKydQo
         r9lcFbtfPX65jqbyZEo+xGLZic/ukeTD+EmCs/CwDTeVNMvFZPyqfWLCbVazUmLK2Ttx
         Pd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783021547; x=1783626347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cly/nd+WtRjsO5TA3lU7g6oCqpic1LOhtM2jPoyTuQk=;
        b=UPCvpU5MNkYhEk6EXfAw7hlIzA7Cfjn2QivJcOPAEqueq3LbyzCQCqMIGWw9llRLCW
         WjfO9gXDWoNfXhIeR3XW+ovAZf2FzYQkq3Nq0WGE7gp4ulf//gSRnUvO7hBy9l7pZima
         tcC/+3kOiJb0U51RmCJ1pa0/qanyXjFfGC8mMPqDQmHvY5Amwp5djGXzo/lOvX2oH0rM
         +0VKDwIoshLvkLH3L02Ifvzj/+Z3sXwVYvjdWNgdSZWVYIjLuNq1qNzgtu2zlPaliO4q
         o/1uDF0JcAgCaVMFkbsKwsVn9r5qlbRNSHgf3ORBkbWIXs7J2oI5I+XJh0y30AQXzy2A
         cmjA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp1lUpo89H+uHQj8RdxSRnDmAlEAdiaUAaopEXCXSbwhxRoiGifqN+ZqxvfvTDbiNZ3ZiyniPCj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcBzq9HWHJX/uQXsc3vabx5iz5n9QPN4Kdo5t5H7Ac1PeXIH6h
	0XEa6eGw/zbo7kzdFx60BJ9E0yyjkPYkPXslHeLJRrm0w9kgpIF4H71w
X-Gm-Gg: AfdE7cnc2xaOUR3dU4FlR5jDnRBAg2yri+ddXz/+trtoQnH0yefb3WgYwmG3rNGitCH
	SO4M1X59WCcGCY78CRDr81h7cjCgfT10KL+9XCy4Qxj+rfLcFL6CeQrSKNGnAo/vcNJhmE6a/6G
	m9oS8r9n1kCWVMkg2W4kooCHJT7vGgvuwIqx/QTiX1+H7gpO2SbwtWpcUD6jgr1an9/lVHdL5SX
	3+6NJ0LtLvRrxAnabXQQVuOaDQDH/ExV7ZQ1GlH++Oq5tfB8VczEQUWPMq3ImGUU4zz5aR1xVZs
	wU4bXrr2YcBKNhdpCWHDmlUxhNG7V6xLW7JcfWWCfimuUQi5xCykG0nXql+U+RYwwbUIVm33B1D
	xRVmiGIDKFZ6Sy8gOSySuSM5+fSUK0euSEDnNtWo3QZRt85uVJVoSWQLqNZqK7NyjxDwLNRh5Gy
	jTl1YSf0tKloTHgM2hbUWWcc5DmMYfuiPf5U9LVcm0XFc2y7igZ+uNDZsF6INM9p3zYjYX+0wZf
	7XSn9nhwIrrS3uciSC3jfW/RF2n8CITN7uhYSGBKMFdT1AVZXedXn5vtX/Q+IBZuHwscF/kR6H5
	1GFicrXoI5JrbvU8q0ipgrCFAEfh8Rll6yo/tOK/TEPTi84r
X-Received: by 2002:a17:90b:2791:b0:36d:de94:f31 with SMTP id
 98e67ed59e1d1-380aa1f87b9mr4934895a91.7.1783021546906;
        Thu, 02 Jul 2026 12:45:46 -0700 (PDT)
Received: from midnightair ([2401:4900:1c94:62e8:bc10:77d0:2fda:415d])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30f0b85de12sm12578844eec.12.2026.07.02.12.45.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 02 Jul 2026 12:45:46 -0700 (PDT)
From: Anas Khan <anxkhn28@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] drm/nouveau/therm: remove unreachable fan update branch
Date: Fri,  3 Jul 2026 01:15:40 +0530
Message-ID: <20260702194540.65127-1-anxkhn28@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: anxkhn28@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: C4OJ52AXYPDM3EZ27PDYGFEC7XWLSTQ2
X-Message-ID-Hash: C4OJ52AXYPDM3EZ27PDYGFEC7XWLSTQ2
X-Mailman-Approved-At: Fri, 03 Jul 2026 15:02:48 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Anas Khan <anxkhn28@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C4OJ52AXYPDM3EZ27PDYGFEC7XWLSTQ2/>
Archived-At: 
 <https://lore.freedesktop.org/20260702194540.65127-1-anxkhn28@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The fan re-scheduling logic sits inside an "if (target != duty)" block,
so by the time the inner if/else-if chain runs, duty can never equal
target. The "else if (duty == target)" branch is therefore dead code and
has been since it was introduced. Drop it; the two reachable cases
(duty > target and duty < target) are unchanged, so behaviour is
identical.

Signed-off-by: Anas Khan <anxkhn28@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c
index f8fa43c8a7d2..c4aaf7473065 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c
@@ -90,8 +90,6 @@ nvkm_fan_update(struct nvkm_fan *fan, bool immediate, int target)
 
 		if (duty > target)
 			delay = slow_down_period;
-		else if (duty == target)
-			delay = min(bump_period, slow_down_period) ;
 		else
 			delay = bump_period;
 
-- 
2.54.0

