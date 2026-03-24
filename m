Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CE3F54AC4
	for <nouveau@archiver.kernel.org>; Tue, 24 Mar 2026 14:37:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5021410E6F2;
	Tue, 24 Mar 2026 14:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PqgKbgJe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 99CB8452C6;
	Tue, 24 Mar 2026 14:26:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774362404;
 b=ci0EPLk8Kwc8W1cSWKc4q5e/jqW+6OQowpW0dW3zi/WEsSl/fbAQQhSd/9PkqHLuvI/Xd
 kE19oOXl84udVn0m6I3HwFmBPk9+cxO3P7x2uO5pdqAFKEO6eviM3JNqYxlrNCuDt9vHNUY
 X0aqUgLL8N5fJoXMb/an7Rg7HcHhIl5auRAIm5p0Olqq9RzPMCihcD/lzOivs0zNIRDviG+
 BN4C++DqLIMwWbRbAPMWTKjvcvzZMDL9gZEgq4yO2SK8kkrWI2Z5jZzd7+7yHi64kejQ8S6
 /N645q5FY1S9XdF0c3k5wGhcDQXDhOFzTvR4msyZTlm50pfbX6GzxPnNtZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774362404; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dN5c5MijPovwWoRuCuz5H7GiMGVRH2NEHxZTIluAhI8=;
 b=mY07AZkgalsATTnAAEQeFL0+71xAfeW8N1tD4LTlXtghbkDhdytU8K2OdKtSSbGAuKFQv
 Lk81RqOPZyBMK/Kw+Z7RpUKY8PmdwCJUq4jfhcr0qU+dCRN4zFdKlh3Q5v88S6WWdb9Lcgx
 /i3ggckECFfFCcLm5lnBqb5bqVu99W7k+hzufA8RjudmdDIAbHcOIoys8U8rYUP5E/KdeCZ
 RGiJ1S0oWlHNciVXBN/PiHEGOOwYY7RiDMBukPtdUEtHjpjysrajKrdUVzj9x7IcoJ0Y4u5
 kB6+j4GAE1lXqWLBHiHHjXoFHBP+A8aaC4v1X/PstN+pljAxJPUmdl4zpE6g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D1647433BB
	for <nouveau@lists.freedesktop.org>; Tue, 24 Mar 2026 14:26:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 33A5F10E6E2;
	Tue, 24 Mar 2026 14:37:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8017E60120;
	Tue, 24 Mar 2026 14:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50C4C2BC87;
	Tue, 24 Mar 2026 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774363065;
	bh=3M1pZU/Rt+tvSzSNAmvvsplHgsc63Xp92Dg1sukL488=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PqgKbgJeA0TFHNoShupCs/8BjLfjfpRdFRc1+QL9ZroTHAZf625/7hlReKSHx5E/X
	 ujj1Czq7HLgl5sgc86N/UZqJmKXs5sXug11u7ckU6kFsKZeFu8y2ivJczOV62YjaJO
	 +HCznSqBIDkIwgkH35og13sT0N5yAszfd7Sosv/UfL/ncpPo13dT7INSEP9bD8Qifv
	 x9OR4odB+qoi2Zp/6YzvsORLj3eUER7PaXs2RiLdKK505wnePKh/fIFJPEKvFjH3jb
	 99ew1U06WRjPOp1dXTb0oM3PLvncpi9kyk82CSA6c9e07DUqyz2PSGKu2acRbKnOpo
	 RTSgXB53nQebw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com
Subject: Re: [PATCH v2 2/8] rust: dma: add generalized container for types
 other than slices
In-Reply-To: <DHB2JCKXZ5ZN.LA5E3HY3YHGS@garyguo.net>
References: <20260320194626.36263-1-dakr@kernel.org>
 <8WwJUXIwwCnCTXlAJw77hgSFS-jjhGgfJQoyIaVPdDf99QqTFd1uHhEj56PCo9Ihv-koAQP7826Vpx8HZkKE5A==@protonmail.internalid>
 <20260320194626.36263-3-dakr@kernel.org> <877br1qr6v.fsf@kernel.org>
 <MfXnI_tAbjftGXdPiZWkQbZEmqAq3Fqd6UudPSK5GVeEK_lnU03F5MJcFcuaSNTf26g4UzcjPm6myrYKFUXz6w==@protonmail.internalid>
 <DHB2JCKXZ5ZN.LA5E3HY3YHGS@garyguo.net>
Date: Tue, 24 Mar 2026 15:37:35 +0100
Message-ID: <87341pz428.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: K43DKIKEASFSHK74BYH4YKNESB6JDZ2A
X-Message-ID-Hash: K43DKIKEASFSHK74BYH4YKNESB6JDZ2A
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K43DKIKEASFSHK74BYH4YKNESB6JDZ2A/>
Archived-At: 
 <https://lore.freedesktop.org/87341pz428.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Gary Guo" <gary@garyguo.net> writes:

> On Tue Mar 24, 2026 at 1:42 PM GMT, Andreas Hindborg wrote:
>> "Danilo Krummrich" <dakr@kernel.org> writes:
>>
>>> +    /// Returns a reference to the data in the region.
>>>      ///
>>> -    /// # Examples
>>> +    /// # Safety
>>>      ///
>>> -    /// ```
>>> -    /// # use kernel::device::{Bound, Device};
>>> -    /// use kernel::dma::{attrs::*, CoherentAllocation};
>>> +    /// * Callers must ensure that the device does not read/write to/from memory while the returned
>>> +    ///   slice is live.
>>> +    /// * Callers must ensure that this call does not race with a write to the same region while
>>> +    ///   the returned slice is live.
>>> +    #[inline]
>>> +    pub unsafe fn as_ref(&self) -> &T {
>>> +        // SAFETY: per safety requirement.
>>
>> Is this enough? Don't you need to assert a valid bit pattern? I assume
>> you get this from `FromBytes`, but that bound is not on `T` in this impl
>> block.
>
> Concetually `Coherent<T>` is a container of `T` so it should always hold a valid
> bit pattern for the type. Perhaps this should be added to the type invariant.
>
> FromBytes is only needed at the constructor level as that's the only place where
> you're asserting that initial bit pattern is valid.

Makes sense to add the invariant and assert at construction time.

>
>
>>
>>> +        unsafe { &*self.as_ptr() }
>>> +    }
>>> +
>>> +    /// Returns a mutable reference to the data in the region.
>>>      ///
>>> -    /// # fn test(dev: &Device<Bound>) -> Result {
>>> -    /// let c: CoherentAllocation<u64> =
>>> -    ///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
>>> -    /// # Ok::<(), Error>(()) }
>>> -    /// ```
>>> -    pub fn alloc_attrs(
>>> +    /// # Safety
>>> +    ///
>>> +    /// * Callers must ensure that the device does not read/write to/from memory while the returned
>>> +    ///   slice is live.
>>> +    /// * Callers must ensure that this call does not race with a read or write to the same region
>>> +    ///   while the returned slice is live.
>>> +    #[expect(clippy::mut_from_ref, reason = "unsafe to use API")]
>>> +    #[inline]
>>> +    pub unsafe fn as_mut(&self) -> &mut T {
>>> +        // SAFETY: per safety requirement.
>>
>> Same.
>>
>>> +        unsafe { &mut *self.as_mut_ptr() }
>>> +    }
>>> +
>>> +    /// Reads the value of `field` and ensures that its type is [`FromBytes`].
>>> +    ///
>>> +    /// # Safety
>>> +    ///
>>> +    /// This must be called from the [`dma_read`] macro which ensures that the `field` pointer is
>>> +    /// validated beforehand.
>>> +    ///
>>> [...]
>>> +
>>> +impl<T: AsBytes + FromBytes> Coherent<T> {
>>> +    /// Allocates a region of `T` of coherent memory.
>>> +    #[expect(unused)]
>>> +    fn alloc_with_attrs(
>>>          dev: &device::Device<Bound>,
>>> -        count: usize,
>>>          gfp_flags: kernel::alloc::Flags,
>>>          dma_attrs: Attrs,
>>> -    ) -> Result<CoherentAllocation<T>> {
>>> -        build_assert!(
>>> -            core::mem::size_of::<T>() > 0,
>>> -            "It doesn't make sense for the allocated type to be a ZST"
>>> -        );
>>> +    ) -> Result<Self> {
>>> +        const {
>>> +            assert!(
>>> +                core::mem::size_of::<T>() > 0,
>>> +                "It doesn't make sense for the allocated type to be a ZST"
>>> +            );
>>> +        }
>>>
>>> -        let size = count
>>> -            .checked_mul(core::mem::size_of::<T>())
>>> -            .ok_or(EOVERFLOW)?;
>>>          let mut dma_handle = 0;
>>>          // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
>>>          let addr = unsafe {
>>>              bindings::dma_alloc_attrs(
>>>                  dev.as_raw(),
>>> -                size,
>>> +                core::mem::size_of::<T>(),
>>>                  &mut dma_handle,
>>>                  gfp_flags.as_raw(),
>>>                  dma_attrs.as_raw(),
>>>              )
>>>          };
>>> -        let addr = NonNull::new(addr).ok_or(ENOMEM)?;
>>> +        let cpu_addr = NonNull::new(addr.cast()).ok_or(ENOMEM)?;
>>>          // INVARIANT:
>>> -        // - We just successfully allocated a coherent region which is accessible for
>>> -        //   `count` elements, hence the cpu address is valid. We also hold a refcounted reference
>>> -        //   to the device.
>>> -        // - The allocated `size` is equal to `size_of::<T> * count`.
>>> -        // - The allocated `size` fits into a `usize`.
>>> +        // - We just successfully allocated a coherent region which is adequately sized for `T`,
>>> +        //   hence the cpu address is valid.
>>
>> The invariant says "valid for the lifetime", do you need to argue for
>> the duration of the validity?
>
> It says "For the lifetime of an instance of ..." which is basically equal to
> saying nothing. I think that part should just be removed.

Sounds good.

>
>>
>>> +        // - We also hold a refcounted reference to the device.
>>
>> This does not relate to the second invariant of `Self`.
>
> The second invariant is about size, which is addressed in the first bullet
> point. This is about the third invariant, which the doc-comemnt just says "TODO"
> currently.

So it is not an invariant, and it should not be covered here.

I would suggest that if you use bullet list both in definition and
justification, please make sure the justification bullets match the
definition bullets. If you need to, you can make sub-lists by indenting.


Best regards,
Andreas Hindborg



