Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1217EE9A04E
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 16:25:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8125E10E71E;
	Thu, 19 Feb 2026 16:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lIboqRIW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EE2F243432;
	Thu, 19 Feb 2026 16:15:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771517708;
 b=t+oI61u3JOJLddOtnmr1UXCLF1MGLauVG+Ojk3ZHL6uq0ZrEbvGPURTzrUTHHvmhXzuPY
 a7+/0uWbB5Fs5JInP3wQpO5BrBeIG1d+VW/g/VsPsRtOsP+n0G4yN8nHUWC3CixA5g4SqjQ
 fp+RydZWOXkuN5yf3WDYXWZminIplPduD6wwmvMYVadZnzV3EVoaurNCSmLYjU2Vdku+Gh/
 bes4KKLhp9g6Bv0c7vh5qY75TIqZa37Ba8Fj54l35743aKg7rR2y1x1chiSIhZuZPvsxDIq
 8uVBAZ0TBMF5hwU40s9j+Y+Nnt+wUTVaYkneR3ynXS/O1ZB61MWL/SmUupEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771517708; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wr1s7cTPpfno0cPKnTeyLJYtH8PL5k8uX63BkP8Twbs=;
 b=i58QqG827Xx08CHGLQE0S/NFxhON9guR53kPEOEJ6xiu2IlDab2J/uNQPEmq8E8MeMBMd
 ICks1XMaoANDb7cx3QtcmKRHPCP4vgPOdQGEURc4w5aJAm7hy/n02itThCRbLknImpXFgxf
 zEzoYbhseFS3wfVA7wWwVy2FMHPJmn/7NGnwFJKnIpI8wh7vjOLSmFEDOyrel9FGfYQesZ9
 Ltz1Xu0nrjHBHanfEvnS5v6a4ptA5mXhQIgzaIAGn6bHmI2Y9MlhP9sd4JnlxPrAZlXUYRp
 WEN5dktBAzBHprtvGfNvzujSu+FMbfX3ukIrncforw6lg5M2eG3FxzQxXyCA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6E1ED43423
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 16:15:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B34CD10E714;
	Thu, 19 Feb 2026 16:24:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CE3543966;
	Thu, 19 Feb 2026 16:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CD2C4CEF7;
	Thu, 19 Feb 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771518296;
	bh=OCRBu9qsD2GHhHV+NJGvV6X8iN1sZS9eqVlDPCtnB9E=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=lIboqRIWWI0Nl11/uAb1VygPApq8lQgg+bC6qBlJREYwyEDXFh+Dofxp3rOm5PPWC
	 dLp215UoDS1K1KqVDFaU6waG4ydZq2m1U7C3dGvt1uQ8i6w2xDBLqgkG3mrxcMgHse
	 tlDJsS1OHKsdaa0Etb6zN7zn2l9MBt4WUK89r0gxOryHFoRNRHpssPK4uLayAAZZzQ
	 JdLWT3UZXTBrmlJET+6UvN8q6ZcBfYRVtI3ZYR3nCQCCM2tYtkag39OXGCG9l1D7Eg
	 YUwwql64EkbFNnVDCrsWk8iMbekXQtMs24PBIhpmiIbo2aG+q34Uw9lBE+0NgAZaMY
	 +5djkniION80w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 17:24:50 +0100
Message-Id: <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
In-Reply-To: <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
Message-ID-Hash: QABEUVKAPVCROMYRVZ7X2QFV6AW3E7DX
X-Message-ID-Hash: QABEUVKAPVCROMYRVZ7X2QFV6AW3E7DX
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QABEUVKAPVCROMYRVZ7X2QFV6AW3E7DX/>
Archived-At: 
 <https://lore.freedesktop.org/DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Feb 19, 2026 at 4:44 PM CET, Joel Fernandes wrote:
>
>
> On 2/19/2026 10:27 AM, Joel Fernandes wrote:
>> On Thu, Feb 19, 2026 at 12:21:56PM +0100, Danilo Krummrich wrote:
>>> On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
>>>> +RUST TO C LIST INTERFACES
>>> Maybe this should just be "RUST [FFI]" instead (in case Alex and you wa=
nt to
>>> sign up for looking after FFI helper infrastructure in general)?
>>
>> Good idea, done.
>
> Actually, I am not sure we want to commit to entire RUST FFI infra though=
 its
> pretty tiny right now. Most of this infra right now is clist, let us star=
t with
> keeping it as is "RUST TO C LIST INTERFACES" ? Or we could make it "C LIS=
T
> INTERFACES [RUST]" sections.

I feel like it makes a bit more sense to have an entry for the entire class=
 of
"RUST [FFI]" infrastructure.

I could imagine that we will find quite some more cases where an FFI abstra=
ction
layer makes sense; at some point it might even go the other way around.

Once that happens, I think it would be good to have people looking after
intermediate FFI layers in general. But it does not have to be you of cours=
e.

Maybe we can create the "RUST [FFI]" entry already with the following
constraint:

	RUST [FFI]
	M:	Joel Fernandes <joelagnelf@nvidia.com> (CLIST)
	M:	Alexandre Courbot <acourbot@nvidia.com> (CLIST)
	L:	rust-for-linux@vger.kernel.org
	S:	Maintained
	F:	rust/kernel/ffi/
