Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9948D2FED9
	for <nouveau@archiver.kernel.org>; Tue, 27 Jan 2026 21:08:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6328910E5C9;
	Tue, 27 Jan 2026 21:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FCjDt6tH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AF1F840AC9;
	Tue, 27 Jan 2026 20:59:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769547542;
 b=yjz+x60f9lzwiYvF8k47f443Rh99g9mjQYh1FYnQN85Qo96l2MR7kdDRvqWqnEN/WGDsW
 coYGTjyk5r+L2u+XeW4ukKKExPBNx3mUIiQJQRkF2sAeR5jPvMwBl6x1kmTj0byDJndh5Ff
 bQ1zb3hUZ8yJokb0HKMYI3umWkaAcqGSOHBUl2ZapoaH8w6Om0fC1Wk+g2zwb1D+6DlEKvA
 eWnLm8RiXIgfaeeAYSQdZ1+8HM9breu2/WRnqH4Jla9AY8yLpLrw1Zdput/866wNJWU5wWX
 l2+p1HJzjm6wKn1/icj5EvRHEqvcK8q0YSvLOQLcXAf0gu3GKoOBi98TY3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769547542; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MS7uftUQ2VA7lLIbZ5DVtkHSf7GdQm6+Iq+IgA5yUYk=;
 b=C5o4L7mLjZpmU0hiZ1YLsKj750tUcmMdHvuRP3hcwti1SLs/q0Og8ddPEgZyy/6VPyEpI
 h2Z8/YJrwnn6AGb6q5I5rN98ghahl7S9GFWNijVW+9xzE++vB3m4+CS4gZB/cBmACPFjGnj
 sbvEXXktUs34uMha52ojRQwjcf1KrbMkAe39fwSKYxRI+jGbBDiR65ttzn4vv/quoL8+CSU
 SuTEej+OaUYzmjBN6W6cnZ1K5k+TO+hMUQ/EFLo8KfE83QV5rAvUGOc8ZBW9V8yI3X+G9WS
 PTT+64fWlc4r61S558ecfwjEAFxyvylqYcSfj5RCXmIC8ukUjfC1M1EP3kWQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1E52D40803
	for <nouveau@lists.freedesktop.org>; Tue, 27 Jan 2026 20:59:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C36E10E170
	for <nouveau@lists.freedesktop.org>; Tue, 27 Jan 2026 21:08:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A35E4601E6;
	Tue, 27 Jan 2026 21:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE02C116C6;
	Tue, 27 Jan 2026 21:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769548079;
	bh=o1VZiVEj5vNR7p7ziWtConODn0+BdXQSUjNYnZoUA6Y=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=FCjDt6tHLXLA6uNE3VfQHGjMsdfkH9zENwDnB8Hy9uNgekGyTnyDfASVpMiZHPgQH
	 yg7AfWlgKB2k+qvs20qPy3wZ2C98jwV2eJZbeWYXPs5HWtUjYvmjlWdrRkckRbZO+G
	 YyWA0uFocZ6qXey7Ou0TAQzdoROVVMfchOFD5hJzVz9jrAJBjJMlSyinLF8vnLP2YQ
	 8wAGFseEYSHmTVQI48MYr5X7JYUxn+7uJIXoa7XYZ8aQ3hUCv3gVCkjgccrMMLFzIE
	 5qCxgI53qhTIvgYBvcMSQ+/Fq+RTYpYyuzk93KRePq7FBG16FNq53b0WAx3oSSQhRE
	 VdaMU0zfcALbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 22:07:55 +0100
Message-Id: <DFZOFVL4LS08.2R2HWJXVP92BR@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 1/8] rust: pci: add device name method
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-2-ttabi@nvidia.com>
 <DFQTGD2X29SA.SFSXUTFX6CWQ@kernel.org>
 <04ce3a5880f3f96e083cf72289a2af220b3e3fd7.camel@nvidia.com>
In-Reply-To: <04ce3a5880f3f96e083cf72289a2af220b3e3fd7.camel@nvidia.com>
Message-ID-Hash: RNSROEGQEXKOOEPKNVDMJBLVZOHUGQ73
X-Message-ID-Hash: RNSROEGQEXKOOEPKNVDMJBLVZOHUGQ73
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RNSROEGQEXKOOEPKNVDMJBLVZOHUGQ73/>
Archived-At: 
 <https://lore.freedesktop.org/DFZOFVL4LS08.2R2HWJXVP92BR@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Jan 27, 2026 at 10:04 PM CET, Timur Tabi wrote:
> On Sat, 2026-01-17 at 12:09 +0100, Danilo Krummrich wrote:
>>=20
>
>> > @@ -25,3 +25,8 @@ void rust_helper_dev_set_drvdata(struct device *dev,=
 void *data)
>> > =C2=A0{
>> > =C2=A0	dev_set_drvdata(dev, data);
>> > =C2=A0}
>> > +
>> > +const char *rust_helper_dev_name(const struct device *dev)
>>=20
>> Please add the __rust_helper annotation.
>
> Should I add it to all of the functions in this file?  None of the existi=
ng functions have
> "__rust_helper".

This is only because your base is from a different tree, within the
driver-core-next branch they should all have this annotation already. So, j=
ust
add it to the new one you introduce please.
