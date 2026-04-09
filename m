Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C64E10FC463
	for <nouveau@archiver.kernel.org>; Thu,  9 Apr 2026 00:16:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ECCA510E72B;
	Thu,  9 Apr 2026 00:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aZ6R+R5d";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1F91B456FF;
	Thu,  9 Apr 2026 00:04:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775693096;
 b=R+fDPIJ1v4awG3u9HeG91kHxrnhw4X6YqpByqQqHR3iFOt9+JjE5M/F2gpdRix+KX36Z+
 2344CXwftukfpCHmRnQl+9KWDI/rWkRJqyeRzFxTPWMxcuT5N5A9e+3BgVLAAvjoux4jV1U
 9VmB3FtJSIAvV/4FjsIzTe2e5fPC2xXgfxFSs3tUmobzxMyxmn270scBGGaeXsy3dp+VlgQ
 iNKzs5pC+8b9AJMkd80wdP1UPKg6hc7aLr4IVXPjRK7m5ApZk6BczPmuXdhBPpac97fpuSh
 sVcts3veAKG0GMiW2vi5KTNzsT1inl3Klj/6O4TnFNuuiUYtvzQRpI9V05cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775693096; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=J51JV2t8ATxq3MTpYcX2Nv/NU8nxD8jdNfnruXWJzCw=;
 b=L6FtLeJ6QIjsJH3YoMavXWNxkPepW28hWPZOubHZm/msRnSYikrUiHw4I/8WtWusysMNS
 VOiaZK0Ah4B//zaWkuDSETBys7TemOr1PuXK4T6W7XxZK4hpmBi5Wv1ZSCghZUTp+g1rmjp
 8lZU6AoOi1G/kqGgyaIvB2kTLteKKbEWYsVSJs0Iw9xNKw2X03u3RqRfvIum+zxW4tGOllv
 Pw6Iy/C+dfZWozwjkMMplXot98IRQqp6XWW37DACO4qTIxH+0SuoHhSsg51OjbWxmkBA7NN
 TDQQ4210txGAu0Yw9wBJ7IBWXx3GlwSyroJC/GoYVXjunzLnloBxNqTOg2gw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4C9C84527F
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 00:04:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA97910E72A
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 00:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775693791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J51JV2t8ATxq3MTpYcX2Nv/NU8nxD8jdNfnruXWJzCw=;
	b=aZ6R+R5dmIlTtxkuX2YWbK0RVfjgk7/jwin7mxKrqrmawEsRn6pK4eB8+6rcM2EagJOKw0
	aPlDcrANCZHPbEFIZzuGeJDGT3NgOJFhUIH0b1gYunQjqMJ1DOsCR8cguo08BRfgr9oGpC
	hHbyxgjtT6pJDIDAy3bCN0NTi4vD1Dk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-388-0B8VsfYfNTOhlIIcB-OLUQ-1; Wed,
 08 Apr 2026 20:16:28 -0400
X-MC-Unique: 0B8VsfYfNTOhlIIcB-OLUQ-1
X-Mimecast-MFC-AGG-ID: 0B8VsfYfNTOhlIIcB-OLUQ_1775693784
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B7D701800359;
	Thu,  9 Apr 2026 00:16:24 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.49])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1BD2E30001BB;
	Thu,  9 Apr 2026 00:16:20 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 4/5] rust: drm: gem: Introduce shmem::SGTable
Date: Wed,  8 Apr 2026 20:12:50 -0400
Message-ID: <20260409001559.622026-5-lyude@redhat.com>
In-Reply-To: <20260409001559.622026-1-lyude@redhat.com>
References: <20260409001559.622026-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 8lR5Oz3jLFJV2rrIT9jSLVshRA4T2vYYLasBJ93fdeM_1775693784
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: QMYX4QKQPUGLNSU5Q27MNO25ADTUTYKC
X-Message-ID-Hash: QMYX4QKQPUGLNSU5Q27MNO25ADTUTYKC
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QMYX4QKQPUGLNSU5Q27MNO25ADTUTYKC/>
Archived-At: 
 <https://lore.freedesktop.org/20260409001559.622026-5-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

In order to do this, we need to be careful to ensure that any interface we
expose for scatterlists ensures that any mappings created from one are
destroyed on driver-unbind. To do this, we introduce a Devres resource into
shmem::Object that we use in order to ensure that we release any SGTable
mappings on driver-unbind. We store this in an UnsafeCell and protect
access to it using the dma_resv lock that we already have from the shmem
gem object, which is the same lock that currently protects
drm_gem_object_shmem->sgt.

We also provide two different methods for acquiring an sg table:
self.sg_table(), and self.owned_sg_table(). The first function is for
short-term uses of mapped SGTables, the second is for callers that need to
hold onto the mapped SGTable for an extended period of time. The second
variant uses Devres of course, whereas the first simply relies on rust's
borrow checker to prevent driver-unbind when using the mapped SGTable.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Rename OwnedSGTable to shmem::SGTable. Since the current version of the
  SGTable abstractions now has a `Owned` and `Borrowed` variant, I think
  renaming this to shmem::SGTable makes things less confusing.
  We do however, keep the name of owned_sg_table() as-is.
V4:
* Clarify safety comments for SGTable to explain why the object is
  thread-safe.
* Rename from SGTableRef to SGTable
V10:
* Use Devres in order to ensure that SGTables are revocable, and are
  unmapped on driver-unbind.

 rust/kernel/drm/gem/shmem.rs | 191 ++++++++++++++++++++++++++++++++++-
 1 file changed, 189 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index c643f18b20838..111be446213df 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -11,25 +11,38 @@
 
 use crate::{
     container_of,
+    device::{
+        self,
+        Bound, //
+    },
+    devres::*,
     drm::{
         driver,
         gem,
         private::Sealed, //
         Device,
     },
-    error::to_result,
+    error::{
+        from_err_ptr, //
+        to_result,
+    },
     prelude::*,
+    scatterlist,
     types::{
         ARef,
         Opaque, //
     }, //
 };
 use core::{
+    cell::UnsafeCell,
     ops::{
         Deref,
         DerefMut, //
     },
-    ptr::NonNull,
+    ptr::{
+        self,
+        NonNull, //
+    },
 };
 use gem::{
     BaseObjectPrivate,
@@ -65,6 +78,10 @@ pub struct Object<T: DriverObject> {
     obj: Opaque<bindings::drm_gem_shmem_object>,
     /// Parent object that owns this object's DMA reservation object.
     parent_resv_obj: Option<ARef<Object<T>>>,
+    /// Devres object for unmapping any SGTable on driver-unbind.
+    ///
+    /// This is protected by the object's dma_resv lock.
+    sgt_res: UnsafeCell<Option<Devres<SGTableMap<T>>>>,
     #[pin]
     inner: T,
 }
@@ -117,6 +134,7 @@ pub fn new(
             try_pin_init!(Self {
                 obj <- Opaque::init_zeroed(),
                 parent_resv_obj: config.parent_resv_obj.map(|p| p.into()),
+                sgt_res: UnsafeCell::new(None),
                 inner <- T::new(dev, size, args),
             }),
             GFP_KERNEL,
@@ -176,6 +194,100 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
         // SAFETY: We're recovering the Kbox<> we created in gem_create_object()
         let _ = unsafe { KBox::from_raw(this) };
     }
+
+    // If necessary, create an SGTable for the gem object and register a Devres for it to ensure
+    // that it is unmapped on driver unbind.
+    fn create_sg_table<'a>(
+        &'a self,
+        dev: &'a device::Device<Bound>,
+    ) -> Result<&'a Devres<SGTableMap<T>>> {
+        let ret;
+        let sgt_res_ptr = self.sgt_res.get();
+
+        // SAFETY: This lock is initialized throughout the lifetime of the gem object
+        unsafe { bindings::dma_resv_lock(self.raw_dma_resv(), ptr::null_mut()) };
+
+        // SAFETY: We just grabbed the lock required for reading this data above.
+        let sgt_res = unsafe { (*sgt_res_ptr).as_ref() };
+        if let Some(sgt_res) = sgt_res {
+            // We already have a Devres object for this sg table, return it
+            ret = Ok(sgt_res);
+        } else {
+            // SAFETY: We grabbed the lock required for calling this function above */
+            let sgt = from_err_ptr(unsafe {
+                bindings::drm_gem_shmem_get_pages_sgt_locked(self.as_raw_shmem())
+            });
+
+            if let Err(e) = sgt {
+                ret = Err(e);
+            } else {
+                // INVARIANT:
+                // - We called drm_gem_shmem_get_pages_sgt_locked above and checked that it
+                //   succeeded, fulfilling the invariant of SGTableRef that the object's `sgt` field
+                //   is initialized.
+                // - We store this Devres in the object itself and don't move it, ensuring that the
+                //   object it points to remains valid for the lifetime of the SGTableRef.
+                let devres = Devres::new(dev, init!(SGTableMap { obj: self.into() }));
+                match devres {
+                    Ok(devres) => {
+                        // SAFETY: We acquired the lock protecting this data above, making it safe
+                        // to write into here
+                        unsafe { (*sgt_res_ptr) = Some(devres) };
+
+                        // SAFETY: We just write Some() into *sgt_res_ptr above
+                        ret = Ok(unsafe { (&*sgt_res_ptr).as_ref().unwrap_unchecked() });
+                    }
+                    Err(e) => {
+                        // We can't make sure that the pages for this object are unmapped on
+                        // driver-unbind, so we need to release the sgt
+                        // SAFETY:
+                        // - We grabbed the lock required for calling this function above
+                        // - We checked above that get_pages_sgt_locked() was successful
+                        unsafe { bindings::__drm_gem_shmem_free_sgt_locked(self.as_raw_shmem()) };
+
+                        ret = Err(e);
+                    }
+                }
+            }
+        }
+
+        // SAFETY: We're releasing the lock that we grabbed above.
+        unsafe { bindings::dma_resv_unlock(self.raw_dma_resv()) };
+
+        ret
+    }
+
+    /// Creates (if necessary) and returns an immutable reference to a scatter-gather table of DMA
+    /// pages for this object.
+    ///
+    /// This will pin the object in memory.
+    #[inline]
+    pub fn sg_table<'a>(
+        &'a self,
+        dev: &'a device::Device<Bound>,
+    ) -> Result<&'a scatterlist::SGTable> {
+        let sgt = self.create_sg_table(dev)?;
+
+        Ok(sgt.access(dev)?.deref())
+    }
+
+    /// Creates (if necessary) and returns an owned reference to a scatter-gather table of DMA pages
+    /// for this object.
+    ///
+    /// This is the same as [`sg_table`](Self::sg_table), except that it instead returns an
+    /// [`shmem::SGTable`] which holds a reference to the associated gem object, instead of a
+    /// reference to an [`scatterlist::SGTable`].
+    ///
+    /// This will pin the object in memory.
+    ///
+    /// [`shmem::SGTable`]: SGTable
+    pub fn owned_sg_table(&self, dev: &device::Device<Bound>) -> Result<SGTable<T>> {
+        self.create_sg_table(dev)?;
+
+        // INVARIANT: We just ensured above that `self.sgt_res` is initialized with
+        // `Some(Devres<SGTableMap<T>>)`.
+        Ok(SGTable(self.into()))
+    }
 }
 
 impl<T: DriverObject> Deref for Object<T> {
@@ -226,3 +338,78 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
         dumb_map_offset: None,
     };
 }
+
+/// A reference to a GEM object that is known to have a mapped [`SGTable`].
+///
+/// This is used by the Rust bindings with [`Devres`] in order to ensure that mappings for SGTables
+/// on GEM shmem objects are revoked on driver-unbind.
+///
+/// # Invariants
+///
+/// - `self.obj` always points to a valid GEM object.
+/// - This object is proof that `self.0.owner.sgt` has an initialized and valid SGTable.
+pub struct SGTableMap<T: DriverObject> {
+    obj: NonNull<Object<T>>,
+}
+
+impl<T: DriverObject> Deref for SGTableMap<T> {
+    type Target = scatterlist::SGTable;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY:
+        // - The NonNull is guaranteed to be valid via our type invariants.
+        // - The sgt field is guaranteed to be initialized and valid via our type invariants.
+        unsafe { scatterlist::SGTable::from_raw((*self.obj.as_ref().as_raw_shmem()).sgt) }
+    }
+}
+
+impl<T: DriverObject> Drop for SGTableMap<T> {
+    fn drop(&mut self) {
+        // SAFETY: `obj` is always valid via our type invariants
+        let obj = unsafe { self.obj.as_ref() };
+
+        // SAFETY: The dma_resv for GEM objects is initialized throughout its lifetime
+        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
+
+        // SAFETY: We acquired the lock needed for calling this function above
+        unsafe { bindings::__drm_gem_shmem_free_sgt_locked(obj.as_raw_shmem()) };
+
+        // SAFETY: We are releasing the lock we acquired above.
+        unsafe { bindings::dma_resv_unlock(obj.raw_dma_resv()) };
+    }
+}
+
+// SAFETY: The NonNull in SGTableRef is guaranteed valid by our type invariants, and the GEM object
+// it points to is guaranteed to be thread-safe.
+unsafe impl<T: DriverObject> Send for SGTableMap<T> {}
+// SAFETY: The NonNull in SGTableRef is guaranteed valid by our type invariants, and the GEM object
+// it points to is guaranteed to be thread-safe.
+unsafe impl<T: DriverObject> Sync for SGTableMap<T> {}
+
+/// An owned reference to a scatter-gather table of DMA address spans for a GEM shmem object.
+///
+/// This object holds an owned reference to the underlying GEM shmem object, ensuring that the
+/// [`scatterlist::SGTable`] referenced by this type remains valid for the lifetime of this object.
+///
+/// # Invariants
+///
+/// - This type is proof that `self.0.sgt_res` is initialized with a `Some(Devres<SGTableMap<T>>)`.
+/// - This object is only exposed in situations where we know the underlying `SGTable` will not be
+///   modified for the lifetime of this object. Thus, it is safe to send/access this type across
+///   threads.
+pub struct SGTable<T: DriverObject>(ARef<Object<T>>);
+
+// SAFETY: This object is thread-safe via our type invariants.
+unsafe impl<T: DriverObject> Send for SGTable<T> {}
+// SAFETY: This object is thread-safe via our type invariants.
+unsafe impl<T: DriverObject> Sync for SGTable<T> {}
+
+impl<T: DriverObject> Deref for SGTable<T> {
+    type Target = Devres<SGTableMap<T>>;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: `self.owner.sgt_res` is guaranteed to be initialized with
+        // `Some(Devres<SGTableMap<T>>)` via our type invariants
+        unsafe { (*self.0.sgt_res.get()).as_ref().unwrap_unchecked() }
+    }
+}
-- 
2.53.0

