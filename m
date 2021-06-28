Return-Path: <SRS0=KDXO=LW=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC6DC11F64
	for <nouveau@archiver.kernel.org>; Mon, 28 Jun 2021 21:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF83C61D08
	for <nouveau@archiver.kernel.org>; Mon, 28 Jun 2021 21:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF83C61D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801006E580;
	Mon, 28 Jun 2021 21:21:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4C96E580;
 Mon, 28 Jun 2021 21:21:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 971D961D05;
 Mon, 28 Jun 2021 21:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624915268;
 bh=C/HLHG6Av8lXqimOwroFa0oITaX+axl/LT1kTAHBQKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=foCe8AjheKgWrQCKP4Yka6knjjeqAzFwgpHXXblqlCWeBE9W7TRPtxMelNJNPyvAL
 m9WdtAHOfRqE/vj7cpRzLgZmb0Da8c2k9r303I5i93NG2M6k+MA6LBBeWdwKvHHxaf
 Y4ckcwmGABhU9BTndfEJIMznYC/y5VnzbQualY/T1J8hgwgbvLQb34nvdPhvlnHErO
 41QWgxMABP4Vi7q3Lwd/wTe2xfaFkfhKzIZbUIUvmqevbaD54uoTUR6/3y6u+hLKYL
 IRlXQGFPH26Lo+Fleiedk3CE0BmJoQH7HGm8nmgZ/tO4Q1Y0GAb0XHZwSo8OLpOIXz
 BVhHp7yoAtsag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 28 Jun 2021 17:21:04 -0400
Message-Id: <20210628212105.43449-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210628212105.43449-1-sashal@kernel.org>
References: <20210628212105.43449-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Nouveau] [PATCH AUTOSEL 5.4 2/3] drm/nouveau: fix dma_address
 check for CPU/GPU sync
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgZDMzMDA5OTExNTU5N2JiYzIzOGQ2NzU4YTQ5MzBlNzJiNDllYTliYSBdCgpB
R1AgZm9yIGV4YW1wbGUgZG9lc24ndCBoYXZlIGEgZG1hX2FkZHJlc3MgYXJyYXkuCgpTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkFja2Vk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ckxpbms6IGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIxMDYxNDExMDUxNy4x
NjI0LTEtY2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmlu
IDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2JvLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5j
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCmluZGV4IGY4MDE1ZTAzMThk
Ny4uZjc2MDNiZTU2OWZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCkBAIC01
NDIsNyArNTQyLDcgQEAgbm91dmVhdV9ib19zeW5jX2Zvcl9kZXZpY2Uoc3RydWN0IG5vdXZlYXVf
Ym8gKm52Ym8pCiAJc3RydWN0IHR0bV9kbWFfdHQgKnR0bV9kbWEgPSAoc3RydWN0IHR0bV9kbWFf
dHQgKiludmJvLT5iby50dG07CiAJaW50IGk7CiAKLQlpZiAoIXR0bV9kbWEpCisJaWYgKCF0dG1f
ZG1hIHx8ICF0dG1fZG1hLT5kbWFfYWRkcmVzcykKIAkJcmV0dXJuOwogCiAJLyogRG9uJ3Qgd2Fz
dGUgdGltZSBsb29waW5nIGlmIHRoZSBvYmplY3QgaXMgY29oZXJlbnQgKi8KQEAgLTU2Miw3ICs1
NjIsNyBAQCBub3V2ZWF1X2JvX3N5bmNfZm9yX2NwdShzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibykK
IAlzdHJ1Y3QgdHRtX2RtYV90dCAqdHRtX2RtYSA9IChzdHJ1Y3QgdHRtX2RtYV90dCAqKW52Ym8t
PmJvLnR0bTsKIAlpbnQgaTsKIAotCWlmICghdHRtX2RtYSkKKwlpZiAoIXR0bV9kbWEgfHwgIXR0
bV9kbWEtPmRtYV9hZGRyZXNzKQogCQlyZXR1cm47CiAKIAkvKiBEb24ndCB3YXN0ZSB0aW1lIGxv
b3BpbmcgaWYgdGhlIG9iamVjdCBpcyBjb2hlcmVudCAqLwotLSAKMi4zMC4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
