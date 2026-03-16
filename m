Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC2AF53D9A
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 20:42:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD9BE10E3F4;
	Mon, 16 Mar 2026 20:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="p0csYt9K";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 559C44516E;
	Mon, 16 Mar 2026 20:31:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773693093;
 b=zxQGLTgjCyrrv1vkren/CMxaO8QbJtHeL0W7/hjMoVixVAu6hAyyWAgIoHjLB30Qqv0Wa
 tpfQiXnjyosjqrn74X0AmqCv9V8MmSQKjEWn1IjVS+JloziNZQA2DtLGk7Vqde5o3vZmo/7
 NOvyvV1tT86d4q48Omgi12ImWsrtuTce/ZQqgRuXWZHBVqsplcNExNCmkAOV4XxxwL13rY2
 YxJ6z9dnqlQ86RHymnfxU6PAcHjh+C2PC6CItvwikxHG0P1bfR3IXkPPFMzLZg01R5eITN4
 YdAhxleIp6XnhFBrrCl91g4u7OwtZqajtszUPrZqMo3KoUVjKxqkd6O/4vDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773693093; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rnehdcYWB9w3tVl2LzZNjtYNnm+PGYt8SHrexd0l+qg=;
 b=LiAIixYI8o/MTkd0pcS1srWoVgBfActO9VKQyIAlmA/+3DZT4WiAQyqHK6dVAgNprz78E
 +nuf0KAT1u1eEl3AOSAwr2LAWFk6V74yklPF8pjv3KxttCzNDo1cYZIzam9pNW8AAeSo/1p
 am/xMm4gj549/liE/oMP8rF9pgNT9Q9qwNPtScLmF3a5nixNqs99rL6U+AmAanVFMElERxi
 R6Wqc0jqG1jlslKtlP2pdO9Fox5XAHERWZWPgYKFP1CGZ9ZGhb/+a3qouFd60F0/jz8tsTa
 8Pvlf0Ug7AjHNAjEABs0Of+Ol3h+Qbd2NvP21U5SfEWGl0w8uAxoWCv+s5iA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1035B45160
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 20:31:30 +0000 (UTC)
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 42B2210E39E
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 20:42:17 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4852fbfc379so71245445e9.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Mar 2026 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773693736; x=1774298536;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rnehdcYWB9w3tVl2LzZNjtYNnm+PGYt8SHrexd0l+qg=;
        b=p0csYt9KJ6tAY73BH1SE9FC3sRhX+0NYHdbz7PDtkLLt07o4EBtMHsufCe55Udk7MP
         064wWACd2WQNfh8psF0a2lB+w0rRgIeOprtvTAa+rlpgbfhZEfZW+1h5RWURdfnBpPsE
         /CN/zXs95brkdCgt9U8AD4oKQiGwuvRFMv23VhzKZrwEI+WtrG41KBxf1+Jsiy0b4hLX
         f4Omd7bmUIqNdazcHEn9qonZpLjGaGEiCr1M2kyIjb2BKP0UOIu0aHIR8MPLzum5fHsw
         E4De2XTpcBur5lSDjruEl/Gn++aMLzlK40Dozy0oYmABJj7yhvXqzjMqdIYt5kiGfJKG
         yvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773693736; x=1774298536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnehdcYWB9w3tVl2LzZNjtYNnm+PGYt8SHrexd0l+qg=;
        b=MePyds/PLNbPzbli5NhoR1nARa8l39qeCphM4PT2FQhxt2GSY7W25fzu+jyO5IkXds
         rOdSS1GYpwCLfeHpMdSt7s1AeFpCQLECrMysdmfXiHIfg1FmDdEpiVBgxAHm6TkWhatT
         Cvjec4s0z9BYgLPBOtk2//dhoLr/dOXsS8Y0se9ESW3oCpehWLJCMJalW6lWY0RpnDb7
         fjgIfQFjDJso3oWkHc3h6dLiyuougcyhofAJK0HOG4TyBnCSe3tOvjX7fgWGMR5V5+mB
         iLzHcTkoGnQKdCH5mivjhlem7Ae35E+x5WyrXTljcL11snvgQE3TVggBUrrgS5oQ4ZZg
         kDGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTkGzj26VFoDSolWlsLJ+THysm4WJJt+ojx9wqTOUsmiOs0MHHs5CnBAz//cTAeHUnNDx6fpis@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJFOQKmlJ0d15vy7Ne+1A+YbSOZS5MF/38vmWE133W31X6rD5w
	aiUNa6AJQbyi5EADEgGUeiLDGS60gUE2OOUFjlvjLIC0sNF/NFEKxJIELtpdUFbLtVTuWgu/Rc+
	Xx1T4Mn7tVhwtidfThg==
X-Received: from wmjy24.prod.google.com ([2002:a7b:cd98:0:b0:485:316c:34b4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d1a:b0:485:2ce2:4c8a with SMTP id
 5b1f17b1804b1-485566cfb00mr242140765e9.1.1773693735483;
 Mon, 16 Mar 2026 13:42:15 -0700 (PDT)
Date: Mon, 16 Mar 2026 20:42:14 +0000
In-Reply-To: <20260316055736.1690546-3-ttabi@nvidia.com>
Mime-Version: 1.0
References: <20260316055736.1690546-1-ttabi@nvidia.com>
 <20260316055736.1690546-3-ttabi@nvidia.com>
Message-ID: <abhrJgPEiIRCvmwe@google.com>
Subject: Re: [PATCH v9 2/6] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: 5PMIIKJRWV57JLKGPXUPRDERVT3IQ6Y7
X-Message-ID-Hash: 5PMIIKJRWV57JLKGPXUPRDERVT3IQ6Y7
X-MailFrom: 
 3J2u4aQkKBzQQbYSUhoXbWeeWbU.SecdeklUQkbYiji.VhUUTUiajef.ehW@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>, mmaurer@google.com,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, ecourtney@nvidia.com,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5PMIIKJRWV57JLKGPXUPRDERVT3IQ6Y7/>
Archived-At: <https://lore.freedesktop.org/abhrJgPEiIRCvmwe@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Mar 16, 2026 at 12:57:32AM -0500, Timur Tabi wrote:
> Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u8>
> to userspace. This provides a safe interface for copying DMA buffer
> contents to userspace without requiring callers to work with raw pointers.
> 
> Because write_dma() and write_slice() have common code, factor that code
> out into a helper function, write_raw().
> 
> The method handles bounds checking and offset calculation internally,
> wrapping the unsafe copy_to_user() call.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` points to a valid slice of `len` bytes (i.e., it is
> +    /// valid for reads of `len` bytes).

I don't know how I feel about this 'valid slice' thing. The memory might
be dma memory after all ... just say it's valid for reads of `len`
bytes.

After all, in below SAFETY: comments, you also argue that it's valid for
reads, not that it points at a valid slice.

> +    unsafe fn write_raw(&mut self, ptr: *const u8, len: usize) -> Result {
>          if len > self.length {
>              return Err(EFAULT);
>          }
> -        // SAFETY: `data_ptr` points into an immutable slice of length `len`, so we may read
> -        // that many bytes from it.
> -        let res = unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), data_ptr, len) };
> +        // SAFETY:
> +        // - `self.ptr` is a userspace pointer, and `len <= self.length` is checked above to
> +        //   ensure we don't exceed the caller-specified bounds.
> +        // - `ptr` is valid for reading `len` bytes as required by this function's safety contract.
> +        // - `copy_to_user` validates the userspace address at runtime and returns non-zero on
> +        //   failure (e.g., bad address or unmapped memory).
> +        let res =
> +            unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len) };

Points 1 and 3 in this bulleted list do not seem to address any actual
safety requirements of `copy_to_user`. Yes, the function validates
userspace addresses at runtime, and this is part of why its
implementation is safe, but it's not a precondition on the caller.
There's no way to call `copy_to_user` where it would not validate the
userspace address at runtime.

> +    /// Writes raw data to this user pointer from a DMA coherent allocation.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `data` - The DMA coherent allocation to copy from.
> +    /// * `offset` - The byte offset into `data` to start copying from.
> +    /// * `count` - The number of bytes to copy.

This is not the usual Rust style for documentation. We would generally
just write it in words:

	Copies `count` bytes from `alloc` starting from `offset` into
	this userspace slice.

Yes, argument lists are *occassionally* used, but it's rare.

> +    /// # Errors
> +    ///
> +    /// Returns [`EOVERFLOW`] if `offset + count` overflows.
> +    /// Returns [`ERANGE`] if `offset + count` exceeds the size of `data`, or `count` exceeds
> +    ///     the size of the user-space buffer.
> +    /// Returns [`EFAULT`] if the write happens on a bad address, or if the write goes out of
> +    ///     bounds of this [`UserSliceWriter`].

Using a list to format the possible errors seems sensible to me. But I
don't think you intended for this to be rendered like this in the final
docs:

	Returns `EOVERFLOW` if `offset + count` overflows. Returns
	`ERANGE` if `offset + count` exceeds the size of `data`, or
	`count` exceeds the size of the user-space buffer. Returns
	`EFAULT` if the write happens on a bad address, or if the
	write goes out of bounds of this `UserSliceWriter`.

Please use a markdown list to format this, and check the generated html
docs.

Alice
