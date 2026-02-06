Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C1CEE6B66
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 22:35:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F19510E96E;
	Fri,  6 Feb 2026 22:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B9LdHIIj";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0ACB241E53;
	Fri,  6 Feb 2026 22:26:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770416782;
 b=tFTDaYIeqvzZokduKF/s2V3zYXAOl8oxpCmKRhWNtGPJBFmLbHIjeych+YSw2BwDaZgVy
 wZ5uQ1KaZwQGXy/C4eBM+4Rr59QDlxt55sX1xcJqAz1hD5ENnHDdDkbOLQaEtoBYlLGrc6O
 eTUjnIGCokaj52qdGnIS9WlNZWyLjI2Yy8lZv2P707QnwQjHjLahh7rdwWP6A6R3xYUPmnF
 /UBuBw5nzrmjt3h7zffdj25FmMydFnl5g/V5J+rT99f5KO4V3uufqOSOdxauIFg4/P5eW7h
 bZuAuUB5TcUXtcMJNhjp+hgRbc+goNXx+CD402me3Pf/o0i/C1lWnhSp0Rvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770416782; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ubWrbzuOvF2ccvY5WkapIB6gOHOp4NqWeBmUs5KhfrE=;
 b=M8OmHHeMJtwwJgYhnIke9Q3Ng0Txm8AXOGaPBQXqzNELUsboZo9+E2YOKtY1e8ir/Qa/m
 YEOrLXgzAPixpNRjYWsT7PnUMf1kC8cHSK37iBLFxJGDFgD6dZeANA3dvp2TxixTEcn4oJR
 O6XgtD3BrCmK4PQf8BCl518ziLmGKQ+YjyLlYM6mJdLNWo7u/JA6QRiVgyE3tfDlTLLMj3y
 9/BqzBA0djLgCPM3yc9FS/UqXVF7hwPL5G+XY3w/zpelaPlGOKpkfXba9FtMMk2mpScL5WZ
 DmN00IkJma8b0M1YYJ3axX4n6Eq4yXdMrCjMjoLsBxfVbiZQ9VZ/LCVgpI+w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 87B2341B4C
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 22:26:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 547A810E957
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 22:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770417342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ubWrbzuOvF2ccvY5WkapIB6gOHOp4NqWeBmUs5KhfrE=;
	b=B9LdHIIj35DK5UiDc66NSKHjjWGI7w9ZjdWm+pv2oEt7yVHWuXhqsdcP9puk5kct43r5sn
	+cFXUmEQOu/BS8VMqBDx4Q7eJ81mUTJUOHRRkoutwKz9tY7DokkteBfGkE/L/4P4o3Nn9I
	lFEYSvtEUeN9pE91JFboFeTXZ7xkci4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-uf5L_7eDOcONEtUO0AFdgA-1; Fri,
 06 Feb 2026 17:35:39 -0500
X-MC-Unique: uf5L_7eDOcONEtUO0AFdgA-1
X-Mimecast-MFC-AGG-ID: uf5L_7eDOcONEtUO0AFdgA_1770417337
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AFAD01800349;
	Fri,  6 Feb 2026 22:35:37 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.226])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 36D7119373D8;
	Fri,  6 Feb 2026 22:35:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v7 6/7] rust: Introduce iosys_map bindings
Date: Fri,  6 Feb 2026 17:34:30 -0500
Message-ID: <20260206223431.693765-7-lyude@redhat.com>
In-Reply-To: <20260206223431.693765-1-lyude@redhat.com>
References: <20260206223431.693765-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 2TSRdHDhHr4qxjj0HN0qoBO9r-FbkVGQcjif8mBPXuQ_1770417337
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: NA6LMW422YMK4V6ZN2PP33TOX44ZBHER
X-Message-ID-Hash: NA6LMW422YMK4V6ZN2PP33TOX44ZBHER
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NA6LMW422YMK4V6ZN2PP33TOX44ZBHER/>
Archived-At: 
 <https://lore.freedesktop.org/20260206223431.693765-7-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This introduces a set of bindings for working with iosys_map in rust code
using the new Io traits.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V5:
- Fix incorrect field size being passed to iosys_map_memcpy_to()
- Add an additional unit test, basic_macro(), which can successfully catch
  the above issue so it doesn't happen again in the future.
V6:
- Drop as_slice/as_mut_slice (Alice Rhyl)
V7:
- Start using Alexandre Courbot's wonderful Io, IoCapable and IoKnownSize
  traits instead of trying to roll our own IO accessors. This also changes
  the following:
  - We don't have a custom AsBytes/FromBytes type that we carry around any
    longer with maps
  - We now have optional compile-time size checking
  - We don't need our own unit tests anymore
  - RawIoSysMap can be used for unsafe IO operations, because why not.
  - IoSysMapRef::new() can fail now since it needs to ensure SIZE is valid.
  - We don't implement Deref<RawIoSysMap> for IoSysMapRef any longer. The
    main reason for this is that we want to avoid users having to manually
    specify if they want the RawIoSysMap or IoSysMapRef variant functions
    like io_read()/io_write().
    This is fine IMHO, but to make sure things remain easy for APIs that
    wrap around iosys map we make IoSysMapRef.raw_map pub(crate).

 rust/helpers/helpers.c   |   1 +
 rust/helpers/iosys_map.c |  34 +++++++
 rust/kernel/iosys_map.rs | 211 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs       |   1 +
 4 files changed, 247 insertions(+)
 create mode 100644 rust/helpers/iosys_map.c
 create mode 100644 rust/kernel/iosys_map.rs

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 1d3333cc0d2a8..bd8ad237aa02e 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -31,6 +31,7 @@
 #include "irq.c"
 #include "fs.c"
 #include "io.c"
+#include "iosys_map.c"
 #include "jump_label.c"
 #include "kunit.c"
 #include "maple_tree.c"
diff --git a/rust/helpers/iosys_map.c b/rust/helpers/iosys_map.c
new file mode 100644
index 0000000000000..6861d4ec48a4b
--- /dev/null
+++ b/rust/helpers/iosys_map.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/iosys-map.h>
+#include <linux/types.h>
+
+#define rust_iosys_map_rd(type__)                                                       \
+	__rust_helper type__                                                            \
+	rust_helper_iosys_map_rd_ ## type__(const struct iosys_map *map, size_t offset) \
+	{                                                                               \
+		return iosys_map_rd(map, offset, type__);                               \
+	}
+#define rust_iosys_map_wr(type__)                                                       \
+	__rust_helper void                                                              \
+	rust_helper_iosys_map_wr_ ## type__(const struct iosys_map *map, size_t offset, \
+					    type__ value)                               \
+	{                                                                               \
+		iosys_map_wr(map, offset, type__, value);                               \
+	}
+
+rust_iosys_map_rd(u8);
+rust_iosys_map_rd(u16);
+rust_iosys_map_rd(u32);
+
+rust_iosys_map_wr(u8);
+rust_iosys_map_wr(u16);
+rust_iosys_map_wr(u32);
+
+#ifdef CONFIG_64BIT
+rust_iosys_map_rd(u64);
+rust_iosys_map_wr(u64);
+#endif
+
+#undef rust_iosys_map_rd
+#undef rust_iosys_map_wr
diff --git a/rust/kernel/iosys_map.rs b/rust/kernel/iosys_map.rs
new file mode 100644
index 0000000000000..2070f0fb42cb8
--- /dev/null
+++ b/rust/kernel/iosys_map.rs
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! IO-agnostic memory mapping interfaces.
+//!
+//! This crate provides bindings for the `struct iosys_map` type, which provides a common interface
+//! for memory mappings which can reside within coherent memory, or within IO memory.
+//!
+//! C header: [`include/linux/iosys-map.h`](srctree/include/linux/pci.h)
+
+use crate::{
+    error::code::*,
+    io::{
+        Io,
+        IoCapable,
+        IoKnownSize, //
+    },
+    prelude::*, //
+};
+use bindings;
+use core::marker::PhantomData;
+
+/// Raw unsized representation of a `struct iosys_map`.
+///
+/// This struct is a transparent wrapper around `struct iosys_map`. The C API does not provide the
+/// size of the mapping by default, and thus this type also does not include the size of the
+/// mapping. As such, it cannot be used for actually accessing the underlying data pointed to by the
+/// mapping.
+///
+/// With the exception of kernel crates which may provide their own wrappers around `RawIoSysMap`,
+/// users will typically not interact with this type directly.
+#[repr(transparent)]
+pub struct RawIoSysMap<const SIZE: usize = 0>(bindings::iosys_map);
+
+impl<const SIZE: usize> RawIoSysMap<SIZE> {
+    /// Convert from a raw `bindings::iosys_map`.
+    #[expect(unused)]
+    #[inline]
+    pub(crate) fn from_raw(val: bindings::iosys_map) -> Self {
+        Self(val)
+    }
+
+    /// Returns whether the mapping is within IO memory space or not.
+    #[inline]
+    pub fn is_iomem(&self) -> bool {
+        self.0.is_iomem
+    }
+
+    /// Convert from a `RawIoSysMap<SIZE>` to a raw `bindings::iosys_map` ref.
+    #[expect(unused)]
+    #[inline]
+    pub(crate) fn as_raw(&self) -> &bindings::iosys_map {
+        &self.0
+    }
+
+    /// Convert from a `RawIoSysMap<SIZE>` to a raw mutable `bindings::iosys_map` ref.
+    #[allow(unused)]
+    #[inline]
+    pub(crate) fn as_raw_mut(&mut self) -> &mut bindings::iosys_map {
+        &mut self.0
+    }
+
+    /// Returns the address pointed to by this iosys map.
+    ///
+    /// Note that this address is not guaranteed to be valid, and may or may not reside in I/O
+    /// memory.
+    #[inline]
+    pub fn addr(&self) -> usize {
+        (if self.is_iomem() {
+            // SAFETY: We confirmed above that this iosys map is contained within iomem, so it's
+            // safe to read vaddr_iomem
+            unsafe { self.0.__bindgen_anon_1.vaddr_iomem }
+        } else {
+            // SAFETY: We confirmed above that this iosys map is not contaned within iomem, so it's
+            // safe to read vaddr.
+            unsafe { self.0.__bindgen_anon_1.vaddr }
+        }) as usize
+    }
+}
+
+// SAFETY: As we make no guarantees about the validity of the mapping, there's no issue with sending
+// this type between threads.
+unsafe impl<const SIZE: usize> Send for RawIoSysMap<SIZE> {}
+
+impl<const SIZE: usize> Clone for RawIoSysMap<SIZE> {
+    fn clone(&self) -> Self {
+        Self(self.0)
+    }
+}
+
+macro_rules! impl_raw_iosys_map_io_capable {
+    ($ty:ty, $read_fn:ident, $write_fn:ident) => {
+        impl<const SIZE: usize> IoCapable<$ty> for RawIoSysMap<SIZE> {
+            #[inline(always)]
+            unsafe fn io_read(&self, address: usize) -> $ty {
+                // SAFETY: By the trait invariant `address` is a valid address for iosys map
+                // operations.
+                unsafe { bindings::$read_fn(&self.0, address) }
+            }
+
+            #[inline(always)]
+            unsafe fn io_write(&self, value: $ty, address: usize) {
+                // SAFETY: By the trait invariant `address` is a valid address for iosys map
+                // operations.
+                unsafe { bindings::$write_fn(&self.0, address, value) };
+            }
+        }
+    };
+}
+
+impl_raw_iosys_map_io_capable!(u8, iosys_map_rd_u8, iosys_map_wr_u8);
+impl_raw_iosys_map_io_capable!(u16, iosys_map_rd_u16, iosys_map_wr_u16);
+impl_raw_iosys_map_io_capable!(u32, iosys_map_rd_u32, iosys_map_wr_u32);
+#[cfg(CONFIG_64BIT)]
+impl_raw_iosys_map_io_capable!(u64, iosys_map_rd_u64, iosys_map_wr_u64);
+
+/// A sized version of a [`RawIoSysMap`].
+///
+/// This type includes the runtime size of the [`RawIoSysMap`] and can be used for checked I/O
+/// operations.
+///
+/// # Invariants
+///
+/// - The iosys mapping referenced by this type is guaranteed to be of at least `size` bytes in
+///   size
+/// - The iosys mapping referenced by this type is valid for the lifetime `'a`.
+#[derive(Clone)]
+pub struct IoSysMapRef<'a, const SIZE: usize = 0> {
+    pub(crate) raw_map: RawIoSysMap<SIZE>,
+    size: usize,
+    _p: PhantomData<&'a ()>,
+}
+
+impl<'a, const SIZE: usize> IoSysMapRef<'a, SIZE> {
+    /// Create a new [`IoSysMapRef`] from a [`RawIoSysMap`].
+    ///
+    /// Returns an error if the specified size is invalid.
+    ///
+    /// # Safety
+    ///
+    /// - The caller guarantees that the mapping is of at least `size` bytes.
+    /// - The caller guarantees that the mapping remains valid for the lifetime of `'a`.
+    #[expect(unused)]
+    pub(crate) unsafe fn new(map: RawIoSysMap<SIZE>, size: usize) -> Result<Self> {
+        if size < SIZE {
+            return Err(EINVAL);
+        }
+
+        Ok(Self {
+            raw_map: map,
+            size,
+            _p: PhantomData,
+        })
+    }
+
+    /// Returns whether the mapping is within IO memory space or not.
+    #[inline]
+    pub fn is_iomem(&self) -> bool {
+        self.raw_map.is_iomem()
+    }
+
+    /// Returns the address pointed to by this iosys map.
+    ///
+    /// Note that this address is not guaranteed to be valid, and may or may not reside in I/O
+    /// memory.
+    #[inline]
+    pub fn addr(&self) -> usize {
+        self.raw_map.addr()
+    }
+}
+
+macro_rules! impl_iosys_map_io_capable {
+    ($ty:ty) => {
+        impl<'a, const SIZE: usize> IoCapable<$ty> for IoSysMapRef<'a, SIZE> {
+            #[inline(always)]
+            unsafe fn io_read(&self, address: usize) -> $ty {
+                // SAFETY: By the trait invariant `address` is a valid address for iosys map
+                // operations.
+                unsafe { self.raw_map.io_read(address) }
+            }
+
+            #[inline(always)]
+            unsafe fn io_write(&self, value: $ty, address: usize) {
+                // SAFETY: By the trait invariant `address` is a valid address for iosys map
+                // operations.
+                unsafe { self.raw_map.io_write(value, address) };
+            }
+        }
+    };
+}
+
+impl_iosys_map_io_capable!(u8);
+impl_iosys_map_io_capable!(u16);
+impl_iosys_map_io_capable!(u32);
+#[cfg(CONFIG_64BIT)]
+impl_iosys_map_io_capable!(u64);
+
+impl<'a, const SIZE: usize> Io for IoSysMapRef<'a, SIZE> {
+    #[inline]
+    fn addr(&self) -> usize {
+        self.raw_map.addr()
+    }
+
+    #[inline]
+    fn maxsize(&self) -> usize {
+        self.size
+    }
+}
+
+impl<'a, const SIZE: usize> IoKnownSize for IoSysMapRef<'a, SIZE> {
+    const MIN_SIZE: usize = SIZE;
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6d637e2fed1b6..02385af66fde2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -103,6 +103,7 @@
 pub mod init;
 pub mod io;
 pub mod ioctl;
+pub mod iosys_map;
 pub mod iov;
 pub mod irq;
 pub mod jump_label;
-- 
2.53.0

