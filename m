Return-Path: <SRS0=1s4d=JN=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B442EC43462
	for <nouveau@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 711AA61166
	for <nouveau@archiver.kernel.org>; Fri, 16 Apr 2021 14:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 711AA61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B436EC0A;
	Fri, 16 Apr 2021 14:37:48 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DEC6EC07
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:44 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id bx20so31418104edb.12
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgIHEbwNozF8CQjai0jy8D0j5kT9wSfHdAr6OHIEyt8=;
 b=vIYbLsCnXZcnG2cRVSblNfFcyusCLsjiUbckjgZLHrJu6wDwi1lkqsJDWjwnKopAbu
 op3YKHikZtzbx4ebcA//omZ7wElXRbE3SIzbxL7lHvJfJz9VvqtD8XnemiSCAyA8Kwnp
 k5hBgFXoTYJ+0Bmaeztgy7ain6htlqbELXe8o/1/xm2P/RJeL+z+SPFh0r40bmb6emob
 VekFGRhmY26RK5HqiqPScD2iCiATVkSt/PR2mBWrYuYRmZom+0wbf9wfUICQXaonjPQc
 UsuTfOaixW7nlp/DpWhgEkkXSwA0gDFdxm1f31eD/B27hticKj+ixocIwwQ2cOScMtd1
 iqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgIHEbwNozF8CQjai0jy8D0j5kT9wSfHdAr6OHIEyt8=;
 b=rCW9nrRMTrkONWdpV6MBZWkF7rOy/UHlalSCkwijSFSm/1xIrU18ePhqTqRMWOYOOc
 kfXYuBrs//yIlvjoSs3sz0fIv5Vd0W+E4zjfCgrWXfrb3AKsYLhYoPKn+rfBwd3AHFu6
 zNt0pM3TXRSVriGut7YHqrvCedMPjABAUx1Wd9vxN/xUwZzxzjo1C4/5y7oYcxPLiL96
 9+6wWcU8osbSSr4IMvubiAJaqVrrUji2BHIV4DF5g6QX0XH8daNFk7hZHvTtG7Y4+LS3
 MrtTKPN9rUG+VOYQlOEHeOooVFax8WVK65qsdGIDEQPwECElf7pQ9SZ+2PQ7t7a6NCiU
 E6kA==
X-Gm-Message-State: AOAM5311Ri7LAucBkIgK+hwW3SCisAdJMQm7fx/SwiEvSo2Y3SMpviTA
 OHbYOaahbTGvTROD8OQMhTTECg==
X-Google-Smtp-Source: ABdhPJzhK89Pf/RdgigL+rbG9MyZVtIoXNauFJ4PHalgntAntPQIt9OfCxq6jsCVsJ1pk0yfnwv/Lg==
X-Received: by 2002:a05:6402:35cd:: with SMTP id
 z13mr10413409edc.21.1618583863370; 
 Fri, 16 Apr 2021 07:37:43 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:42 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 16 Apr 2021 15:36:57 +0100
Message-Id: <20210416143725.2769053-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 12/40] drm/nouveau/nv50_display: Remove
 superfluous prototype for local static functions
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcjoKCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9kaXNwLmM6MjUzMDoxOiBlcnJvcjogY29uZmxpY3RpbmcgdHlwZXMgZm9yIOKA
mG52NTBfZGlzcGxheV9maW5p4oCZCiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjcxOgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnY1MF9kaXNwbGF5Lmg6MzY6Njogbm90ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gb2Yg4oCYbnY1
MF9kaXNwbGF5X2ZpbmnigJkgd2FzIGhlcgogSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzo3MToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252NTBfZGlzcGxheS5oOjM1OjY6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKA
mG52NTBfZGlzcGxheV9pbml04oCZIHdhcyBoZXJlCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmM6MjU4MToxOiBlcnJvcjogc3RhdGljIGRlY2xhcmF0aW9uIG9mIOKAmG52
NTBfZGlzcGxheV9kZXN0cm954oCZIGZvbGxvd3Mgbm9uLXN0YXRpYyBkZWNsYXJhdGlvbgogSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
Yzo3MToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oOjM0OjY6IG5vdGU6
IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKAmG52NTBfZGlzcGxheV9kZXN0cm954oCZIHdhcyBo
ZXJlCgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaCB8IDMgLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBf
ZGlzcGxheS5oCmluZGV4IGZiZDNiMTU1ODNiYzguLjI0MjE0MDFkMTI2MzYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oCkBAIC0zMSw3ICszMSw0IEBACiAjaW5jbHVkZSAi
bm91dmVhdV9yZWcuaCIKIAogaW50ICBudjUwX2Rpc3BsYXlfY3JlYXRlKHN0cnVjdCBkcm1fZGV2
aWNlICopOwotdm9pZCBudjUwX2Rpc3BsYXlfZGVzdHJveShzdHJ1Y3QgZHJtX2RldmljZSAqKTsK
LWludCAgbnY1MF9kaXNwbGF5X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKik7Ci12b2lkIG52NTBf
ZGlzcGxheV9maW5pKHN0cnVjdCBkcm1fZGV2aWNlICopOwogI2VuZGlmIC8qIF9fTlY1MF9ESVNQ
TEFZX0hfXyAqLwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXUK
