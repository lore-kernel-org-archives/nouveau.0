Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7758CA5FD4
	for <nouveau@archiver.kernel.org>; Fri,  2 Oct 2026 03:02:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5DE10E48A;
	Fri,  2 Oct 2026 03:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S7g+QUXU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F1581488A2;
	Fri,  2 Oct 2026 02:44:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790909040;
 b=WQ6x99uaPyZYQeMohq6J5L24k/ABnwg3X1kqVD66q5eFwFhVIK4s1UArAPevw3HPmFvYT
 u4AEtLo00yLJfJaR3rdxaIleeS31i+09jsXdGmhSkHSSESGvAv9XUYmDPxY3elXCtyZs1eh
 4CBV1SNhS490exLY7VzNrgwKLwcMFEVH4tiwrLdIN4rShR8zXG2ann0B49h3ITvvNHCJ9gA
 gzswno2bdxtNhreZCiL752cO1/M836onb1dfG32ZXBEI3b3ooizyJpVWU3UlAEyOFdnVyy2
 KkrnvyRDcuMJuSApjed4vnL9NuWiLkiUnILi3wvzTzJifhYweldnRLA3mQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790909040; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jY7qINqE168WGofiIfS8GtydGEuYw1LesO3Yod7eqJ8=;
 b=EI+cdMgQ1tFXYbQqlq8oR7aeXWgW+ijpB+8a388/y2Tm8XnQk7VV58grIc9/h/X8O2DJC
 1gAc7Gqd0wcFauQgSpWYFVmMPt0Ac/M+yD/G5tZzNm1q2S9W+hWNecplTSy6zswb1c7mPGK
 GhRx0n7dKvHatZKfSuxBWn7T1YAnOnPOW7XiMVxb/KVAHgyjzGdHssA4RNlykRnLmfYa9l5
 1fDGqYVftJOu3r4/oE3sA1hl8QQLi5l0KHiyWapksUv4QLt0LQ95a8Hn1Tjq0414bSAL/Ve
 64A4+NObRUzeUX1bDiEu8ejk94MoZtL+Mw5zrpwIxKCGR+t8LkfoeRPFgeIA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4933646D48
	for <nouveau@lists.freedesktop.org>; Sun, 27 Sep 2026 14:11:03 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B603310E40A
	for <nouveau@lists.freedesktop.org>; Sun, 27 Sep 2026 14:29:02 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e721b5503so21492875e9.0
        for <nouveau@lists.freedesktop.org>;
 Sun, 27 Sep 2026 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519341; x=1791124141;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jY7qINqE168WGofiIfS8GtydGEuYw1LesO3Yod7eqJ8=;
        b=S7g+QUXUP8gxgqqte8eS/lTpjiN3cK9D3OyshcNaDzNzImoE3Q9+gdrpqeN5SMSDs5
         Ed0KYOvQxUbwSS5FjmVjpRLU3E0gxjvGg77ReT1egc95ncRGiK49t+EouWKI2DOshFkg
         zA6/h1ScwQqwwI69mXymsFN9IHBmimPASq5Ps287cjUET1ydqoUjRDJyFQfbDl3pxm21
         LcJQl8Hh772D7gIcD0h+oNHG8HQq2nerdr3x4AkZyIeQRu6JLv7U265lmhL4A9PbHhAy
         2HpWvzEHv+h6nE5ly45a13pfuviZyYzGCzNcdvqjySgL377wJ46YMIGq4Ofl95btKwpc
         T5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519341; x=1791124141;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jY7qINqE168WGofiIfS8GtydGEuYw1LesO3Yod7eqJ8=;
        b=vhiRgVwanrHZhGmNmOu5fEZ7j2wo0iqQSBXXZ3567l1i93lVtmrfrGqP02WImqIn5T
         ywp+j8fVz7pNvdc7+Xf3LLUkkE7JMfaZ08udCfMAICD5jVIAnsLxGnyGuMUKVZO3tH2E
         LuOu/OrD3sKY2rXAW72qSQnlMN1SlNz6eVJ9gPZUuVxDbRClBSqnhlP8rndVe+7DcD2P
         iQ4oJypbUKOJhU+9P0+Gp3q9UNChov3hg6tyncRICsAmnpXbEWwKJcmEJFk++al+xQ4X
         bUf5Hngeo/XyGZtW15mPWw9Fw+ypcb+dDtvoqeZKwhH8rJocUTACclXB/Sr1eUC7l4q1
         YQYw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4LqLymmRWWVqOP1Fknr/L+DfdLSkqKa+XMS34t1M4bsp4xeZByoXxVByzNam3Sr+Q9pmYbZoV@lists.freedesktop.org
X-Gm-Message-State: AFuF++ngI6N3KsK1o99QHWYRUXL/3yfEKA+W4l7pWCFvrT9k20QKY5VK
	uewXJZcW+gGZZhVgMgqgVPWzbZxN5jdeI4aR+xG3IhQk/Kh1MMF8dhA=
X-Gm-Gg: AYBFou2jivkQKpQNZ7MIMVkR6sNAZAfi905SKmeCtUI8oEXj25GFL3tUR8HtCO30hMn
	w7xRv7UKICgKKmKdKkdms8LP9UWIdI6oCSrz5hb3piGFyn2HcUEXYM3LnTXYa0YR0Vd2XWoc4Em
	ttkjmtjHaOIA4bOcJ5ga3Cen0Hw+BE7VQ9bWnE9jd/euLQ/T3baP8nzy0RfTXVO8P7YsIf/QZyx
	6wmEJdt+YCoGrZmsjTXhA+8Iq6vGfWrD4ia968Vl4UaMKHcobcE1XyC03bnnLp17HI0dBwZCFbz
	db5aeJjAcG75seWzrl6aef8mqDPyFY8Hdt38xxEXjt90AMmI4IVtsKt7ZFyk/vx5Kr59/XmZDzx
	Lnf4wO+t+MaKgu/KfRuZu6fcTFWpC7PEfar/jxJyZsbU/ms2MUuXXORrX6dPZIGUL3Qdyq5RzNv
	10VuMzyixW8QCkoUMHSoIv0V0XlUkEgUM+vv1iEghJn6hlQHZfjgc9oUCz+6/jODmhOS6llSnA1
	yVkGMRNLGglMrWPm0Ux9gz+/TGZLpVhuajdVV2WQn05mvRfGJE=
X-Received: by 2002:a05:600c:870e:b0:49f:c1a1:5222 with SMTP id
 5b1f17b1804b1-49fe670b208mr200681385e9.33.1790519340970;
        Sun, 27 Sep 2026 07:29:00 -0700 (PDT)
Received: from localhost.localdomain ([31.223.26.114])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a34a76fsm21796928f8f.7.2026.09.27.07.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:29:00 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=
 <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 1/2] x86/hw_breakpoint: Remove misleading ERR_PTR() cast
Date: Sun, 27 Sep 2026 17:25:40 +0300
Message-ID: <20260927142816.15099-2-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927142816.15099-1-habilerenturker@hotmail.com>
References: <20260927142816.15099-1-habilerenturker@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: habilerenturker@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: DC75XGCUW5PJJH6GHFAKBD7W73TELURH
X-Message-ID-Hash: DC75XGCUW5PJJH6GHFAKBD7W73TELURH
X-Mailman-Approved-At: Fri, 02 Oct 2026 02:43:58 +0000
CC: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org,
 =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DC75XGCUW5PJJH6GHFAKBD7W73TELURH/>
Archived-At: 
 <https://lore.freedesktop.org/20260927142816.15099-2-habilerenturker@hotmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

args->err holds the address of the DR6 value, not an error pointer.

Using ERR_PTR here is misleading and produces a false-positive from Smatch:

        arch/x86/kernel/hw_breakpoint.c:521 hw_breakpoint_handler()
        error: 'dr6_p' dereferencing possible ERR_PTR()

ERR_PTR is defined as a plain (void *) cast. So the compiler generates
identical code with or without it.

No functional change.

Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 arch/x86/kernel/hw_breakpoint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/hw_breakpoint.c b/arch/x86/kernel/hw_breakpoint.c
index f846c15f2..f142d868e 100644
--- a/arch/x86/kernel/hw_breakpoint.c
+++ b/arch/x86/kernel/hw_breakpoint.c
@@ -517,7 +517,7 @@ static int hw_breakpoint_handler(struct die_args *args)
 	bool bpx;
 
 	/* The DR6 value is pointed by args->err */
-	dr6_p = (unsigned long *)ERR_PTR(args->err);
+	dr6_p = (unsigned long *)args->err;
 	dr6 = *dr6_p;
 
 	/* Do an early return if no trap bits are set in DR6 */
-- 
2.47.3

