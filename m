Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2FED6CFAB
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 22:51:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 33E4010EB79;
	Thu, 22 Jan 2026 22:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZztJKWC4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7D40D404B5;
	Thu, 22 Jan 2026 22:42:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769121768;
 b=KgJw2hp2mBq3dXILMuvodfbahve2/2sT4UghGGnzzLMfVYH2TzHNCFydpVt++Upad7bjb
 Q2sMGHTQekUZc/PCjiyp9eWL6ZAtCUx7C3wBmKXSgi6AVq/URDO0z0559mtZxzFJ+b/t4qi
 3bynw9933+E2m+91I+n/EvGE7lc5kCyrsiJg+FDYKmXN5HTjmxQFEJHkBwoHCSZhW3uMI5o
 19c89HIZ4xhBoRteyFPQS1o9PXdUfYLvhcnx4JpNW2QwrNsyIKOCc3s5C0xRURzhm2s3cK7
 a0i5nrZHTxEZurD2O+0rn5D4HCVVwaioMjiJXve0qyjV3i51hRzENBO+OCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769121768; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=O5w1C5A1b7/iDoWWklIxjrD42HoB0GOu7XofvrCfsI8=;
 b=gCQrNhLFySvIuWfeYOnLsIJP5WKnE2pX0MDXxMEm4UwBnmYUSzoL8qPSk8hRsUQdNMPtW
 QD3Notvuird0ob5UF3YEe2Jsg3IwQp/65c/tuBIzzd1VN2SZPvosgGq2wyoM0KEPAOQRc2G
 wXlKRNnJfDOxROw2rem9jXUdMjidhBCDAjvC0GUy9HXVyAuBncLMm0cbVZXiBWlTfW3TE5P
 CkT12SVX9HSojrkwvfcmwec420QLQJf1s1iE7B5CnqAqpmTq8KOtajZAXIyrrTpVF+OFbIj
 0p2tfHbEULUPak4xrJFNMdq7O3PGPt37IcnfT1TVMY/pbmVzc30OawnARaYw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 67BFE403B4
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:42:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D141D10EB72
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769122295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O5w1C5A1b7/iDoWWklIxjrD42HoB0GOu7XofvrCfsI8=;
	b=ZztJKWC4Bz5yB2FkGV08hvEeNeuKvap9J7M+EI4A+GW9cZit3CDDDDj3Y3JNzKPoyrg9zK
	G3ZaqT+XWoJqAPNeJWXPCDszSUCi10HvrVciJquMFpSQuJG/5dLTakMcMuND2elLIH0G4S
	+RRe/FkD0Uq+X+KTIphz8C5Dx2zjokA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-TTC83R5rPseRm-Vi29HBwg-1; Thu,
 22 Jan 2026 17:51:31 -0500
X-MC-Unique: TTC83R5rPseRm-Vi29HBwg-1
X-Mimecast-MFC-AGG-ID: TTC83R5rPseRm-Vi29HBwg_1769122290
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 01747180044D;
	Thu, 22 Jan 2026 22:51:30 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 090C130002D8;
	Thu, 22 Jan 2026 22:51:27 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 2/3] rust/drm: Don't setup private driver data until
 registration
Date: Thu, 22 Jan 2026 17:46:37 -0500
Message-ID: <20260122225057.3589500-3-lyude@redhat.com>
In-Reply-To: <20260122225057.3589500-1-lyude@redhat.com>
References: <20260122225057.3589500-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-ID-Hash: IG6KUYTCWSJ4GS5DZJLYN6AHO4QNNVVB
X-Message-ID-Hash: IG6KUYTCWSJ4GS5DZJLYN6AHO4QNNVVB
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IG6KUYTCWSJ4GS5DZJLYN6AHO4QNNVVB/>
Archived-At: 
 <https://lore.freedesktop.org/20260122225057.3589500-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Now that we have a DeviceContext that we can use to represent whether a
Device is known to have been registered, we can make it so that drivers can
create their Devices but wait until the registration phase to assign their
private data to the Device. This is desirable as some drivers need to make
use of the DRM device early on before finalizing their private driver data.

As such, this change makes it so that the driver's private data can
currently only be accessed through Device<T, Registered> types and not
Device<T, Uninit>.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nova/driver.rs |  4 +--
 drivers/gpu/drm/tyr/driver.rs  |  4 +--
 rust/kernel/drm/device.rs      | 63 ++++++++++++++++++++--------------
 rust/kernel/drm/driver.rs      | 19 ++++++++--
 4 files changed, 58 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 99d6841b69cbc..8cea5f68c3b04 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -56,8 +56,8 @@ impl auxiliary::Driver for NovaDriver {
     fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
-        let drm = drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
-        let drm = drm::Registration::new_foreign_owned(drm, adev.as_ref(), 0)?;
+        let drm = drm::UnregisteredDevice::<Self>::new(adev.as_ref())?;
+        let drm = drm::Registration::new_foreign_owned(drm, adev.as_ref(), data, 0)?;
 
         Ok(Self { drm: drm.into() })
     }
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index ac265a60f5667..e73c56659ea75 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -133,8 +133,8 @@ fn probe(
                 gpu_info,
         });
 
-        let tdev = drm::UnregisteredDevice::<Self>::new(pdev.as_ref(), data)?;
-        let tdev = drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), 0)?;
+        let tdev = drm::UnregisteredDevice::<Self>::new(pdev.as_ref())?;
+        let tdev = drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), data, 0)?;
 
         let driver = TyrDriver {
             device: tdev.into(),
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index f529bc7fc4032..0e81957cf8c28 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -26,13 +26,15 @@
 };
 use core::{
     alloc::Layout,
+    cell::UnsafeCell,
     marker::PhantomData,
-    mem,
-    ops::Deref,
-    ptr::{
+    mem::{
         self,
-        NonNull, //
+        MaybeUninit, //
     },
+    ops::Deref,
+    ptr::NonNull,
+    sync::atomic::*,
 };
 
 #[cfg(CONFIG_DRM_LEGACY)]
@@ -141,7 +143,7 @@ impl DeviceContext for Uninit {}
 ///
 /// The device in `self.0` is guaranteed to be a newly created [`Device`] that has not yet been
 /// registered with userspace until this type is dropped.
-pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, Uninit>>, NotThreadSafe);
+pub struct UnregisteredDevice<T: drm::Driver>(pub(crate) ARef<Device<T, Uninit>>, NotThreadSafe);
 
 impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
     type Target = Device<T, Uninit>;
@@ -188,7 +190,7 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
     /// Create a new `UnregisteredDevice` for a `drm::Driver`.
     ///
     /// This can be used to create a [`Registration`](kernel::drm::Registration).
-    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<Self> {
+    pub fn new(dev: &device::Device) -> Result<Self> {
         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
         // compatible `Layout`.
         let layout = Kmalloc::aligned_layout(Layout::new::<Self>());
@@ -207,22 +209,6 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<S
         .cast();
         let raw_drm = NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOMEM)?;
 
-        // SAFETY: `raw_drm` is a valid pointer to `Self`.
-        let raw_data = unsafe { ptr::addr_of_mut!((*raw_drm.as_ptr()).data) };
-
-        // SAFETY:
-        // - `raw_data` is a valid pointer to uninitialized memory.
-        // - `raw_data` will not move until it is dropped.
-        unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
-            // SAFETY: `raw_drm` is a valid pointer to `Self`, given that `__drm_dev_alloc` was
-            // successful.
-            let drm_dev = unsafe { Device::into_drm_device(raw_drm) };
-
-            // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_dev` must be valid and the
-            // refcount must be non-zero.
-            unsafe { bindings::drm_dev_put(drm_dev) };
-        })?;
-
         // SAFETY: The reference count is one, and now we take ownership of that reference as a
         // `drm::Device`.
         // INVARIANT: We just created the device above, but have yet to call `drm_dev_register`.
@@ -254,7 +240,15 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<S
 #[repr(C)]
 pub struct Device<T: drm::Driver, C: DeviceContext = Registered> {
     dev: Opaque<bindings::drm_device>,
-    data: T::Data,
+
+    /// Keeps track of whether we've initialized the device data yet.
+    pub(crate) data_is_init: AtomicBool,
+
+    /// The Driver's private data.
+    ///
+    /// This must only be written to from [`drm::Registration::new`].
+    pub(crate) data: UnsafeCell<MaybeUninit<T::Data>>,
+
     _ctx: PhantomData<C>,
 }
 
@@ -305,6 +299,21 @@ extern "C" fn release(ptr: *mut bindings::drm_device) {
         // SAFETY: `ptr` is a valid pointer to a `struct drm_device` and embedded in `Self`.
         let this = unsafe { Self::from_drm_device(ptr) };
 
+        {
+            // SAFETY:
+            // - Since we are in release(), we are guaranteed that no one else has access to `this`.
+            // - We confirmed above that `this` is a valid pointer to an initialized `Self`.
+            let this = unsafe { &mut *this };
+            if this.data_is_init.load(Ordering::Relaxed) {
+                // SAFETY:
+                // - Since we are in release(), we are guaranteed that no one else has access to
+                //   `this`.
+                // - We checked that the data is initialized above.
+                // - We do not use `data` any point after calling this function.
+                unsafe { (&mut *this.data.get()).assume_init_drop() };
+            }
+        }
+
         // SAFETY:
         // - When `release` runs it is guaranteed that there is no further access to `this`.
         // - `this` is valid for dropping.
@@ -323,11 +332,15 @@ pub(crate) unsafe fn assume_ctx<NewCtx: DeviceContext>(&self) -> &Device<T, NewC
     }
 }
 
-impl<T: drm::Driver, C: DeviceContext> Deref for Device<T, C> {
+impl<T: drm::Driver> Deref for Device<T, Registered> {
     type Target = T::Data;
 
     fn deref(&self) -> &Self::Target {
-        &self.data
+        // SAFETY:
+        // - `data` is initialized before any `Device`s with the `Registered` context are available
+        //   to the user.
+        // - `data` is only written to once in `Registration::new()`, so this read will never race.
+        unsafe { (&*self.data.get()).assume_init_ref() }
     }
 }
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index da9f1bfef1f14..a16605b407159 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -15,7 +15,8 @@
 };
 use core::{
     mem,
-    ptr::NonNull, //
+    ptr::NonNull,
+    sync::atomic::*, //
 };
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
@@ -127,7 +128,18 @@ pub trait Driver {
 pub struct Registration<T: Driver>(ARef<drm::Device<T>>);
 
 impl<T: Driver> Registration<T> {
-    fn new(drm: drm::UnregisteredDevice<T>, flags: usize) -> Result<Self> {
+    fn new(
+        drm: drm::UnregisteredDevice<T>,
+        data: impl PinInit<T::Data, Error>,
+        flags: usize,
+    ) -> Result<Self> {
+        // SAFETY:
+        // - `raw_data` is a valid pointer to uninitialized memory.
+        // - `raw_data` will not move until it is dropped.
+        unsafe { data.__pinned_init(drm.0.data.get().cast()) }?;
+
+        drm.data_is_init.store(true, Ordering::Relaxed);
+
         // SAFETY: `drm.as_raw()` is valid by the invariants of `drm::Device`.
         to_result(unsafe { bindings::drm_dev_register(drm.as_raw(), flags) })?;
 
@@ -150,6 +162,7 @@ fn new(drm: drm::UnregisteredDevice<T>, flags: usize) -> Result<Self> {
     pub fn new_foreign_owned<'a>(
         drm: drm::UnregisteredDevice<T>,
         dev: &'a device::Device<device::Bound>,
+        data: impl PinInit<T::Data, Error>,
         flags: usize,
     ) -> Result<&'a drm::Device<T>>
     where
@@ -160,7 +173,7 @@ pub fn new_foreign_owned<'a>(
             return Err(EINVAL);
         }
 
-        let reg = Registration::<T>::new(drm, flags)?;
+        let reg = Registration::<T>::new(drm, data, flags)?;
         let drm = NonNull::from(reg.device());
 
         devres::register(dev, reg, GFP_KERNEL)?;
-- 
2.52.0

