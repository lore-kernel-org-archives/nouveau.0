Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DCEF53D9E
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 21:17:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4231D10E4F1;
	Mon, 16 Mar 2026 21:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JJ+bQd5s";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BD2CD4518A;
	Mon, 16 Mar 2026 21:06:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773695191;
 b=BQvJbgqPpWxjcEanIUNApyZklVVDgvNX1/HF/2c+HLCdMVxcI0B8kO/pI+a2LE99+FM+w
 mvSpPTiIr9Zq3NvWvv5Ieb025pYUy6vBSddhg0q63y2NMFDfpj3RGUqfhPnovii3wG1LUyB
 6ANrMJzXs64N9WVU6kCPd5qS/GcmR4z1CkAw3czngznHcwFkkH83Ik3m97vTzCDL9VSFH27
 +fn9xvGj7zoZq9djw9/GOlIRz7ikTBaqCj24bvwh3lrpxLria43/EdOn5JvuveBM3NX1gwD
 QsYtIIjmJEvxdbxclEtE06rSWu5NPXwj8tP3v3dgsSrYTF99IjPcmk4t5ZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773695191; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SBBNHAB7ECc4iRrpuo2tvoBzGi4OXxzNc9t5KOahDKA=;
 b=kBdMtrZjQVkb4xeXg9WFyNJzay4/g47Xg37e2JhFiThghzOVkWaLwakHCEr1VjQDanDio
 2gPv8bRFgnXgbh+LM2WRP1vy1wGhLW0smKCCnOqf8g4fYj72AazuOs17RGXZL2bUEEcFcwd
 hBJzOS632uRe6o4stoNglWP82EIpVgK9bt6WGeD1Ln6II4M39c17Itz2ba15oS4GiVxxohV
 THQd9CoMsNwUsdTSgZ5TgNFoypOI1Ui36APi7lW2g/X0tuKR2NEMTGsyZm1MbjayFfhNCuh
 ow2uumetRSM0OLBkps6rI8vllo2srBW1uI+t87Ll2mnu16ETuu44fjbNY6Kw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A3F4243790
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 21:06:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D917B10E4E6
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 21:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773695835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBBNHAB7ECc4iRrpuo2tvoBzGi4OXxzNc9t5KOahDKA=;
	b=JJ+bQd5s7FNiQbRe7IbBZuhPiy2WEI/SCPrfnvncg57swDw3t8zTRo2x1PmYYnNu0974jp
	uVyHeaoR5JiHGnPvEuNn3Rm2EAeUGGZgdA9yJhXPWPqAuUV8I7R5usC4aywPOzJpMm6IY6
	Uh1bkcCYWXlNe875QDLbyhdVd3lshVU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-r66_DnroMr678vaQc5q0hA-1; Mon,
 16 Mar 2026 17:17:11 -0400
X-MC-Unique: r66_DnroMr678vaQc5q0hA-1
X-Mimecast-MFC-AGG-ID: r66_DnroMr678vaQc5q0hA_1773695828
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DEF9319560B4;
	Mon, 16 Mar 2026 21:17:07 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7E54C180035F;
	Mon, 16 Mar 2026 21:17:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v9 4/7] rust: gem: Introduce DriverObject::Args
Date: Mon, 16 Mar 2026 17:16:12 -0400
Message-ID: <20260316211646.650074-5-lyude@redhat.com>
In-Reply-To: <20260316211646.650074-1-lyude@redhat.com>
References: <20260316211646.650074-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: HQN_Q2foemH3ina2ub4aJCazKMo0eyQGtcKFRH3kiFU_1773695828
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: YVG72YVOTMV7DHJXSV22LIRCEPCQN43V
X-Message-ID-Hash: YVG72YVOTMV7DHJXSV22LIRCEPCQN43V
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YVG72YVOTMV7DHJXSV22LIRCEPCQN43V/>
Archived-At: 
 <https://lore.freedesktop.org/20260316211646.650074-5-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is an associated type that may be used in order to specify a data-type
to pass to gem objects when construction them, allowing for drivers to more
easily initialize their private-data for gem objects.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Janne Grunau <j@jananu.net>

---
V3:
* s/BaseDriverObject/DriverObject/
V4:
* Fix leftover reference to BaseObjectDriver in rustdoc for
  DriverObject::Args
V6:
* Fix build errors in Tyr

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nova/gem.rs |  5 +++--
 drivers/gpu/drm/tyr/gem.rs  |  3 ++-
 rust/kernel/drm/gem/mod.rs  | 13 ++++++++++---
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 6ccfa5da57617..e073e174e2578 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -19,8 +19,9 @@ pub(crate) struct NovaObject {}
 
 impl gem::DriverObject for NovaObject {
     type Driver = NovaDriver;
+    type Args = ();
 
-    fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
+    fn new(_dev: &NovaDevice, _size: usize, _args: Self::Args) -> impl PinInit<Self, Error> {
         try_pin_init!(NovaObject {})
     }
 }
@@ -33,7 +34,7 @@ pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self
         }
         let aligned_size = page::page_align(size).ok_or(EINVAL)?;
 
-        gem::Object::new(dev, aligned_size)
+        gem::Object::new(dev, aligned_size, ())
     }
 
     /// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 1273bf89dbd5d..bb5e7871efa94 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -11,8 +11,9 @@ pub(crate) struct TyrObject {}
 
 impl gem::DriverObject for TyrObject {
     type Driver = TyrDriver;
+    type Args = ();
 
-    fn new(_dev: &TyrDevice, _size: usize) -> impl PinInit<Self, Error> {
+    fn new(_dev: &TyrDevice, _size: usize, _args: ()) -> impl PinInit<Self, Error> {
         try_pin_init!(TyrObject {})
     }
 }
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index bcec62155c02d..68bf33969a7d4 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -62,8 +62,15 @@ pub trait DriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
     type Driver: drm::Driver;
 
+    /// The data type to use for passing arguments to [`DriverObject::new`].
+    type Args;
+
     /// Create a new driver data object for a GEM object of a given size.
-    fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
+    fn new(
+        dev: &drm::Device<Self::Driver>,
+        size: usize,
+        args: Self::Args,
+    ) -> impl PinInit<Self, Error>;
 
     /// Open a new handle to an existing object, associated with a File.
     fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) -> Result {
@@ -242,11 +249,11 @@ impl<T: DriverObject> Object<T> {
     };
 
     /// Create a new GEM object.
-    pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
+    pub fn new(dev: &drm::Device<T::Driver>, size: usize, args: T::Args) -> Result<ARef<Self>> {
         let obj: Pin<KBox<Self>> = KBox::pin_init(
             try_pin_init!(Self {
                 obj: Opaque::new(bindings::drm_gem_object::default()),
-                data <- T::new(dev, size),
+                data <- T::new(dev, size, args),
             }),
             GFP_KERNEL,
         )?;
-- 
2.53.0

