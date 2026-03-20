Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658001098793
	for <nouveau@archiver.kernel.org>; Fri, 20 Mar 2026 14:52:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 98F1110EB06;
	Fri, 20 Mar 2026 14:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NHD40AJH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C491F45242;
	Fri, 20 Mar 2026 14:41:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774017664;
 b=AdDQ5U47vvesI47MgOmYNzcTRxihtF8YQ0FPToR2zTxxfjv0mMPfkINo5TvPMskRiwsgU
 BvZtI7lXi6bsUo9DAaFziPngNcHC+x4xSAWEkc8leKV437z++NxHr/Z3wvgDH/pMAfhdUWU
 uvTn01VqHv2/sjfX/ISCpxvQ7bSyFSlOzk5mNdt7WdG/bcXBNVhfjN0vOU/FEgt5c5PHOj5
 47E3zE1l5HdZJxxLYCAEK/fClP0QA4Z8Al6cXMI/8jXCff8hyl7H/MEXUGpGYrPRymWNWQR
 3cUhEj8G9H6VGLX7A50vls89Y6VvIKSMxIVlK6juyFXIZVwGcBA4LqHskMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774017664; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6ZmUaIGW9unOjpxP3qpIKunuXqi954gY1zMIw4E/6cw=;
 b=DjjrU7Tl0I79P5BQrldErBA25IqPHfxK9QYqml0VJUoiQ4pZ7RWp7zZ2mYGIwaJCqrzA5
 c0JoMJVu1Oidi5x62Gs84BJLXt/V9mT+L/Qu4X88LLCAryf6hzPlZy9C6JM4UCJhTjrXwQC
 mtfldmeXh3m4mVRcFdmiiBHWgQVO8/S6fVyx+h+69ccXrboqIWbQgLkJLAWYbsTftECwkeC
 7fxlQvVkcjKzGIohzC3JIRneNtaBQeeD2gVUA0Qq7scyAfoH2EjKIi17KG3d9l4JBAcD2zW
 xOztHXWhW9wvUsueDwyFDjGqG0fHn0Vmqm1a8Zjsbu7r0ZObv11Noo5TAFRA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E705C44D6D
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 14:41:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 762E210EAF5;
	Fri, 20 Mar 2026 14:51:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A23A661854;
	Fri, 20 Mar 2026 14:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB9EC4CEF7;
	Fri, 20 Mar 2026 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774018317;
	bh=c4iKsXS9FObY8UukAwlggqveq7EGRVJUILeikf6snDI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NHD40AJHDT02+DvH/U1AsJXl9mQNxpthbOfOD+j7zwpJXm63hipCalLLf5sapIWrX
	 Xp3wwneQs9BXKqya3aLcaa7SgnGQedPzxvQrrke5GlT3E/glOW6X4wZqZ0A7P9KRqZ
	 mykBOZeIl8huNcxg0UhMcDXwv8zl5eYXp6BSKOFmNKVTEeSqjcqwxXHkCtXBvD+2PR
	 +37G9unuMj4jT1glUwytlEDQyI+bGy8bquPV+dNkv7nNnbXb3+boSwr/WOgYU59Mzs
	 vaHTLzxjik+gcdVAmfnZC/lSbhrRMGfZxbwni4605oz24xg6W0jabK4Uw7V8gz+P8e
	 Xsj9Q8jUdmseQ==
Message-ID: <480059c8-33e7-4f8e-bf03-b0d7ca3fd074@kernel.org>
Date: Fri, 20 Mar 2026 14:51:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory
 initialization
To: Alexandre Courbot <acourbot@nvidia.com>
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-5-dakr@kernel.org>
 <DH7OO4961WUH.1MM3MW1SVWI3I@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DH7OO4961WUH.1MM3MW1SVWI3I@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4X7CBSXMJPP7Z57UIMLQQ64K4AEBGIFQ
X-Message-ID-Hash: 4X7CBSXMJPP7Z57UIMLQQ64K4AEBGIFQ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: aliceryhl@google.com, ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com,
 driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4X7CBSXMJPP7Z57UIMLQQ64K4AEBGIFQ/>
Archived-At: 
 <https://lore.freedesktop.org/480059c8-33e7-4f8e-bf03-b0d7ca3fd074@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 3/20/2026 3:35 PM, Alexandre Courbot wrote:
> On Wed Mar 4, 2026 at 1:22 AM JST, Danilo Krummrich wrote:
>> +/// # fn test(dev: &Device<Bound>) -> Result {
>> +/// let mut dmem: CoherentInit<u64> =
>> +///     CoherentInit::zeroed_with_attrs(dev, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
> 
> Since this is an example, shall we use the simpler
> `CoherentInit::zeroed`?

Sure.

>> +    /// Initializes the element at `i` using the given initializer.
>> +    ///
>> +    /// Returns `EINVAL` if `i` is out of bounds.
>> +    pub fn init_at<E>(&mut self, i: usize, init: impl Init<T, E>) -> Result
> 
> Should this method be introduced in the next patch, or even in its own
> patch? It feels a bit out of place at this stage since the non-array
> `CoherentInit` doesn't have an equivalent.

The non-slice variant doesn't need it.

I don't see an advantage creating a separate patch for this.

> I was also wondering whether we could have an `init` method that
> initializes all the elements without having to zero the whole array
> first, but I guess it might be a bit difficult to implement in a
> flexible enough way.

You have this in the next patch, Coherent::init() works with arrays.
