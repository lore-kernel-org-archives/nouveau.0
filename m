Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFE8EB1049
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 10:35:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A136310E24F;
	Tue, 10 Mar 2026 10:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m5uljI2K";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5F14C45012;
	Tue, 10 Mar 2026 10:24:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773138277;
 b=PiEva9QEeTPyI8J2ma93sSuj4P34sTuwDf1A27sOziLximR9a8VHqHrMnBxWHwHect+QW
 JzRop1bo9OZApKw+UpJsfTvDpnyV1gTzjyQ0n3M1aEPBCK9hxIfxKjZwq8zC29EMTO6vuLf
 Q6vnJeJm3H4jvBoG1GifH5TeZqGarlGfAFj1DpYl/AHQnYufWlrPwUaH/vrLsXsUunWWlw2
 j4/GiK+Y1P/gdPZR+awT3Vf6ymMCWvJ2vRJtfTD5Dheqo9Sg3/dbg7skh5C0Fk56f5XvENN
 lbknRIdSY7Bqt0sQgTwEmRFV4PImT/VDRh2lb19bitNJBGXTvx+NcTtJ/9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773138277; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wqJe0YuDQBn2Qa/KMuGpy+q96kXH0dc7G6EcIkd0sDA=;
 b=bjpLK0WZNTPiM50HJ+VJD9fwVjm3AAuPnfTtRLpKzVHWvp0BvKyb0mPC+Fc2YRu0TlbaN
 9CuLmVFn7b3GOZGfMLQ4yBluzQXgg6ryddfI6GTNofnWMt4Zrsh4tR8dUN4cuZBzhU6eyHz
 BSPyoFbQg5Nr3xrP9+yhB+UjahPa4oU6VhtUdZb+MWkwDxb1h1rhns7CbgogqyM0JfzTziV
 x0p2Cl9Y6PQ+wTiWcDvlmOOgNpOzaFnZo+RzO8ahaRvR4plmqwlptUntBSF+ofRUZlZjQgs
 SK/tqDhBDRAgWpFmbMsYado6X1P+A0yyOCWhGhmrbOzor/uxF7KecP4FVFdw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 350B944E0F
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 10:24:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3749B10E113;
	Tue, 10 Mar 2026 10:35:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5105417C1;
	Tue, 10 Mar 2026 10:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C501C19423;
	Tue, 10 Mar 2026 10:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773138907;
	bh=o3jFtbDjVq5zxQWyC4adOecn3nFUZ4TF7ZRoY2jTlWY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=m5uljI2Ka7GzfelDMbi9R1Wj/orOidAngK08ZDDKKF0nHYm5Ickl+hWJqTzZ/c5Ve
	 t6Vl4F15Z1v4nPQaGFjZ8o/pNTOtJpq/OCYMwSBG/KPjSAlGhi0BFgOMrsiUh91VQ8
	 qfwGfyDOaFYquyHQtA7rdsOMyU59Uhhf0/Ce+rEGljMLNT/9jCGZPPSFF4s+kZ6liw
	 s9KcXrz6aKXdZoSUF4kdvn+X/Z238a55uxUupNKgSlaxAHM6KsNeHO6f+8G3ZnIoqH
	 1IqxbWE1wOf/enu7gFSv81T65tiqLyIM2LGHJyFTHVLTkcV8ijY1uNt7A/McfNNVSu
	 SWvgXjZNAsLAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 11:35:04 +0100
Message-Id: <DGZ1A7CGUNF4.3035UQ0ZGPHBA@kernel.org>
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: expose GSP-RM internal client
 and subdevice handles
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <288fc58b-657c-4e8c-b6bc-d07afe14bb97@nvidia.com>
 <eaba411f-d882-4175-ac43-a9217fbb915b@nvidia.com>
 <DGYR3ZICOYFB.2ZHQ2CTUO2UIP@nvidia.com>
 <DGYSXKA569RE.2KZUJR434RNJM@nvidia.com>
In-Reply-To: <DGYSXKA569RE.2KZUJR434RNJM@nvidia.com>
Message-ID-Hash: WA7WXI3F7HFWZAJBG7YUF2G5UFTOGMV7
X-Message-ID-Hash: WA7WXI3F7HFWZAJBG7YUF2G5UFTOGMV7
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WA7WXI3F7HFWZAJBG7YUF2G5UFTOGMV7/>
Archived-At: 
 <https://lore.freedesktop.org/DGZ1A7CGUNF4.3035UQ0ZGPHBA@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 10, 2026 at 5:02 AM CET, Eliot Courtney wrote:
> On Tue Mar 10, 2026 at 11:36 AM JST, Alexandre Courbot wrote:
>> On Tue Mar 10, 2026 at 11:17 AM JST, Joel Fernandes wrote:
>>>> On Mar 9, 2026, at 8:06=E2=80=AFPM, John Hubbard <jhubbard@nvidia.com>=
 wrote:
>>>> On 3/9/26 4:41 PM, Joel Fernandes wrote:
>>>>>>> On Mar 9, 2026, at 5:22=E2=80=AFPM, Joel Fernandes <joelagnelf@nvid=
ia.com> wrote:
>>>>>> On Fri, Feb 27, 2026 at 09:32:08PM +0900, Eliot Courtney wrote:
>>>>>>> +    h_client: u32,
>>>>>>> +    h_subdevice: u32,
>>>>>>=20
>>>>>> I would rather have more descriptive names please. 'client_handle',
>>>>=20
>>>> Maybe it's better to mirror the Open RM names, which are ancient and
>>>> well known in those circles. Changing them at this point is probably
>>>> going to result in a slightly worse situation, because there are
>>>> probably millions of lines of code out there that use the existing
>>>> nomenclature.
>>>
>>> I have to disagree a bit here. Saying h_ in code is a bit meaningless:
>>> there is no mention of the word "handle" anywhere near these fields.
>>> h_ could mean "higher", "hardware", or any number of things. The only
>>> reason I know it means "handle" is because of expertise with Nvidia
>>> drivers. The `_handle` suffix is self-documenting; `h_` is not.
>>
>> I tend to agree with Joel that we should try to avoid NVisms when they
>> get in the way of clarity - that's what we did so far actually. We can
>> always mention the RM name of fields in the doccomments.
>>
>> The only exception being generated bindings, but they reside in their
>> own module and are opaque to the rest of the driver.
>
> Thanks everyone for your comments so far. I don't mind about the naming,
> I can see both arguments. But we have two votes for different names for
> h_client/h_subdevice/etc so far, so I'll go with that for now. If anyone
> has any other suggested names keen to hear.

Please don't mirror names from other drivers (regardless whether it is Open=
 RM,
nouveau, etc.) just to be consistent with the naming of other drivers. If t=
he
name is good, great, otherwise please pick what makes the most sense.

In this case h_client and h_subdevice aren't great names at all. I don't wa=
nt to
establish a pattern where we prefix handles with 'h' to distinguish them fr=
om
other values.

There is no reason to have such a convention if we can just represent a
handle through a proper type (which has other advantages as well), i.e. we =
don't
need to resolve any ambiguity due to a primitive type.

For instance, we could have a gsp::Handle type and then this could just bec=
ome:

	client: gsp::Handle,
	subdev: gsp::Handle,

If we want type safety to a point where we can't even confuse different typ=
es of
handles, we could give them a type state, so we don't have to re-implement =
the
same thing multiple times, e.g.


	client: gsp::Handle<Client>,
	subdev: gsp::Handle<Subdev>,

I.e. when a method expects a client handle, nothing else can be passed it.

- Danilo
