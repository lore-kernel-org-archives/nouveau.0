Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DBEF53D96
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 21:17:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B612410E527;
	Mon, 16 Mar 2026 21:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ikxp+Ut2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4167245189;
	Mon, 16 Mar 2026 21:06:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773695184;
 b=ZgX6DLdb3ERmCjcDqTkDBVKHjpCWJXO09Y7/BAi2ypmKrN5VUJzSZLu8vPrbLc1paVa1d
 wp6Z8KJaSDUXs8qg/5MRLOuvVnzFy3/g5K2yZF7naPPaifz6FC0s6qSDc5UyUXcVlnk8PnR
 2jdLpFExCzTVb6FQbgJ6EsZsxUTVO2FQfC4wNu+eUe5n+9TpQNrIIuwJFi+VO2F4v9K6xrX
 BM25M1wynIbGVYPaNMIFhONaAMLI2OGYzKFzplkeKpFPC+KAoERlo798CxrXgm+hM3yYOu+
 4oeGCz2GqaxfQ4wcQOnlQkg/XZaBSyD4fxziSznlspBbOkavGZ0+50t87kDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773695184; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kw/CChfMYazflyPqG/1L5aluivgViQKC8HGD+SI/7m8=;
 b=jNVVH23iNCB3F5baT4aclP3ckoU0d8LWMkUv3tMdFtZmELooMbPqzIMKEla+tizh57QV4
 49oucyVqSnmmzgZl0rnecY86YfW26pQBOj6hSoL4g3aAsE7iuD76D0fqWT1cXT4n26EFCnn
 9jAKT9+ChBt7M8eCWp2nEl/YfSaH15uioh98vQZVYiz6CrVPOB3V5bsRDMdEej4AWecmefr
 EO/D70HwkFOC75LAHZ7vl96KH5Xm7p9UovMqYOtDP1z4yZ0V9ONbuI0ufhlCpXdc5YiN3Ge
 WTTvBwHNTnWU1d5l3NQxRgmSUWb5/KGpguyN5V3RKYNOARqnZXjejEuxEbDQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3852D45169
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 21:06:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD4510E4F3
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 21:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773695827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw/CChfMYazflyPqG/1L5aluivgViQKC8HGD+SI/7m8=;
	b=ikxp+Ut2S8VfgxHMV1NW+zKyTZz6EIa0N3YqGIdjgoZDkfYRQKj9WZW28wqR8IDMqrqiv/
	aGu7SVABGRuZCyO2yaDpAiHD7eKnjCLhmtoHHMYZ7aLrS1ftEqvDBILw2w9ER2odS/VPO7
	aQBFx4HD0k4GYrGuUwBwdYnc/4b1Pj4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-o20v4gqpPPKn-CQ1Ojo1cA-1; Mon,
 16 Mar 2026 17:17:03 -0400
X-MC-Unique: o20v4gqpPPKn-CQ1Ojo1cA-1
X-Mimecast-MFC-AGG-ID: o20v4gqpPPKn-CQ1Ojo1cA_1773695820
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5A2D719560AB;
	Mon, 16 Mar 2026 21:17:00 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CA9F11800594;
	Mon, 16 Mar 2026 21:16:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v9 2/7] rust: drm: gem: Add raw_dma_resv() function
Date: Mon, 16 Mar 2026 17:16:10 -0400
Message-ID: <20260316211646.650074-3-lyude@redhat.com>
In-Reply-To: <20260316211646.650074-1-lyude@redhat.com>
References: <20260316211646.650074-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: PWcnR_sBFjFePOAPoZ3vuhkmUvdP4myZr-vQUGVbWZ0_1773695820
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: XTFB3OGVQ2DGSQYCECMDQ5WF7QXKJKKG
X-Message-ID-Hash: XTFB3OGVQ2DGSQYCECMDQ5WF7QXKJKKG
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XTFB3OGVQ2DGSQYCECMDQ5WF7QXKJKKG/>
Archived-At: 
 <https://lore.freedesktop.org/20260316211646.650074-3-lyude@redhat.com/>
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
index 94e7c2a7293d0..bcec62155c02d 100644
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

