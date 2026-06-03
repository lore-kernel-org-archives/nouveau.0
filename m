Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5ACCD6E55
	for <nouveau@archiver.kernel.org>; Wed,  3 Jun 2026 19:52:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C76E711231E;
	Wed,  3 Jun 2026 19:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bo4OS5gt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1B9624677A;
	Wed,  3 Jun 2026 19:38:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780515528;
 b=DUt7TobT1G49b7Wc+5T9/u0lvZD2XNbwtz0rsfGvDrAT87oo7GOADH0WuC/ZqZAmz9Zgm
 yAXbOOMTGG8Byqt7uwdHHe+tsLoOX5AsE+cAL3KXbR5xWHr8GvZ9GWAhFMZv80jMLT1Cwbx
 RPdabE1Q2j0N5+8AGukZhDG/TqWK/z+b/63CwGdOWnW0vZSjdQ8nFAurLhLMS2B7q57QA0k
 /sbTxxBuT5tBAYEyhTnzetrflkrAIx7fQnEdWviwp8CNWmNruySzadwdxTPEtJ6MeaK0/9m
 tUPa5W3ltlZ7htVNgQruxQXo7/Ss2FATPAdI+5Qx2at5KANYmWUAp9V+8ruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780515528; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=olsmC37uFpzY+y9wtmCt1x1gIahVEJ6Wl0D8b/LZIzs=;
 b=b0VtBIC4bktL8kgZSOkS+Mb3CLTIVktmiXQ6+W/4SnJQzd7lqxu3vilUKR1zK/Fg3NfNw
 4aZ/UhEqZOA4P4bcQY9eHTnbGUIK+yfoZOtWy4CXDNb0aTbQwJq5Cdyva1UWsH4Slza49R0
 beTHa7DOgVzgT5bhZCLiOVtPK22EMK2JFTMKHue8zBbBlbq3tk/AALsMJl1rD70WXkKyMCo
 nJxeljfNhYiXbTD7xtocuCmKiEdMk7TtbDFwmOZRuk3VaH1Pidn08S3IV2gnznn02sbwY1a
 fFQ3YHicHbd82E/zXbNTHkUA7au1uIv2IDZyPWVl77kjVsQ+OftZpi3ov6ww==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 10D8044C81
	for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2026 19:38:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7898F11231A
	for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2026 19:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780516348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olsmC37uFpzY+y9wtmCt1x1gIahVEJ6Wl0D8b/LZIzs=;
	b=bo4OS5gtXl/55XwAM/rFrIYr1s/5IpCj06Irb2F9CFQiu3wtlZ8QSmGNHo8m02gmWKvDY+
	c123qtLuciPwq3cV72U6J5pU9iDD4A3lj8XlJut6QH1UUoqpHRdAdIHxXrQgh0XA+aM41j
	/iD59qDc5GEoTV6YSqpEpYnAPuJ7Ex8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-56-7TCLGpkIP7OuSlDk4Z0O4A-1; Wed,
 03 Jun 2026 15:52:25 -0400
X-MC-Unique: 7TCLGpkIP7OuSlDk4Z0O4A-1
X-Mimecast-MFC-AGG-ID: 7TCLGpkIP7OuSlDk4Z0O4A_1780516342
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B027718004D4;
	Wed,  3 Jun 2026 19:52:21 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.81.203])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2A2601800351;
	Wed,  3 Jun 2026 19:52:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v17 1/6] rust: drm: gem: shmem: Fix Default implementation for
 ObjectConfig
Date: Wed,  3 Jun 2026 15:42:30 -0400
Message-ID: <20260603195210.693856-2-lyude@redhat.com>
In-Reply-To: <20260603195210.693856-1-lyude@redhat.com>
References: <20260603195210.693856-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: fK_45SPpjAurdvspZjJJYmJNmSObDV0zkwU6ODzlTDE_1780516342
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: GNB62ZT2K44UAEH5AI7ANOE2QUH3BZOB
X-Message-ID-Hash: GNB62ZT2K44UAEH5AI7ANOE2QUH3BZOB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GNB62ZT2K44UAEH5AI7ANOE2QUH3BZOB/>
Archived-At: 
 <https://lore.freedesktop.org/20260603195210.693856-2-lyude@redhat.com/>
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
V17:
* Rebase
* Fix format of commit message subject

 rust/kernel/drm/gem/shmem.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 34af402899a0e..084b798ce795b 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -42,7 +42,6 @@
 ///
 /// This is used with [`Object::new()`] to control various properties that can only be set when
 /// initially creating a shmem-backed GEM object.
-#[derive(Default)]
 pub struct ObjectConfig<'a, T: DriverObject, C: DeviceContext = Registered> {
     /// Whether to set the write-combine map flag.
     pub map_wc: bool,
@@ -53,6 +52,16 @@ pub struct ObjectConfig<'a, T: DriverObject, C: DeviceContext = Registered> {
     pub parent_resv_obj: Option<&'a Object<T, C>>,
 }
 
+impl<'a, T: DriverObject, C: DeviceContext> Default for ObjectConfig<'a, T, C> {
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

