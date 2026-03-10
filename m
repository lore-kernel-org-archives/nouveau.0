Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77008EB1049
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 10:59:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D98E10E6AA;
	Tue, 10 Mar 2026 10:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MpX9Pz0r";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1322645014;
	Tue, 10 Mar 2026 10:48:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773139706;
 b=jRHb3fVTAakcfUxyS1buLjPl/JJgdwCAgSWYYMefsZ6vf8NfSyNodYGwCvJ9PqCDKzI9I
 TxFho8JVjD5PDwHXdk963iPWa98932pUcAl6mGF1MrRCQtnNkjHyJrB/uXheE0Jl+Dhbfgs
 TQOU5AhPlZo1w5ncni5/yLFyRybePAgvaW5aSMq/T9z63wpXgX/oTHZwSYdGYuu3pvooR1/
 ulc6AMQGzGG/oaYG5VMUQVNk6fibeWJVS0f2/nmxEJGMMATG6jwutIA9tuRpmWznJz+t6yd
 HSxATOA+fX+chuCmJZweR6QuOOr7T5SU56ra89p6ciLCWFX58j5V29hmozUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773139706; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=po+6RRmf67ESt4BPo/gqHsIblTftkUe2YDR/DsyiWqk=;
 b=LovyBkRl17ttO/DFUfegWEJmJXmoqIad8L+XY+nsOP+vjiuCAltT3ujyhzUaR262K8jGR
 xId9iYQRp5BSbEG6NCqE+ihxdCAOATCKhZVflAoFm0Vz3LtnYToB98M6imiCfUPBmxiQOj4
 gDG7bSQPbvU5bFIbSVAYsGvpnMdGWY+b603JRFW+xHYkZ9NjNLOm6ZevEBgHrr3FsdCaX5l
 JTJSJM3WYjyTyMsiFYoS4xbnuPkK/PzbhboaG1mMWE4RL3VUsV/TqpdosCRcLNBru2oJxrj
 mwAgEk/Xy5pYZwdqxCR6Z1E8F0E7XtD3TiR1LSYhG2i5UaoXXiKQxYVAL9Pg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 24F7044E0F
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 10:48:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF3310E24C;
	Tue, 10 Mar 2026 10:58:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A869600B0;
	Tue, 10 Mar 2026 10:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DB4C19423;
	Tue, 10 Mar 2026 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773140336;
	bh=P3TywGqRAkhOoXBhCiCMOV9gwuUSxS2oeLYbxPkHnjA=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=MpX9Pz0rS3A+qDX6WlvyVrbiRpvWJ2KvhZUkWiofdPZlKDyhG8UGmlG4iPzeew84u
	 1YmVLm7gawNFKUUKq33UpP9vjIeih85cOxercEgGB+eYM2BcaQZTnYDyzWcTFvLSGM
	 Wktl15nF2sSj54MbXVSAVoVNgvkA+5yW40YR785WEbWu/fbTJtbqXclkYp1q71xM3I
	 knuaVyS9OSLWoftLEyn61NngFXUBF1L+zx/DF81AgKe+saojsica+dp7AP+xEePFGh
	 2V7Y/JgWLzPZfCN0Tky5B0Ok6GGzIn1LBnsgi8ppJH56FKAO06aNngkJvSwG/LjByn
	 YXMtsOajf2+uw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 11:58:53 +0100
Message-Id: <DGZ1SFR07FY8.26IXX819VFGC5@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
References: <20260309225408.27714-1-dakr@kernel.org>
 <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
In-Reply-To: <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
Message-ID-Hash: ANM4EH5RHRD2KL2L7EE3FJRZWZPCHNTR
X-Message-ID-Hash: ANM4EH5RHRD2KL2L7EE3FJRZWZPCHNTR
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: acourbot@nvidia.com, aliceryhl@google.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ANM4EH5RHRD2KL2L7EE3FJRZWZPCHNTR/>
Archived-At: 
 <https://lore.freedesktop.org/DGZ1SFR07FY8.26IXX819VFGC5@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 10, 2026 at 3:01 AM CET, Gary Guo wrote:
>> +// TODO: Revert to private once `IoView` projections replace the `gsp_m=
em` module.
>> +pub(in crate::gsp) struct Msgq {
>
> These could all be `(in super)`?

Yes, or just pub(super). However, that's not the case for the functions in =
the
gsp_mem module, they could be pub(in super::super) though. But I think I pr=
efer
pub(in crate::gsp) for those.

>> +    pub(in crate::gsp) fn gsp_write_ptr(qs: &CoherentAllocation<GspMem>=
) -> u32 {
>> +        // PANIC: A `dma::CoherentAllocation` always contains at least =
one element.
>> +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.tx.0.writePtr) %=
 MSGQ_NUM_PAGES) }().unwrap()
>
> I wonder if I should add a panicking variant of index projection for this=
 case.
> Perhaps of syntax `[index]!`.
>
> We could also make the existing `[index]` becoming a panicking one instea=
d of
> `build_error!` one. It is more consistent with Rust index operator that w=
ay.

I thought the same, as something like this `[n]?.ptes[i]` looks a bit odd.

However, I think we ideally want both variants (I like your `[i]!` proposal
above), since generally users should have the choice (as they also have wit=
h a
slice through get()). For instance, the index could come from userspace. Su=
re,
you can always validate the index in advance, but having a fallible variant=
 is a
bit nicer.
