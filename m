Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B78DD46C1D
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 00:15:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F15E610E186;
	Sat, 31 Jan 2026 00:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AaGGZFUb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4C93940F63;
	Sat, 31 Jan 2026 00:05:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769817953;
 b=XkpFfEVyyEJ8ptbeBD637ouYQM8fb9aFUbZtPseziGX444mdvmcdsh4/hgxJvwJiXJ9Zm
 lCqO7VidWRlZoejR7vcS19AEiMFNV5u6Nmrkmp4nJplJjzuJZ7/Xwq/kcyjYVQxQnw3xaUu
 HpDfNs6GBEoV8KCo+X9lS3fvHfYBNUyCilOtQYu9A0QIR8N2iEel43i7uMckNw8GjZvgqhB
 0F8XkLCIof1iuBF8kNJU3vMvzHG/awuHzOQit3JItXosfQf9DKa72CZYAsGGBLxYZkTtrBk
 gAZ+/sFTgDaSJjIbqQJaTwLTdvuLGAc7ISeRCwuzrcFtO8k5va8W+a49P/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769817953; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DvwXVFAeeafwpLEdA0FcWh3YzsTnhb9S/tExNaTneW0=;
 b=TSNVU0ORswCGsaEkCtOMPFBIvnrn6Ux84Jhe0z/XYEoAUIjdynkeJ+k/nJdYB60VG+QrB
 DlIw2jfqLRumH7Eo8n72S1vJhjulbC2a6icSpc5JbvvQv8KQthcRffgV/2QUtz1l35W6CmJ
 zpgJ9JqTc7st15iZq44d8Dt6IIMlB1RLlpRynoY8iErMCndu1DSevded87ZKiV+Wm4C6det
 H5NSxEpG+gaxG8a4eDV8pm5BQGDmX6O/KnXBHXcfir2KhygjkCJ24F/kyvVihk+ClJ5b0p7
 IbxWfgBLJEaMMADAyjspTH+yUXF2PkWe451BdyP4xf+Ca8p2+alxUPnHaY5g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BF2FC4015A
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:05:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCB710E079
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:14:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2015E60008;
	Sat, 31 Jan 2026 00:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0911CC4CEF7;
	Sat, 31 Jan 2026 00:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769818496;
	bh=ZoI+iqcGgdae+p1gydlMNbQ0hxd1od8WckPfjNXZWJw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=AaGGZFUbd4ACQjN1xiENPYTqIQwGB3DdInquu6A4JbNWpePzoCtAbQg7KAoiVZ2bI
	 AJbnPka3j09sI5uyIIXSP5ChY4FUqqDVj+bEoActgFuqmi9m1kqIedsCPJNaDTu7ve
	 pwGXJ+wOMERcRwUU5Vsw0R9W5/5DMMPCc8+edEPg1BEwWSMj1nB9sLL25n5Q3VlNf1
	 gnJMFfJl2M96CXBX+6QvXAaxqrB9Gv5PB0Fjk/tUBcREJvQR3qVUYLtLh1e1x/HiRr
	 AZOrCbsi6j6hiNWLloHlTi3e3D/lPbwyfXvYJxGwAriDwKT0ehvdM9/yJSBU0W9ENA
	 es01X2Ya5wk4A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 01:14:53 +0100
Message-Id: <DG2CANK7QMY0.2W8S2R1ZML3UW@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-3-ttabi@nvidia.com>
In-Reply-To: <20260129022837.4133832-3-ttabi@nvidia.com>
Message-ID-Hash: D34CNAWU2EQHGUSFCOJU5GYERY5NQMBY
X-Message-ID-Hash: D34CNAWU2EQHGUSFCOJU5GYERY5NQMBY
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
 mmaurer@google.com, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D34CNAWU2EQHGUSFCOJU5GYERY5NQMBY/>
Archived-At: 
 <https://lore.freedesktop.org/DG2CANK7QMY0.2W8S2R1ZML3UW@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Jan 29, 2026 at 3:28 AM CET, Timur Tabi wrote:
> +    /// Writes raw data to this user pointer from a DMA coherent allocat=
ion.
> +    ///
> +    /// Returns error if the offset+count exceeds the allocation size.
> +    ///
> +    /// Fails with [`EFAULT`] if the write happens on a bad address, or =
if the write goes out of
> +    /// bounds of this [`UserSliceWriter`]. This call may modify the ass=
ociated userspace slice
> +    /// even if it returns an error.
> +    ///
> +    /// Note: The memory may be concurrently modified by hardware (e.g.,=
 DMA). In such cases,
> +    /// the copied data may be inconsistent, but this does not cause und=
efined behavior.
> +    pub fn write_dma(
> +        &mut self,
> +        alloc: &CoherentAllocation<u8>,
> +        offset: usize,
> +        count: usize,
> +    ) -> Result {
> +        let len =3D alloc.count();
> +        if offset.checked_add(count).ok_or(EOVERFLOW)? > len {
> +            return Err(ERANGE);
> +        }
> +
> +        // SAFETY: `start_ptr()` returns a valid pointer to a memory reg=
ion of `count()` bytes,
> +        // as guaranteed by the `CoherentAllocation` invariants. The che=
ck above ensures
> +        // `offset + count <=3D len`.
> +        let src_ptr =3D unsafe { alloc.start_ptr().add(offset) };
> +
> +        // SAFETY: `src_ptr` is valid for reads of `count` bytes per the=
 above.
> +        let res =3D unsafe {
> +            bindings::copy_to_user(self.ptr.as_mut_ptr(), src_ptr.cast::=
<c_void>(), count)
> +        };
> +        if res !=3D 0 {
> +            return Err(EFAULT);
> +        }
> +
> +        self.ptr =3D self.ptr.wrapping_byte_add(count);
> +        self.length -=3D count;
> +
> +        Ok(())
> +    }

I think the idea was to have a common read_slice_raw() method that can be s=
hared
between write_dma() and write_slice(). Can you please factor this out?
