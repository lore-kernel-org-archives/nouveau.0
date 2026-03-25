Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C946D106B53E
	for <nouveau@archiver.kernel.org>; Wed, 25 Mar 2026 13:46:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B031610E6C8;
	Wed, 25 Mar 2026 13:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lzc9iRun";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D8FE745309;
	Wed, 25 Mar 2026 13:35:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774445738;
 b=KhRyRhGfrWRWNgvi55trFkm3ahPg2P7bUExbyphaTnk5/hvbjK3GeaHdJA82OV37gylsE
 tagJkMf9x2uwgQRJZ4Fy576Qh36qi+lrzoDTmhQv9ZfGdK00/+b3lx0Rc8TN0axamQKpCWo
 wotepxNsPG8dxifNBdm3L7ebUrQBU/SBFosiffZX76HYD9oKwGbSP+gxltrVfkeW7xSgEbZ
 5imcNYwfLZ7U++Tsz+WOEYvJZEgqrZqZdIqjSyADCNbZ/Td+0m9poI5L3FZgkw+zZuhR6Rq
 3YrVBVMHw7cFpXaGynYfB0B1HXQ1p5ODBbKtD4ZEA4ihSF7U+Qd2BACDoKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774445738; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xLkQNb4KjeNoAHaCQC2FoInXgmkcSMg2UxEzJulxawk=;
 b=qf/7Dsri848Q6e1+WpqyFa6fjGgC2s6xb7cj5Rm1XQYt+rDE+uVf7oeR9QzQ+P+FSf48s
 Rr3v9jYsiGDRJxcZFCkElnmUHuN5VHHVPqHVmZV6KAzZ7vGjd87RvWrjHLVG19iuX3GYFr6
 fKO1TkiGW0ysr6iNfvczSOc+X5Al+b32gvWafMTKhQPko6iWN/9Gnw6GBnJKbQ2Ft1iZEEd
 U+r8N9A+TK7jTNS+gNYueJPrCodt2E/CYNEEmfZL8todQpnnAX1HpsibG0QqIvjdehn2TVS
 HmLb5U9gO3vfP/JExKuyqRcZpEdZF1ceClvo/kANhyWuE0r0DDZy0XTCHqZQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 93DAF452CF
	for <nouveau@lists.freedesktop.org>; Wed, 25 Mar 2026 13:35:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 39D7010E1B4;
	Wed, 25 Mar 2026 13:46:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD6B643DE8;
	Wed, 25 Mar 2026 13:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B01C4CEF7;
	Wed, 25 Mar 2026 13:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774446401;
	bh=EsepFe1hTb5yu5DvZwZ6ftYofkp6jSkghDu2bLsvZFc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Lzc9iRunAk7MiPNEUxkZBdZUGG559+UZ9DVpW3Ciygeuez0OPaJRURjDHkplhW3/g
	 ASTg+NyrAwFUpscHzNrkdeqX2gZxv6dVT1gYCHJ2oA06aTK4VtQcuMoMJ4qu74BBuZ
	 Eunp3AqstGSSUAaF909Dmdu9yVkm9mxygGT4MqJHVH1/qv9yFSOFVgX2HD51sxiaCO
	 mbxzUvH8qaIzRq4MGvbezsVtHYokDXHjMGWzpVlbZnbv7Mznr80zDXg4RR8R6aw4jA
	 VZnCFJyx4rJoj0gWRYkKYAz/VDPcPPTytp82xjooGwP25FDwGoA4MR1zp1zca9RsKC
	 eGiUNqVkHMU7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 14:46:36 +0100
Message-Id: <DHBWR17G0AIE.30MDYBUT7PNZL@kernel.org>
Subject: Re: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any
 Coherent<T>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325003921.3420-1-dakr@kernel.org>
 <DHBVS7DX89G2.34ELW7TJAH7M8@garyguo.net>
In-Reply-To: <DHBVS7DX89G2.34ELW7TJAH7M8@garyguo.net>
Message-ID-Hash: RUEGMJCZUUI7DHYP6IMBMVA2GI3ZD53C
X-Message-ID-Hash: RUEGMJCZUUI7DHYP6IMBMVA2GI3ZD53C
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: acourbot@nvidia.com, aliceryhl@google.com, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com, a.hindborg@kernel.org,
 ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com,
 lossin@kernel.org, tmgross@umich.edu, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RUEGMJCZUUI7DHYP6IMBMVA2GI3ZD53C/>
Archived-At: 
 <https://lore.freedesktop.org/DHBWR17G0AIE.30MDYBUT7PNZL@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 25, 2026 at 2:01 PM CET, Gary Guo wrote:
> I think there is a reason, which is that it weakens the strong typing tha=
t we
> have. I think it'll be better to have this be
>
>     fn write_dma<T>(&mut self, view: View<'_, Coherent<T>, [u8]>, offset:=
 usize) -> Result
>
> once we have I/O view and expect people to create cast views into bytes
> explicitly.
>

There is technically no difference between the above and the below, except =
that
for the above the user has to create the View first, i.e. it needs addition=
al
code. What's the advantage?

>> +    pub fn write_dma<T: KnownSize + AsBytes + ?Sized>(
>> +        &mut self,
>> +        alloc: &Coherent<T>,
>> +        offset: usize,
>> +        count: usize,
>> +    ) -> Result {

<snip>

> Although, given that we already have APIs like
>
>     fn write<T: AsBytes>(&mut self, value: &T)
>
> I'm okay with putting this in until we have a replacement solution.

Sounds good.
