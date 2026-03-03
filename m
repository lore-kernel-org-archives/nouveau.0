Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60727EDA69A
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 16:23:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 30B3710E867;
	Tue,  3 Mar 2026 16:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pJgBC+lu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 12A3944DA0;
	Tue,  3 Mar 2026 16:13:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772554403;
 b=WggU8sDlia4OpRSehMwoQuD9P/s81n32PLThta0g3zPOl25s2ewvj12b5O84DmtMCHjOZ
 /QO5KnPDxRoTW+RoFh+zPbazzXn64CNPUPn4SMnVnpDFM73CI58ilaVUC9WszyMu2T72CMd
 HlynZ237Vlw5nEV8PGbG+FD3M5hluVcxeNAbv49pvlzqrl9EHrEC4mMLo8n6soOpovYamXY
 n6brLA8znvAjCzj/c/b+HPxeelDS6y6mkS36PzwXMDc2GZRxR12cxy3XL4PKK5UZiTM/2o8
 JRNe/zWZ205Zszh2gJmGkgDMHvu15Rjdz7cYb81+XcVHzCl3PBY6OW9gnbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772554403; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=apPWDpK2wPBE4DS4Px0iSeeqAsA+RDKGWK4F4URCgq0=;
 b=yLMNV1y1SrWm0N9dYmslN+u4QXapCUDJoozUfcUP7c3ZAfRStdA2V9luZrechx8Usjb8g
 xfBwH0ujqBebt1MJm1qwqkPtomUkkbTFAgXUCMHmb93IDLbWPDUblcp5GN9dNeNv+FkKUAN
 j0ev0CHlU1q0PhLnBI/jH5hRyHaiNo2lVEKmUu9lU+91U32srKj6O+lODyG2jDLw/xlZy+W
 /cILtqgBNNCZGc6/l+xFlqUHY2QB3Vzjx1RcmDyuPWr2bD/BzsoHxXzmvlH3mXciEL37NA5
 sPe92cBRZKEXuTK1ecilZKk202WtiLVQaaJ1GrLosVWtyPZ/nG7/zZdtxMGA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 238F344CD7
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 16:13:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0986210E859;
	Tue,  3 Mar 2026 16:23:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 762B060008;
	Tue,  3 Mar 2026 16:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7715CC2BCB0;
	Tue,  3 Mar 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555018;
	bh=lvS+2efafKwewwHd7ONO5y6+Y49CgHw8VIi3bRKXV+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJgBC+luK2vnGf5VECQogdIin5ejUVwJ/MBgNwPKigPRYTo/X/75Uvpvtl1UqQyl7
	 RbTf4I7YXeQzkGZSuMMi78LymclByTCU/nZCfaFzxJ3PjPARKunoJjZUIpRLe2KBhD
	 0kFdsmbFWb2lB/vgFeBoJPn9gAJLrdmfZTnYToaYTzHAynJXDe4dKlQVT46ytElXSm
	 CSnqQ/AHK1LQzsN4CM3fCW3iI+0Dl4grK40RbexUN5CeBKI3ypdKx8jdxNY+x03fEm
	 JE8W+fRcAnDYouuuGTOWAOeQleLw2OGwaK/NVpTLWuyjU2jN/+g7NBnlqHtpldZ09j
	 2f8W8c8jXw6YA==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com
Subject: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory
 initialization
Date: Tue,  3 Mar 2026 17:22:55 +0100
Message-ID: <20260303162314.94363-5-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303162314.94363-1-dakr@kernel.org>
References: <20260303162314.94363-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BXJSDWFXYH2QNJAT22IHAOIRY7S2SXTQ
X-Message-ID-Hash: BXJSDWFXYH2QNJAT22IHAOIRY7S2SXTQ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BXJSDWFXYH2QNJAT22IHAOIRY7S2SXTQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260303162314.94363-5-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Currently, dma::Coherent cannot safely provide (mutable) access to its
underlying memory because the memory might be concurrently accessed by a
DMA device. This makes it difficult to safely initialize the memory
before handing it over to the hardware.

Introduce dma::CoherentInit, a type that encapsulates a dma::Coherent
before its DMA address is exposed to the device. dma::CoherentInit can
guarantee exclusive access to the inner dma::Coherent and implement
Deref and DerefMut.

Once the memory is properly initialized, dma::CoherentInit can be
converted into a regular dma::Coherent.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 153 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 291fdea3b52b..79dd8717ac47 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -20,7 +20,13 @@
         FromBytes, //
     }, //
 };
-use core::ptr::NonNull;
+use core::{
+    ops::{
+        Deref,
+        DerefMut, //
+    },
+    ptr::NonNull, //
+};
 
 /// DMA address type.
 ///
@@ -352,6 +358,151 @@ fn from(direction: DataDirection) -> Self {
     }
 }
 
+/// Initializer type for [`Coherent`].
+///
+/// A [`Coherent`] object can't provide access to its memory as (mutable) slice safely, since it
+/// can't fulfill the requirements for creating a slice. For instance, it is not valid to have a
+/// (mutable) slice to of the memory of a [`Coherent`] while the memory might be accessed by a
+/// device.
+///
+/// In contrast, this initializer type is able to fulfill the requirements to safely obtain a
+/// (mutable) slice, as it neither provides access to the DMA address of the embedded [`Coherent`],
+/// nor can it be used with the DMA projection accessors.
+///
+/// Once initialized, this type can be converted to a regular [`Coherent`] object.
+///
+/// # Examples
+///
+/// `CoherentInit<T>`:
+///
+/// ```
+/// # use kernel::device::{
+/// #     Bound,
+/// #     Device,
+/// # };
+/// use kernel::dma::{attrs::*,
+///     Coherent,
+///     CoherentInit,
+/// };
+///
+/// # fn test(dev: &Device<Bound>) -> Result {
+/// let mut dmem: CoherentInit<u64> =
+///     CoherentInit::zeroed_with_attrs(dev, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+/// *dmem = 42;
+/// let dmem: Coherent<u64> = dmem.into();
+/// # Ok::<(), Error>(()) }
+/// ```
+///
+/// `CoherentInit<[T]>`:
+///
+///
+/// ```
+/// # use kernel::device::{
+/// #     Bound,
+/// #     Device,
+/// # };
+/// use kernel::dma::{attrs::*,
+///     Coherent,
+///     CoherentInit,
+/// };
+///
+/// # fn test(dev: &Device<Bound>) -> Result {
+/// let mut dmem: CoherentInit<[u64]> =
+///     CoherentInit::zeroed_slice_with_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+/// dmem.fill(42);
+/// let dmem: Coherent<[u64]> = dmem.into();
+/// # Ok::<(), Error>(()) }
+/// ```
+pub struct CoherentInit<T: AsBytes + FromBytes + KnownSize + ?Sized>(Coherent<T>);
+
+impl<T: AsBytes + FromBytes> CoherentInit<[T]> {
+    /// Initializer variant of [`Coherent::zeroed_slice_with_attrs`].
+    pub fn zeroed_slice_with_attrs(
+        dev: &device::Device<Bound>,
+        count: usize,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        Coherent::zeroed_slice_with_attrs(dev, count, gfp_flags, dma_attrs).map(Self)
+    }
+
+    /// Same as [CoherentInit::zeroed_slice_with_attrs], but with `dma::Attrs(0)`.
+    pub fn zeroed_slice(
+        dev: &device::Device<Bound>,
+        count: usize,
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<Self> {
+        Self::zeroed_slice_with_attrs(dev, count, gfp_flags, Attrs(0))
+    }
+
+    /// Initializes the element at `i` using the given initializer.
+    ///
+    /// Returns `EINVAL` if `i` is out of bounds.
+    pub fn init_at<E>(&mut self, i: usize, init: impl Init<T, E>) -> Result
+    where
+        Error: From<E>,
+    {
+        if i >= self.0.len() {
+            return Err(EINVAL);
+        }
+
+        let ptr = core::ptr::from_mut(&mut self[i]);
+
+        // SAFETY:
+        // - `ptr` is valid, properly aligned, and within this allocation.
+        // - `T: AsBytes + FromBytes` guarantees all bit patterns are valid, so partial writes on
+        //   error cannot leave the element in an invalid state.
+        // - The DMA address has not been exposed yet, so there is no concurrent device access.
+        unsafe { init.__init(ptr)? };
+
+        Ok(())
+    }
+}
+
+impl<T: AsBytes + FromBytes> CoherentInit<T> {
+    /// Same as [`CoherentInit::zeroed_slice_with_attrs`], but for a single element.
+    pub fn zeroed_with_attrs(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        Coherent::zeroed_with_attrs(dev, gfp_flags, dma_attrs).map(Self)
+    }
+
+    /// Same as [`CoherentInit::zeroed_slice`], but for a single element.
+    pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> Result<Self> {
+        Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
+    }
+}
+
+impl<T: AsBytes + FromBytes + KnownSize + ?Sized> Deref for CoherentInit<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY:
+        // - We have not exposed the DMA address yet, so there can't be any concurrent access by a
+        //   device.
+        // - We have exclusive access to `self.0`.
+        unsafe { self.0.as_ref() }
+    }
+}
+
+impl<T: AsBytes + FromBytes + KnownSize + ?Sized> DerefMut for CoherentInit<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY:
+        // - We have not exposed the DMA address yet, so there can't be any concurrent access by a
+        //   device.
+        // - We have exclusive access to `self.0`.
+        unsafe { self.0.as_mut() }
+    }
+}
+
+impl<T: AsBytes + FromBytes + KnownSize + ?Sized> From<CoherentInit<T>> for Coherent<T> {
+    fn from(value: CoherentInit<T>) -> Self {
+        value.0
+    }
+}
+
 /// An abstraction of the `dma_alloc_coherent` API.
 ///
 /// This is an abstraction around the `dma_alloc_coherent` API which is used to allocate and map
-- 
2.53.0

