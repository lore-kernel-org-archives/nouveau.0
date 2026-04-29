Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C07FF8867
	for <nouveau@archiver.kernel.org>; Wed, 29 Apr 2026 08:04:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8E810EEB9;
	Wed, 29 Apr 2026 08:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LeUJuCmi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7F50F45D12;
	Wed, 29 Apr 2026 07:51:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777449114;
 b=ULJB2v4L4f3qceWFK0YRvoEV2KkmUpHLZy0co8f4FkXFtn8L6F5G5AVAood+AO3O5n5Pu
 D2bVw8QpNRtSNrKXeGasWYN9nHb/ED++jEI77zTPAusK/NatTpZGehVol56dGvi+fZhH14F
 AAfM4KgSupgkC6+mVgtnPZWSLdreElQcLs7GpMtGYP+tYrgTxZ+CnAYxq+HHKa0i17gXC7m
 IlYZedllkyYSJUCGX0ujM7sGy1e4WXtlksX0SNh0Yu7Xwa5sDvy1vtf7zEng2rcgGsxeX/A
 fbFFgdc73UbJZ3Yzg7AgCZ45yQmLG+O4MbtpTtfIuj2YZHWQm2B2RJOvREhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777449114; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GGIlJocKNB3iRq8vZ2TS6Y48JRlqzlQLb6ETaP74nU0=;
 b=Ojahrn+x7dxCBbN4yOxlhVIF+wDrYF2n7h5InD7T3iKyCakfGNmXZKQJ4dXfXmUo3EzM1
 ImmnOPVJ1rzcRNzwhJnzwV7q7jtRIj4N18EbbQmX+ql7KGXT/8144TBzK2jvpyPQD5IxZae
 fLY9a+aOeuoT0rtbZiMP1YXs7JRYt3Ff5rOOo9zohpIKKUmw+fM5rp4cWAk/amHYb1v1NnR
 7MUTNMfSDJDziMlG5Ku1uoGgeEq6vUO3EH8HaRPIbE4NaIbHu/qXWb4TENBwVYj5xfalHoe
 XfY1GUSNcyZKBPIMj8glPGpqx6UWDgeAwLa5pEGPcCfLZRfTA/UwCuugCLeQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3DDF445563
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 07:51:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E48DE10E0B0;
	Wed, 29 Apr 2026 08:04:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E660960180;
	Wed, 29 Apr 2026 08:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06159C19425;
	Wed, 29 Apr 2026 08:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777449853;
	bh=GGIlJocKNB3iRq8vZ2TS6Y48JRlqzlQLb6ETaP74nU0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LeUJuCmic1zvLoN87Fkn17i0m2S/j3AsHuwJQ+ZKmDHh0X/bfkURdCdh9kz0hcv5S
	 bldFD+DqtrolQRrFA2GkXnLJXwrM8TQNOhh29xnE2m+NtVKt4pHuDIi6NsJl0iEzVE
	 zqUBQ2j5fljSSjhvICtZmlP0APNRn4dLF/p31aw5BmZ0uSf9fmCLH3TI4Q33YYO+VF
	 SHQD4q7hlTbAsUHuHKvzTsPnQU5vgJ82xRv7mmNrs0c3wPDzzzGOMCOMWKmb36lftZ
	 Z4sDeZbHU/MYtVmsSfob24lP7eJ+0pE0kz7jdnTkEqaTgvsHheCQEwGjclJqKvJtG8
	 3wCesWXFOxACA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 05/11] rust: io: restrict untyped IO access and
 `register!` to `Region`
In-Reply-To: <DI4VHH97CABG.3VW1RVS2O10K7@kernel.org>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-5-4c251c692ef4@garyguo.net>
 <874ikvqwyd.fsf@t14s.mail-host-address-is-not-set>
 <vYp32vOGPut322JQ-5jSBZQNd6eXvnOvg8b6YDhYcYzBqTBVUvSajCJng33oXSQ9wiMvb62VLERzLYSa4g2pJQ==@protonmail.internalid>
 <DI4QT2U1098S.3K9K7INQ86M0Q@garyguo.net>
 <87tssvp9sq.fsf@t14s.mail-host-address-is-not-set>
 <DI4SY1NXU1XW.2VHPFEKIFBQVW@garyguo.net>
 <87ik9bp2og.fsf@t14s.mail-host-address-is-not-set>
 <DI4VHH97CABG.3VW1RVS2O10K7@kernel.org>
Date: Wed, 29 Apr 2026 10:04:02 +0200
Message-ID: <87fr4ep4zx.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: S6R252HZN6QTXBCIY4JQG5LB6DLHQX3X
X-Message-ID-Hash: S6R252HZN6QTXBCIY4JQG5LB6DLHQX3X
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S6R252HZN6QTXBCIY4JQG5LB6DLHQX3X/>
Archived-At: 
 <https://lore.freedesktop.org/87fr4ep4zx.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Danilo Krummrich" <dakr@kernel.org> writes:

> On Tue Apr 28, 2026 at 4:41 PM CEST, Andreas Hindborg wrote:
>> That is probably a good call =F0=9F=98=85 Going over the pieces again, I=
 am not
>> sure when and where I decided this was an index rather than a byte
>> offset.
>
> This is not the first time I see someone stumble over this, assuming this=
 has
> index semantics, i.e. I assume there might be something creating this
> impression.
>
> However, I can't see what that might be (probably I'm too used to the C
> primitives). In case you know, I'd be interesting for me to know.

Not sure, I think I just conflated things from `CoherentAllocation`
where we used to have `item_from_index`. Once the mind is in that frame
of understanding, it is easy to read `ptr.wrapping_byte_add` as
`ptr.wrapping_add`.


Best regards,
Andreas Hindborg


