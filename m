Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B98CD58E48
	for <nouveau@archiver.kernel.org>; Mon,  2 Mar 2026 17:04:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6040510E580;
	Mon,  2 Mar 2026 17:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.b="lm7N2ZIm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5F98344D7F;
	Mon,  2 Mar 2026 16:54:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772470448;
 b=LOx03OT3M8uTIWpFJxuQz75eQCBIqTxGxafmIVZextnPSjEXAizG1XzJPblCWV6WcVOw9
 ebX9yvSLM6kX3M+YIt/+q8vYtOqlWVdjtHNoRs7A9URd+Sws5BupNEyQSHS1z/gtBUvWRmx
 apOK4jdKMRTgOMbWbhv6WxmcCb6nHGO6C+6U+nTPmbz0HfeSLZDIOymXe1xtak+EAIuVmUs
 mkXvmcG24Ic4k4d0OMoFI0/fhLD1s1iGG7h31mBSvDGUH+cKP1dIQCI9/OwuAQtsjMlV8/1
 PI0QoHCV14tOcUQo69ghcGutA5D4LrpVhYBCzX79RpYwoEz4X6ZDBz6xiZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772470448; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6zAy6gReJcleCqNHP1MmxDQ9Xz+aQderSR0GGhLr1pI=;
 b=VexgLtrmw8b1lWzv2qf/yqO19+mOAIc76LWehPgugSTzkmAzVyKAcGf+HBu+MYKrw/o+Z
 tEVnFpc76xdVLZvOTg/o5S17Q/Z4C/l1IoCSwKkJvmgFWb14+1HbBf8waprhf8DyII9PHO3
 6PpwiWFhRD3Uk5PZMd6ZB+qg2m27ZUVGGMmzYWmLUXmrNtkDCrKYxgGI3MGMluoRraUArup
 eat57MRe5f0njo5srAzQGSHryzEhuBqMcOY7AhZTpmiyUckauTIFzINOQdBJsajWiavOSnL
 91bE4WmnU1CkF1EODIZTPSL2ikc0aJDONRoaQhmh7elpoi1COK82zwJYT38g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=xry111.site;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=xry111.site
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=xry111.site;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=xry111.site
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B002A44CFB
	for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2026 02:20:27 +0000 (UTC)
X-Greylist: delayed 491 seconds by postgrey-1.36 at gabe;
 Mon, 02 Mar 2026 02:30:42 UTC
Received: from xry111.site (xry111.site [89.208.246.23])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1484710E348
	for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2026 02:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1772418148;
	bh=6zAy6gReJcleCqNHP1MmxDQ9Xz+aQderSR0GGhLr1pI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lm7N2ZImQhodvGc2BqpdKduMN036R8BbCgpOTPJDmWK/nKCMuzHMa0C6dKfWZXUzm
	 9CWJVusSrx5JxW6d4BY32NmVQxOIoUAszHDJFUx6iZAb2IXdPfy367PzVLrwjYnqVR
	 qKsf7Gm5OBLno2fMOQze9cpj+0blCrMDRRGsJKsQ=
Received: from [IPv6:2409:8a4c:e11:4510:818c:b334:624:49f8] (unknown
 [IPv6:2409:8a4c:e11:4510:818c:b334:624:49f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 512C16760A;
	Sun,  1 Mar 2026 21:22:25 -0500 (EST)
Message-ID: <9bb8b1ae61ccebec6460e2b271cbcc709aba9765.camel@xry111.site>
Subject: Re: loongarch64 objtool warning with LLVM 18 in Rust object file
From: Xi Ruoyao <xry111@xry111.site>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Josh Poimboeuf
	 <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Huacai Chen
	 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Date: Mon, 02 Mar 2026 10:22:20 +0800
In-Reply-To: 
 <CANiq72mAQxbRJZDnik3Qmd4phvFwPA01O2jwaaXRh_T+2=L-qA@mail.gmail.com>
References: 
	<CANiq72mAQxbRJZDnik3Qmd4phvFwPA01O2jwaaXRh_T+2=L-qA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-MailFrom: xry111@xry111.site
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: RYUOPVBSEN2TFIXY4YVMZEEU5BP4PLPT
X-Message-ID-Hash: RYUOPVBSEN2TFIXY4YVMZEEU5BP4PLPT
X-Mailman-Approved-At: Mon, 02 Mar 2026 16:54:06 +0000
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, loongarch@lists.linux.dev,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RYUOPVBSEN2TFIXY4YVMZEEU5BP4PLPT/>
Archived-At: 
 <https://lore.freedesktop.org/9bb8b1ae61ccebec6460e2b271cbcc709aba9765.camel@xry111.site/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 2026-03-02 at 00:42 +0100, Miguel Ojeda wrote:
> Hi objtool & loongarch,
>=20
> I noticed an objtool warning in a Rust object file for loongarch64 in
> mainline:
>=20
> drivers/gpu/nova-core/nova_core.o: warning: objtool:
> _RNvMs1_NtNtCs3LxSlPxFOnk_9nova_core3gsp4cmdqNtB5_4Cmdq3new+0x238:
> return with modified stack frame
>=20
> From a quick test, I saw it happened only with older upstream Rust
> binaries (1.78.0 to 1.81.0), so I suspected a switch of major LLVM
> version, and indeed with 1.82.0 LLVM 19 is used instead of LLVM 18.

/* snip */

> While with LLVM 19 I get:

/* snip */

> =C2=A0=C2=A0=C2=A0 lu12i.w=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $a2, 1
> =C2=A0=C2=A0=C2=A0 ori=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 $a2, $a2, 0x870
> =C2=A0=C2=A0=C2=A0 sub.d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 $sp, $sp, $a2
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 lu12i.w=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $a0, 1
> =C2=A0=C2=A0=C2=A0 ori=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 $a0, $a0, 0x870
> =C2=A0=C2=A0=C2=A0 add.d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 $sp, $sp, $a0

/* snip */
>=20
> So I suspect the stack pointer is not getting tracked properly and
> thus the mismatch. Is it a known limitation for `objtool` on
> loongarch64?

It indeed looks like objtool cannot handle the sp update using a scratch
register above.

--=20
Xi Ruoyao <xry111@xry111.site>
