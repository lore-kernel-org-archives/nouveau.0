Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF429EE6B69
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 22:35:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C3E7D10E968;
	Fri,  6 Feb 2026 22:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Lh3wdsbG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AF80E41B47;
	Fri,  6 Feb 2026 22:26:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770416786;
 b=e6QS8QUl8OHFo8yE3mzuTVOZlIJdjs+kthLZ4cNO5ZyypTxvuVGh4h1Y2SBdXWs9kP02V
 YUixhTE3XuLapJpY+u2eGPG1jYFVFzsvLCyJEBRLgc03lFpxyInHIlLTU1VbFlOthp3WGHG
 E3ynXVXV1Tqv6dUAWuZ1x5I+5xEE4lzwuQhdkN6qyXHYcar4XwbEAoIb71KhleDY0IuDBJJ
 uYtmmTmq+9A/MD44B2AR9vC2mGpNLgS277YBsaHhbVPAO4bvcJDxg/Vwf7m+oo4lMHbylhk
 /L5mJLcun1BLOmOkJgdKGNSr2G6frM9xTGsoVlTac151cSbhbYbp2YbYAVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770416786; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zTebqQ2eipm8YqiSwO1TAoGzLEbFz+blNfHKTyJxzv0=;
 b=mF+mPyDnizYsQTPuDj8t1h/SEt84vh+wJuUzphpmVUsWzdykvnFxgYbcjLwp3SfGNN9r8
 NEx5LeXknfxefuw2P1bkTnY0dpZ8F963eKS7Pb9bVEq6NO2pCREMAHR/VOvhLqHXwGO27sp
 zCAytlm0d5y2CO9RjtL74saG08DbYvWaYs5WI88l0eInWXwyKp27FayoevN2sFeUiIg3uVB
 NmqdO8VjKgC7HF2dhYG9ji4Ocj2bsjVFLDS+0GMPgNYOKYD7X58u4nEOTPJEat2WPlsrAyL
 gY91G5VeZMZ/EG+jYFsVllasZafXINwD1FGqznFPlQmuizx+Vf+FOLFzAYrQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3848641B4D
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 22:26:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0475310E969
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 22:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770417344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTebqQ2eipm8YqiSwO1TAoGzLEbFz+blNfHKTyJxzv0=;
	b=Lh3wdsbGwch50R2rLPuJZguuKUCMNzLVzamcwKShFCnlkEwfslD2ubbAR5qCcektiSF65o
	i3Qxh+ef4b9HQj32uLpBrg0D/Ln4ouVfUwiAmjI2Rp3zWDYP1V69o4MkVSbKGTaVdXC/BL
	t0PXInwj3QI4wmRIOCoAtitOzx9Svjg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-3KZVlp8tORq_6hbtHCtJMA-1; Fri,
 06 Feb 2026 17:35:41 -0500
X-MC-Unique: 3KZVlp8tORq_6hbtHCtJMA-1
X-Mimecast-MFC-AGG-ID: 3KZVlp8tORq_6hbtHCtJMA_1770417339
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B73581956094;
	Fri,  6 Feb 2026 22:35:39 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.226])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E264519373D8;
	Fri,  6 Feb 2026 22:35:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v7 7/7] rust: drm/gem: Add vmap functions to shmem bindings
Date: Fri,  6 Feb 2026 17:34:31 -0500
Message-ID: <20260206223431.693765-8-lyude@redhat.com>
In-Reply-To: <20260206223431.693765-1-lyude@redhat.com>
References: <20260206223431.693765-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: d5v5TITKTwHxxmbJ_GfO8HffqEAAI5_EgfhW-hSTglI_1770417339
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: VPQTXLFBZFWKOBUPNY6GPHLTQ5U4JLKA
X-Message-ID-Hash: VPQTXLFBZFWKOBUPNY6GPHLTQ5U4JLKA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VPQTXLFBZFWKOBUPNY6GPHLTQ5U4JLKA/>
Archived-At: 
 <https://lore.freedesktop.org/20260206223431.693765-8-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

One of the more obvious use cases for gem shmem objects is the ability to
create mappings into their contents, specifically iosys mappings. Now that
we've added iosys_map rust bindings to the kernel, let's hook these up in
gem shmem.

Similar to how we handle SGTables, we make sure there's two different types
of mappings: owned mappings (kernel::drm::gem::shmem::VMap) and borrowed
mappings (kernel::drm::gem::shmem::VMapRef).

One last note: we change the #[expect(unused)] for RawIoSysMap::from_raw()
to an #[allow(unused)]. Normally we would simply remove the lint assertion,
however - since shmem is conditionally built, we need allow to avoid
hitting warnings in certain kernel configurations.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V7:
* Switch over to the new iosys map bindings that use the Io trait

 rust/kernel/drm/gem/shmem.rs | 170 ++++++++++++++++++++++++++++++++++-
 rust/kernel/iosys_map.rs     |   3 +-
 2 files changed, 170 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index e511a9b6710e0..604fb10325d1e 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -21,6 +21,7 @@
         from_err_ptr,
         to_result, //
     },
+    iosys_map::*,
     prelude::*,
     scatterlist,
     types::{
@@ -29,13 +30,18 @@
     }, //
 };
 use core::{
+    mem::{
+        self,
+        MaybeUninit, //
+    },
     ops::{
         Deref,
         DerefMut, //
     },
-    ptr::NonNull,
+    ptr::NonNull, //
 };
 use gem::{
+    BaseObject,
     BaseObjectPrivate,
     DriverObject,
     IntoGEMObject, //
@@ -216,6 +222,72 @@ pub fn owned_sg_table(&self) -> Result<SGTable<T>> {
             _owner: self.into(),
         })
     }
+
+    /// Attempt to create a [`RawIoSysMap`] from the gem object.
+    fn raw_vmap<const SIZE: usize>(&self) -> Result<RawIoSysMap<SIZE>> {
+        let mut map: MaybeUninit<bindings::iosys_map> = MaybeUninit::uninit();
+
+        // SAFETY: drm_gem_shmem_vmap can be called with the DMA reservation lock held
+        to_result(unsafe {
+            // TODO: see top of file
+            bindings::dma_resv_lock(self.raw_dma_resv(), core::ptr::null_mut());
+            let ret = bindings::drm_gem_shmem_vmap_locked(self.as_shmem(), map.as_mut_ptr());
+            bindings::dma_resv_unlock(self.raw_dma_resv());
+            ret
+        })?;
+
+        // SAFETY: if drm_gem_shmem_vmap did not fail, map is initialized now
+        Ok(unsafe { RawIoSysMap::<SIZE>::from_raw(map.assume_init()) })
+    }
+
+    /// Unmap a [`RawIoSysMap`] from the gem object.
+    ///
+    /// # Safety
+    ///
+    /// - The caller promises that `map` came from a prior call to [`Self::raw_vmap`] on this gem
+    ///   object.
+    /// - The caller promises that the memory pointed to by `map` will no longer be accesed through
+    ///   this instance.
+    unsafe fn raw_vunmap<const SIZE: usize>(&self, map: &mut RawIoSysMap<SIZE>) {
+        let resv = self.raw_dma_resv();
+
+        // SAFETY:
+        // - This function is safe to call with the DMA reservation lock held
+        // - Our `ARef` is proof that the underlying gem object here is initialized and thus safe to
+        //   dereference.
+        unsafe {
+            // TODO: see top of file
+            bindings::dma_resv_lock(resv, core::ptr::null_mut());
+            bindings::drm_gem_shmem_vunmap_locked(self.as_shmem(), map.as_raw_mut());
+            bindings::dma_resv_unlock(resv);
+        }
+    }
+
+    /// Creates and returns a virtual kernel memory mapping for this object.
+    pub fn vmap<const SIZE: usize>(&self) -> Result<VMapRef<'_, T, SIZE>> {
+        let map = self.raw_vmap()?;
+
+        Ok(VMapRef {
+            // SAFETY:
+            // - The size of the vmap is the same as the size of the gem
+            // - The vmap will remain alive until this object is dropped.
+            map: unsafe { IoSysMapRef::<SIZE>::new(map, self.size()) }?,
+            owner: self,
+        })
+    }
+
+    /// Creates and returns an owned reference to a virtual kernel memory mapping for this object.
+    pub fn owned_vmap<const SIZE: usize>(&self) -> Result<VMap<T, SIZE>> {
+        // INVARIANT: We verify here that the mapping is at least of SIZE bytes.
+        if self.size() < SIZE {
+            return Err(EINVAL);
+        }
+
+        Ok(VMap {
+            map: self.raw_vmap()?,
+            owner: self.into(),
+        })
+    }
 }
 
 impl<T: DriverObject> Deref for Object<T> {
@@ -267,6 +339,102 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
     };
 }
 
+/// A borrowed reference to a virtual mapping for a shmem-based GEM object in kernel address space.
+pub struct VMapRef<'a, D: DriverObject, const SIZE: usize = 0> {
+    map: IoSysMapRef<'a, SIZE>,
+    owner: &'a Object<D>,
+}
+
+impl<'a, D: DriverObject, const SIZE: usize> Clone for VMapRef<'a, D, SIZE> {
+    fn clone(&self) -> Self {
+        // SAFETY: We have a successful vmap already, so this can't fail
+        unsafe { self.owner.vmap().unwrap_unchecked() }
+    }
+}
+
+impl<'a, D: DriverObject, const SIZE: usize> Deref for VMapRef<'a, D, SIZE> {
+    type Target = IoSysMapRef<'a, SIZE>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.map
+    }
+}
+
+impl<'a, D: DriverObject, const SIZE: usize> DerefMut for VMapRef<'a, D, SIZE> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.map
+    }
+}
+
+impl<'a, D: DriverObject, const SIZE: usize> Drop for VMapRef<'a, D, SIZE> {
+    fn drop(&mut self) {
+        // SAFETY: Our existence is proof that this map was previously created using self.owner.
+        unsafe { self.owner.raw_vunmap(&mut self.map.raw_map) };
+    }
+}
+
+/// An owned reference to a virtual mapping for a shmem-based GEM object in kernel address space.
+///
+/// # Invariants
+///
+/// - The size of `owner` is >= SIZE.
+/// - The memory pointed to by `map` is at least as large as `T`.
+/// - The memory pointed to by `map` remains valid at least until this object is dropped.
+pub struct VMap<D: DriverObject, const SIZE: usize = 0> {
+    map: RawIoSysMap<SIZE>,
+    owner: ARef<Object<D>>,
+}
+
+impl<D: DriverObject, const SIZE: usize> Clone for VMap<D, SIZE> {
+    fn clone(&self) -> Self {
+        // SAFETY: We have a successful vmap already, so this can't fail
+        unsafe { self.owner.owned_vmap().unwrap_unchecked() }
+    }
+}
+
+impl<'a, D: DriverObject, const SIZE: usize> From<VMapRef<'a, D, SIZE>> for VMap<D, SIZE> {
+    fn from(value: VMapRef<'a, D, SIZE>) -> Self {
+        let this = Self {
+            map: value.map.raw_map.clone(),
+            owner: value.owner.into(),
+        };
+
+        mem::forget(value);
+        this
+    }
+}
+
+impl<D: DriverObject, const SIZE: usize> VMap<D, SIZE> {
+    /// Return a reference to the iosys map for this `VMap`.
+    #[inline]
+    pub fn get(&self) -> IoSysMapRef<'_, SIZE> {
+        // SAFETY:
+        // - The size of the iosys_map is equivalent to the size of the gem object.
+        // - `size` is >= SIZE according to our type invariants, ensuring that we can never pass an
+        //   invalid `size` to `IoSysMapRef::new().
+        unsafe {
+            IoSysMapRef::new(self.map.clone(), self.owner.size()).unwrap_unchecked()
+        }
+    }
+
+    /// Borrows a reference to the object that owns this virtual mapping.
+    pub fn owner(&self) -> &Object<D> {
+        &self.owner
+    }
+}
+
+impl<D: DriverObject, const SIZE: usize> Drop for VMap<D, SIZE> {
+    fn drop(&mut self) {
+        // SAFETY: Our existence is proof that this map was previously created using self.owner
+        unsafe { self.owner.raw_vunmap(&mut self.map) };
+    }
+}
+
+/// SAFETY: `iosys_map` objects are safe to send across threads.
+unsafe impl<D: DriverObject, const SIZE: usize> Send for VMap<D, SIZE> {}
+/// SAFETY: `iosys_map` objects are safe to send across threads.
+unsafe impl<D: DriverObject, const SIZE: usize> Sync for VMap<D, SIZE> {}
+
 /// An owned reference to a scatter-gather table of DMA address spans for a GEM shmem object.
 ///
 /// This object holds an owned reference to the underlying GEM shmem object, ensuring that the
diff --git a/rust/kernel/iosys_map.rs b/rust/kernel/iosys_map.rs
index 2070f0fb42cb8..b649d2de83093 100644
--- a/rust/kernel/iosys_map.rs
+++ b/rust/kernel/iosys_map.rs
@@ -33,7 +33,7 @@
 
 impl<const SIZE: usize> RawIoSysMap<SIZE> {
     /// Convert from a raw `bindings::iosys_map`.
-    #[expect(unused)]
+    #[allow(unused)]
     #[inline]
     pub(crate) fn from_raw(val: bindings::iosys_map) -> Self {
         Self(val)
@@ -139,7 +139,6 @@ impl<'a, const SIZE: usize> IoSysMapRef<'a, SIZE> {
     ///
     /// - The caller guarantees that the mapping is of at least `size` bytes.
     /// - The caller guarantees that the mapping remains valid for the lifetime of `'a`.
-    #[expect(unused)]
     pub(crate) unsafe fn new(map: RawIoSysMap<SIZE>, size: usize) -> Result<Self> {
         if size < SIZE {
             return Err(EINVAL);
-- 
2.53.0

