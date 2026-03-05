Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA23F3093A
	for <nouveau@archiver.kernel.org>; Thu,  5 Mar 2026 11:16:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72FAB10E277;
	Thu,  5 Mar 2026 11:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KJpOjRjs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4E4F844E82;
	Thu,  5 Mar 2026 11:06:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772708772;
 b=zB21F54Q/chctieHgvX71Y7tzl8t+ssJpPj1DxaWhYkxZbA4M+7cWsoyJLmgjJr3RmcSV
 P06fzoXvE/HU95xKKURee+LQtlFTm25VxqoBRRbQAYUBBT4gWdWljOqwtQcJu0/9F7GdMgk
 HALi4LX6b5qtinylu7DuBwkpZL6vEuxHdNbQOD73a1Na7cg9SAxlb+mylC46XgoxiAwEpbW
 Vjd7qsUk11vxxPLLzeYl6nt0OlVATwNJAIOY2OJTbFrxUaPgpzXpOzN5LgBl2A+aqqpNRo+
 5Xv7NwPCFthWX0X6mvMmDvPScl6K//mlPEnjRUXF4Jg24XqxMzu6GFtaN0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772708772; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QCDTnqp29TRXhDe1wAdSV0e3j9wzmT0n4Qk0HlXHugs=;
 b=ftfQ/2BfGB1N3usQ3WW8aBkPgj58K3wst9uJ/6E/HQI7EBGc+IqM/ogJGZYalHAGh1lup
 af+eGc8ik4eTBl1gpFM58QVSO3qPu46yn7Lx5GZrvww6rqd//u3rrgf6tBsk/PP2eBeOjA/
 aVuYOJIK73apxr5EikLCTy5zUUejoSuvpEvaD0GFmZyBgGkv1jnrPhqTbLu4VZNr1L1q7ZU
 bUeapvBf/uHvJYEc+E2p9A4Kl16+8g8PGGvDjj+wU17KuhlALDVomJfX+sIULwCOWyJzcKO
 rVAb0FtNTgJ6colIQA5E4NtC3p5h9pxWjRqtNcHdqbe44TQGipAAOUe8xsLQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 54452402B7
	for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2026 11:06:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 10AED10E251;
	Thu,  5 Mar 2026 11:16:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29DA061344;
	Thu,  5 Mar 2026 11:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C242BC2BC87;
	Thu,  5 Mar 2026 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709389;
	bh=lrn12u6sL6iGiv7dTsc1sF0gtNSSPZgx/BMyrzPZGnw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=KJpOjRjsdjQDEtf+Bo+H9g/cw839Els4EBc5934Vs3bnb7Vyqt2if5+0a6Br7ayBn
	 2KJsfbGKeP0sUDTeiGM5QBSOEOy13j7Q1i4vq3fojuuz4JIjemBNTBbaRWw+bd2D+R
	 6AShFbSzTxvgE0WPKoqyOOk4Aky2wwFxgS34tFJkKEuCHwnJpTsCK3zMsvYvA4aY/Q
	 KM/czFBJIhMFVaa4Ai4u18/LCNpIYOo8sYGArXAGAMwVt3PjE3VvDFBtDdtCMt9guF
	 nWpyWn/qo1zxNHN3HN1vdJYNitDF6IjUSY3uLZU85WZA65s1NJZS9onKA5zA6fSsrN
	 eh4ygkb6vP8CQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 12:16:24 +0100
Message-Id: <DGUT14ILG35P.1UMNRKU93JUM1@kernel.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
 <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
In-Reply-To: <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
Message-ID-Hash: LGS2AEM2PCEU3Y3WLXZRRCXZJHFSHMSI
X-Message-ID-Hash: LGS2AEM2PCEU3Y3WLXZRRCXZJHFSHMSI
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LGS2AEM2PCEU3Y3WLXZRRCXZJHFSHMSI/>
Archived-At: 
 <https://lore.freedesktop.org/DGUT14ILG35P.1UMNRKU93JUM1@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Mar 5, 2026 at 8:37 AM CET, Eliot Courtney wrote:
> On Wed Mar 4, 2026 at 8:39 PM JST, Danilo Krummrich wrote:
>> On Wed Mar 4, 2026 at 2:42 AM CET, Eliot Courtney wrote:
>>> +    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Res=
ult<GspCommand<'_>> {
>>> +        read_poll_timeout(
>>> +            || Ok(self.driver_write_area_size()),
>>> +            |available_bytes| *available_bytes >=3D size_of::<GspMsgEl=
ement>() + size,
>>> +            Delta::ZERO,
>>
>> Isn't this either creating unneccessary thrashing of the memory controll=
er or
>> unnecessary contention at the cache-coherency level?
>>
>> I think we should probably add at least a small delay of something aroun=
d 1us.
>
> This is what nouveau does (specifically `usleep_range(1, 2)`). OTOH,
> openrm just does a busy wait, which is what I replicated here for now.
> GSP command queue not having space IIUC is meant to be very exceptional.
> I am not sure which is best, maybe Alex has an opinion, but also happy
> to change it because that reasoning makes sense to me and I don't know
> enough about the distribution of how often it would actually need
> to wait to know if 0 delay is justified.

Well, what this code says is "let's hammer the cache / memory controller as=
 fast
as we can for up to one second".

This really should come with some justification why it is actually needed f=
or
proper operation of the driver.

@Alex: It also seems that this is based on broken code, i.e. I noticed how =
the
DMA read is done in this case in e.g. gsp_read_ptr().

	fn cpu_read_ptr(&self) -> u32 {
	    let gsp_mem =3D self.0.start_ptr();
=09
	    // SAFETY:
	    //  - The ['CoherentAllocation'] contains at least one object.
	    //  - By the invariants of CoherentAllocation the pointer is valid.
	    (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
	}

Why isn't this using dma_read!()? I think creating this reference is UB.
