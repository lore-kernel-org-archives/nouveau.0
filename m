Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5AB1094489
	for <nouveau@archiver.kernel.org>; Sat, 21 Mar 2026 18:22:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DC2F510E2C4;
	Sat, 21 Mar 2026 18:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="In99FVRi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7F67B4526B;
	Sat, 21 Mar 2026 18:11:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774116710;
 b=Y9xfbTngT0VWJnZUnOLh8qxHvYfMtMhGlxMBFfOxhvmcn9lLjAoeaJJNJUmFBlZpUjsSl
 LmEkTUIHGGpgPCVi514LuQ8M7n4V4H4oPPM2q6ABHIRaVzujhg7In7UktlSDRuJAHaoK78h
 YpeYJ2BBOIPuya3wjz5AMc2GKg6QT5UIeaL3NQY+wlcy+PAt3m2RXIdnWuqMJWnquPM+K/x
 sLVln4jYc0jhMBP2yEVV7au9I+xa9V8rYsKCYyKumC6c6S8ZNN3nRZdQfZJCyF7GZA7RAoF
 tayVTUWDTmx25SCeXLVSAL9c5ZN2eqEp+eIlJ6GpC+yBnIyWk4bc+uwboC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774116710; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rx271Vys573WUSndN0cUXWBBFipS7Agjmb/7ehghgQI=;
 b=arEGeVSqJgWpsvCYC9pAL/XiaVC1amaqaedTH64S9xOdqE6JX05oXEGESF0LqBBEm582r
 Z95htUB90wmPiC1uWsQOg6ODX3Pg6mCmrKGRQDdYlhrYw0wLSuBGZnp6tB9z20MMp5HVihs
 d/Z59bqIS+9Xv0KZK9IwiwdYXMxwPNKkcVx+x02veM1vua0gpz3aFcfuAUdwRi6L+cvQZBT
 PpIIVZsSFcLDREpIUoS3o+x9/QRgDPW7H58+My1b5Cgo7uXJ16vk6BIUqvivUeUmEhBbBRd
 fzhKc6tIgldMGigD7itczYw9HiOQkGSqmV1Gmand3wYUG9gEpii6pm1xQk3Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9FFE440214
	for <nouveau@lists.freedesktop.org>; Sat, 21 Mar 2026 18:11:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A23D10E211;
	Sat, 21 Mar 2026 18:22:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B61760097;
	Sat, 21 Mar 2026 18:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F40C19421;
	Sat, 21 Mar 2026 18:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774117364;
	bh=DxozQ+XKxQ0fD6TkCuvC+HyBcPkFBTcRM0Dqohddfo0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=In99FVRiLVR8JAEuAUj37ZAcjEfc/J9DLBPt7ErZAudMrz9sxPDkUu7kINQ53iphh
	 j4Y0tIsVIqCz28Y3qLSPlKHUN9V9U2iNt8bkhYaZTx9w3ESus1B3hfYqAQmGShk83Y
	 2jBI11W/0fVaX3WroucaUZ7HQMTvR6a7EY0ImrGrGRmIwl67Ea0cbgWxk/0d4xl/ZH
	 lDCTE9MEU7KNpB0SCqizoTGi8tTq1NCoerX1CNN1gWwMgeNIun78FOMf/x9iMlNOQf
	 vXtF8z+NLhwUn8dr2eBFpXV66WQXNC8mQr5mXzK/WsIqlU+2ONFN0GAGkqJ4sdEPt1
	 oX2ybLE9f/J7w==
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 19:22:39 +0100
Message-Id: <DH8O47F2GM1Z.3H3E13RSKIV22@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 8/8] gpu: nova-core: convert to new dma::Coherent API
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
References: <20260320194626.36263-1-dakr@kernel.org>
 <20260320194626.36263-9-dakr@kernel.org>
 <DH8M5QZKZETW.3TA4YS1SBAXDP@garyguo.net>
Content-Language: en-US
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=0
X-Identity-Key: id8
Fcc: imap://kernel%40dakr.org@imap.dakr.org/Sent
In-Reply-To: <DH8M5QZKZETW.3TA4YS1SBAXDP@garyguo.net>
Content-Transfer-Encoding: 7bit
X-TUID: 9r29XOjfZmFI
Message-ID-Hash: GAKCWZN3Q6XWJBQIHBLFY6CMGBHAFNLD
X-Message-ID-Hash: GAKCWZN3Q6XWJBQIHBLFY6CMGBHAFNLD
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com,
 driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GAKCWZN3Q6XWJBQIHBLFY6CMGBHAFNLD/>
Archived-At: 
 <https://lore.freedesktop.org/DH8O47F2GM1Z.3H3E13RSKIV22@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/21/26 5:50 PM, Gary Guo wrote:
> It looks like with Alex's "gpu: nova-core: create falcon firmware DMA objects
> lazily" landed, all others users of the old API are now gone.

Good catch.

> So this line could be dropped and `impl CoherentAllocation` and the type alias
> can be removed after this patch.

I will drop the line on apply and add the below patch to remove
CoherentAllocation.

- Danilo

commit e96bc0b65bec48ac0f1cf2fc15b39c1b26b9d973 (HEAD -> drm-rust-next)
Author: Danilo Krummrich <dakr@kernel.org>
Date:   Sat Mar 21 19:18:08 2026 +0100

    rust: dma: remove dma::CoherentAllocation<T>

    Now that everything has been converted to the new dma::Coherent<T> API,
    remove dma::CoherentAllocation<T>.

    Suggested-by: Gary Guo <gary@garyguo.net>
    Signed-off-by: Danilo Krummrich <dakr@kernel.org>

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 6d2bec52806b..779d4babab9a 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -841,156 +841,6 @@ pub fn len(&self) -> usize {
     }
 }

-// Type alias for compatibility.
-#[doc(hidden)]
-pub type CoherentAllocation<T> = Coherent<[T]>;
-
-impl<T: AsBytes + FromBytes> CoherentAllocation<T> {
-    /// Allocates a region of `size_of::<T> * count` of coherent memory.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// # use kernel::device::{Bound, Device};
-    /// use kernel::dma::{attrs::*, CoherentAllocation};
-    ///
-    /// # fn test(dev: &Device<Bound>) -> Result {
-    /// let c: CoherentAllocation<u64> =
-    ///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
-    /// # Ok::<(), Error>(()) }
-    /// ```
-    pub fn alloc_attrs(
-        dev: &device::Device<Bound>,
-        count: usize,
-        gfp_flags: kernel::alloc::Flags,
-        dma_attrs: Attrs,
-    ) -> Result<CoherentAllocation<T>> {
-        Coherent::alloc_slice_with_attrs(dev, count, gfp_flags, dma_attrs)
-    }
-
-    /// Performs the same functionality as [`CoherentAllocation::alloc_attrs`], except the
-    /// `dma_attrs` is 0 by default.
-    pub fn alloc_coherent(
-        dev: &device::Device<Bound>,
-        count: usize,
-        gfp_flags: kernel::alloc::Flags,
-    ) -> Result<CoherentAllocation<T>> {
-        CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
-    }
-
-    /// Returns the base address to the allocated region in the CPU's virtual address space.
-    pub fn start_ptr(&self) -> *const T {
-        self.as_ptr().cast()
-    }
-
-    /// Returns the base address to the allocated region in the CPU's virtual address space as
-    /// a mutable pointer.
-    pub fn start_ptr_mut(&mut self) -> *mut T {
-        self.as_mut_ptr().cast()
-    }
-
-    /// Returns a DMA handle starting at `offset` (in units of `T`) which may be given to the
-    /// device as the DMA address base of the region.
-    ///
-    /// Returns `EINVAL` if `offset` is not within the bounds of the allocation.
-    pub fn dma_handle_with_offset(&self, offset: usize) -> Result<DmaAddress> {
-        if offset >= self.len() {
-            Err(EINVAL)
-        } else {
-            Ok(self.dma_handle + (offset * core::mem::size_of::<T>()) as DmaAddress)
-        }
-    }
-
-    /// Common helper to validate a range applied from the allocated region in the CPU's virtual
-    /// address space.
-    fn validate_range(&self, offset: usize, count: usize) -> Result {
-        if offset.checked_add(count).ok_or(EOVERFLOW)? > self.len() {
-            return Err(EINVAL);
-        }
-        Ok(())
-    }
-
-    /// Returns the data from the region starting from `offset` as a slice.
-    /// `offset` and `count` are in units of `T`, not the number of bytes.
-    ///
-    /// For ringbuffer type of r/w access or use-cases where the pointer to the live data is needed,
-    /// [`CoherentAllocation::start_ptr`] or [`CoherentAllocation::start_ptr_mut`] could be used
-    /// instead.
-    ///
-    /// # Safety
-    ///
-    /// * Callers must ensure that the device does not read/write to/from memory while the returned
-    ///   slice is live.
-    /// * Callers must ensure that this call does not race with a write to the same region while
-    ///   the returned slice is live.
-    pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
-        self.validate_range(offset, count)?;
-        // SAFETY:
-        // - The pointer is valid due to type invariant on `CoherentAllocation`,
-        //   we've just checked that the range and index is within bounds. The immutability of the
-        //   data is also guaranteed by the safety requirements of the function.
-        // - `offset + count` can't overflow since it is smaller than `self.count` and we've checked
-        //   that `self.count` won't overflow early in the constructor.
-        Ok(unsafe { core::slice::from_raw_parts(self.start_ptr().add(offset), count) })
-    }
-
-    /// Performs the same functionality as [`CoherentAllocation::as_slice`], except that a mutable
-    /// slice is returned.
-    ///
-    /// # Safety
-    ///
-    /// * Callers must ensure that the device does not read/write to/from memory while the returned
-    ///   slice is live.
-    /// * Callers must ensure that this call does not race with a read or write to the same region
-    ///   while the returned slice is live.
-    pub unsafe fn as_slice_mut(&mut self, offset: usize, count: usize) -> Result<&mut [T]> {
-        self.validate_range(offset, count)?;
-        // SAFETY:
-        // - The pointer is valid due to type invariant on `CoherentAllocation`,
-        //   we've just checked that the range and index is within bounds. The immutability of the
-        //   data is also guaranteed by the safety requirements of the function.
-        // - `offset + count` can't overflow since it is smaller than `self.count` and we've checked
-        //   that `self.count` won't overflow early in the constructor.
-        Ok(unsafe { core::slice::from_raw_parts_mut(self.start_ptr_mut().add(offset), count) })
-    }
-
-    /// Writes data to the region starting from `offset`. `offset` is in units of `T`, not the
-    /// number of bytes.
-    ///
-    /// # Safety
-    ///
-    /// * Callers must ensure that this call does not race with a read or write to the same region
-    ///   that overlaps with this write.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// # fn test(alloc: &mut kernel::dma::CoherentAllocation<u8>) -> Result {
-    /// let somedata: [u8; 4] = [0xf; 4];
-    /// let buf: &[u8] = &somedata;
-    /// // SAFETY: There is no concurrent HW operation on the device and no other R/W access to the
-    /// // region.
-    /// unsafe { alloc.write(buf, 0)?; }
-    /// # Ok::<(), Error>(()) }
-    /// ```
-    pub unsafe fn write(&mut self, src: &[T], offset: usize) -> Result {
-        self.validate_range(offset, src.len())?;
-        // SAFETY:
-        // - The pointer is valid due to type invariant on `CoherentAllocation`
-        //   and we've just checked that the range and index is within bounds.
-        // - `offset + count` can't overflow since it is smaller than `self.count` and we've checked
-        //   that `self.count` won't overflow early in the constructor.
-        unsafe {
-            core::ptr::copy_nonoverlapping(
-                src.as_ptr(),
-                self.start_ptr_mut().add(offset),
-                src.len(),
-            )
-        };
-        Ok(())
-    }
-}
-
 /// Note that the device configured to do DMA must be halted before this object is dropped.
 impl<T: KnownSize + ?Sized> Drop for Coherent<T> {
     fn drop(&mut self) {
