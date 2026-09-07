Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299AFC88E50
	for <nouveau@archiver.kernel.org>; Sat, 12 Sep 2026 03:00:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E758710E5BD;
	Sat, 12 Sep 2026 03:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VsT/bstL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9B39F46FCE;
	Sat, 12 Sep 2026 02:43:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789181009;
 b=QHyf7b0hDZdPnXXwCzTm1cR6F8bbh8MGdW47VG8JWrjP8hq+fmZDa53C0Zqv1iClcJ/ma
 LK1Qf8AbQAyIMlo9x96Q/GawnGUuiz72VeIG5mKhzN5ZI8goWTKCKOT0LyZm6avBL/8LTCR
 JddRPpdDE/CcQBPYyyA75a8JAeQ9KJRaLBQtuhblI70IDK6wIAhBtErc73aHBD/m2TEKje6
 YVyGkoAJxlbM6kPZvUGw62dFLTz4nFrxP4oJYO0PaIpSvaG18NvATqM1flRmpVDtyhkh4Ar
 8WD7hSuydWFHSZMaoobDnWQZGbaR8seFenzze8d1txA6QPssaTJCzsrH6QUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789181009; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PtaQqVSlZuFX18DeVPVqwMKwClza0Yn6Bnu05r8m2bg=;
 b=JIyJb7kJYz/kozaWB4rwTFB34OEsbV43vKpu9h7UGAZOfin4IPro1H1EwGpXw62lRUaVu
 AZmsSrEHWZmRZumfLQc44A3koTbLCU2q111MryhsNrUTNozt2yjLe67Pm+6TRiIslTb/CnJ
 XUfLuB+shUpMbzTT63BxzZGCzNnlx54RK3jyr3aCadixZYWSneGU6leqWAdWOyFMDr+NC61
 Sf6pLTdAU00jL3HVgZrIkKtKIhtwWf9QadDVI6cTFxVz4jXt5fNN6CvfDK/UCqGPP5IEfba
 gxTZSVTzPeKvTnItRGDFBk16C9/h0sp2IOFwGTJj/ZmYaFtdNAGBwTyu4b7w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0CFFF40102
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:05 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8F66F10E242
	for <nouveau@lists.freedesktop.org>; Mon,  7 Sep 2026 16:39:38 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c2544ff970dso507364266b.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 07 Sep 2026 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799177; x=1789403977;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtaQqVSlZuFX18DeVPVqwMKwClza0Yn6Bnu05r8m2bg=;
        b=VsT/bstLdHkscHF3vSunSxv5RpBvHd40JgEP+nyT4ChoGBGrz7zSamQej2KDfMsiYx
         Y7dreio7HTeN2mA5WeYSuQvr+qVMIJEy9pdUqs9e3Zc7zrc4v+63/OfiXBJNpMo9SelD
         qDdTz0K9r79EXpEiYNF242ueEBnm82gc0wztpXJFjyuHCitfmx44hg/nEue5hcon6wEt
         +JtBHYkSWrP0r8cgmD1LFBhD9xogXUymog1+JpYG+Cf6bsTttlsUCfCaRy3doikcfa6h
         MXrkMcmfyxSHZtPQqT5KgdNkml5VSr22c90oKGUT3HeyqqWw278HoakssqsEJOg+7JWH
         iuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799177; x=1789403977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PtaQqVSlZuFX18DeVPVqwMKwClza0Yn6Bnu05r8m2bg=;
        b=lamKhh9mYsCU1euY+4hZ/lM44W2XGTcPiErKuDzGTt0w/1TZByxRcQQKBNbPr26EFE
         1uf6zK8ModXZ2SayKLf2RzL01vnHh6VejGyc3677qqK2e//cBeIi7dobWiBLTEGpwQf+
         ZiDcCT4LisswuBXxvQyisHTUkaPfYTsn9B0Sx02XSVFZhXwilfMheBRHhKgiB3QarSwD
         77P8ts9RdUr7GHKtvLlp3bw/69g5SZD44u1q6Qrq/IWaaD9vF2MFVpwZMA+eiADpMZS9
         4hsO6jstyR1UFospbpguUJZQ/rOoL+FK7gFrS4fRSlrqZJudOxc7iIwLK53rb4+Oke8L
         naeQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtxyz2YhVyuhA6bFwJEgOQGRSjseG8Mo+ZqiN2BnLYPqB6kj4Lgu6A2fzliCepOIZjMkO+wE65@lists.freedesktop.org
X-Gm-Message-State: AFuF++motCUxiGKYE3KEDHrk1+lEXiVBYE0Q6gSrnfEm/p1WuAXtVCvS
	ZXhkKr8+iGNgADyjOK3aH7aEe33qmvXjG9gWibNMuJb3tSr3Mbn9ELYW
X-Gm-Gg: AYBFou3I274x3WZQuRlge45dGo6MGB2zqfx3WFRX+cX9iBjZ8uCGQKSad7cq+1tfERD
	WvJdWhP51OZoy6ItbRTHUnYSB6crKasZA3bq9VZ5Oyt+7OfoRH1sSAL+gB2pUK7qCdlGwfJXknU
	egMgaBQk04aYa1TDWS34Vn0woGoqDh8Z0oMP65IBQkXCwUFJxuZ40W3+wZdoISC3stjBIWaGKTR
	1E4FCMTaY00/X1/5r0b++ze3t9z93dhaqkMlEthIGlT80RbYl8sdC1uyTCQIPIXC6A4gm+gGFKo
	FnFIVLmOoSmqJgsMot+FeEi3G1NTNvTQoroE4nGBTax/go1ER/Pj9AiHWeoA7UKpVjo0d4Hd6e8
	D9fgzDYzl9X9TfDmQc7d8bLrHx0/d81Jjs2d8yiopQeYIFdzfZgcpx0OxJkQ450/ds5KwYLefVo
	eDcjPeKgmEDgQkIvaJk+632cy9fk2VRlWwQEtOvffwgs4GsMg0NTPO4PvlE/dSktYCUxnvYijM8
	tu/ukIvdA==
X-Received: by 2002:a17:907:6ea3:b0:c26:1649:47b6 with SMTP id
 a640c23a62f3a-c261649567dmr733976366b.44.1788799176674;
        Mon, 07 Sep 2026 09:39:36 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d4a8b89sm483434766b.10.2026.09.07.09.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:39:36 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: alexevgmart@gmail.com,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 5.15/6.1/6.6 0/2] tracing/mmiotrace: Add NULL check for
 mmio_trace_array in logging functions
Date: Mon,  7 Sep 2026 19:39:17 +0300
Message-ID: <20260907163919.183961-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902122613.442176-1-alexevgmart@gmail.com>
References: <20260902122613.442176-1-alexevgmart@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexevgmart@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: P7MNWFU6BSDP3KO7DFWJUVTI6N4Q4ASJ
X-Message-ID-Hash: P7MNWFU6BSDP3KO7DFWJUVTI6N4Q4ASJ
X-Mailman-Approved-At: Sat, 12 Sep 2026 02:43:27 +0000
CC: karolherbst@gmail.com, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, mhiramat@kernel.org, mingo@kernel.org,
 nouveau@lists.freedesktop.org, ppaalanen@gmail.com, rostedt@goodmis.org,
 tglx@linutronix.de, Ingo Molnar <mingo@elte.hu>,
 linux-trace-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P7MNWFU6BSDP3KO7DFWJUVTI6N4Q4ASJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260907163919.183961-1-alexevgmart@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Backport fix for CVE-2026-80689.

Masami Hiramatsu (Google) (1):
  tracing/mmiotrace: Add NULL check for mmio_trace_array in logging
    functions

Steven Rostedt (1):
  tracing/mmiotrace: Remove reference to unused per CPU data pointer

 kernel/trace/trace_mmiotrace.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

-- 
2.43.0

