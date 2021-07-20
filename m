Return-Path: <SRS0=LAsz=MO=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F54C6377D
	for <nouveau@archiver.kernel.org>; Thu, 22 Jul 2021 03:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF91161208
	for <nouveau@archiver.kernel.org>; Thu, 22 Jul 2021 03:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF91161208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD2E6EEAA;
	Thu, 22 Jul 2021 03:10:05 +0000 (UTC)
X-Greylist: delayed 2726 seconds by postgrey-1.36 at gabe;
 Tue, 20 Jul 2021 06:00:39 UTC
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849B589DF9;
 Tue, 20 Jul 2021 06:00:39 +0000 (UTC)
Received: from localhost (unknown [192.168.167.13])
 by regular1.263xmail.com (Postfix) with ESMTP id 6F0061BFD;
 Tue, 20 Jul 2021 14:00:36 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [111.207.172.18])
 by smtp.263.net (postfix) whith ESMTP id
 P30160T139874264110848S1626760826533946_; 
 Tue, 20 Jul 2021 14:00:36 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <b85de854ca89f4566868732de4f340b9>
X-RL-SENDER: zhaoxiao@uniontech.com
X-SENDER: zhaoxiao@uniontech.com
X-LOGIN-NAME: zhaoxiao@uniontech.com
X-FST-TO: airlied@linux.ie
X-RCPT-COUNT: 7
X-SENDER-IP: 111.207.172.18
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: zhaoxiao <zhaoxiao@uniontech.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Date: Tue, 20 Jul 2021 14:00:25 +0800
Message-Id: <20210720060025.25492-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Jul 2021 03:10:04 +0000
Subject: [Nouveau] [PATCH] drivers/gpu/drm/nouveau/nouveau_bo: Remove a
 bunch of unused variables
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
Cc: nouveau@lists.freedesktop.org, zhaoxiao <zhaoxiao@uniontech.com>,
 bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cgpkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmM6IEluIGZ1bmN0aW9uIOKAmG5vdXZlYXVfdHRt
X3R0X3BvcHVsYXRl4oCZOgpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmM6MTI0
NToxNzogd2FybmluZzogdmFyaWFibGUg4oCYZGV24oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGVdCiAgc3RydWN0IGRldmljZSAqZGV2OwogICAgICAgICAgICAg
ICAgIF5+fgpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmM6IEluIGZ1bmN0aW9u
IOKAmG5vdXZlYXVfdHRtX3R0X3VucG9wdWxhdGXigJk6CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYm8uYzoxMjY4OjE3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkZXbigJkgc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KICBzdHJ1Y3QgZGV2aWNlICpk
ZXY7CiAgICAgICAgICAgICAgICAgXn5+ClNpZ25lZC1vZmYtYnk6IHpoYW94aWFvIDx6aGFveGlh
b0B1bmlvbnRlY2guY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8u
YyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggNGYzYTUzNTdkZDU2Li42
OTJkNjNkMDhiNWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
Ym8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKQEAgLTEyNDIs
NyArMTI0Miw3IEBAIG5vdXZlYXVfdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNlICpi
ZGV2LAogewogCXN0cnVjdCB0dG1fdHQgKnR0bV9kbWEgPSAodm9pZCAqKXR0bTsKIAlzdHJ1Y3Qg
bm91dmVhdV9kcm0gKmRybTsKLQlzdHJ1Y3QgZGV2aWNlICpkZXY7CisKIAlib29sIHNsYXZlID0g
ISEodHRtLT5wYWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxBR19TRyk7CiAKIAlpZiAodHRtX3R0X2lz
X3BvcHVsYXRlZCh0dG0pKQpAQCAtMTI1NSw3ICsxMjU1LDYgQEAgbm91dmVhdV90dG1fdHRfcG9w
dWxhdGUoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsCiAJfQogCiAJZHJtID0gbm91dmVhdV9iZGV2
KGJkZXYpOwotCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKIAlyZXR1cm4gdHRtX3Bvb2xfYWxsb2Mo
JmRybS0+dHRtLmJkZXYucG9vbCwgdHRtLCBjdHgpOwogfQpAQCAtMTI2NSwxNCArMTI2NCwxMiBA
QCBub3V2ZWF1X3R0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LAogCQkJ
ICBzdHJ1Y3QgdHRtX3R0ICp0dG0pCiB7CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Ci0Jc3Ry
dWN0IGRldmljZSAqZGV2OwogCWJvb2wgc2xhdmUgPSAhISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1f
UEFHRV9GTEFHX1NHKTsKIAogCWlmIChzbGF2ZSkKIAkJcmV0dXJuOwogCiAJZHJtID0gbm91dmVh
dV9iZGV2KGJkZXYpOwotCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKIAlyZXR1cm4gdHRtX3Bvb2xf
ZnJlZSgmZHJtLT50dG0uYmRldi5wb29sLCB0dG0pOwogfQotLSAKMi4yMC4xCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
