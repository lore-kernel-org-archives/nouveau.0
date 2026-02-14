Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85B8EF99EA
	for <nouveau@archiver.kernel.org>; Sat, 14 Feb 2026 00:29:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD5E10E84D;
	Sat, 14 Feb 2026 00:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JUITrCym";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BD7B142BBF;
	Sat, 14 Feb 2026 00:19:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771028389;
 b=P6BHozlpWWVTd1OKUeiDC59zAaWqHJ85jV6UeLH7+nzzHgBQ1IL+ci/ppQ9KwmD9+q2nS
 ha+w8XGTKbDaoyRU9mEsPWN6F+iohDqfTmJoF8dY5GHlVmEqrtSeL4O1Z7am0XyGjYVAWdk
 gtde50w97AvN1GJd2M+GTU+1sZQ8G6YWLLn8AuzrWoGyzUHSKZGVc18mN/Gh68epaq+RVzR
 gUtTcQ4Gw+tD88/SWp/Tcmi9suEZ9x/h1a0jwyTDl6kG9aPxZ02XHASbaFEqNsLK4uESr1F
 LSOmPb7XYOfzqGFe+q9/+pHG7Rm/3jQma8R91Q5EzMRk90Kwsg+MFoLdzKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771028389; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EHDiyg4xEdeTxqLaqPMSWmx3zaPHo6u20yA8zbsrEbk=;
 b=YzHvEXHrqinn8PS0YjNBhZny5vZv8Ct8CRQ925Na72xZdOCpMq+ShzrrXCT7P4Crzx1OA
 6tBTY82WlYKrk6FpHpmKhLr/MnqGqDnfScSYJ1fybiOdnmclGVxb7enKtGKDQwhcxK/nvnE
 59Vrc8G7kHz1xgEqTkxXYm7XYiTyPOD76p9dUmSqimtTyeWsqUiUFBlMaqsTGuUlpdVzzm1
 aPMv1WDdv56qYB382vzMO/Mz+N8CjdSzHxYdpeNxWhTevWk2FLrAS/XycNENRZ3IWQ9o0Ny
 ld/xzft4RR/HmXMvxhqBSsgZ+PphRQM/Yse7hSz2U7EmuaUNY2yZPH9oYV/Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 06818403B4
	for <nouveau@lists.freedesktop.org>; Sat, 14 Feb 2026 00:19:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE1810E840;
	Sat, 14 Feb 2026 00:29:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 544C960054;
	Sat, 14 Feb 2026 00:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EB1C116C6;
	Sat, 14 Feb 2026 00:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771028963;
	bh=YvsPEh6HCGUHqoLXvFZixMboBz4g8kUXgB9HcJr15SU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=JUITrCymFE8WY9hXlJPFWo1wD9IY5UpE/H2jZVoxtblH62tkk274itODMFESplm7R
	 fvoFDorHMV1IMoUHzdUuLjF6/9W1vBitY/h0vpZPMLunQcJv4nwUA4ryOAuPnwXZuB
	 3qEgddDEJRyVY+9v4uogaxdb8yxJKBN/4eSE7moAiWHHqjZf5j1JNrd584FEjIUHJ8
	 17IWEhk/D5TvGOh95pox7cFI13u31SPRGocJn2nf9LjLt0NaoBeLEcbGpHr1kJhZzq
	 dvcj9/pFauSyKNtGq6PVF5CzhyGS7l+5XMWRf6+NZUlQJw0+bzgaC1VrmqlOOFteTv
	 Yh63U7tikoLJQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 01:29:18 +0100
Message-Id: <DGE9DBH7X8CO.2EES6EX8UA5ZF@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: fix stack overflow in GSP memory
 allocation
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>
 <DGE5NO2W48YJ.34YKFNI6VS63A@kernel.org>
 <e6df0b7ebd86d0c84ffd4b15cee15716@garyguo.net>
 <DGE8Y55O5445.D6KRXL724153@kernel.org>
 <1b7adbcbb4405fdc3e8ea7d3cc0dc526@garyguo.net>
In-Reply-To: <1b7adbcbb4405fdc3e8ea7d3cc0dc526@garyguo.net>
Message-ID-Hash: IQDX3DXR47NX6FZEBVFBZLZEDQABSAHV
X-Message-ID-Hash: IQDX3DXR47NX6FZEBVFBZLZEDQABSAHV
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>,
 tim.kovalenko@proton.me, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IQDX3DXR47NX6FZEBVFBZLZEDQABSAHV/>
Archived-At: 
 <https://lore.freedesktop.org/DGE9DBH7X8CO.2EES6EX8UA5ZF@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Feb 14, 2026 at 1:18 AM CET, Gary Guo wrote:
> On 2026-02-14 00:09, Danilo Krummrich wrote:
>> On Sat Feb 14, 2026 at 12:50 AM CET, gary wrote:
>>> If you prefer, I can send out a version with just improved projections=
=20
>>> without
>>> all the generic I/O improvement stuff.
>>=20
>> Yes, that would be great. Otherwise, we can also use as_slice_mut() to=
=20
>> avoid
>> having to touch field_write() directly, but I much prefer the former.
>>=20
>> In any case, I'd like to keep the PteArray type. It can at least=20
>> provide a
>> function to calculate the value from the DMA address for a given index.
>>=20
>> (Would be nice if we'd have something like a dma::Projection<T> type,=20
>> such that we
>> could have PteArray::init(self: dma::Projection<Self>).)
>
> I think once I/O projection work is done, this would just be
>
> impl PteArray {
>      fn init<Base>(self: io::View<'_, Base, Self>>, dma: DmaAddress)
> }
>
> and the generic I/O projection is used inside.

I guess I should have written "Would be nice if we'd have something like a
dma::Projection<T> type *already* [...]", i.e. I meant to say that this way=
 we
could remain close to what the final implementation will look like eventual=
ly.
:)
