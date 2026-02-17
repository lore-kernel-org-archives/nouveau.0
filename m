Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9230DE909C1
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 15:44:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45EF810E4FD;
	Tue, 17 Feb 2026 15:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sVWscTb/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4CF864339B;
	Tue, 17 Feb 2026 15:34:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771342457;
 b=DuGJje63AHTgTTrG3ZBgwvkNZjxqSn2MKe1AMmsCoRY2TZo+ms2ZHloGRuft4oxJXtZaK
 9D3ABz6tKYnrIb5b3g7k9bxo1cSU1WqwJbFP7ek9qrnglaU4AKkOOBa1RR9AM9BmwGxOImC
 vrdHeq27kO8LzWWScDU5SDa8cGVTNY+qJ0PNjBhM77Or6wMQj9y5WeOrKNuPF/WyUkJ0KAe
 aWp3EYaWz/YwTB4Mr1JcRcgxfjA9XNwtMhMgkJ/9WqiGZvzvzldOobdBVhPbIKOBN0F8ah3
 Jr1KcS/97xy6vhKGgRxlnriLeg6Btrs8tPjpCf38SGpuja2nc7tO2VOA7vPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771342457; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xWkZROORPpoNspT3eUibBRJPbrFYSiOPNZLStuG9nhw=;
 b=n7t48ZwQ3Q5j9CEV1ECLr6YbMHZfLvOFIdcGa0X0n7VgcxBfgZuDVN0lgkJGqObudU1Yf
 S6qt2jzvs2pio3geTJfXO6dyxVNLAPnotiBu+GVbiqjBKCLC9tGjeskWvD+gPhXLOqjl/gk
 Av2XaP1TJ/SUO8HbRokG+WJT4fH4J6Z4tHKYjeNP0RWLR3axSWCS/033HfuMFuoXKGh9eVY
 lN7nqdUc/52fRU7LBCG/XjXkakTssGKXs08flnTIGD2Cf1/RxZml2B1v4GhINpbXCFvGZU8
 azkKSQ8JBXw6Apo+h78oFh+Fvpw02231SoFKPbdAwhvZ6RMn6moooGIk30Cw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 56271403B4
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 15:34:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 220B510E4F3
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 15:44:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB18444136;
	Tue, 17 Feb 2026 15:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D88C4CEF7;
	Tue, 17 Feb 2026 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771343040;
	bh=XBoj7jEee6VfITY4FrVhLwIQfn3xCXCky7dYUphWrbg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=sVWscTb/mAJvi7p5NHrL9Wyzu+Rbk2HYWjeFQebqQWPkAr1bjPIMBBT56d2CZSSdz
	 cAgLZNdUAvB7tfhy2u8UghAK8GizWwcQyoVzjmERGfr8fA4VEC5XyQ/PsKEfpcccd3
	 8MdOarGwt7ySv6rGm89MXnQfsscQdlOT2rCSc0Qkt3rQNUtV/8paUxq70iU2a9A6OW
	 9UeGTWVFCZr5POebt+DowX4SfTlmeuhtLBAZY3/AgcUfJp0Wb0gTjn7kGtWeuuvsWX
	 hI9x6xae/QMMPgGk7G/9jUbZ/aUT2F/7mfF3s0y5o/uMm+C1qtWoFH9Fsvo+U1YGZd
	 MFLcJ1Uv++RUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 16:43:54 +0100
Message-Id: <DGHCP8CM5CRI.2C5YJ7S899XE1@kernel.org>
Subject: Re: [PATCH v4 17/33] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon EMEM operations
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-18-jhubbard@nvidia.com>
 <DGC2UTPTU2ZH.3Q5E9OW3ZRPLP@kernel.org>
 <b38a9707-a640-4104-a8a9-238cab23187a@nvidia.com>
In-Reply-To: <b38a9707-a640-4104-a8a9-238cab23187a@nvidia.com>
Message-ID-Hash: UHBGQL2JJPKOHG5J7QT7U4LBBQRO4NSY
X-Message-ID-Hash: UHBGQL2JJPKOHG5J7QT7U4LBBQRO4NSY
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UHBGQL2JJPKOHG5J7QT7U4LBBQRO4NSY/>
Archived-At: 
 <https://lore.freedesktop.org/DGHCP8CM5CRI.2C5YJ7S899XE1@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Feb 12, 2026 at 3:09 AM CET, John Hubbard wrote:
> On 2/11/26 2:57 AM, Danilo Krummrich wrote:
>> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> ...
>>> +    #[expect(unused)]
>>> +    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut=
 [u8]) -> Result {
>>> +        // TODO: replace with `is_multiple_of` once the MSRV is >=3D 1=
.82.
>>> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>>> +            return Err(EINVAL);
>>> +        }
>>> +
>>> +        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
>>> +            .set_rd_mode(true)
>>> +            .set_offset(offset)
>>> +            .write(bar, &Fsp::ID);
>>> +
>>> +        for chunk in data.chunks_exact_mut(4) {
>>> +            let word =3D regs::NV_PFALCON_FALCON_EMEM_DATA::read(bar, =
&Fsp::ID).data();
>>> +            chunk.copy_from_slice(&word.to_le_bytes());
>>> +        }
>>> +
>>> +        Ok(())
>>> +    }
>>> +}
>>=20
>> Technically, we could represent this as a separate I/O backend and use I=
oView /
>> IoSlice (once we have it).
>>=20
>> So, you could have Falcon<Fsp>::emem(), which returns an &Emem that impl=
ements
>> Io [1].
>>=20
>> This way we would get IoView and register!() for free on top of it. IoVi=
ew will
>> allow you to modify fields of the FSP structures similar to what we have=
 for DMA
>> with dma_read!() and dma_write!().
>>=20
>> I just briefly glanced at the subsequent patches, but it looks like this=
 could
>> save quite some code.
>>=20
>> We may not get the full potential right away, as IoView is still WIP, bu=
t I
>> think it makes sense to consider it for a follow-up.
>>=20
>
> Yes, let's keep this in mind.

Just to clarify, I mean we should implement Io and IoCapable right away, bu=
t
leave the rest as follow-up.
