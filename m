Return-Path: <SRS0=q2Al=K3=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD324C47080
	for <nouveau@archiver.kernel.org>; Tue,  1 Jun 2021 17:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 870B161042
	for <nouveau@archiver.kernel.org>; Tue,  1 Jun 2021 17:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 870B161042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440C76EA9C;
	Tue,  1 Jun 2021 17:51:52 +0000 (UTC)
X-Greylist: delayed 1159 seconds by postgrey-1.36 at gabe;
 Mon, 31 May 2021 02:48:18 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8CC6E450
 for <nouveau@lists.freedesktop.org>; Mon, 31 May 2021 02:48:18 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FtfHh5flZzWq73;
 Mon, 31 May 2021 10:24:16 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 10:28:56 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 31 May
 2021 10:28:56 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Date: Mon, 31 May 2021 10:38:11 +0800
Message-ID: <20210531023811.477542-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 01 Jun 2021 17:51:50 +0000
Subject: [Nouveau] [PATCH -next] drm/nouveau/svm: Remove set but not used
 variable 'ret'
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
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYzogSW4gZnVuY3Rpb24gJ25vdXZlYXVfcGZuc19t
YXAnOgpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jOjgxNDo2OiB3YXJuaW5n
OgogdmFyaWFibGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCgpJdCBuZXZlciB1c2VkIHNpbmNlIGludHJvZHVjdGlvbi4KClNpZ25lZC1vZmYt
Ynk6IEJhb2t1biBMaSA8bGliYW9rdW4xQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9zdm0uYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMK
aW5kZXggODQ3MjZhODllNjY1Li4xNmZiZjkwZjlmMzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9zdm0uYwpAQCAtOTIxLDcgKzkyMSw2IEBAIG5vdXZlYXVfcGZuc19tYXAoc3RydWN0
IG5vdXZlYXVfc3ZtbSAqc3ZtbSwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJCSB1bnNpZ25lZCBs
b25nIGFkZHIsIHU2NCAqcGZucywgdW5zaWduZWQgbG9uZyBucGFnZXMpCiB7CiAJc3RydWN0IG5v
dXZlYXVfcGZubWFwX2FyZ3MgKmFyZ3MgPSBub3V2ZWF1X3BmbnNfdG9fYXJncyhwZm5zKTsKLQlp
bnQgcmV0OwogCiAJYXJncy0+cC5hZGRyID0gYWRkcjsKIAlhcmdzLT5wLnNpemUgPSBucGFnZXMg
PDwgUEFHRV9TSElGVDsKQEAgLTkyOSw3ICs5MjgsNyBAQCBub3V2ZWF1X3BmbnNfbWFwKHN0cnVj
dCBub3V2ZWF1X3N2bW0gKnN2bW0sIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAogCW11dGV4X2xvY2so
JnN2bW0tPm11dGV4KTsKIAogCXN2bW0tPnZtbS0+dm1tLm9iamVjdC5jbGllbnQtPnN1cGVyID0g
dHJ1ZTsKLQlyZXQgPSBudmlmX29iamVjdF9pb2N0bCgmc3ZtbS0+dm1tLT52bW0ub2JqZWN0LCBh
cmdzLCBzaXplb2YoKmFyZ3MpICsKKwludmlmX29iamVjdF9pb2N0bCgmc3ZtbS0+dm1tLT52bW0u
b2JqZWN0LCBhcmdzLCBzaXplb2YoKmFyZ3MpICsKIAkJCQlucGFnZXMgKiBzaXplb2YoYXJncy0+
cC5waHlzWzBdKSwgTlVMTCk7CiAJc3ZtbS0+dm1tLT52bW0ub2JqZWN0LmNsaWVudC0+c3VwZXIg
PSBmYWxzZTsKIAotLSAKMi4yNS40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXUK
