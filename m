Return-Path: <SRS0=6/tN=IR=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BC8C43381
	for <nouveau@archiver.kernel.org>; Fri, 19 Mar 2021 14:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 428E564F4D
	for <nouveau@archiver.kernel.org>; Fri, 19 Mar 2021 14:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 428E564F4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2560F6EA3D;
	Fri, 19 Mar 2021 14:36:56 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35F66E99F
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:48 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id k10so8283711ejg.0
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQfVByDMubjxteIKJEZ6P0NR+Mqv9ZNp4le53NfYrp8=;
 b=J7cBZga0HMi5iG0MBUZwq+qeZQWVYjaTEHrLyI9EUXYAQUPVTL0uLJnF3hBzdX6FIZ
 zVDwtYg3IT40ZqvObqkEA8SNak/MrlukLTeG32vP1M96twbR8MtsqufK1UIcwXfHjPnf
 2K2NJB8UHPugVxfg2oMC8GzczIRdANNmDdg2XqMK818eM2//X328KiyDO7xyh9o5sT97
 AVlqyCAsqbSQExSIbVOBgEbA2EI0WzjnzOjiCajnhzQV+qLA9KIaQ4PwZMgJ2JIrY1fl
 E9nJBb0VkUxHN0WG8ArEkjbhDPTOX5KTCOPJKYwk5PgIhndI2lYcOv2kun1XLWJgjxjS
 bn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQfVByDMubjxteIKJEZ6P0NR+Mqv9ZNp4le53NfYrp8=;
 b=XoCoqtwliF8sagz8FE64a+MBmURWQSEsQ7YcXJIpjIGRO4Pu1+4xj5b8b0qt907Bln
 2PF7TlYPUvQF39ZrEpeuVObwJqA/nqGTZegkcpfqDlF4zXEct32aZesvxAsdjEhpvPX4
 iLciDVUye3BbIEcgkOoKyLyXHYiJYT7Y+eGdDOEapfDYOE+wqDj9MnVNcl5dDarEBNyv
 JyppkneN6zXISxiHBiGI1qwkddtPW7IwNgBEdn2VZAzOp/Pcrd+FleAYjp21kcvWloDY
 4K7i4IkqLMbqLHP+oT7kH1Jjexjjn1+qBnMjh8C2wWAYrjzyOs7XZSwwcQhtOwY7EY9c
 KUQg==
X-Gm-Message-State: AOAM532atFFkQV+Nd4w842RIZJ7G/XbRDaw517gvtBvDNOxICj+016E3
 17pjEBIzB7CvGXdlz2bsQc3tJA==
X-Google-Smtp-Source: ABdhPJx6jKnRq5nqPpVdA7aCaWOhgT0WB+9GfElNE7osCoFYtIg0/X6xNmLS5P73xbTCg6pNXGlfOA==
X-Received: by 2002:a17:906:f88a:: with SMTP id
 lg10mr3078558ejb.39.1616142287621; 
 Fri, 19 Mar 2021 01:24:47 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:47 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 19 Mar 2021 08:24:25 +0000
Message-Id: <20210319082428.3294591-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:36:46 +0000
Subject: [Nouveau] [PATCH 16/19] drm/nouveau/dispnv50/disp: Include header
 containing our prototypes
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
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjI1OTk6MTogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhudjUwX2Rpc3BsYXlfY3JlYXRl4oCZIFstV21pc3Npbmct
cHJvdG90eXBlc10KCkNjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBub3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXggODI4ZjQ4ZDViZGQ0ZS4uY2QxNjQzMTQyMjE5OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAtNjgsNiArNjgsOCBA
QAogCiAjaW5jbHVkZSA8c3ViZGV2L2Jpb3MvZHAuaD4KIAorI2luY2x1ZGUgIm52NTBfZGlzcGxh
eS5oIgorCiAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKiBFVk8gY2hhbm5lbAogICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqLwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
