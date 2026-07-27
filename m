Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49320C531FC
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 15:28:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 96D9010E46D;
	Mon, 27 Jul 2026 15:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jOLI+tcI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6FAAA47410;
	Mon, 27 Jul 2026 15:12:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785165166;
 b=0UegkTFJFfgf7EK7m7+aTidc8iehfluinePFLinhPdOFLEWyU4Udb9RyO2dmkXZwUGUok
 6ZNFRgjEo2+dPbWdQJedAYv8vAjl65iMLoHJ69QggN3A++YCCoQmmtU2Hpgbi3owbUCjAIr
 dKEW7k/zijJPSuDmuJQ2/4yW8BnNPUdnlLlpoxUKbEG6TmDNJ+iO1bOFsPcSEowVh/JOumH
 WNwQiZ0PK1IHKlnJ6l/954SC8zXHwV6T47/k4Dak6tlBIVcbo0O4ZnXo8e/pSIAMeVGB2pw
 ior3TP60Mu/rvU6vZcw0XbeSPTPfvgBt+kde55nO32RErHM/SO2wtu44ohBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785165166; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xR8fBXhyULcS9rw8dxfF/pU3nQ4nEDbAUP33X1bCS3I=;
 b=QtFd+NAZqEEmyTK0l5ri9hqJg19l8Skv+JF212wYM5MjSLmC0LJKPxMH8yDIjTU4Q2gmV
 HnaWIihZOUh6OcWSetydjCKeJNNZgK/WM5Eih4qKW50nUbOB7h80WW/YzZQWca7TEh9TAR6
 Kbep+ggf2cxBhH9CkCYu6sfOh8i54MdnVjRcTB0c9o8ckD6OK9wEap2rsvBbbPA2rgULZq3
 1pXre9IQW/yxqq5E/ccYXXqvtqQTdNBseNsMFRSz4m7Llu0HVOP6XvLH2d/uJbFgTKA5XIq
 GPo95OR1ugVMFiPwkHwFl+VG4YOXKloQuh4A9XQgeP5w3I5TWAePe3+8mbqw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 92CA8473DF
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 15:12:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE0D10E418
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 15:28:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so13275335e9.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 27 Jul 2026 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785166104; x=1785770904;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xR8fBXhyULcS9rw8dxfF/pU3nQ4nEDbAUP33X1bCS3I=;
        b=jOLI+tcIiMnJyey0K1t6NWld0kgXuZdCVWQvFTerrwDLFV4T+qImQGreYda1RGJY8z
         fKv6zYpt0wsQ/h4SW5XioxWXuA+LEBF0i9L1PmX7ooi44tpsFJfYtbG4IIuvktoZzgND
         ny+3NEgFTDj0uvw/Gq0OMaILVpDI0yx8OeA6yiCNq54T5Gh6GSVhoGXSCNyWkF9Kjv6F
         beudl1Dr9Bf22jvHS7fgvrZCuiqy0/iktbrgaZVAc/8miuk2Gp5tZzIBRYj+qRXdEgNm
         ykS5X0gIkONHUeZ7M/RCT/Zj6oYL3BfI5G9dJtBtwjxfR9qvA+a+vx+nUGZmzB9ABuWa
         zRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166104; x=1785770904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR8fBXhyULcS9rw8dxfF/pU3nQ4nEDbAUP33X1bCS3I=;
        b=kmqnmlfb0cJF7G8Y6Q9mm/Jd7kUMk7lknj2CO4WSvkm4g3gWGQRcIZfW/zuOb2e3mv
         q9R0ytnhPWZqz0ZcKbLy3X93if074964zcJrwK68ydXmuAv60SSq5+MoAaBkn22YyoE1
         G7wqCBPFLb8pzAS4cSwymp92JSC2zTskua2sxurUoDwuJ5TAP/8mvdVkr190XEYY6DX8
         K+cCptjgRw8HfZi8b5b6IwqZdg08B7p45ebjP3Jf48OgE/MXVJhiWtovdXX3GxGaESGw
         Fh+XXOD42zcxCWpCYUQwFRCsqUN2XtmC8bWfDmn11zifpss7I/4IXVHBWPUzfJxSJPrn
         tLIw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoawUvntxRgmNt6pz/lpuoa2e68sDMgwFQDf6Wi3pTM/We53IcYrQSHZG8WwnyKK1RlzHFZwF1t@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0XCH9SwOQSXx3S0dciTrz/4Hbx07cLY48+U6tWwFlby3gYTko
	IyALO+XZ57c9pC+Q3tZeunYIaYM32auY3O5d9pNcFUtJVKNZbdj7DRnX
X-Gm-Gg: AR+sD13ctu4wikuZksViE7uzztO/wG0snp5whSDcbIp7vTRsJEKcFtkYfVZoXRunC8w
	9s/+8TipgJOwDo8EXrNROaKPNWXiUHhRUwhBebTcnUKq+m+JKDm1c3/XJ42F9g1Yk1ayIruc4Nf
	1tgDiw0eC9h64GJt9Umh5tByCCaiQHpZkCIcHDxxMnXmMe2YwyELxmOCfKiWeDVwA/e8p0PfeqS
	P6GrFYqFKTnIVvO7BMAcK5zDWnxe6UAT58uTbxLx4Hwdu3qWQcv/PLFOn0xDhBtEs9O8k0cJbMp
	i5ma/UOG9iD3wFC86tcIsTcDzh5fBrjVZPkygWfwvi0Ca5hAGBFvLQdgW6vNp2KyMZ8CB9W4NJi
	CGAKo87YBHVrZnrlhWihmcTGxzIkzGklp3Zg1Ulhp2CNRIwoQBtf6HuyjPh7oSAUi3dCmAZdN9y
	+9trWJOiA=
X-Received: by 2002:a05:600c:630d:b0:495:5dcc:52b4 with SMTP id
 5b1f17b1804b1-496b56bbe6fmr121439075e9.3.1785166103817;
        Mon, 27 Jul 2026 08:28:23 -0700 (PDT)
Received: from fra-x8664.lan ([151.16.232.22])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957b816ef8sm214838735e9.1.2026.07.27.08.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:28:23 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/2] drm/nouveau/clk: fix RAM error handling and pstate desync
 in nvkm_pstate_prog
Date: Mon, 27 Jul 2026 17:28:19 +0200
Message-ID: <20260727152821.128432-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZSPR4V5NJWO4NL5MLXVLMUZATXKUKT2I
X-Message-ID-Hash: ZSPR4V5NJWO4NL5MLXVLMUZATXKUKT2I
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZSPR4V5NJWO4NL5MLXVLMUZATXKUKT2I/>
Archived-At: 
 <https://lore.freedesktop.org/20260727152821.128432-1-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Follow-up to "[PATCH v2 0/4] drm/nouveau: fix list cursor use after loop
in the clk pstate paths" (20260712123616.1180830-1-postadelmaga@gmail.com).
Sashiko AI review flagged three pre-existing issues while reviewing patch
2/4 of that series; the third (clk->func->prog()'s error being clobbered
by nvkm_volt_set_id() in nvkm_cstate_prog()) is already fixed by patch 4/4
of that series. These two patches address the other two:

  1. nvkm_pstate_prog() drops the RAM reclock error and falls through to
     core clock programming anyway.
  2. nvkm_pstate_prog() commits clk->pstate to the new state before the
     hardware transition has actually succeeded.

Francesco Magazzu (2):
  drm/nouveau/clk: don't ignore RAM clock programming errors in
    nvkm_pstate_prog
  drm/nouveau/clk: only update clk->pstate after hardware programming
    succeeds

 nvkm/subdev/clk/base.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.55.0

