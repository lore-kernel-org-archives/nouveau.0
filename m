Return-Path: <SRS0=7tVC=JE=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50A3C433B4
	for <nouveau@archiver.kernel.org>; Wed,  7 Apr 2021 15:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9886139B
	for <nouveau@archiver.kernel.org>; Wed,  7 Apr 2021 15:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9886139B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3E56E939;
	Wed,  7 Apr 2021 15:37:35 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DEB89F2D;
 Wed,  7 Apr 2021 08:25:07 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R681e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0UUmMqoH_1617783897; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UUmMqoH_1617783897) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 07 Apr 2021 16:25:04 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: bskeggs@redhat.com
Date: Wed,  7 Apr 2021 16:24:56 +0800
Message-Id: <1617783896-106243-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Apr 2021 15:37:34 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: remove unused variable
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmM6MTM4OTo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkKc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0uCgpSZXBvcnRlZC1ieTogQWJh
Y2kgUm9ib3QgPGFiYWNpQGxpbnV4LmFsaWJhYmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBKaWFwZW5n
IENob25nIDxqaWFwZW5nLmNob25nQGxpbnV4LmFsaWJhYmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2Rpc3AuYwppbmRleCAxYzljMGNkLi5iNzVlZGUxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52NTAvZGlzcC5jCkBAIC0xMzg2LDEyICsxMzg2LDEwIEBAIHN0cnVjdCBub3V2
ZWF1X2VuY29kZXIgKm52NTBfcmVhbF9vdXRwKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikK
IHsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKG1zdG0tPm91dHAtPmJh
c2UuYmFzZS5kZXYpOwogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKLQlpbnQgcmV0Owog
CiAJTlZfQVRPTUlDKGRybSwgIiVzOiBtc3RtIGNsZWFudXBcbiIsIG1zdG0tPm91dHAtPmJhc2Uu
YmFzZS5uYW1lKTsKLQlyZXQgPSBkcm1fZHBfY2hlY2tfYWN0X3N0YXR1cygmbXN0bS0+bWdyKTsK
LQotCXJldCA9IGRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0MigmbXN0bS0+bWdyKTsKKwlkcm1f
ZHBfY2hlY2tfYWN0X3N0YXR1cygmbXN0bS0+bWdyKTsKKwlkcm1fZHBfdXBkYXRlX3BheWxvYWRf
cGFydDIoJm1zdG0tPm1ncik7CiAKIAlkcm1fZm9yX2VhY2hfZW5jb2RlcihlbmNvZGVyLCBtc3Rt
LT5vdXRwLT5iYXNlLmJhc2UuZGV2KSB7CiAJCWlmIChlbmNvZGVyLT5lbmNvZGVyX3R5cGUgPT0g
RFJNX01PREVfRU5DT0RFUl9EUE1TVCkgewotLSAKMS44LjMuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
