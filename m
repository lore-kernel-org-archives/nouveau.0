Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D981125876
	for <nouveau@archiver.kernel.org>; Wed, 11 Mar 2026 19:53:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA4010E925;
	Wed, 11 Mar 2026 19:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xo4bGm6O";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D522845099;
	Wed, 11 Mar 2026 19:42:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773258171;
 b=T4nz17Pl/n5FOQgc7wfsn21va+I7V7PbAdQmq1uC0k5e06a+ln9kjGfBGiS3/BnveWNif
 BYqQyYJyf6hn4D6FjJ8Ly/J823sJQLfCRAVaXGwMjTVuwvE0Op7bpMva1nbxoohCOyOhc0q
 SGhFR75Co9SQKz6Qb6fw2esFJ/H6ANsxLDJW8Oq9LKDWI3a7UU8KlZDbVMc/qmPZC/0d9Ew
 EGen/viEpP0G4/MgFB60VD7WV/98B6ak/0Mq9oRllUDcDolkT6BpSLuSRCpEX67EuW2nRMc
 rocOl4qGXt3ix19VScXxqW4MNzHJK1UE4HPdkIl8IDNLy+JtKwkKndyHCucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773258171; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kw/CChfMYazflyPqG/1L5aluivgViQKC8HGD+SI/7m8=;
 b=csnO8ryUogqahcqmtD8hEOHOV7EGcMCfai9Cd85VUrrj5yg6Ox87ZZMTKG2ei+Wln94Fl
 oAq09b/wBlexbkFJ9cTeV8wkNVke01h7I78xWwD01pKOCHk/fZ6Is9nVv1Q6fM/G++UIyDN
 K/BixzAnu0aMmAo0fJ3BImJ2zZhkZjpmXlvMAgSY3Pjpg7Z0wrmGBe7NZktSO+UuJgZpA+K
 CQLYupfFkuu3RGs5KknYO6fjSdZDRqc0GcGqApXqYhJ2ZsUXQd2QfNcodftXqfiodVt2vcT
 NqWleLIQiKMWGKdlk3UiHMtM63VJbWVwEmI+Cyq6fP58hbZ7O6KfnwnZ7R0g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EFCC440696
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 19:42:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F028B10E90E
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 19:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773258804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw/CChfMYazflyPqG/1L5aluivgViQKC8HGD+SI/7m8=;
	b=Xo4bGm6Oz79wRJ0Bv3ZalH4+WxElGikQHj3RfMxGK9utlrkQt0eM7+GYBfsSiQL1kERFLa
	7VbRwTklGvC/kYy7k8H8fsQVPBtmHHt2SinVseO+ksMZXAHNT8ODR4N2oqRZHnFG5mrTVA
	O3u1cKPjesP74IWcz3fIchB/dd02DPk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-547-tmXfS2JNPeCgd0fV1h0oOA-1; Wed,
 11 Mar 2026 15:53:17 -0400
X-MC-Unique: tmXfS2JNPeCgd0fV1h0oOA-1
X-Mimecast-MFC-AGG-ID: tmXfS2JNPeCgd0fV1h0oOA_1773258794
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1F0FF1956059;
	Wed, 11 Mar 2026 19:53:14 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.81.64])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 18B0E3002D0E;
	Wed, 11 Mar 2026 19:53:09 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v8 2/7] rust: drm: gem: Add raw_dma_resv() function
Date: Wed, 11 Mar 2026 15:52:41 -0400
Message-ID: <20260311195246.2439593-3-lyude@redhat.com>
In-Reply-To: <20260311195246.2439593-1-lyude@redhat.com>
References: <20260311195246.2439593-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 1hSAPw-6mz1bezINSFwQsDuRh2DrxeHHCHdwUx5UrXY_1773258794
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: NR2WF2SZGMANGEDDGZLVAL3RTKIGMFIG
X-Message-ID-Hash: NR2WF2SZGMANGEDDGZLVAL3RTKIGMFIG
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NR2WF2SZGMANGEDDGZLVAL3RTKIGMFIG/>
Archived-At: 
 <https://lore.freedesktop.org/20260311195246.2439593-3-lyude@redhat.com/>
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

