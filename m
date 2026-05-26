Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1FDCD5BC8
	for <nouveau@archiver.kernel.org>; Tue, 26 May 2026 21:29:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 88E0910E6F7;
	Tue, 26 May 2026 21:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="i1eqoFi0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6882646468;
	Tue, 26 May 2026 21:16:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779830163;
 b=jrPVghHl59Goqk7kQFEXtj5Wp643LMswxphT2iT3sumuthS0rieqT4yytNgPWkLQsitJs
 B43NfSPOCmwe+yQ0rqY7h6Yd2ABbi6PbRmMJalJgFhqyRR+acSA27ON9IBkE0wFLb9sJikb
 JdS4c/JhtSxANZCBJIARR39kV24XKr/YkJLJTSNLDXWDTXLGTmDoMjFtWOM8tMvPraaC8KS
 4qlUpCBn2dqFqwd6qCitnpuKy6qGEO+5XXxmWIrpccDrXX9HgcO1pnCa6P15Gd3W2OYnn7F
 8BYTrBddJkyNYVN81jYvsrn3y4plmKxxasYAGHOViaZv0NgB9MGkNYwCDaGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779830163; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=35xOY5UpjGtZddGUxJfTOaK/u/wc0iWDPCGCXs5Om6w=;
 b=I3PrGdrIwYrfxgt6gDG+3YH2CTV4k+fC89GuHBSkwLZFFPTKFQXcn5CON8vC2DKNzY0Qn
 IpydqVb2oYld9abAblXFQMNeclYqE80RJjQSSx4HX8RqK2Hc6D5TjKcvgHjaQK6OB/weruo
 EeUYV1DBxUqeLvbHq5kfjRzMUFlPwvbAr2iBpqaf9GHul4Fmui9ZJiMilXyIU2l1uhFPKGr
 Bds9diwWzKeKFFc/8BTBAARuL5+SyhZGk20POgpy00IcEeb0wRP3XTDaxAQ+afq/tDdykdS
 U4lgrdOgh6Z6IRimzUi8NEfkCY6bkfOi7bxIGCqQ08j/PKTGcJWIkUYR6UMQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 959CC4641C
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 21:16:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 75F0710E6BA
	for <nouveau@lists.freedesktop.org>; Tue, 26 May 2026 21:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779830964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=35xOY5UpjGtZddGUxJfTOaK/u/wc0iWDPCGCXs5Om6w=;
	b=i1eqoFi0Ud3YJ1OG1qgUWxBRhwefCbO9GHUyGeZhnDdJc57vC7uyZ/iSaJ1X5AsNN3BWwf
	6LWuQhUbtUlXNigtyeSV1Bdbeob5WyzbF6cAVcKTYpIwGKlsf0UI8SuKuDBEYXn57m/Ddq
	qO10JffXsluVNlXtCV5HiVPhrhs4+Yc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-cEgIZJ2IMoG2W1xSPwgxqA-1; Tue,
 26 May 2026 17:29:19 -0400
X-MC-Unique: cEgIZJ2IMoG2W1xSPwgxqA-1
X-Mimecast-MFC-AGG-ID: cEgIZJ2IMoG2W1xSPwgxqA_1779830956
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 408E01955F25;
	Tue, 26 May 2026 21:29:16 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C072E30001BB;
	Tue, 26 May 2026 21:29:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v14 2/6] rust: gem: shmem: Fix Default implementation for
 ObjectConfig
Date: Tue, 26 May 2026 17:28:53 -0400
Message-ID: <20260526212857.1158294-3-lyude@redhat.com>
In-Reply-To: <20260526212857.1158294-1-lyude@redhat.com>
References: <20260526212857.1158294-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: pYXsvgl8xOq1reiqd9h6to1VElaGMf1llpRVRZumIKE_1779830956
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 6YWDEQ3YRUYPJVRKXIS2TWPAGFRS3AHY
X-Message-ID-Hash: 6YWDEQ3YRUYPJVRKXIS2TWPAGFRS3AHY
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6YWDEQ3YRUYPJVRKXIS2TWPAGFRS3AHY/>
Archived-At: 
 <https://lore.freedesktop.org/20260526212857.1158294-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

I completely forgot when coming up with this type that #[derive(Default)]
only works if all generics mentioned in the type implement Default (and T
usually doesn't). This being said: We don't use `T` for anything besides
using it for a reference type, so whether or not it implements `Default`
shouldn't actually need to matter.

So, fix this by just manually implementing Default instead of deriving it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/shmem.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index e1b648920d2f6..8b7de136ab1f9 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -39,7 +39,6 @@
 ///
 /// This is used with [`Object::new()`] to control various properties that can only be set when
 /// initially creating a shmem-backed GEM object.
-#[derive(Default)]
 pub struct ObjectConfig<'a, T: DriverObject> {
     /// Whether to set the write-combine map flag.
     pub map_wc: bool,
@@ -50,6 +49,16 @@ pub struct ObjectConfig<'a, T: DriverObject> {
     pub parent_resv_obj: Option<&'a Object<T>>,
 }
 
+impl<'a, T: DriverObject> Default for ObjectConfig<'a, T> {
+    #[inline(always)]
+    fn default() -> Self {
+        Self {
+            map_wc: false,
+            parent_resv_obj: None,
+        }
+    }
+}
+
 /// A shmem-backed GEM object.
 ///
 /// # Invariants
-- 
2.54.0

