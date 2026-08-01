Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9722C55172
	for <nouveau@archiver.kernel.org>; Sat,  1 Aug 2026 19:17:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 96F4C10E393;
	Sat,  1 Aug 2026 19:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.b="QM0r4+rW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0C9054757E;
	Sat,  1 Aug 2026 19:01:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785610890;
 b=RudR4p7rnHTlMT1M99UrTLnr8obi4tjrCT8Y567pVihBFUFTriPMQ9HVduv9PFvkSVQBE
 NDp5AkCaHVj+EvVUN5Z7PhpjXTltGYjhCH+gRm6ImTN/FAPW5czJPWTJ81xPpPIN09AG5lF
 W3h6MdMk9cvcdBMz9BKdh8eBw9xKWWNY3joouYpC7y8eY1xtQLP4jq/wdqs08163Vq6Y726
 wpAFhEOu9+Nmkhp/NNth5sDKsjg/HweOT/cLsIWKucrOJO6SAu9Zc9hQ5OnWnGVJG76Ut+9
 iIZ/as1agfFUIj8Y2bEiXE/rEPUu8YqI2xX+8QlkIGlUC3QHQ9h0IZXXJ2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785610890; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eGNzqQoF4RSNQLvpJf4olM07e0yunhY4ZG6n3gv0Pbg=;
 b=ks4b2JseHaW28tMEXrNvP2GS5n35UDkTtz9FqUlowkaw5m5TTchAkgNYIqclCwcUPPTd5
 BHyctIYz5hX14at15S8Zbct/VAe1jgS781U1fXhg++ar/dC7SMCq8K2JD8NAbTFEXKriKkU
 UixIdgc9gFJEsT5rKE8HzvjnN4EQDTkWqY39GDkV8fpD4TEctppgNMOqrZ+451IFmFjbq37
 gJGhqZNzRDWnss6kiCIHUKwq1YiL8fasC9iXolOmQuxhuj5huzJFBbJDpVy5kh/99kgSyFE
 Dy0RHbqEuwVpyaTNAIcXINRK17kjZ1u2G0BAg+Rexd7+r2Noy8c1FBcF5w0Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=inria.fr;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=inria.fr policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=inria.fr;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=inria.fr policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BC91043790
	for <nouveau@lists.freedesktop.org>; Sat,  1 Aug 2026 19:01:26 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Sat, 01 Aug 2026 19:17:19 UTC
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 89BCF10E093;
	Sat,  1 Aug 2026 19:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eGNzqQoF4RSNQLvpJf4olM07e0yunhY4ZG6n3gv0Pbg=;
  b=QM0r4+rWXtHFIynievF2F36tTDpXJJvjv8QAnmZ7jiVtuoGatIQlIEBm
   p2YlTSKM4oY/5WVNY/Cgre9K7+yNZ2e70oeNLleKJTJsjqgx/PzylTWV8
   gix3DdaR2VdZn6ghmp6Uol1gVH823uhhEosB3mrPxXbJa/UsCydBPvMP8
   g=;
X-CSE-ConnectionGUID: 0W+Bu0iYTbyt4Z338D48tA==
X-CSE-MsgGUID: eaIW/iH/Tm6zTtu7JyXogA==
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600";
   d="scan'208";a="288769010"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.)
 ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 21:10:08 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau/bios/init: drop unneeded semicolon
Date: Sat,  1 Aug 2026 21:09:54 +0200
Message-Id: <20260801191002.1383835-8-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YBABVDSTL5Y2TNLMZSG4QXFEFZC2DOL6
X-Message-ID-Hash: YBABVDSTL5Y2TNLMZSG4QXFEFZC2DOL6
X-MailFrom: Julia.Lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: kernel-janitors@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YBABVDSTL5Y2TNLMZSG4QXFEFZC2DOL6/>
Archived-At: 
 <https://lore.freedesktop.org/20260801191002.1383835-8-Julia.Lawall@inria.fr/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

When a function-like macro expands to an expression, that expression
doesn't need a semicolon after it.  All uses have been verified to
have their own semicolons.

This was found using the following Coccinelle semantic patch:

@r@
identifier i : script:ocaml() { String.lowercase_ascii i = i };
expression e;
@@

*#define i(...) e;

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
index b54f044c4..3f888fb97 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -403,7 +403,7 @@ init_table_(struct nvbios_init *init, u16 offset, const char *name)
 #define init_io_condition_table(b) init_table_((b), 0x08, "io condition table")
 #define init_io_flag_condition_table(b) init_table_((b), 0x0a, "io flag condition table")
 #define init_function_table(b) init_table_((b), 0x0c, "function table")
-#define init_xlat_table(b) init_table_((b), 0x10, "xlat table");
+#define init_xlat_table(b) init_table_((b), 0x10, "xlat table")
 
 static u16
 init_script(struct nvkm_bios *bios, int index)

