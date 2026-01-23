Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B0FD6CFD7
	for <nouveau@archiver.kernel.org>; Fri, 23 Jan 2026 23:12:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA9210EC3D;
	Fri, 23 Jan 2026 23:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xy4omd0b";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2C3D840469;
	Fri, 23 Jan 2026 23:04:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769209446;
 b=FBeXJDedtUnsuvNdU1Du7SVltgpi6UYyy7NZoSDXWEuTVYIql2MGCqhUfMH00nz3hb4hz
 YQ2Z0uMQrQDX/j7r0VmbfBf6JIzHobScISxHLpejP1cGKXIdmZ5oGpkf0rcemWq08lgm7vj
 vbCc3Cfi946D+bvvZe4AzLwUEz8XpzdxuD31LLuRPbQt5j1UtW7TEAnCPo1upt/3iFDLVeV
 d5souBNo6FmXUNs101iWWYZ5yhNPVgJHLIja+Xzw+PmwcroZ9EKInTWHAVLNuDXW+wjPVzj
 c3PCawLZA3mnGG5/JhLXmeEb7Rt7+1B6frpDh00tNWnao6snqBiqbR+1g1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769209446; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=I4xaYhUpLXOBwZoEHLADcBcWiGEAuhBq9dyW2GYPd4M=;
 b=CvzkRgKO9zzomevOpVKKK/cXxKbgZ7DLBl9c9bmQqsZQVh003yVDtr+kyeF/Itt+q32r/
 OQ2dlWe6fiFLQc1IiWlAXZIBCH/LZmT2NVPOngFAEMHjafERzNBG0loR/iRQlcDODOY2+ba
 3ArKIoD4RV7AHXMIOg5j2ro12oz6DMTR+RNvDryRS4Vp4b3EN5w6aOzAMH1jXKjyl2trvZ9
 6zu3LNTbTirHNzThn4UPzzaytDzWwikbI0A6fgI5X2eyU2atWoHnyEU4wk+2aPON51XGdoX
 FdHrVOraQL6diQ+rsDVlwim2lhno7FsidJlIzL8i5GnKDNPMRs+T2haEYEnQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0CD664003B
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 23:04:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B52EE10EC0F
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 23:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769209974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4xaYhUpLXOBwZoEHLADcBcWiGEAuhBq9dyW2GYPd4M=;
	b=Xy4omd0bfDXN4qFvHll8uctWD37NHH3JVdnvMPbyp66xPGtTcMv5WXEy5NMyo32diZ48L6
	tF0FIp5YB7XgyphZy/UCPdH+G/sJLAbCInYI1bZHdjUaZYlMAY92DBEHSqDyhwflxhSjgf
	KX1WUA/m81x3BFa1ta31ebpEJ9HPCmY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-UmEgOjSXNgCZkMAomxi1Ag-1; Fri,
 23 Jan 2026 18:12:48 -0500
X-MC-Unique: UmEgOjSXNgCZkMAomxi1Ag-1
X-Mimecast-MFC-AGG-ID: UmEgOjSXNgCZkMAomxi1Ag_1769209967
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DAA2E1944F2F;
	Fri, 23 Jan 2026 23:12:46 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CA4781958DC5;
	Fri, 23 Jan 2026 23:12:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 2/3] rust/drm: Don't setup private driver data until
 registration
Date: Fri, 23 Jan 2026 18:10:14 -0500
Message-ID: <20260123231230.248500-3-lyude@redhat.com>
In-Reply-To: <20260123231230.248500-1-lyude@redhat.com>
References: <20260123231230.248500-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-ID-Hash: 7DXOYYLHUR4QBRJ5MWNNCJ656QN25WP6
X-Message-ID-Hash: 7DXOYYLHUR4QBRJ5MWNNCJ656QN25WP6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7DXOYYLHUR4QBRJ5MWNNCJ656QN25WP6/>
Archived-At: 
 <https://lore.freedesktop.org/20260123231230.248500-3-lyude@redhat.com/>
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
V4:
* Remove accidental double-aliasing &mut in Device::release()
---
 drivers/gpu/drm/nova/driver.rs |  4 +--
 drivers/gpu/drm/tyr/driver.rs  |  4 +--
 rust/kernel/drm/device.rs      | 64 +++++++++++++++++++++-------------
 rust/kernel/drm/driver.rs      | 19 ++++++++--
 4 files changed, 59 insertions(+), 32 deletions(-)

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
index 0d479b5d7bd62..b574ee1c24587 100644
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
             _device: tdev.into(),
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 8f1780b8f0196..a1d9b0e92f3fd 100644
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
@@ -253,7 +239,15 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<S
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
 
@@ -304,6 +298,22 @@ extern "C" fn release(ptr: *mut bindings::drm_device) {
         // SAFETY: `ptr` is a valid pointer to a `struct drm_device` and embedded in `Self`.
         let this = unsafe { Self::from_drm_device(ptr) };
 
+        // SAFETY:
+        // - Since we are in release(), we are guaranteed that no one else has access to `this`.
+        // - We confirmed above that `this` is a valid pointer to an initialized `Self`.
+        let is_init = unsafe { &*this }.data_is_init.load(Ordering::Relaxed);
+        if is_init {
+            // SAFETY:
+            // - We confirmed we have unique access to this above.
+            // - We confirmed that `data` is initialized above.
+            let data_ptr = unsafe { &mut (*this).data };
+
+            // SAFETY:
+            // - We checked that the data is initialized above.
+            // - We do not use `data` any point after calling this function.
+            unsafe { data_ptr.get_mut().assume_init_drop() };
+        }
+
         // SAFETY:
         // - When `release` runs it is guaranteed that there is no further access to `this`.
         // - `this` is valid for dropping.
@@ -322,11 +332,15 @@ pub(crate) unsafe fn assume_ctx<NewCtx: DeviceContext>(&self) -> &Device<T, NewC
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
index 55b01ee088548..cfb8884ece700 100644
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
@@ -159,7 +172,7 @@ pub fn new_foreign_owned<'a>(
             return Err(EINVAL);
         }
 
-        let reg = Registration::<T>::new(drm, flags)?;
+        let reg = Registration::<T>::new(drm, data, flags)?;
         let drm = NonNull::from(reg.device());
 
         devres::register(dev, reg, GFP_KERNEL)?;
-- 
2.52.0

