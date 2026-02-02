Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2601E7DEF0
	for <nouveau@archiver.kernel.org>; Mon,  2 Feb 2026 14:52:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE2A10E4ED;
	Mon,  2 Feb 2026 14:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EsI6GGBR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2080C41B0A;
	Mon,  2 Feb 2026 14:43:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770043426;
 b=F9e1SBEzk/OPa/XSeLV68JigaxYshTHnzNwJVIIvixxdE+mziPyrTuiK1OgGAUTo5LCgA
 Mh08VQV5db830nxBJvMAF6YvaJFRUbZsKTjP8C9mtleys7O1g8/mvtTWj7JVUmUx8aQk1KG
 tvmFHrXP7ZqR1JBTwN9KiX5PPzCbNGUPY6xaA9sjL0lKnq3TZx/ObcC8d5zKuxKn4K93vX/
 dyEKZhFxzND8UhDr5lp8xXQuBtkE5FED1bbKj82S24E6BGCIiqFtQ5mgJBlY1Psm1Mm8mCP
 Y2JNBhoW5VNBffSWx9PVG+7q3DXs+w5y4WReYIw9PAH+wFZ2e38pT+pbm4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770043426; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uV8IMfWqiVu0si7KncZbLY0Xb5dgPXNpmKCyXjjfgIo=;
 b=VZSFVfR25K3/Jor1GKG+bwR5H0lOERPaHWP23Hokr8ZUybvb6hnKz2tjE7BOEBmczK9NG
 fGoP4nf6r0CpDZF79QdgviTLoMovDukR/l128bRD7Z7AooRwtH7bNGEB07Miysv4Lzoub2U
 X0Ep2ItxQEZZLTkB7J4QVVuHwD6UcblgnNbwneG/e3MDbtUkHYWBjgvpjuwG3nMx63qWikz
 HaSvJbRzFD+OK7tdgTP3pa6D+tuWvoZkaDQS5U2KGTgr69eSYf6If1hOL0XPClmXTiNPBQg
 rTydLpjZtmw6vmEI7oeKvHobjwQIZK1KKF+nTp0N8V3D/Di7pu5i52DUpD7Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B891240F1F
	for <nouveau@lists.freedesktop.org>; Mon,  2 Feb 2026 14:43:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 084FC10E445
	for <nouveau@lists.freedesktop.org>; Mon,  2 Feb 2026 14:52:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7FFE40165;
	Mon,  2 Feb 2026 14:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EA7C116C6;
	Mon,  2 Feb 2026 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770043976;
	bh=DpKN1zB9jDt5oLNW9GWwTCcpJ9LVGF8ljqdByG6v1QY=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=EsI6GGBRD6G7M96GB0buE0ifwjXzDUAmK0Tv7femLa8HX+86PIhZlqpukrFyCLNy0
	 CH3kM7dzUpPq6yiUCAC8GbZYpxEWEIpDPb3UZGc4wtuWMWTdbbbQFMnQBRx/w0d+y6
	 gs2+TcoW3DLJ1DHv3asu75XjoQdoIQCi78KrNAsnSYukkH/U6Vk5JHGkGVsA7nMQOt
	 m1zaSknm4t36bRbimxsccNY/sp0pMnA8/969UAQ774y1vyF4djsekNGVYbSgy57rQk
	 QeSLHQnRUdcsyixG+zDllPewP2ieK1zp7jzMKbN17lrvIke2YU55NEv2gOGKmWQ2am
	 eRPVlkWoHZU0g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 15:52:50 +0100
Message-Id: <DG4K7YGOOHA0.PR72G7RL07PE@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 08/30] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
References: <20260131005604.454172-1-jhubbard@nvidia.com>
 <20260131005604.454172-9-jhubbard@nvidia.com>
 <DG4K5PA5DYIF.1BWA30EA8G1LQ@garyguo.net>
In-Reply-To: <DG4K5PA5DYIF.1BWA30EA8G1LQ@garyguo.net>
Message-ID-Hash: ZFPBVS5Z54BVFZ5AGPHQHTYGDKDKQ7MM
X-Message-ID-Hash: ZFPBVS5Z54BVFZ5AGPHQHTYGDKDKQ7MM
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZFPBVS5Z54BVFZ5AGPHQHTYGDKDKQ7MM/>
Archived-At: 
 <https://lore.freedesktop.org/DG4K7YGOOHA0.PR72G7RL07PE@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Feb 2, 2026 at 3:49 PM CET, Gary Guo wrote:
> On Sat Jan 31, 2026 at 12:55 AM GMT, John Hubbard wrote:
>> Hopper and Blackwell GPUs use FSP-based secure boot and do not require
>> waiting for GFW_BOOT completion. Skip this step for these architectures.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 2e7b90b80877..2ed0f6d8d19d 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -304,10 +304,19 @@ pub(crate) fn new<'a>(
>>          let chipset =3D spec.chipset();
>> =20
>>          try_pin_init!(Self {
>> -            // We must wait for GFW_BOOT completion before doing any si=
gnificant setup on the GPU.
>> +            // Turing, Ampere, Ada: we must wait for GFW_BOOT completio=
n before doing any
>> +            // significant setup on the GPU.
>> +            //
>> +            // Hopper/Blackwell: skip GFW_BOOT completion waiting entir=
ely, and use the simpler FSP
>> +            // Chain of Trust boot path (elsewhere) instead.
>>              _: {
>> -                gfw::wait_gfw_boot_completion(bar)
>> -                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot =
did not complete\n"))?;
>> +                if matches!(
>> +                    chipset.arch(),
>> +                    Architecture::Turing | Architecture::Ampere | Archi=
tecture::Ada
>> +                ) {
>> +                    gfw::wait_gfw_boot_completion(bar)
>> +                        .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW b=
oot did not complete\n"))?;
>
> I think the `as_ref()` here is no longer necessary?

Current drm-rust-next does not have the required changes yet, but it will a=
fter
-rc1 is out. I'd recommend basing patch series on linux-next if they do not
target the current cycle.
