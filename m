Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C30C5B56A
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 15:02:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DF3D010EC69;
	Tue, 11 Aug 2026 15:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O0liesbJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7F8BE476A8;
	Tue, 11 Aug 2026 14:46:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786459581;
 b=rJqvU6JDq+WxBBeIt4A7LVx/LTtfaQIVZxMhBCEx8Bh9o5NWW6ws2xjkA31exiCjNLLx6
 rqU/nzff7Pn1ApqTEvFezQQWD/imEt0rIGU58hvWxttQFW0+qJGtTGmDDq2+RFwSe4LkX/x
 PD7GzJkqJTmSe3BDFqw5DZfRO39cpTemGQYPfjkpulgzQzhLyXpX2+kKYrUUm/MkFO+McZ7
 M4coupZmri+UAZj2avYrxnhCGgCjNRFfMgTj59SRHN7dn8C5qEQ6ZqDHuuksv7vukeQNS93
 X8vWakl9WUXEVQCaN9EVZpzRGZjMzudHiYLHYQCU6IaG0nN0SNWGBgnWxCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786459581; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mAgyZghrLzvIUtwLqemCCKGCV+TdS1W6/V0Fv+KXADI=;
 b=Z6oeURv/b+KjwOP9WzfsQd0509qj9ARXmrs9cJW6rR5sr6NKj45Xi6AWvYvd4BKxVljpT
 6xAkjG5ANr5NWkWu1HTv482YfvKl0uTjBCHMOm/raw//7wNdjMXOX8bc9bqpkxccQSESBdN
 JZzm85gn6b49Oqb+HtXByrjyGINBLhXMaNHnzTWy5WchNdOlXYHB3qFIqGx3gVGdAN8S2mO
 EORod/Iwk/Dxg/dbY0A7H+7/eUuA7l5tdXZGGM6sgjKYurh4SrB3k42V6XrCKb1mnlLtLZb
 ztADjcCE3Q7l8LW3gU9Kh9KTKcoikGEvRpr2o8u8yVgHmRMZFfXg7wyJf2hQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 54DDB4767A
	for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2026 21:26:38 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E939210E23A
	for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2026 21:42:51 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47f7027ca11so1517050f8f.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 10 Aug 2026 14:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786398170; x=1787002970;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAgyZghrLzvIUtwLqemCCKGCV+TdS1W6/V0Fv+KXADI=;
        b=O0liesbJQyZNwssugofNJAMlLjX6TNwWleNaP4cZPqHu35GvOZ10MJQUbc4/krhFQ7
         PTQ2SQtZqTiJUA+OVVw7zzH9yutKtd+03JcvC+Y/XGX6wWYbXSUNvgenacps9AEGcEA8
         xfBe9CDws5Rx+smEw4FBNoH3G6FMKe2fiUwsfRD9naqOXqf/tcq9MpCWUuAQxasy27tF
         IoYjPDN+gLg9SNmlyiqRpt89jStJVtexoHHYHBhu7SjzrTEXly2P6hXiH8Ua/lOp+r2r
         SGU6kxhSzSiq/9Pde55GumjprYWb7feG++Aubw1msCn1LvWw1rGCV9G1e1iErM2XCIII
         0L6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786398170; x=1787002970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAgyZghrLzvIUtwLqemCCKGCV+TdS1W6/V0Fv+KXADI=;
        b=b5bJQ7hEuonv72wc40iMT2kBDtpK1o6acjJQ9iEBbYYC5sDcueU1MCeTvo9w8V8t9m
         BaqbGqoVbFqazrSgw29k+4sd8AGoOV89L9VrvEtmx/fR5+A7AUWbgjCijpAOhnhOhQ6a
         ZuBjkBDeKCUQ++uhxtPWsgitLYK5gyieQT76QMM1PBU7VW0+ACoJ+phLToK9zs6Zo7tm
         /yN6Tu0erueThavxiNCGiOW9omX0Ez1oaiusc+8DZOkCjNcHWPImviEgKniBZrr4qdIu
         ryKlnld8+48QW9kpCPvRLt3DURL9F6sT/Swyc6WCtattXtbPp1DJ4crBdHJpeI0X5zbf
         xRgw==
X-Forwarded-Encrypted: i=1;
 AHgh+Roec4FNPMpLwIeNZ8N2lclniSHmPrRk2MzXZi04j8XEg1guOIhENmxsInfdcjMVNM2p+U8N3DN9@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+pzuxvzz0+SGIQanwWhWDU7TqvcBRgPLb+VdQZyykm7xwu6/y
	aAQb4Tnktx363k7QzBD3Je/sxL471kAFvLyo7t9enBcyozzwxVsW3pz8
X-Gm-Gg: AR+sD10RZZ/4B1uJPMEyt0pvA//9baCeKhhkMtOCbda/fnSXEr7qLkiGSIL7MtmfnQ3
	HG8p5lp7BLge5d8cW0rYLfr/yNUfnn3Yg41WdMplaEhIyJArPkXVEwsv+Tfwm1M2Xv7jU1scbZU
	YZOAQg1smBFQuVuTgbkUKNOTM/5mlbXANQ9zFHMn68wTL2+yD1MkDFzdZdftTFHFMmUcr9cfCYz
	KHyQ3QH7ZPmXoMVrrBC9de5bl1bMDKUlIB2t2JUhymSrNGmoCTXo0MTvVpTNlaRWOQX5uJN0zZv
	XmKTaM9JCDlEljdUrP7u7jg8QQH1CLFfAlPdH2O1cOCC1RTk1QaAd9ujnmHDtCNcE39JdZbTrP7
	nNGB9w6nq7Zc5nA8H1eFo9LNzFf2r2QEK2wvFCX0dCtBkQc4szQ07wEstPjO7W3COTXBI59qw62
	YRQW+qW4hCi3lkUXrLz4GdbYlR2wAESHngRLEUTEdZR8pc++zxl4ss2YLq86LUwi/JbUJ572hfG
	1e6wZdweyIKwXCAT8XuV1h5a9CrwTnqxBrKt0G4PS0iXxQlrSD5wKPb
X-Received: by 2002:a5d:5d86:0:b0:47f:8fc8:a8b1 with SMTP id
 ffacd0b85a97d-480026c89d2mr30573171f8f.14.1786398170143;
        Mon, 10 Aug 2026 14:42:50 -0700 (PDT)
Received: from localhost
 (lewi-30-b2-v4wan-171487-cust1241.vm4.cable.virginm.net. [80.192.28.218])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021e902dsm39534359f8f.21.2026.08.10.14.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:42:49 -0700 (PDT)
From: Muhammed Sariyildiz <asiyee994@gmail.com>
To: lyude@redhat.com,
	dakr@kernel.org
Subject: [PATCH] drm/nouveau/clk/gk20a: fix undefined behaviour in signed left
 shift
Date: Mon, 10 Aug 2026 22:42:47 +0100
Message-ID: <20260810214247.21416-1-asiyee994@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: asiyee994@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: UQPFERUQ6FFLZPELKTT4REVWLTLIWHR4
X-Message-ID-Hash: UQPFERUQ6FFLZPELKTT4REVWLTLIWHR4
X-Mailman-Approved-At: Tue, 11 Aug 2026 14:46:19 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Muhammed Sariyildiz <asiyee994@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UQPFERUQ6FFLZPELKTT4REVWLTLIWHR4/>
Archived-At: 
 <https://lore.freedesktop.org/20260810214247.21416-1-asiyee994@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

MASK(w) expands as ((1 << (w)) - 1), and GPC2CLK_OUT_SDIV14_INDIV4_MODE
is defined as plain 1. Both are used, via GPC2CLK_OUT_INIT_MASK and
GPC2CLK_OUT_INIT_VAL in gk20a_clk_prog() (and reused by gm20b, which
includes gk20a.h), to compute:

	1 << 31

Left-shifting a signed int into its sign bit is undefined behaviour
per the C standard (ISO C11 6.5.7p4), and is flagged by UBSan and
static analysis tools such as cppcheck (shiftTooManyBitsSigned). Make
the shifted operand unsigned to fix it, matching the pattern used
elsewhere in the kernel for register bitfield masks.

No functional change intended.

Found via static analysis (cppcheck --enable=portability) while
auditing nvkm/subdev/clk for correctness issues.

Signed-off-by: Muhammed Sariyildiz <asiyee994@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
index ea5b0ba..7a93f9f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h
@@ -27,7 +27,7 @@
 #define KHZ (1000)
 #define MHZ (KHZ * 1000)
 
-#define MASK(w)	((1 << (w)) - 1)
+#define MASK(w)	((1U << (w)) - 1)
 
 #define GK20A_CLK_GPC_MDIV 1000
 
@@ -79,7 +79,7 @@
 #define GPC2CLK_OUT			(SYS_GPCPLL_CFG_BASE + 0x250)
 #define GPC2CLK_OUT_SDIV14_INDIV4_WIDTH	1
 #define GPC2CLK_OUT_SDIV14_INDIV4_SHIFT	31
-#define GPC2CLK_OUT_SDIV14_INDIV4_MODE	1
+#define GPC2CLK_OUT_SDIV14_INDIV4_MODE	1U
 #define GPC2CLK_OUT_VCODIV_WIDTH	6
 #define GPC2CLK_OUT_VCODIV_SHIFT	8
 #define GPC2CLK_OUT_VCODIV1		0
-- 
2.43.0

