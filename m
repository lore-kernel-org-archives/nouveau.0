Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABABCF01827
	for <nouveau@archiver.kernel.org>; Fri,  6 Mar 2026 11:03:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 84F1810ECEE;
	Fri,  6 Mar 2026 11:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RTDbKOpx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2918244F53;
	Fri,  6 Mar 2026 10:53:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772794394;
 b=OxBimbJ9oqM6FdD4923Zy5QPl6iFHV7r3eghqwjslOCz2R7P3k/0BbVKxYrDPJsCy4uFp
 SVrvpaV01XSfgZk8nvLgIpKOjAb8sdZd6oHsa5iQh93hx44y6fwMZYRsQkly+jOELN7KhEb
 TUr8uiaK/a/AXJ53LPhWtr68Q+GCKAnlDJ30AipWpYTug7BIaALDFB5NzfiCvuf3op7owFR
 O81sO5936nuLs2TFo6BpZjteNFoak5TWO3LJBFXHNxuLvk2DIFfqwRqHMNGf8X5D/JNtvX0
 hxAFDXd8PrLvqp5OImyAk2JYl/l4/txqG4hXZ01Q3KLiPvF97y4TFHIz2ptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772794394; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uQ+gikbXgAj0jyufF+4r60g0YN2hEmYsT0ipd9s6X7k=;
 b=CsbAQSlLioTzH15UbZVuK5SAPFgTjWIhpYP5RiW3YTK2CAarlctD/ADLQ/eHVaV+b2a4E
 S3y0hkQ77E5PG0ZMGuhweBHiHzVKZHzGPiwRc4mi4r6jCtZKNK5+wvPFAfmUutXXd+wDlLr
 4CbBEkFEpUWQNfGhkYk4p6cjgIy0y8YGyeRzTPs0w1UMl6k3k2C2+t4MXDc78IdOX3Tc2iG
 XSIeqWanqj+i0bxAuy2Bj43NpRrIxXrGrabT0ug8DHVyJN2UoadXXJL1FVBkJ0+LYdiaRao
 09uzFEfhve1dDfNkdPmOdyWF5F02QxLwRgfACh1nUT+cJowwHplElhWFF8jw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 40CA6404AB
	for <nouveau@lists.freedesktop.org>; Fri,  6 Mar 2026 10:53:11 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 622C010ECDE;
	Fri,  6 Mar 2026 11:03:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E820043EE2;
	Fri,  6 Mar 2026 11:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C08BC2BCB3;
	Fri,  6 Mar 2026 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772795014;
	bh=9kYhONNOuHNdTnEFXcExgHi8n0fGbiUgRAaTDCbIcqI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=RTDbKOpxoF1J+0YGsIe4inkKZkkELNb0sZAhBcxnObYCNGFEcQIeMcIAwm7nGM99n
	 GSijIOczN3ZbGAJxa6xwXdRUPU8cNCMuweonYby9//8PlSIedpowNvgceKpjNcD4DU
	 bk6s5STkAeZM7mV2YnotGvhjQX9F7gOTNI7a5HQzKHL2T4634gdn5IFGGFm81v4LwW
	 VsdnjLAFAZHGvlRBFhbWoEGoqjRpXdOQvuaLZ9e8Eg10daSLpEuVOBg3gCTj4wvuuM
	 3Looy0HT6EdabLHJQ1Ywd23hygCGXPL7+fACrTlouGML20s1c8hs7kdbuzD/5r/AKf
	 Ph1n6uuXgCRrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 12:03:28 +0100
Message-Id: <DGVNDRM96OTJ.1RD1IGZ4QV5VF@kernel.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
 <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
 <DGUT14ILG35P.1UMNRKU93JUM1@kernel.org>
 <DGVAB40GKAYG.3MX3IZQO1816A@nvidia.com>
In-Reply-To: <DGVAB40GKAYG.3MX3IZQO1816A@nvidia.com>
Message-ID-Hash: NVHSNK6IUUKC32EPEN5KI3SCR376GPXB
X-Message-ID-Hash: NVHSNK6IUUKC32EPEN5KI3SCR376GPXB
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Zhi Wang <zhiw@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NVHSNK6IUUKC32EPEN5KI3SCR376GPXB/>
Archived-At: 
 <https://lore.freedesktop.org/DGVNDRM96OTJ.1RD1IGZ4QV5VF@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Mar 6, 2026 at 1:48 AM CET, Alexandre Courbot wrote:
> On Thu Mar 5, 2026 at 8:16 PM JST, Danilo Krummrich wrote:
>> @Alex: It also seems that this is based on broken code, i.e. I noticed h=
ow the
>> DMA read is done in this case in e.g. gsp_read_ptr().
>>
>> 	fn cpu_read_ptr(&self) -> u32 {
>> 	    let gsp_mem =3D self.0.start_ptr();
>> =09
>> 	    // SAFETY:
>> 	    //  - The ['CoherentAllocation'] contains at least one object.
>> 	    //  - By the invariants of CoherentAllocation the pointer is valid.
>> 	    (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
>> 	}
>>
>> Why isn't this using dma_read!()? I think creating this reference is UB.
>
> We can't - technically we would have to have the `dma_read` in `cmdq.rs`
> so it can access the `CoherentAllocation` (and do an unwrap in the
> process):
>
>     dma_read!(self.0, 0, .gspq.rx.0.readPtr).unwrap()
>
> ... but that cannot be done as `MsgqRxHeader` is part of the bindings
> (i.e. in `fw.rs`) and thus its internal fields are not visible to
> `cmdq.rs`, as per our policy of making the bindigns opaque.

We can have a helpers for doing such dma_read!() calls in gsp/fw.rs instead=
, and
just forward from the actual methods.

	fn cpu_read_ptr(&self) -> u32 {
	    fw:gsp_mem::cpu_rx_ptr(self) % MSGQ_NUM_PAGES
	}

> This can probably be done better with I/O projections, but for now we hav=
e to
> do the read_volatile by ourselves.

Not necessarily, see above.

> What makes this reference UB btw?

Gary explained this in another reply already; I think fixing this with Opaq=
ue or
passing raw pointers instead involves even more unsafe. Whereas the simple
indirection from above is fully safe and can easily replaced with I/O
projections once we have them.
