Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF1AD715C4
	for <nouveau@archiver.kernel.org>; Sat, 24 Jan 2026 12:04:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D07B810E32D;
	Sat, 24 Jan 2026 12:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NZcGQXZE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A577C40686;
	Sat, 24 Jan 2026 11:55:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769255737;
 b=bp5/L5E+QCKMJI5isYv7BTOGN+J2GIdfMq1GeDvwne8p2jD8GaO2qTGPx54S6zvLa/JEu
 KVDtGKO6bG2EtGuKrAsohFzJ/9LmWslREDsuSr99BEQKxWrilt3rQ42Y+4KBPnQPEL/gjPK
 OmtGFn1ZfdXXJx34aalVqS4RmHa3/o3DXBfCTbYdR8MLT7hEqjbxOPNvj2L2fsYnfy2tysY
 W7NNsnZi2zsld9Qojdv7ItxHyB/xc4KvQ3McR17v58oN6bE6Scsq3mmnL4N7kp+b6y69NzG
 bcu3D6ycytS50wSVhRI0Y3CvBk/NHWtr4rLvgS4+apxa7Ni4uBqJNHM0imPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769255737; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dSyajvewZkIQwPvjRTlQJGapQOGk/fl6Nw4OPbFBIFI=;
 b=zzV3aIX2XsPHIRMd8tATb9Vjj5Awyq8nM3fb6j0aRdVdBZFM/3zLbCZxvBHj3rcRSYKtI
 k9X8ilJ/GALoTB/b5Pac1gnxKjhuenTnLW8yWPvWLguNLof2lo2aN0NWHvqshFqaZ3q4CxE
 T0Nly+YuAcPUiJepO5CQgMVPaLOUHKFhTmLLEpakIBxCBkWpI+87OaDC1MVipt8S51Q6lfV
 6RbFU8IHglCDtZHg/t+sSEBgwhSuIel83BLbIt+k5fgTS91fJLlBS6yXTbgc0BKZ1PjNELu
 JY++76RYrqDGoGsJffx7X1ZZfG4M+NRr8/csD8Nosgq+RJ5Kh+v8y9YrsJPg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5D9E740351
	for <nouveau@lists.freedesktop.org>; Sat, 24 Jan 2026 11:55:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45B0210E05A
	for <nouveau@lists.freedesktop.org>; Sat, 24 Jan 2026 12:04:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5769405E8;
	Sat, 24 Jan 2026 12:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295FEC16AAE;
	Sat, 24 Jan 2026 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769256266;
	bh=dSyajvewZkIQwPvjRTlQJGapQOGk/fl6Nw4OPbFBIFI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=NZcGQXZELaJEby8HOyiBqfDOnLq+SB0Xc4VRc9cufFLvdE33gSXCXcIGShK34uu18
	 7i2FNxdhyAAbQTuJfvZOM8OqzH9pvWSbeJWeK6nWtfWeOj0JdFfAxgJF5MmberM3x8
	 JLu+CEYH4srWAbE9liw8GvwximuRFpWNA2r5Za1ErOcg3e+Qin6u0lKbaSKGcmiDaF
	 bdbsZ8OI9LsNitHHEdjbGO1YwlE+oVu4C55BaVIFcBz5tR6Hj9BQWtAg3V4H3fODaF
	 E+mPFmGTARwwrkpgal+3pwjXF9/jkZlCgTUQbPal2Szzw3mW8zCaLgcETX+zgbl6tc
	 hlfdiE/dVt0hA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 13:04:23 +0100
Message-Id: <DFWT02TDUDHX.2JXA0SCWANCP0@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Timur Tabi"
 <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v8 09/13] gpu: nova-core: add Falcon HAL method
 load_method()
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <20260122222848.2555890-10-ttabi@nvidia.com>
 <DFWGPVUB7Q7O.XCM4MOK1SK2T@nvidia.com>
 <8dd8d8047615cadc73e0a888d5172ab15cc372a1.camel@nvidia.com>
 <CANiq72mXr1A6sdB2mo848wcmHk-obVO91NAEDpbakEmoh5Gv-g@mail.gmail.com>
In-Reply-To: 
 <CANiq72mXr1A6sdB2mo848wcmHk-obVO91NAEDpbakEmoh5Gv-g@mail.gmail.com>
Message-ID-Hash: CUPKJUSICI4YLGULRV7SM5GRWMJSK4JB
X-Message-ID-Hash: CUPKJUSICI4YLGULRV7SM5GRWMJSK4JB
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CUPKJUSICI4YLGULRV7SM5GRWMJSK4JB/>
Archived-At: 
 <https://lore.freedesktop.org/DFWT02TDUDHX.2JXA0SCWANCP0@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 24, 2026 at 12:56 PM CET, Miguel Ojeda wrote:
> There are developers and CIs using different versions, so eventually
> it will be caught by someone (likely the maintainer), but it can save
> time to do it early.

For patches that target the drm-rust tree, we have committer guidelines wit=
h a
submit-checklist [1] (that eventually points to both, the generic kernel on=
e and
the Rust one linked by Miguel).

However, it also lists the most important steps that should be taken before
submitting a patch series.

[1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-=
drm-rust.html#submit-checklist
