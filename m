Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA05EE6B66
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 22:35:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5BA10E950;
	Fri,  6 Feb 2026 22:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="USdf51wb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 680D241B4D;
	Fri,  6 Feb 2026 22:26:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770416772;
 b=Yw/LiRJbTDTQcS2lf9pdJVIqkdqd1WvYytjrpuc/WOW6v8VuJoC9e1WAy4grWyElWqyxB
 Z+W6PHYKp+LnOQxMda/3NNEND+MRa1VzNhkrNVgrOUfeAwwdIZLjGZRZtYW4d9J27ChalXE
 tJfLuxwd3hIGlQ7yMKuh9Fy5T7XJX6EJFS5DMlwW0hdbScF1T0o3+Jk8U+GdVV0x5at/l+c
 dZ9A/QYoTOOtJxwNU9b8oCoYCyG/M3erNdOgg2zVFBOtYASqb/zumE99mob10k4S8OZ3CYX
 xz/V3Aw7oA+VGqK4E3St12/WposZDAIKzW6H8N5Eue4KHKkxZMqDLhrARCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770416772; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4YK+4HwwquBYeIuxYMPDw1j2BgvfAbpgHtDrxAyiwYs=;
 b=uE5ySJ7HLYd5x1psNHeBZwXETsXEP7ra383fGdqQVedX1wedxf/cpOdw9CUiUNCMyQOfD
 uBVBUJlB4SQFLxFep7g3vmvzKFKlRrr53dB5i2h7dwjF/WU10Q9k43KjIeqyxph6fnEM6Y/
 jZHrqHK+5sf0eeN9Li+tBJkMOkNX2DWIDmBNC+hxSofjkMYMe5J6mtBk7sQEkOCY3gthcix
 8ETooLGaKwINyFAZE9vej9bqeljcfSjm1J10vG5/vSh2HVoV1C6IrwEFBgofBBB+GR7ckIp
 jdRHEJtdWFBnkmzHbtvX5KBSrjOIBk/ENtyQ6OYT1yQtNbtmICw3lVA/eM9g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CA02F4055F
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 22:26:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9791310E251
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 22:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770417331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4YK+4HwwquBYeIuxYMPDw1j2BgvfAbpgHtDrxAyiwYs=;
	b=USdf51wbUqWYkuUH7KH8Jgcv92Oh9Eh8+iSRsTRjwOiwfI0BsgtisghSmb1qDbJBVQqDUU
	XqeEvqCYWseK0JRppSLH+gbFGDRlerhCY+c7YvoJnnnSo7EOyESS0KKaTc+Vtr0/mKZWYR
	XjpkITEIm2fdfALIkF4Bo7+VjoAN9+E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-oAs-S85qMCSvgldeCpQXPg-1; Fri,
 06 Feb 2026 17:35:30 -0500
X-MC-Unique: oAs-S85qMCSvgldeCpQXPg-1
X-Mimecast-MFC-AGG-ID: oAs-S85qMCSvgldeCpQXPg_1770417328
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AB00A1956095;
	Fri,  6 Feb 2026 22:35:28 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.226])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B9647192C7C3;
	Fri,  6 Feb 2026 22:35:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v7 1/7] rust: drm: gem: Add raw_dma_resv() function
Date: Fri,  6 Feb 2026 17:34:25 -0500
Message-ID: <20260206223431.693765-2-lyude@redhat.com>
In-Reply-To: <20260206223431.693765-1-lyude@redhat.com>
References: <20260206223431.693765-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 59efEWhlc8fhW9Rw9HgVclvhuyJZEMk_aqeD_QhI6Io_1770417328
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: A4IPFDKLLDCC2263WG3DZXPR2TAEBCFT
X-Message-ID-Hash: A4IPFDKLLDCC2263WG3DZXPR2TAEBCFT
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org,
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Janne Grunau <j@jannau.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A4IPFDKLLDCC2263WG3DZXPR2TAEBCFT/>
Archived-At: 
 <https://lore.freedesktop.org/20260206223431.693765-2-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

For retrieving a pointer to the struct dma_resv for a given GEM object. We
also introduce it in a new trait, BaseObjectPrivate, which we automatically
implement for all gem objects and don't expose to users outside of the
crate.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Janne Grunau <j@jananu.net>
---
 rust/kernel/drm/gem/mod.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index e1cc3af8ade9b..82b3151e5ae3b 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -197,6 +197,18 @@ fn create_mmap_offset(&self) -> Result<u64> {
 
 impl<T: IntoGEMObject> BaseObject for T {}
 
+/// Crate-private base operations shared by all GEM object classes.
+#[expect(unused)]
+pub(crate) trait BaseObjectPrivate: IntoGEMObject {
+    /// Return a pointer to this object's dma_resv.
+    fn raw_dma_resv(&self) -> *mut bindings::dma_resv {
+        // SAFETY: `as_gem_obj()` always returns a valid pointer to the base DRM gem object
+        unsafe { (*self.as_raw()).resv }
+    }
+}
+
+impl<T: IntoGEMObject> BaseObjectPrivate for T {}
+
 /// A base GEM object.
 ///
 /// # Invariants
-- 
2.53.0

