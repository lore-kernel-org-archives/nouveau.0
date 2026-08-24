Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD581C61DB9
	for <nouveau@archiver.kernel.org>; Mon, 24 Aug 2026 12:53:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9B810E7AD;
	Mon, 24 Aug 2026 12:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XeHf5Onf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xkjPY9AA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A931E4750C;
	Mon, 24 Aug 2026 12:37:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787575022;
 b=GdZXgeGMk9/75Tb1IR4Eq+qkubox6TEYLtruHxLqmnqb/feugMR9eHQykW3o4zfCYgWQ1
 iNTz9GKFcXkMKb2YLjKipIvTztZ1u9a6iADXyNEI5m2I1mgl1f/Zyc2XlmE2GjNRALpuENx
 VbZte31hkll3PCJiRSOarcAh0cDtY3a7za5/MJr0WfESiUgdOR+3R9VK35R0OuRNOFXBSoZ
 S6FENIWHsE5uLcXLjwfAfLKxKlfAtKej8RpqHKPrUSWN/c51gF/xokYTzbz1Owjh8KdiQBr
 ncMiJfQuatZg3WTMLDGQpyK7S7Dskkd2LqiCgFsczpoXJQ+1y0TWuikIpsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787575022; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KTrzt/jaZvN9VkFIcS6JMzdZ6BhpAj1Od+S6kV1K9r0=;
 b=RAVJi6ZY2IkJ5NNRnGm8sWnzO0FJgqFWlrRlLcsQI1tppWTLXRWc1HglVusuB1t0iP3VA
 caPKslwOr+WD15O9o/oTeHBCpIoLI++OOWv8FQj4PZVLBLsxLasWoy+S8Xfh+a2BHsIIhGC
 +RHncL9z+5BLuZD+F72Ii5G7URRTZQw1nR4O+xqjs8Rw9ZeQ+ixbG6FB1Rr8/hBN399UNAZ
 JlgQiXrgj9L3G5bP9neS+IPZfgSSBRRHA2gheLXNgfrTDTCRokaWzTOQagbuttJg0JbWTw6
 37TlTbCbrdZbehvEB4zSK6b43y0GQ078+icGm6l40PZDPQtFU8WulQ8q33+A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=suse.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B5F8540951
	for <nouveau@lists.freedesktop.org>; Mon, 24 Aug 2026 12:36:59 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 69CD310E7A7
	for <nouveau@lists.freedesktop.org>; Mon, 24 Aug 2026 12:53:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 53A631F46E;
	Mon, 24 Aug 2026 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1787575927;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTrzt/jaZvN9VkFIcS6JMzdZ6BhpAj1Od+S6kV1K9r0=;
	b=XeHf5OnfwEUyRrANU2SOcH4VgZOYIRChRYa4Bt21YmCBQVoFKA2wbGarCnW22i3e18dmXJ
	A5oEliuPyhPQAam7qYvnkKUW3oW8bdUUiSVhk4XZuJ+MlTRFR7c9gssgrDZSpOWVImnHVS
	C4WAFM/On3lSiZIf0/gWWaFlHpxRMVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787575927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTrzt/jaZvN9VkFIcS6JMzdZ6BhpAj1Od+S6kV1K9r0=;
	b=xkjPY9AAgwbSSPohSquaRXhP7KTmucKrsraDn8dcLqCZWslkIXf5yj1/m1WgTFPZApgqwt
	BLOKw6QC9IiWFXBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD986133CF;
	Mon, 24 Aug 2026 12:52:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2H7RLHY+jGpyNwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 24 Aug 2026 12:52:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geert@linux-m68k.org,
	rdunlap@infradead.org
Subject: [PATCH v2 02/13] drm/panic: Test address from kmap op for NULL
Date: Mon, 24 Aug 2026 14:43:33 +0200
Message-ID: <20260824125201.218863-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824125201.218863-1-tzimmermann@suse.de>
References: <20260824125201.218863-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 53A631F46E
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: ROEVDWUV2PBZGIBUVYMSJOIVJSW7HO7U
X-Message-ID-Hash: ROEVDWUV2PBZGIBUVYMSJOIVJSW7HO7U
X-MailFrom: tzimmermann@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ROEVDWUV2PBZGIBUVYMSJOIVJSW7HO7U/>
Archived-At: 
 <https://lore.freedesktop.org/20260824125201.218863-3-tzimmermann@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Do nothing if kmap_local_page_try_from_panic() returns NULL. This is
not likely to hapen, as the previous page from the same memory area
has been mapped successfully.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 23437509a694 ("drm/panic: Fix 24bit pixel crossing page boundaries")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.18+
---
 drivers/gpu/drm/drm_panic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index ba21df4be338..d28ce8878e05 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -178,6 +178,8 @@ static void drm_panic_write_pixel24_xpage(void *vaddr, struct page *next_page,
 	u8 *p = vaddr + offset;
 
 	vaddr2 = kmap_local_page_try_from_panic(next_page);
+	if (!vaddr2)
+		return;
 
 	*p++ = color & 0xff;
 	color >>= 8;
-- 
2.55.0

