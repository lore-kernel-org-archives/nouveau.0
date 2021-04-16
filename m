Return-Path: <SRS0=1s4d=JN=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6DBC43461
	for <nouveau@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B64B6113D
	for <nouveau@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B64B6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC336EC0C;
	Fri, 16 Apr 2021 14:37:47 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB076EC04
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:44 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id bx20so31418029edb.12
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9yFPCpC+KcvysSHE/TzUxgB6C7mqpr36eNkZECpHJ1c=;
 b=q24GGnGRAdzpbYYl+M7v9f6M5HcbMMdNCA8arW0qs7LIDVQVe0UheCz0W99E9kxnj8
 N9FH43w69SituNqVOudZiavc32EsX36KzfUsKqwa1nLTqpCTmE83YCzAJcJZblI57yeZ
 +2yJUhe+ShtafcRhG+RrBXeAsrhgdbxSN2AwmxE46GXV+mlylZpzRs65X5SFvZGldR3r
 WAe1mbQraJTDhXL8wK09ukr8acgzxwhxqfItaqvC5EVi9cCEun6BK7WXQp5C6SONaOV1
 Feqo9YoxTXppD1tCy/5zJNjgEbL4YKuHwL4rK3TSkhLjruiaMb3YL112oC3OWWYdQ9vZ
 F5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9yFPCpC+KcvysSHE/TzUxgB6C7mqpr36eNkZECpHJ1c=;
 b=Drp0ZV1Ng6OvZQ3Rb5lk8ZLqn+rjI+s30eaMck8kKd2CX2EUkKZGIvOT7N5h48ZzMe
 GeLDrf0acnfXcQgnGaUeuoimYIU6XFW2voiLc6rmsziQpYEY0lwG5yuNUy/BGt9B2t3p
 YgNb4oYjUYowe+SthADB6vTS0MyJKpaooXasisAYwlzlyte2xILKNfv+Mu14heYodZvQ
 OaQ5cnRVQvoyorpeH3FEmUadPrD/gEsDySarF0fjt8wVCwioZoXjvtRbjN1rPnAgHxQI
 LDn06LCeXUV8gKSqWlAmsL6K4oGRdSJ/Y/QbX+9tVnVO8b2tiljifQ8ximlAyr+32Gq3
 uTwQ==
X-Gm-Message-State: AOAM533ZKfPHiyVQpHAbxhhoMPC5fD5/dbxGSTGlP4xZrZDEGCTos4jY
 olrIeNoldi0KtUBE8UO5XJ1c+w==
X-Google-Smtp-Source: ABdhPJypegeIw/OfmdjDiD5Yv8LbnLlddqWoHhsQUliKWi5Cl4dqXq69rC2fzWbChz449ozg46lBfA==
X-Received: by 2002:a05:6402:3550:: with SMTP id
 f16mr10260110edd.134.1618583862459; 
 Fri, 16 Apr 2021 07:37:42 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:41 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 16 Apr 2021 15:36:56 +0100
Message-Id: <20210416143725.2769053-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 11/40] drm/nouveau/dispnv50/headc57d: Make local
 function 'headc57d_olut' static
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYzoxNzM6MTogd2FybmluZzogbm8g
cHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhoZWFkYzU3ZF9vbHV04oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KCkNjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2hlYWRjNTdkLmMKaW5kZXggZmQ1MTUyN2I1NmI4My4uYmRjZmQyNDBkNjFjOCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jCkBAIC0xNjks
NyArMTY5LDcgQEAgaGVhZGM1N2Rfb2x1dF9sb2FkKHN0cnVjdCBkcm1fY29sb3JfbHV0ICppbiwg
aW50IHNpemUsIHZvaWQgX19pb21lbSAqbWVtKQogCXdyaXRldyhyZWFkdyhtZW0gLSA0KSwgbWVt
ICsgNCk7CiB9CiAKLWJvb2wKK3N0YXRpYyBib29sCiBoZWFkYzU3ZF9vbHV0KHN0cnVjdCBudjUw
X2hlYWQgKmhlYWQsIHN0cnVjdCBudjUwX2hlYWRfYXRvbSAqYXN5aCwgaW50IHNpemUpCiB7CiAJ
aWYgKHNpemUgIT0gMCAmJiBzaXplICE9IDI1NiAmJiBzaXplICE9IDEwMjQpCi0tIAoyLjI3LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
