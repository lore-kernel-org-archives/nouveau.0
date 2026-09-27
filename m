Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAE1CA5FCE
	for <nouveau@archiver.kernel.org>; Fri,  2 Oct 2026 03:02:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFB0010E4E4;
	Fri,  2 Oct 2026 03:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I7B/1L8E";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3DC5A488A1;
	Fri,  2 Oct 2026 02:44:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790909041;
 b=YK1skEpGAPHY5v2qtPpsj4A+A+vq+6RK8gjTi/Vtc7Ki7wVqM4ULTwQ55Amk16QcSmWE3
 vXb2wkguLZRcl0D043F56l0Wl67uKjpn3LbTJqvircq/7my15hnxorHUqgCJz865wZ3Y29C
 lLQdTcFtuzw2R1f468gb+/9Wl6DkhsAKUeR968cKUIxTVi+VE/V3ol89Q10iJsvVcolTAWD
 q06gGsVF7OqqSY+8aScaiuCsWJ/xyaFhl0yLjkZqakobX5sF38QTXHS/+Kwgf4TKy4XEh0P
 ua0vbyteV6REswr63jWLl4iS3E6q6wTGry7AAsL4Q+TPhINxcZfe651t1fPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790909041; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=m4ebhT5QYUpz7TFUlBXCRNqm87/Ue9x2YV0hzJwFSF8=;
 b=n9WPu8FviSRWo+a3WwvqGEuHgbSDthI7ph1p6gTxxSnwxWAszU26YvAsSuW33CI6I6fQs
 9Xd5WvCxkSre68yxbcd8zmKYj2420Neetd0bunNAE4KkRuSwY0beBAq3h6PzlOgy0ExEBCV
 HJWCSB1XPvdMouZov7FRVq9Vyqpu/TjIBlSiZjNtWRAsdPDZXAbjLtw6tuCFmogh/mgkEz7
 03ryEgb++jpIU1hm0P+WPpjm0D86E7T2qM2a+TnSRQzFIeF3olNdGm/mn7vrBl7FKxL9FjJ
 2iytcEm1yuwgNoBz976l3M4j6i1EJMpCsR1H+MBbczBqLO1lIzGymACr8n/A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E38FE46D48
	for <nouveau@lists.freedesktop.org>; Sun, 27 Sep 2026 14:11:11 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADB810E40A
	for <nouveau@lists.freedesktop.org>; Sun, 27 Sep 2026 14:29:11 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912d3920so16612015e9.1
        for <nouveau@lists.freedesktop.org>;
 Sun, 27 Sep 2026 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519350; x=1791124150;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m4ebhT5QYUpz7TFUlBXCRNqm87/Ue9x2YV0hzJwFSF8=;
        b=I7B/1L8EKmQF4EL8Xx4vfoOH6hgjCeCU3JADILlVqV9prhyAgOkZy8F4U3XigLeNNb
         K+vCOMwNUKX/N+4nnY9WZHT3pl+ypKPpcI82dWp5d7jihoxDMOE8ECKKQXhPogQ0xX9X
         SWEgfXQ1JhkxljY7Jo6tMlzw0Zs7SKq0wI8qsbSOK94fi1U2EjrA0SctJj+eIorpMr0r
         7JhvILMvjePtiryzRf6mGW8zK1hzTJBGuozgXljvbLbo8JvbNl0QpTyFnIXZG+x0z/1F
         c+Kd7Qaa8GQr38ZhIgZiDBl64UCOplA9d2P0pYd5SbllL2q1SffC2F87WPR5gRIAXYRP
         QSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519350; x=1791124150;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4ebhT5QYUpz7TFUlBXCRNqm87/Ue9x2YV0hzJwFSF8=;
        b=kWDn+g9EEtF8IMfHIx36827b4G4xivCrQm1G2IhvIBhwU6rAZtv7WIrFyyrtrhj3a8
         7gJlDGKWUzxKGR3BFRCb790UDvM3XLf3wTScpeaZu0ea56oUMCKFRWFNC9UER0vQvUie
         sWAfGOYsu+I4F0AaNJbolQwK3A0Sigm0DeSP+R21aA3r2QFk2Be6zn5mgKqNh1NRRnso
         OxeKnPTyJIUm5qC3XwhNLdcYSMYsQq1n3uJFnMdm8RAvOfbYg29Yj7AvTC6xj4Z2PcE9
         r6QmIWyjiy7X+B/c7DJeXIjSbtNyb3nqCK66mSp7O+gs5LnHjKegqwFB4vxvbZ1TY8SQ
         empg==
X-Forwarded-Encrypted: i=1;
 AKwUvBww/vYYk1892ZgAv3BUeI4jmwehkj4JNqDNt82+ZUkm8E9IbSPPkvnJZEax2CJRq7jrhTB9/d0n@lists.freedesktop.org
X-Gm-Message-State: AFuF++kwJevmGx0x6QWw+yBgBcczmlHLNmPIfZ58LbBMPW75ra7iFQF4
	ll1uuTPmqn/ypv27BqttcgtA0x6ko16+r7MaEzFyFTHUiqRN2YXRzOs=
X-Gm-Gg: AYBFou3L+enkLt/sdl5aDhUibcOV3N/6h2qIjwfRBPRGfauNAGF7S4ikqIVTeqnBNef
	g/BGLdwASxFq3h3y+n7seYT/QaV0RSwS8Im4YN9IHijjyls/zszWPA6IrPdootwWVUgqSJjVTlY
	StvCdgmHDORsykpT96XKHmHZzATaTXOb993q0vNwMdAwBzMG3a624TUgyaOhWChMqH+nGnPWxdx
	ngQj78sWRq0bSqeIaW6UVPjNR6/Qxn73tMMlXs2ajHCUirEB9xeJFIbkzUSkYlIT6nrRtCeRU/+
	KY2hxJKr1NSQiDQFQf2gYEN/PM6QdiEyHqfWHqU377FmpAt8j1T5nhbkR7dN3UHlIGM9zzVv7C4
	SLXoge6UTpMSG5Nok7IECPThSFKXGxHgCVyn5hrRWFIEXkWdsv6SgfMsABto2hqhKucyARa3v92
	0C73EWFBJOUOpfxtswfWMGwNtxZmA2azQ41cIKIGi/D1dC1/5ooEYVF2niTrXdjkz0fpWZP5Y2c
	/TQCot1D5IXzBTEQ5O25dBJmigd4GW9/E5uHp9p2dMiqCXeAGk=
X-Received: by 2002:a05:600c:6290:b0:49e:799a:8969 with SMTP id
 5b1f17b1804b1-49fe6707bb7mr206961305e9.30.1790519349715;
        Sun, 27 Sep 2026 07:29:09 -0700 (PDT)
Received: from localhost.localdomain ([31.223.26.114])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a34a76fsm21796928f8f.7.2026.09.27.07.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:29:09 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=
 <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 2/2] x86/mm/kmmio: Remove misleading ERR_PTR() cast
Date: Sun, 27 Sep 2026 17:25:41 +0300
Message-ID: <20260927142816.15099-3-habilerenturker@hotmail.com>
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
Message-ID-Hash: XVLNZAVIOQII3TUC2CCB5ULABKRIVWWY
X-Message-ID-Hash: XVLNZAVIOQII3TUC2CCB5ULABKRIVWWY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XVLNZAVIOQII3TUC2CCB5ULABKRIVWWY/>
Archived-At: 
 <https://lore.freedesktop.org/20260927142816.15099-3-habilerenturker@hotmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Same issue as the hw_breakpoint fix: arg->err holds the address of the
DR6 value, not an error pointer.

The ERR_PTR() cast is misleading and triggers a false positive from Smatch:

        arch/x86/mm/kmmio.c:596 kmmio_die_notifier() error:
        'dr6_p' dereferencing possible ERR_PTR()

While touching this line, also fix the "unsigned long*" spacing to
match kernel coding style.

No functional change.

Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 arch/x86/mm/kmmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index 6ac981cec..88fb7af35 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -591,7 +591,7 @@ static int
 kmmio_die_notifier(struct notifier_block *nb, unsigned long val, void *args)
 {
 	struct die_args *arg = args;
-	unsigned long* dr6_p = (unsigned long *)ERR_PTR(arg->err);
+	unsigned long *dr6_p = (unsigned long *)arg->err;
 
 	if (val == DIE_DEBUG && (*dr6_p & DR_STEP))
 		if (post_kmmio_handler(*dr6_p, arg->regs) == 1) {
-- 
2.47.3

