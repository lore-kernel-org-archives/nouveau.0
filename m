Return-Path: <SRS0=A/Vf=KU=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA3AC4707F
	for <nouveau@archiver.kernel.org>; Tue, 25 May 2021 16:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F865613FA
	for <nouveau@archiver.kernel.org>; Tue, 25 May 2021 16:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F865613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C126E415;
	Tue, 25 May 2021 16:59:50 +0000 (UTC)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2680689A44;
 Tue, 25 May 2021 08:15:44 +0000 (UTC)
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Fq6Jd56pgzBwRf;
 Tue, 25 May 2021 16:12:49 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 16:15:41 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 25 May
 2021 16:15:40 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Date: Tue, 25 May 2021 16:25:11 +0800
Message-ID: <20210525082511.580068-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 25 May 2021 16:59:50 +0000
Subject: [Nouveau] [PATCH -next] drm/nouveau: Remove set but not used
 variable 'dev'
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
Cc: yuehaibing@huawei.com, libaokun1@huawei.com, weiyongjun1@huawei.com,
 yukuai3@huawei.com, yangjihong1@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jOiBJbiBmdW5jdGlvbiAnbm91dmVhdV90dG1fdHRf
cG9wdWxhdGUnOgpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmM6MTI1ODoxNzog
d2FybmluZzoKIHZhcmlhYmxlIOKAmGRlduKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jOiBJ
biBmdW5jdGlvbiAnbm91dmVhdV90dG1fdHRfdW5wb3B1bGF0ZSc6CmRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfYm8uYzoxMjgxOjE3OiB3YXJuaW5nOgogdmFyaWFibGUg4oCYZGV24oCZ
IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpJdCBuZXZlciB1
c2VkIHNpbmNlIGludHJvZHVjdGlvbi4KClNpZ25lZC1vZmYtYnk6IEJhb2t1biBMaSA8bGliYW9r
dW4xQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5j
IHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggN2EyNjI0YzBiYTRjLi41MWY5YTJlNjUzMmUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKQEAgLTEyNTQsNyArMTI1NCw2IEBAIG5vdXZl
YXVfdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LAogewogCXN0cnVjdCB0
dG1fdHQgKnR0bV9kbWEgPSAodm9pZCAqKXR0bTsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybTsK
LQlzdHJ1Y3QgZGV2aWNlICpkZXY7CiAJYm9vbCBzbGF2ZSA9ICEhKHR0bS0+cGFnZV9mbGFncyAm
IFRUTV9QQUdFX0ZMQUdfU0cpOwogCiAJaWYgKHR0bV90dF9pc19wb3B1bGF0ZWQodHRtKSkKQEAg
LTEyNjcsNyArMTI2Niw2IEBAIG5vdXZlYXVfdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fZGV2
aWNlICpiZGV2LAogCX0KIAogCWRybSA9IG5vdXZlYXVfYmRldihiZGV2KTsKLQlkZXYgPSBkcm0t
PmRldi0+ZGV2OwogCiAJcmV0dXJuIHR0bV9wb29sX2FsbG9jKCZkcm0tPnR0bS5iZGV2LnBvb2ws
IHR0bSwgY3R4KTsKIH0KQEAgLTEyNzcsMTQgKzEyNzUsMTIgQEAgbm91dmVhdV90dG1fdHRfdW5w
b3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKIAkJCSAgc3RydWN0IHR0bV90dCAqdHRt
KQogewogCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtOwotCXN0cnVjdCBkZXZpY2UgKmRldjsKIAli
b29sIHNsYXZlID0gISEodHRtLT5wYWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxBR19TRyk7CiAKIAlp
ZiAoc2xhdmUpCiAJCXJldHVybjsKIAogCWRybSA9IG5vdXZlYXVfYmRldihiZGV2KTsKLQlkZXYg
PSBkcm0tPmRldi0+ZGV2OwogCiAJcmV0dXJuIHR0bV9wb29sX2ZyZWUoJmRybS0+dHRtLmJkZXYu
cG9vbCwgdHRtKTsKIH0KLS0gCjIuMjUuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1Cg==
