Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B633EDEBF9
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 22:03:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66FCE10E8E8;
	Tue,  3 Mar 2026 22:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ctwkj3Xu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A562F44DDE;
	Tue,  3 Mar 2026 21:53:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772574784;
 b=ZmSs0JChdBI7n88JPm1KK9GhasoP4VYTh1usBBHtnueive4kNJ0BnJcWi4nhtGrAZIsnu
 EX+kC3xwd7BTJaBCB5584NHEFn0bHUACCbQ5ql2rnL+gYOAOlWX1LzJXYcGRMJDpvD7A3Es
 CxjbWHLJIL8AHgyhhkjEbm30/NVwam2oXWAFfLZlJJorcllmtzlSN2wJKZnwXhuuJefjcnS
 brnZ7zvh6/xwEWu5PMW0LMbNkTQqjaTYQuE0DMMQ6sp3J9vEHcFCSqjijlGbRrdr3nXCAWV
 kpnKUaLPGEpH5+y80iZTavJPi/MumF23hqwCeuLnMlqPZKcjGLOZ4uCyRccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772574784; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8eDHJk+25HswCMdDd0Yzy8EjQS/VaOqOE7gplvGzZg8=;
 b=mjZiC4X7BJqN6150c5QHQ/uLoj06hLgMj92yIwKLs/2V12irElKRN8p7N7lmD0D6fioWn
 AApNnwrBVg3K+7jviQZxaIb/UNgP+zKK+i1Vn0S0tTC0KuCzDbN+YI43JSbICD6cyPxxJ+4
 obJNSzmHU+W3iI8PYf+QYFYmixUzp04Opqy9wOYWh6yykERCa+82EWZnCUDm4kqA2mk6PLe
 tsI/C7HUlRZZMQMonoq2cs2tLrNg3Zpl35MVYNSg3tIq/BOTRR4OvE9ljl3+76fX2OVeftW
 vkXJjQnAIIZlWeQ9Co5LTlnV4f+F4FE26xevIxfKC61LAWoLUiV+fb7130cQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F087044DD7
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:53:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA6910E078;
	Tue,  3 Mar 2026 22:03:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6836F60097;
	Tue,  3 Mar 2026 22:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E164CC19425;
	Tue,  3 Mar 2026 22:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772575398;
	bh=Sk2JKtIHDvQurEEWouMfvz+cHNgcAnRyc1bQSMn+1lY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Ctwkj3XumUq7AeupEpmrvj6P7ij2aVenRXPJpQdjTSr/wLoZRs6f81RXxAWibsli3
	 Etyf6sg0QMaJujUpLJjaPdKT5q8BhnIIxEez+/hCVUCg0UO3hfebjRjittFayAGEn2
	 BLUt/UedCud0h6MguzRzATsNFG7B4hWj8no0EMvrZp1A9uZ4o7THhliLRCxISp3SR0
	 oc2dlMxa/fEolNyUdjAF0OPIRmEdVL9wfidCgKtj5W43pRUvcn7C29Em12zidHYrUl
	 gQo771D+DHiJCSMN6N6tKp+ybFFQx7oRu7tLwsOjwUVQDP07w2QMFoaxXecDkdLWZs
	 FCUYfEe2rm5VQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 23:03:13 +0100
Message-Id: <DGTHJ9WTIIMY.14J3QXBSDAE6D@kernel.org>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
 <DGPPKJ5W6FVD.29LI1HKSBZSG2@kernel.org>
 <7b3146c1-ce5a-4bf9-9837-57c19b24ada9@nvidia.com>
 <CAPM=9tybjq8_ea+iJXxsWK+OXwExJNjBu50se036-9vhO+KodQ@mail.gmail.com>
In-Reply-To: 
 <CAPM=9tybjq8_ea+iJXxsWK+OXwExJNjBu50se036-9vhO+KodQ@mail.gmail.com>
Message-ID-Hash: GAGB47GVEQE6FXTC4DE554P6Z62ZRGS2
X-Message-ID-Hash: GAGB47GVEQE6FXTC4DE554P6Z62ZRGS2
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>, arunpravin.paneerselvam@amd.com,
 joel@joelfernandes.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GAGB47GVEQE6FXTC4DE554P6Z62ZRGS2/>
Archived-At: 
 <https://lore.freedesktop.org/DGTHJ9WTIIMY.14J3QXBSDAE6D@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 3, 2026 at 10:43 PM CET, Dave Airlie wrote:
> On Tue, 3 Mar 2026 at 07:19, Joel Fernandes <joelagnelf@nvidia.com> wrote=
:
>>
>> Hi Danilo,
>>
>> On Fri, Feb 27, 2026 at 12:30:20PM +0100, Danilo Krummrich wrote:
>> > >
>> > > +RUST [GPU BUDDY]
>> > > +M: Joel Fernandes <joelagnelf@nvidia.com>
>> > > +L: dri-devel@lists.freedesktop.org
>> > > +L: rust-for-linux@vger.kernel.org
>> > > +S: Maintained
>> > > +F: rust/helpers/gpu.c
>> > > +F: rust/kernel/gpu/
>> >
>> > What about adding this to the existing GPU BUDDY ALLOCATOR entry? Mayb=
e you can
>> > offer Matthew and Arun your help.
>> >
>> > Also, this wouldn't be a subentry of "RUST", but the rust version of G=
PU BUDDY,
>> > so it would be "GPU BUDDY [RUST]".
>> >
>> > Also, please add rust/kernel/gpu/ to the "DRM DRIVERS AND COMMON INFRA=
STRUCTURE
>> > [RUST]" entry.
>>
>> Both these additions sound good to me. Just to list all the options belo=
w
>> so we save time on what we all agree on:
>>
>> 1. New GPU BUDDY [RUST] entry.
>>
>> 2. Add it under the existing "DRM DRIVERS AND COMMON INFRASTRUCTURE
>>    [RUST]"
>>
>> 3. Add the rust files under the existing "GPU BUDDY ALLOCATOR" and add
>>    myself and Alex as R:/M:
>>
>
> Number 3 please,

Just in case it wasn't clear from my suggestion above, please also do 2 in
addition.

Thanks,
Danilo
