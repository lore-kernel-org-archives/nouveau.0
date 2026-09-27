Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0004CA5FD4
	for <nouveau@archiver.kernel.org>; Fri,  2 Oct 2026 03:01:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 37DE510E3B3;
	Fri,  2 Oct 2026 03:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="obnlqWPT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A7E0F4889B;
	Fri,  2 Oct 2026 02:43:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790909018;
 b=diLwFd7pgooviKSDKFQJQ8q/VBf/Q9Hd4BtYiwmrUh7uU7FydbqTM2Aj6xRo4Qhl3dagb
 hEpV6iVgyR3sPmkNAjKTBug1JDnag3nOApHAepEOVXmATgky5hYZC9iWmCzB2QqELmvVjog
 W+hTb5bcKoK8MFauj8nXiDIHsQ6/RzCcBLJKcypM6SU4eyCUElOMFkRSlzbCe1hqi9DGBlt
 riSFt9fOY4T8h1MppPkI2I3eEQYFqFiDQRnUvA3DF8zpJ/mDptItqDvPQyN1rS8vWB/cn+0
 HWHIECzNeSZo3P9WCY2H7Dv1/rk5V9QKq5zCOS2i3sGtExBTx4fqkEAw4gkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790909018; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=i2/yZb7IeEEdrOmMuM/wlsM68A9x3sDEUKZr2wAwesY=;
 b=x5OObhe9t+o2c46z+xXWWCSyROYd0bjY+KDQzGwSBvL3boDjSVFmZ/WsX4kyhWFNtdk2K
 c4k977Z/1Unqvf+mdRyv/xPbBWZtl+opcjKi72LVHt41a5mg26rG1PZCk0An78q3FpAGWev
 9w2BUMlcA4SGosCLf6ChPCBELH30HT7bJB0XGNpn1eZ3FvYShWR84SSrwM0X/JTgyl3RUIp
 rpxXZXQDmeQRsuQL6Fek1v4/bo5LsNsEUqiZunIa1Sfm6wDZaIn95MpJxg4PI1I94qHKfuD
 vA98u4iazauWAlt83U6+wSR1Lm783uePKucaEO4GzkvnsvT2SWHCCyFqEc2g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 88CEB46D48
	for <nouveau@lists.freedesktop.org>; Sun, 27 Sep 2026 14:10:52 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EE9CB10E40A
	for <nouveau@lists.freedesktop.org>; Sun, 27 Sep 2026 14:28:51 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso16137865e9.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 27 Sep 2026 07:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519330; x=1791124130;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2/yZb7IeEEdrOmMuM/wlsM68A9x3sDEUKZr2wAwesY=;
        b=obnlqWPTyqxekdfjTay/nJi7f7QTRHhx73rQASnHV3o26bTSQlUiAvCJP/a9Oh87O2
         M1DUAQS/hEoC+cFT3xQ/ap5ETBvOfXzERjpKJ7SVRYViq8n5kpZYO2eZWgZa2YXCpjes
         3AFyUxHdB5tvsKNulJ3hGFixLfjNEMH7YZIbO6Xlngo5Op/719G0Yz2O7Caq40GeHjW5
         fIWmlMNjZxQ48QuKOCfBuOni11Xg3s9Ksqb62KdHCR9qfrFEz8anO5X+Z6dVLTskSywM
         gNDuOi3GuOupOp6Nok5U3my54n0o3X7cX46deWlG/DJewkLySbolBUVSa/nVlyrqdbmV
         E0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519330; x=1791124130;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i2/yZb7IeEEdrOmMuM/wlsM68A9x3sDEUKZr2wAwesY=;
        b=yuN/5ZaojpVeflmk0as1Wg4+75HCK8SIjHe1FSPPqueL1b1S+tKKfYMhVfdd64DLWX
         77emvOQza6KkmNG6tRCJHvekjwNKFk0xqi8b15b7BPBIptUTz9eUHqL6wbUfrjWXdK7w
         xP2mqQGOAX5j87+JNvXyyasquaE3xZmNjnAUsTbyKL0y04mT4hmvaQbgeYe02LugJutS
         gd80pQgh0gr2u3Uk2MSEJEEG3kfayLALe7CSmUxUBfcgfaVP2BZLKAhgn/FXShnlxFw8
         YxET+9cpuiCyTl++uv/N0Hf2s3OZZ6Fw5//vjlBDi7if9BgdVBNG/AqTEpLun8n7l8w3
         5Ong==
X-Forwarded-Encrypted: i=1;
 AKwUvBxAQXnYKW+bMZu6geRRMiQufQPSI2SFLjLFWXJ0iffWSfZy8dr+qGPJcScay6ODWncqnYDIEZcb@lists.freedesktop.org
X-Gm-Message-State: AFuF++mgaNUlq5LGctorpvXHvtf0X1YtgVOv+GHYD5sK/h+C90ETgs+o
	ClmsVWvqqdfSLeRhwpJv5kK67MU0TFsXgE1SEqMTeY7YZ2WrLo+NOJA=
X-Gm-Gg: AYBFou1eBgqJAfH2RU6GVM1ZXL8MkO6UtFOoK5z7yAfk/PiFssvrQKg/KJczqsUx4IR
	M+hJZ9dM34y/JFcF0ycB/wZTg2EBlpdLATgHR6eCnVkeKzscBKm5dSdM5N9hzTCrHzqtKfh15L2
	LHhWM3VZZtvIVJtL1rICe3fvvr6QCwOvBlrik8vKgP88RnpOR74xusIceHJrDVqxf+3hjiF3LI6
	lus/Z3TANW/EjKr17nNspOWw1HKvP2h75u3caCX+8hOFMmpodxO6S81oH7gk3WBUo3JnWQBWdpg
	qIaceMafI4VQuiNhxJi5wcXniR4zKnI8eqVdOdD/9d07Jx2BQOX3KujnxRy8T8vv5Tlwd3L0F3a
	Hi6JbWEODY0brZDg7fRmW4sxCwBjr84fLqoDoBMchUweJ6tmzelDY80za1h3YdT1eEdlGok/sBH
	gc3kXN64FvKulCPq5rnOeMvfn/fr5bjhRjU77dsUUILm9Bok4QbGApCMv6ZX70duaVWjL4psnKr
	/JvoZiJAY+3IPHv97yT203iVMgCSHqo3ZLx0lLQvgqldwCO1Ss=
X-Received: by 2002:a05:600d:8643:10b0:49f:bb8a:b4ce with SMTP id
 5b1f17b1804b1-49fe67bc26fmr136581125e9.28.1790519330022;
        Sun, 27 Sep 2026 07:28:50 -0700 (PDT)
Received: from localhost.localdomain ([31.223.26.114])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a34a76fsm21796928f8f.7.2026.09.27.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:28:49 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=
 <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 0/2] x86: Remove misleading ERR_PTR() casts
Date: Sun, 27 Sep 2026 17:25:39 +0300
Message-ID: <20260927142816.15099-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: habilerenturker@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: BIIT5B5KETRYBBGDM53S5XVJ5PRA5KL7
X-Message-ID-Hash: BIIT5B5KETRYBBGDM53S5XVJ5PRA5KL7
X-Mailman-Approved-At: Fri, 02 Oct 2026 02:43:37 +0000
CC: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org,
 =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BIIT5B5KETRYBBGDM53S5XVJ5PRA5KL7/>
Archived-At: 
 <https://lore.freedesktop.org/20260927142816.15099-1-habilerenturker@hotmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Two places use `ERR_PTR()` as a plain cast to convert a long containing
an address into a pointer. This is misleading because ERR_PTR() is
reserved for error pointers, and it produces false positives from
Smatch:

        arch/x86/kernel/hw_breakpoint.c:521 hw_breakpoint_handler() 
        error: 'dr6_p' dereferencing possible ERR_PTR()

        arch/x86/mm/kmmio.c:596 kmmio_die_notifier() 
        error: 'dr6_p' dereferencing possible ERR_PTR()

Both are pure readability fixes with no functional change.

Habil Eren Türker (2):
  x86/hw_breakpoint: Remove misleading ERR_PTR() cast
  x86/mm/kmmio: Remove misleading ERR_PTR() cast

 arch/x86/kernel/hw_breakpoint.c | 2 +-
 arch/x86/mm/kmmio.c             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.47.3

