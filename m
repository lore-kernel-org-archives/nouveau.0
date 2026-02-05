Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4A0EC1EB9
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 14:20:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B888310E8E0;
	Thu,  5 Feb 2026 14:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EyKmjYJd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9885D41B49;
	Thu,  5 Feb 2026 14:10:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770300641;
 b=B+fCOpz0P29okpDyhYUEsezKs/uexJcKdrUk6Pti3xAGPZ2OWNN4jAbvngxK6PmdWHme2
 Ngq44fFVsEzS9Lfy3tZn0HayPoXxdjrNTCRj0SbOopax8S2rX4AWmCSadeRGsWIK0GAEJ05
 YKPIGXjzTyoVW3gfYro+Gg3RZ+0hfhVu2n2qyJu/lGZzXtgoXMqBiXyDIzIeQQIHLHpyJ5t
 qcBJ1dF9HA3XAQJgUtLdgNF5ZNiQ7mLIBrA32UMbR81DHOfuNHDpHz86E68DRmS0og+wXIp
 1PJiWAocrgYHAVscA20vhqdbw2IxmPCySy+Wpt9/N2tXPG8Q2aCZbyhPDbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770300641; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tcXAH9VxC0x+vH9l4NpWAP8DAmM24peprbjG/1dik1Q=;
 b=R6It4tIQlv/6ONAP6iShwoj7S4g6fATF4ltrj5irUr9X4PfdYuR/y1Sjj9m7H9wlN4gt1
 OI2bloE+IEeNvJk4Eb37bwoJ2DFzx++cGRv0qRVDkZf+S4UkPB3zX3PFj25kGJ+CREkrg5M
 q5/RISlhYoozm0RBqy71G/ExqviTSthp4tSAwBj2dUtvkTWVeM326V6gaaWS//iIMZDVH02
 omOkcJoZNNhzI8I3uv5I2R8JIBcvXDaQV6wPM6iRFHWNm1BO7OTjxZZ/7dvNoXyrfGBG/5e
 ntIBvI3jrnCoRZ1j1wyqoalDGVIId0pM6A+DRCfDqiyu4Uzb/C25RBBLiCaw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1FBAC402CB
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 14:10:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F3ECA10E8DD
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 14:19:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12CE9600CB;
	Thu,  5 Feb 2026 14:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC1DC4CEF7;
	Thu,  5 Feb 2026 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770301196;
	bh=tcXAH9VxC0x+vH9l4NpWAP8DAmM24peprbjG/1dik1Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=EyKmjYJdfNJP4QS70K68KAqqSLuJEbWES8rpO+rdJjdTd3C4VBqDkzu1Bx7/DQ402
	 ypSXICYbNQvg7rPsRkxoo+YxcZfJqlyQS7rZFBUsV/nk+/FRkuituyUa1IU8tsoo58
	 9J632hOW8tmXvxi3hChIQoTAmofAZgrbydlNB+IQo3RZ4dQUSZdaC9aN7z4p831Qd6
	 V4SRlZCL5Gl+t30P3dwKHVplPivPIOrqNHK9p5Wpj1XvkTV3saL+Fb/hAMIDK/Gg0h
	 SdlrDENMFnFkXVt7gQhDOWCkHJqyDd5OQ6zmSy7QGScxBuq4JtN6L1v9IlJ6+rVtLB
	 sbahm6HHA2byQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 15:19:49 +0100
Message-Id: <DG73EB8091J4.3SFPDC5TLH0M7@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix aux device registration for
 multi-GPU systems
To: "John Hubbard" <jhubbard@nvidia.com>, "Matthew Wilcox"
 <willy@infradead.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205041120.127106-1-jhubbard@nvidia.com>
 <DG72N8GDQ9E0.2FUX560O3I19X@garyguo.net>
 <aYSfpf3xZNwZhzXs@casper.infradead.org>
In-Reply-To: <aYSfpf3xZNwZhzXs@casper.infradead.org>
Message-ID-Hash: YIQVYC7GKPQF3EAC5MKJ5VLXE6JM2TIV
X-Message-ID-Hash: YIQVYC7GKPQF3EAC5MKJ5VLXE6JM2TIV
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YIQVYC7GKPQF3EAC5MKJ5VLXE6JM2TIV/>
Archived-At: 
 <https://lore.freedesktop.org/DG73EB8091J4.3SFPDC5TLH0M7@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Feb 5, 2026 at 2:48 PM CET, Matthew Wilcox wrote:
> On Thu, Feb 05, 2026 at 01:44:27PM +0000, Gary Guo wrote:
>> > Fix this by using an atomic counter to generate unique IDs for each
>> > GPU's aux device registration. The TODO item to eventually use XArray
>> > for recycling aux device IDs is retained, but for now, this works very
>> > nicely.
>> >
>> > This has the side effect of making debugfs[1] work on multi-GPU system=
s.
>>=20
>> Hi John,
>>=20
>> Looks like this is something that should be achieved via IDA?
>
> Yes, if you have no need to go from ID to pointer, an IDA is better.
> That said, as far as I understand what this code is doing, an atomic_t
> solves the problem just fine and is cheaper.

I agree, for now an atomic should be perfectly fine. Though, with enough
patience binding/unbinding the driver from sysfs you can probably make this
overflow. :)

The reason for the Xarray TODO is that it is one option for a place where
nova-core can store nova-drm / vGPU specific data, once either vGPU or nova=
-drm
attaches to the auxiliary device. But I think there may be better alternati=
ves.
