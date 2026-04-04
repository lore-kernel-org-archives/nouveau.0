Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E631E88D66
	for <nouveau@archiver.kernel.org>; Sat,  4 Apr 2026 09:37:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 38B7010E3F2;
	Sat,  4 Apr 2026 09:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IPgU0/Yi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8AC544557A;
	Sat,  4 Apr 2026 09:26:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775294771;
 b=k8AVR8niAk26wo4+3ULRj0pw4YKeCtIavDIw6/lm0pgJ2KLiorMgqKEWZ3K7LYs6XhQsW
 N1lPfZ4y7bKhSWEo9DGBSBQwhgbM7uRZr6Rgfh7AnPnMR/8SAVyzsQhEo9mHHtLo0pTBC3i
 tDkFq0yByfQB7iZqHlsGvQhVW3Q8Z/yQV2iU5fBzMN8PTdkV5MLBMnxGovQgUqo5rFPY0Qa
 LxaYNw7fygv/7Yvx0CArZVN2B/Ti/tsM7v5Ke+zDsv2lXPkd73WcdHle6qnHvbhSNJeb805
 3fhjsgFHStjRVioZzeWBA4RMngkSGT4r2hnR+KMcBQCokglfjGqFmWma+SSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775294771; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AbBBJoIGzishqNqdtX0FtkBd5lgF7H5IVr8LCN0OyRo=;
 b=OuXUrRe6n0Tap+Y7ckyfr/LaL66Yu2WwuO+DMBiFEUMRWHIU9hvpit7Sjb6qbOh4sYzPt
 5CyphUc7ljvpiArpX5i0WaywuRuMCnQK/xer4rzoKrfsc1FqFqbuDBQeYozekhe2Axqq9iQ
 2kOcCR0xul8dHigaiKI4okaF5jVhC9lGcjpsGamIZ4ODG0VOi9oCbBkvG2rloikVNj63H0+
 ga7LqWg8Iq+rvKUvWkeIeE0UIMjdJ4JJihuBEvsP6J/z/k1vUxDkcONN2ughsFLM23UecGM
 PvrCmc1aQvjGHMR5oqu6iZnWEaEE4MpnXlOOMtQY75wKshhmzDDOvgYGF9Kg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 229BF45021
	for <nouveau@lists.freedesktop.org>; Sat,  4 Apr 2026 09:26:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E52210E00D
	for <nouveau@lists.freedesktop.org>; Sat,  4 Apr 2026 09:37:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A82E60008;
	Sat,  4 Apr 2026 09:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886B2C19421;
	Sat,  4 Apr 2026 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775295455;
	bh=CFGHlbAEFmv5i5GXWAWXlFtVeEAQkwUevCp//wWwtOE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=IPgU0/YigvS1kWRD7y1Pz9hi0+/kU/FF0PD/i/uO5DBAgmh2RR2P8H+UrgrjEwQFT
	 NUB2uB3KIHr9jmTNLaaFmDQoDiogrG/VjsIhRigaDRy2U9G0lqKnD6OlpZ/jSMEwYk
	 fV6Cm77CWc/MlliCpCr8J8AGVbgUdT2+oqUpUti8NCyxfLyVLllAqTmkAxx5c62WlA
	 9PlC/fdy2PRtIwubQHO61bksUQLISs57wSUpKnEUYUwU+rXXOeDRPSzRQZB3BUSVUA
	 gRxR+zLmpcWu3/6YoHf30TLg8DfWvTQddwJATbzB4NUYoVEQU6XtQ29QQUbaxvhw6q
	 4AyJWBNc3KYng==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 11:37:31 +0200
Message-Id: <DHK9PRHYE24E.1ORKH4YACNW9L@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix missing colon in SEC2 boot debug
 message
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260331103744.605683-1-devnexen@gmail.com>
 <DHK0ECA2BBVR.K2PTR9039QEF@nvidia.com>
In-Reply-To: <DHK0ECA2BBVR.K2PTR9039QEF@nvidia.com>
Message-ID-Hash: KHFBDA6NHFGGTGO4NM6MRFFJOHBYDDRA
X-Message-ID-Hash: KHFBDA6NHFGGTGO4NM6MRFFJOHBYDDRA
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: David Carlier <devnexen@gmail.com>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KHFBDA6NHFGGTGO4NM6MRFFJOHBYDDRA/>
Archived-At: 
 <https://lore.freedesktop.org/DHK9PRHYE24E.1ORKH4YACNW9L@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Apr 4, 2026 at 4:19 AM CEST, Alexandre Courbot wrote:
> On Tue Mar 31, 2026 at 7:37 PM JST, David Carlier wrote:
>> The SEC2 mailbox debug output formats MBOX1 without a colon separator,
>> producing "MBOX10xdead" instead of "MBOX1: 0xdead". The GSP debug
>> message a few lines above uses the correct format.
>>
>> Fixes: 5949d419c193 ("gpu: nova-core: gsp: Boot GSP")
>> Signed-off-by: David Carlier <devnexen@gmail.com>
>> ---
>>  drivers/gpu/nova-core/gsp/boot.rs | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/g=
sp/boot.rs
>> index 6f707b3d1a54..18f356c9178e 100644
>> --- a/drivers/gpu/nova-core/gsp/boot.rs
>> +++ b/drivers/gpu/nova-core/gsp/boot.rs
>> @@ -195,7 +195,7 @@ pub(crate) fn boot(
>>              Some(wpr_handle as u32),
>>              Some((wpr_handle >> 32) as u32),
>>          )?;
>> -        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1)=
;
>> +        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox=
1);
>> =20
>>          if mbox0 !=3D 0 {
>>              dev_err!(pdev, "Booter-load failed with error {:#x}\n", mbo=
x0);
>> --=20
>> 2.53.0
>
> Thanks for the patch! The issue is also technically fixed by [1] but I
> prefer having one fix per patch, so thinking about taking it anyway.
>
> Danilo, do you mind if I fast-track this one into drm-rust-next since it
> introduces no possibility of breakage and is technically a fix? This
> would allow the Blackwell series to rebase nicely.

I don't mind if we end up picking your v5 of the UB fix in the next days, s=
o it
is still in time for another drm-rust-next PR before the merge window opens=
.

Otherwise, I wouldn't send a PR just for this.

> [1] https://lore.kernel.org/all/20260326013902.588242-29-jhubbard@nvidia.=
com/

