Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03E6C531D0
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 15:06:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4359410E460;
	Mon, 27 Jul 2026 15:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="sF4tPvLB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2C39D47402;
	Mon, 27 Jul 2026 14:50:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785163819;
 b=oTp7jwglTyHAVAPdVtkF4jdJuIIgqiV4Z8hxarSwDqgoD0PNHJqo6ilPjkQUMf3liugcq
 CAlM15/3s3157oxdJ/4cb2BzJD77K+xvnm46v5rtTQOD0MO2JbOJRMSPiVpozcmJfZ5xHvN
 c1c0BSzHnqDoy7k7MGHezzqqjZcPUN8bE+TVwZ7d4baQJL4ZUVgmkgA9cVKtRinmp076uEJ
 tW3kPDKLcU6Ce/BKncbc0mT+Enou8/9w+iqJtBhLTHxgH0avR8UuxBLn7lFeBNq7RZQRX0u
 3tJKOpqiKC/rpncAgYI4hio624BxVEsHrfLul2E6HrC7jVoNviguB0EQe4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785163819; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xR8fBXhyULcS9rw8dxfF/pU3nQ4nEDbAUP33X1bCS3I=;
 b=WZajMO6dI44pW3+aYUfKp+su2+wseF4J2CDka4poYcijIfZv6ucCTRPbVSLWhPtoAtMV3
 iI8x4xU2bxfZifpEczXVO1gHDZ+lDn0ohhnwim/oB7ChjQ0GZg7PRrm3/LHlkyUEmpjP9yP
 cVF/+n339OE5GZBO9bSApU67MDnBCeJ70FciMP7tpNBh6wzEjgHSdUgIV7KWKyi30RC9i9c
 CjWOzJNLl7iNmWBaeuswdc8/pr6FkuqKRUIaNx91pFsKa+DhMKj8ZM5mHz/KGdObBZYl1PY
 hZ4wGWpZxHUOsURWfkaeTKuS801HTuEHW4E+IzgBsY1soI+Xuas+M+ROGYqw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 12314473DF
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 14:50:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBEC810E45C
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 15:05:57 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47f7854678bso954874f8f.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 27 Jul 2026 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785164756; x=1785769556;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xR8fBXhyULcS9rw8dxfF/pU3nQ4nEDbAUP33X1bCS3I=;
        b=sF4tPvLBPXPfTAf3vowz7uoAWly/kZIDmJxIDjTlPy8ZmG7Q80lDLnqrJr5FEbSkyQ
         UsJmTsThI8AXdZjIGcU8JmIbL/Zv/5VJZDZrEKhxYXT/YEwhpRZf0lXkfVqDzKcySyYU
         dhlmQSOLGdOxMXNnx2UUP1WTL3/+wefYaa4hT28fG/G37u16SwxEe/CMODI+wHCTF8aF
         usAKQpHtTb+vvsAwsRbY2yyDGeFg9Ehcg6MhqKfbQsDpN2r6CUA5RNtb2SYTdX1wD9RP
         nl9Hak4EZMWJal14Bb5eX2dFQc4CVaJVauHsZf6HgH7bNLKVkfvEA9JXVi9ekiyjZKKA
         NBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164756; x=1785769556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR8fBXhyULcS9rw8dxfF/pU3nQ4nEDbAUP33X1bCS3I=;
        b=UYk2qQKMQeS+Uh0dxc/PytzeDCJDFIId8vMwzv67DIz9RdppIXycFn59sAfLm5KFmT
         py7GOIrt6cl7MJmJmchqG9Qr6oZUQnXXKJVdBEqY5zKPFXXFyqHLC7avTAVrpVjj6hv6
         XWYUeTvpFkk8Equ0QnrP6SlQKuJSzApf0z3PMO2HBCi0OAZrkaPIZmSGFe3BqHc1eSyU
         Dx20QpvzzFTktc979Ar/NUHU9YUudKnnj3aVVQnkCyBJnBkPFkyoetxCI7q1ztTBh5cf
         /LD9VMA0vJBmMeQN+fkFE9oOUP5SzWSdF4rUppKdLuVfYMWCKsqA8/7Dtskaf03VT2j4
         aOwQ==
X-Gm-Message-State: AOJu0YwHgUaEO4Z82Yi6EIL+YJb64JR6HBxWfg0SXHuEs7fdVCkY3VDe
	qX/n/s3caj6qQZ6v7ZM5TkBYNc+R41Wh64thTLkQccOqUDH6Llt1k8KIELjBvZAv
X-Gm-Gg: AR+sD11KC9aWT/HH+E5vuhugFTmqYx9arXO84lpPBAkUEYfVr3ApmTRQuRyfXapaRan
	AaCAaBqK/S+JPEXImL3EBxHxfGXXzmQY1N/3S8SOA0Pw9IQY0kUSb29MwuYA87ZrrMg9IUlR40z
	vFrEExOQrc73bK+GdIAcuQl1PZmA3qIQSpps8RG4uc0ReUnXKHmVTPAqZaY2qNXrK0/SPRgr9aD
	QqGrgA8rWIrsvj34RW/gabY0FRCR3V5Gu6PP7fHaRbvz8kK4uY3nLWEfcIZaheSZKQLTv4nFr6S
	p8A1vYYnYQZLzeZ8++gfF5WsBih+5qIHSLxA/b5ZUgBgr3kyHn5tV8NO/tYGqFWL5R+9OBE12NR
	2Ugr7+LdMCF/g+ZXPWvePGwxJ50KN8iDo62kQy2kPpe8+zd8RxQZc1nUGR/t3krapFmkIYX/FhL
	XvhGrKFZk=
X-Received: by 2002:a5d:5e87:0:b0:47d:ea8a:d224 with SMTP id
 ffacd0b85a97d-47f9fe96330mr11316857f8f.23.1785164754717;
        Mon, 27 Jul 2026 08:05:54 -0700 (PDT)
Received: from fra-x8664.lan ([151.16.232.22])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a5a2sm54242960f8f.7.2026.07.27.08.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:05:52 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/nouveau/clk: fix RAM error handling and pstate desync
 in nvkm_pstate_prog
Date: Mon, 27 Jul 2026 17:05:44 +0200
Message-ID: <20260727150546.121357-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RIK5ZBEC5RZ3K7LSN7XBCX2BRO2PMFVJ
X-Message-ID-Hash: RIK5ZBEC5RZ3K7LSN7XBCX2BRO2PMFVJ
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RIK5ZBEC5RZ3K7LSN7XBCX2BRO2PMFVJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260727150546.121357-1-postadelmaga@gmail.com/>
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

