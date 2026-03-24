Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4C5F54ACE
	for <nouveau@archiver.kernel.org>; Tue, 24 Mar 2026 15:40:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E4E3B10E71C;
	Tue, 24 Mar 2026 15:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MzoGbJg8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2624B452CE;
	Tue, 24 Mar 2026 15:29:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774366166;
 b=cE/ntAnD8ISn+zfRIJuLSl74uerKNJ4CbeeMU2IpShMUKUXuZXac1IZGZcuUmMqtlUbgU
 9wkEjYYaivlbwjdagiYxpvlmjFHsw3E1KY3V7wTaZ6mR5rl5/pVYcHn291ila0UurkJ1TxY
 xMHzMv71xsHvCGCKLMunR6Vp1N/S5aCvwLUFN4o4RsU6qA78F+/hTYt5KNTNKqrSnOalcmM
 yKFrT0BA77rB7iw9q3Ow0jLAaCCRoMTIOQc0F7p8Ry9+dhv+xR7GJi2x6sjuLc+3SpToIUD
 afPQsYCRljueEBOTz3b+U4Y/ZSvJy30pfJfemw2yu8fL+h2DrGohZ1uPDzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774366166; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DJbHRaS8pRP79lkZNVy3W9DNq3nAXh6fhZLGY0cyNk0=;
 b=uUbQb2VPDNjsks//IRECWwptZEfLljpA5K4/CY9z2CoQMrygTjL2jkB56ZdKFrsfV4lp3
 TgOXlTcaenncTd5X6CuNepGF83sMBh3r+AsVeH01fKc+MdkxgrMz5WaT0wrU8Hjn3Cjaxl7
 k8Q8Qk3BrJF8EeZedxDWYPRH624+g2OVfppqHMly55OVmEq0zEFWU1AS5A+MuY2SJ4fOY9c
 eOeXoEGg6HsOHBeHJdrW19MY+Cr9FFFMQWqCXc+eNznd9Sx33iheCXyHEd51Vb2bVymzNo3
 nPeeWRPJO/gCueZ8uPfkGFnpnEU7vu0Zj5sPb7nNUZvb+s31rhdv07tGpxQw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C8A6E433BB
	for <nouveau@lists.freedesktop.org>; Tue, 24 Mar 2026 15:29:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 126AB10E70E;
	Tue, 24 Mar 2026 15:40:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48E5C600AC;
	Tue, 24 Mar 2026 15:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC6DC19424;
	Tue, 24 Mar 2026 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774366827;
	bh=8SAT0NvMEzHHIA4fOre9p3OATPKWmFRFNQE2+grgJZg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MzoGbJg8KgNkLqGgI+++0nf6vChXqSbwuF+mwriQl/VGMEfE1yC3TxQ4JZAAuwdtt
	 5Okt+PZKAkuuU0gjHZRzDI0ehEzNdJI2XTQ6azuvLnTkJprKKK+baC/dTqPLcniaPV
	 5bU9A4l/O7VhV2iwYiWQCxX0szABBlxE/7iefSYSKUaO+hr2UxYw4JbrlbTKpV5izi
	 umR4+Fgery2D9palYiL1UCDMCfJqQW48m4nvdG+zT2UkjN3rYbVddqvIpLC1okTjYq
	 LFnNH+ATJDU9OAS6oH9mXi1F33tZ5rs+RJ3zCDN965+Nk/oY785hXP6rj22WioQoG5
	 o/vRbMR7xLXSg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 5/8] rust: dma: add Coherent:init() and
 Coherent::init_with_attrs()
In-Reply-To: <DHB3RDNDS08U.A75EZUOMO311@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <4yknLBbwY93Ty2ltbpxjHgto-m99xkoTgDlKv8cJTK2tbFL0_V6eQDjwbbXI70M6uMKT6RLRxBoYR_XeymmnHA==@protonmail.internalid>
 <20260320194626.36263-6-dakr@kernel.org> <87y0jhpbsp.fsf@kernel.org>
 <7YsbXJIBKj4Er4WkL5X4lsu18tY1b05zm-TzJP7Xt6YGuOsxmCQ7Ew_TFafHcFnLhCy4ptG2mC0vDesRyI7cAw==@protonmail.internalid>
 <DHB3RDNDS08U.A75EZUOMO311@kernel.org>
Date: Tue, 24 Mar 2026 16:40:16 +0100
Message-ID: <87zf3xxmlb.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: JAQNAWERVMRURZCZQ6AGF4TLM7G4MSEB
X-Message-ID-Hash: JAQNAWERVMRURZCZQ6AGF4TLM7G4MSEB
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com,
 driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JAQNAWERVMRURZCZQ6AGF4TLM7G4MSEB/>
Archived-At: 
 <https://lore.freedesktop.org/87zf3xxmlb.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Danilo Krummrich" <dakr@kernel.org> writes:

> On Tue Mar 24, 2026 at 3:00 PM CET, Andreas Hindborg wrote:
>>> +    /// Same as [`Coherent::zeroed`], but instead of a zero-initialization the memory is initialized
>>> +    /// with `init`.
>>> +    #[inline]
>>> +    pub fn init<E>(
>>> +        dev: &device::Device<Bound>,
>>> +        gfp_flags: kernel::alloc::Flags,
>>> +        init: impl Init<T, E>,
>>> +    ) -> Result<Self>
>>> +    where
>>> +        Error: From<E>,
>>> +    {
>>> +        Self::init_with_attrs(dev, gfp_flags, Attrs(0), init)
>>> +    }
>>> +
>>
>> I think we are missing an array initializer for `Coherent<[T]>`.
>
> This method is already compatible with arrays, T can be an array type itself,
> e.g. T = [MyStruct; 5].
>
> For instance, the diff in [1] should work.

Cool!

>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Thanks! The patch series has been applied yesterday, and the branch it has been
> applied to is immutable, so I can't add additional tags.

You guys move fast!

> However, the Link: included in the patch still points to this conversation.
>
> Also note that subsequent review is still valued; we can always send follow-up
> patches if required.

At any rate I can send the changes I suggested if they are deemed valid.


Best regards,
Andreas Hindborg



