Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425F2C88E45
	for <nouveau@archiver.kernel.org>; Sat, 12 Sep 2026 02:58:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B41CE10E3D9;
	Sat, 12 Sep 2026 02:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lhVq5N3O";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IelIU5Gp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5269246A11;
	Sat, 12 Sep 2026 02:41:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789180892;
 b=ApWn3Edu5Aqm2hhNYySPkkjxBUrGxMkgQBuxwaRIvxumWbzKnLk9/heEOPUc+KfUXWNb3
 Fm3SFv+/qSTyyR+gxR6+iqT/iyR8KaTlfeO3BG4LR7WH/TuWSKBifKxhPT3H/IAbmBxDOwV
 J9ecNPr1gRV4MhXXaBFMJgiluSvX1Iz2h5XHBUDO2pLjQo4qEmXNrXdOpn6W7AGQDY7JIpu
 l7uFeKWIOryngePgU71H+NfLWMjMpaWR5AIRPI+TBHIVT4gMb53/T4Jf0y3WTOxcaVO9Q9A
 0/7bVQGama/VYjD+o5Yb271eqSH+wB01Tm9FSQv3Nm+fqkNNQZFbnF3NJijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789180892; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=I86I8FeIQ9CboiECyhds7s4PMDfhKwAuhY6/wPQfsKQ=;
 b=o4/kWnRmRUhjrrHIpuWDBpEWj9FKApyvksgdSaaNd7SpBOuaLYju0XVtgxNPsgOd9xkIu
 XlM43sfvq8Bd0fQsui6EqdGwfbkVz6e5yF6E07o5usHiwuyteLn7kK5d08nYU0UHw4e5EJz
 IqsiYiEnDQJdgDBK1pWwqFa1l6vFwSxqZJxuM7Vfj1T1bdDL794YQOX6RURBi1y9G9aSqg4
 37F9sL1Bys22WBX4s3OC8LvZhaCS0XnJlfe8s1GFJCuxzlvbGT37jz8R+e9f1Sf+8tss65M
 tiNiw1cBHzIY5r8jV5FNpzaoBofnXmzVMHOumk5Bz8JnStD0qhrZAnwaTlPg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mailbox.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B683440250
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:04 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8918F10E153;
	Wed,  9 Sep 2026 13:54:19 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hg2NT6SXqzMlGx;
	Wed, 09 Sep 2026 15:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1788962057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I86I8FeIQ9CboiECyhds7s4PMDfhKwAuhY6/wPQfsKQ=;
	b=lhVq5N3OD8kjPbfooqvGlJxyBaSf595m2UeE4yxHf3rjuE6SE44+/FJ+VzYM/TYaOdPcMq
	wPwtNJzS9ox6Qu/VYOZHfuvRC6THeS9j/beDzPE1xnjIn5Kue90XMI64WQLHsa3t+BYotY
	bD/x57zaJpBwHkM2DIIHbKZNEzB3mM8EPlBkE0PLB6sGMysmTXkr5GH4c+UIOuqpHVEHhx
	lix7IaBNgDNz4TL6vi9I5fYZoD839RHEeTcykqJalsM7Bc47Z9B1TsVTekNEkbl/n4sPe0
	oYOLWFlkqmDKEhH4bMhe5+GWOQTKRHn6LTVSIxfcuQ9ZeGChk3DgA2BAC6Mo5g==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1788962056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I86I8FeIQ9CboiECyhds7s4PMDfhKwAuhY6/wPQfsKQ=;
	b=IelIU5Gp/3a+vPlbqlA7Ttej7H8OgZdMrx74sqpYN3LT4j8ysRgxNhbnQafPKezX0xjxF5
	sYw+XEie3UNGiMuccaD0kfWbPJnPm7Qrz4cMKh+CDE7MsUws375qnp4rSiuRLXbNyddEE+
	zMjeeReVBW74WHzFLMlH3LpSTf0w3k3+5CU3deL4ml9CbMbaj6tCsD45seHT770cc98rDp
	JvcFGP3i0ZBo8naaBcysvZJjKfq8U3cytSDlFdRDImi5v8pRxcjhCIpKAlv7eXGoxshYKw
	0jRYKQfPK+kRvFZYe2rJ7q6cC8NPiC5zw61nVbVycah6dmu2RV4djUxx/a/57g==
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] Documentation nova: Fix bracket
Date: Wed,  9 Sep 2026 15:53:19 +0200
Message-ID: <20260909135319.1364776-3-manuelebnerli@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e664e7234a120557280
X-MBO-RS-META: gn6w5n7mnx6r3t4ocy6iurzoatz49587
X-Rspamd-Queue-Id: 4hg2NT6SXqzMlGx
X-MailFrom: manuelebnerli@mailbox.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: GWGU2HKL2PAOULCX4LNV5Y4WGTSCH53N
X-Message-ID-Hash: GWGU2HKL2PAOULCX4LNV5Y4WGTSCH53N
X-Mailman-Approved-At: Sat, 12 Sep 2026 02:41:29 +0000
CC: Manuel Ebner <manuelebnerli@mailbox.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GWGU2HKL2PAOULCX4LNV5Y4WGTSCH53N/>
Archived-At: 
 <https://lore.freedesktop.org/20260909135319.1364776-3-manuelebnerli@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add missing ')'.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/gpu/nova/core/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index d5130b2b0..a01c362b1 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -33,7 +33,7 @@ A good example from nova-core would be the ``Chipset`` enum type, which defines
 the value ``AD102``. When probing the GPU the value ``0x192`` can be read from a
 certain register indication the chipset AD102. Hence, the enum value ``AD102``
 should be derived from the number ``0x192``. Currently, nova-core uses a custom
-implementation (``Chipset::from_u32`` for this.
+implementation (``Chipset::from_u32``) for this.
 
 Instead, it would be desirable to have something like the ``FromPrimitive``
 trait [1] from the num crate.
-- 
2.54.0

