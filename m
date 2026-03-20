Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A241099B53
	for <nouveau@archiver.kernel.org>; Fri, 20 Mar 2026 23:37:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4F55010EA49;
	Fri, 20 Mar 2026 23:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MPZitOd0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AE8E84525D;
	Fri, 20 Mar 2026 23:26:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774049193;
 b=kFzB4dL2tm4IJ5l78N3shLyOEJ09jQhgRUHoH8MofuupzU6bVBk4sPZocyVgyPMNU2YLV
 JHgAN4Q3Z3uCmAmEWKdmTUQ78/MpTut2c3VTfie9MZmO0o+dT+Dsh2GM7bqofB9S9u/HOGr
 ohvG3FhsFT+Mw5G6BW64J+TOh3QzaPbsdewfbgvIKIE6YUZwpDHrXDi7qMPePqVyHVxUuXU
 tpjmr2BAOQluuURsK3W3Q2dpOIWrwyUCge0W0+gVGKrjwmlta3qkMq/nAUs1yMsoRmte79F
 xVoZbPiFRVQon5h8Up+n694QdNuec/U9u7Np2LbH2IQr4V6QNHoq+onylnsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774049193; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9ryjuW225aIyPKriHsFTqwz9JH8KJWoGfZOzCp5X0/o=;
 b=XHjto7vLJZDl4t31f1aMjssfEEQ2BQk5Tv2+kZhmeRadx5otwPw5RqzGGKpoLSSxtkuv3
 hHrYY/7Mvx8PHXJ9K40zYjTjXoOy+ShZk7HNLkSFfEvBHKo5D82d+2phD8vg144rN3XdOPR
 DF7yh8C4WQUgsew5xllDBnWb+nQpuJ5l25oslilelNf4O8MrVFhYG522Hg8kTXuBDM7y61I
 BuPZnnrAhlvuk858PEiVfu//XoBzSgCGJKsYEx8FZZvy6+bhQpq6Jp65Jdw7hLVcn4qUfSq
 z68WddimQwEgJPWcHYZKAKV3V+vNtoDS52sVGnKRft7Qjtbhb3KnnKjrL3JA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5792044D6D
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 23:26:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A7A2B10EA49
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 23:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774049846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ryjuW225aIyPKriHsFTqwz9JH8KJWoGfZOzCp5X0/o=;
	b=MPZitOd0MPuKpniBhsyC3iJPH7E2uhsp/38n87GQilQA6tf3jHj8AB8Lbeb2YsEJUsTEQ2
	dWQk2FmQ6Q2pGN6TuSJmO7+T/lQihGUZXSRX9+w48VfGzBzsSQn+EPqBnb87ZZaiBqnoZJ
	z0F0Q1fp3dCb2YE6MmHHxxmond8eD44=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-118-81S9b9teMgmwjUvT-fVnCg-1; Fri,
 20 Mar 2026 19:37:23 -0400
X-MC-Unique: 81S9b9teMgmwjUvT-fVnCg-1
X-Mimecast-MFC-AGG-ID: 81S9b9teMgmwjUvT-fVnCg_1774049841
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 254FC1800345;
	Fri, 20 Mar 2026 23:37:21 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0405E180075C;
	Fri, 20 Mar 2026 23:37:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 3/5] rust/drm: Don't setup private driver data until
 registration
Date: Fri, 20 Mar 2026 19:34:28 -0400
Message-ID: <20260320233645.950190-4-lyude@redhat.com>
In-Reply-To: <20260320233645.950190-1-lyude@redhat.com>
References: <20260320233645.950190-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: HmLr8MIMsAHqQ0g48Azjyykl_3jbg4vFtEyAWjoD-qE_1774049841
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: A3LS6YRXY2OQELGT55I6ZLSPLIGOID3P
X-Message-ID-Hash: A3LS6YRXY2OQELGT55I6ZLSPLIGOID3P
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Shankari Anand <shankari.ak0208@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A3LS6YRXY2OQELGT55I6ZLSPLIGOID3P/>
Archived-At: 
 <https://lore.freedesktop.org/20260320233645.950190-4-lyude@redhat.com/>
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
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

---
V4:
* Remove accidental double-aliasing &mut in Device::release()
V5:
* Change new members of Device to pub(super)
V6:
* Split out data_is_init addition into a separate patch, as it turns out
  this fixes a previously present issue in the rust DRM bindings.
* s/pub(crate)/pub(super)/ for one instance I missed in V5

 drivers/gpu/drm/nova/driver.rs |  4 ++--
 drivers/gpu/drm/tyr/driver.rs  |  4 ++--
 rust/kernel/drm/device.rs      | 42 +++++++---------------------------
 rust/kernel/drm/driver.rs      | 19 ++++++++++++---
 4 files changed, 28 insertions(+), 41 deletions(-)

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
index 6238f6e2b3bd2..76c5aed1171b1 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -145,8 +145,8 @@ fn probe(
                 gpu_info,
         });
 
-        let tdev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref(), data)?;
-        let tdev = drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), 0)?;
+        let tdev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
+        let tdev = drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), data, 0)?;
 
         let driver = TyrPlatformDriverData {
             _device: tdev.into(),
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 89788af2e6537..64b1089ba00d4 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -143,7 +143,7 @@ impl DeviceContext for Uninit {}
 ///
 /// The device in `self.0` is guaranteed to be a newly created [`Device`] that has not yet been
 /// registered with userspace until this type is dropped.
-pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, Uninit>>, NotThreadSafe);
+pub struct UnregisteredDevice<T: drm::Driver>(pub(super) ARef<Device<T, Uninit>>, NotThreadSafe);
 
 impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
     type Target = Device<T, Uninit>;
@@ -190,7 +190,7 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
     /// Create a new `UnregisteredDevice` for a `drm::Driver`.
     ///
     /// This can be used to create a [`Registration`](kernel::drm::Registration).
-    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<Self> {
+    pub fn new(dev: &device::Device) -> Result<Self> {
         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
         // compatible `Layout`.
         let layout = Kmalloc::aligned_layout(Layout::new::<Device<T, Uninit>>());
@@ -209,35 +209,6 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<S
         .cast();
         let raw_drm = NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOMEM)?;
 
-        // Extract *mut MaybeUninit<T::Data> from UnsafeCell<MaybeUninit<T::Data>>
-        // SAFETY: `raw_drm` is a valid pointer to `Self`.
-        let raw_data = unsafe { (*(raw_drm.as_ptr())).data.get() };
-
-        // Extract *mut T::Data from *mut MaybeUninit<T::Data>
-        // SAFETY: `raw_data` is derived from `raw_drm` which is a valid pointer to `Self`.
-        let raw_data = unsafe { (*raw_data).as_mut_ptr() };
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
-        // SAFETY: We just initialized raw_drm above using __drm_dev_alloc(), ensuring it is safe to
-        // dereference
-        unsafe {
-            (*raw_drm.as_ptr())
-                .data_is_init
-                .store(true, Ordering::Relaxed)
-        };
-
         // SAFETY: The reference count is one, and now we take ownership of that reference as a
         // `drm::Device`.
         // INVARIANT: We just created the device above, but have yet to call `drm_dev_register`.
@@ -274,7 +245,7 @@ pub struct Device<T: drm::Driver, C: DeviceContext = Registered> {
 
     /// The Driver's private data.
     ///
-    /// This must only be written to from [`Device::new`].
+    /// This must only be written to from [`drm::Registration::new`].
     pub(super) data: UnsafeCell<MaybeUninit<T::Data>>,
 
     _ctx: PhantomData<C>,
@@ -361,11 +332,14 @@ pub(crate) unsafe fn assume_ctx<NewCtx: DeviceContext>(&self) -> &Device<T, NewC
     }
 }
 
-impl<T: drm::Driver, C: DeviceContext> Deref for Device<T, C> {
+impl<T: drm::Driver> Deref for Device<T, Registered> {
     type Target = T::Data;
 
     fn deref(&self) -> &Self::Target {
-        // SAFETY: `data` is only written to once in `Device::new()`, so this read will never race.
+        // SAFETY:
+        // - `data` is initialized before any `Device`s with the `Registered` context are available
+        //   to the user.
+        // - `data` is only written to once in `Registration::new()`, so this read will never race.
         unsafe { (&*self.data.get()).assume_init_ref() }
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
2.53.0

