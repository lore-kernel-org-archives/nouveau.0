Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D958FF885D
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 10:53:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E7DB710EB0A;
	Tue, 28 Apr 2026 10:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oS9hRR2M";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E58F845C88;
	Tue, 28 Apr 2026 10:41:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777372880;
 b=BO/CbIiJBZUEty9Kcy2iJNXyBcqyDPbleMolpIPzddw4gHBWu/CcYoGohTCCFc64hwzxk
 hP4hT9M9lponYth8eD6DeauZU/0umJHmGDtvZeeTax51J9mxC/l2jI0vpa4nOe0SkxHezGd
 sx1MAO5RciVKUrGXqpbeglISVpJ1SJyvbE4NmMF/1DmszkmnRbf/HtmQAAyjO9RVNgM1Lc0
 R5yimA6rPVKUtnpGqzNIWEBYM58hPXXzxmIGOs6he+uHOaNyDVDhFIQxl5jXT+TRXv2JHGP
 xQnWvAswsrsX3bORMRRERYRIlg2ib0KEhued1ndMEe3f2C5jd7L9QdU679uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777372880; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TDr/EFa2HIS+v0+LH1fdKH/swMkUZ8nmR95Nl5UjJK0=;
 b=bhovPgASNsd7nFVVvwdj7GD8TYtTkX98S/1x25TFQzLvb2/ZwgMFDenwlg4WtjVOZMzIu
 F8tYk1zWnMl0KJIGSKE7UoxXDUgHz1ZaM+mKDTAqlFFmfQABeUYdqKuX5S5ZoSAIaYVhH0v
 SzC4vbujxLrb5lVC62MLg/Uh3vafR8rA7T2x1gcL6q9piObmESF53O2yVaIWFNPcb0VpGtE
 nms5JlDYHgDUbwGi0CqvNQro/a51CxTCIySEyM2RLFUjQzJE2rgeRcF7KlzEtYfSK140SJP
 ycO9MtJ72FTJl/3HomEGPwQ9ok7qlCgYRlPws9UUSIBs3bg2lGZYhJ59SJVA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0A7DD45C76
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 10:41:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CFC8E10EAFE;
	Tue, 28 Apr 2026 10:53:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ACBD42A5C;
	Tue, 28 Apr 2026 10:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3101C2BCAF;
	Tue, 28 Apr 2026 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373619;
	bh=nli8iL0UDuKMNz0EFiwRnRD7S6+egKizQtirZgiozV8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oS9hRR2MY804BzfIchS3H290u1GhLRVebtOaPvj2AoKEK9SsiZK1hBt3R06g85rZa
	 kPHNtylqx4TcVZhKJmpPpF0BloBFJ/Nyq9wsA//5dTcuEm+S9xIBxMdB8buhH28TCs
	 /5ntXci365UEi5tFG7yOyLihiTmUIrJfj5/CUNdHMlW7LENk/CntVVjbeedCdC9Ei6
	 yJxjOsflRj64ElaTEjTGDqucPB05E4nAEt/gpP+1mWXiDfQIVaOYdVz9N9u/5GnYWJ
	 83XYZTPwiR7UoQusZc431NsSZDCuHcv7glukVjVEw2toCIsWFq4o3jh1FwgQWjwj1V
	 HuAn5MXSjHj2Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Daniel Almeida
 <daniel.almeida@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Abdiel
 Janulgue
 <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 06/11] rust: io: add view type
In-Reply-To: <20260421-io_projection-v2-6-4c251c692ef4@garyguo.net>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-6-4c251c692ef4@garyguo.net>
Date: Tue, 28 Apr 2026 12:53:18 +0200
Message-ID: <87zf2npd9d.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: CPVN5WMV3KILYKQYZBZAJENJSSEVEJMY
X-Message-ID-Hash: CPVN5WMV3KILYKQYZBZAJENJSSEVEJMY
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CPVN5WMV3KILYKQYZBZAJENJSSEVEJMY/>
Archived-At: 
 <https://lore.freedesktop.org/87zf2npd9d.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gary Guo <gary@garyguo.net> writes:

> The view may be created statically via I/O projection using `io_project!()`
> macro to perform compile-time checks, or created by type-casting an
> existing view type with `try_cast()` function, where the size and alignment
> checks are performed at runtime.
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/io.rs | 147 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 146 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index a13be8c5fd2d..869071d47a13 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -7,7 +7,11 @@
>  use crate::{
>      bindings,
>      prelude::*,
> -    ptr::KnownSize, //
> +    ptr::KnownSize,
> +    transmute::{
> +        AsBytes,
> +        FromBytes, //
> +    }, //
>  };
>  
>  pub mod mem;
> @@ -297,6 +301,13 @@ pub trait Io {
>      /// Type of this I/O region. For untyped I/O regions, [`Region`] type can be used.
>      type Type: ?Sized + KnownSize;
>  
> +    /// Get a [`View`] covering the entire region.
> +    #[inline]
> +    fn as_view(&self) -> View<'_, Self, Self::Type> {
> +        // SAFETY: This is an empty projection, so it trivially satisfies the invariant.
> +        unsafe { View::new_unchecked(self, self.as_ptr()) }
> +    }
> +

Sorry, I missed your reply on v1. This is better. Should it be "identity
projection" rather than "empty projection", or is "emtpy projection" the
correct term?

However, I don't see why we cannot put:

SAFETY:
 - By existence of `&self`, `self.as_ptr()` is aligned.
 - `self.as_ptr()` has same provenance as `self.as_ptr()`.
 - `self.byte_offset_from(self.as_ptr())` is 0.

I think the verbosity is fine. It makes it easier to check the safety
preconditions when scanning the code.


Best regards,
Andreas Hindborg


