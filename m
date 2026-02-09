Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C1FE81BB2
	for <nouveau@archiver.kernel.org>; Mon,  9 Feb 2026 12:56:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0E29A10E3DE;
	Mon,  9 Feb 2026 12:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="H6HT3TZ2";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ow900fby";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 22E9241C6C;
	Mon,  9 Feb 2026 12:47:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770641227;
 b=YPL4dthq19Tz1o6hoytqpjfUiZNn16dc4k3GvHEM27F+oDj0YsEVYsohO2pbeOTLg6jWp
 QNBUgtHLXhjWBI35Ju+CzlomlPTEs/eJz49tuHHGxfDceGvDPwOrTY7+dN3gq5XTnMDUUN8
 pyEx3FIswKKFmnuglrvodRlnWV33eQu/datzmJhX76U3Bc/OMzKNdlmgcckIi34EVJYwlDU
 N3FmtZnEmgtQz/uMPE4Wbe9uyo1xKAUaq+7BrsXfIJesCxLo88hmLbzoOwYIN/or4DXdspz
 TC/fKedQHv4r4arrSylQdwIdJ/mHD4Hg0fzJzB3afD3k1ER7FTSO2xYGBHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770641227; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RDcaStnUbAimuMXULCprr5C0mVOOx8METC8SN47KIsk=;
 b=IkG4dq3x2nHI/fbNG38oR9a7E/kw4u9QGkH9vpy5AJOVfXZB1yCEfgF1rqvTgJxciqc/g
 dAhzADn4B20dL+k+mPcJFr//GWM8AmT7GX823VtY76lD980Zc4+B4qLQj+XHiGhi4LcS6a8
 G/dKUekwP1//IgZLV4E/4dnYEJv0s5QCeoGAOqJgs4fS+DajFUaCB2RPguRdjNvHZ7fuTCC
 tKo+aiITb/b0mmlG8zpmj6QFMFBHrCtEFZ+B2epQAtBWowcMx6rbfu+8+ZlgDWESFv14TyT
 KLOGYGPIFQK8cE6X/GEPUOc2Jmg75htAAfYTZ3sQau8/swSrMjrJhLMAkmiQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=jannau.net;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=jannau.net;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DF6ED40B8C
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 12:47:04 +0000 (UTC)
X-Greylist: delayed 537 seconds by postgrey-1.36 at gabe;
 Mon, 09 Feb 2026 12:56:33 UTC
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCB810E3DA
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 12:56:33 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B82237A01A0;
	Mon,  9 Feb 2026 07:47:35 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-09.internal (MEProxy); Mon, 09 Feb 2026 07:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770641255;
	 x=1770727655; bh=RDcaStnUbAimuMXULCprr5C0mVOOx8METC8SN47KIsk=; b=
	H6HT3TZ2Ti6ofe+B7/4bXT+1q4Mq/VmXifUwSYQX/cgTpUByH73S9gzOYEnmWtHU
	UTLfbgN9sob9NhcCmodBd7FyMq91Mg0GkjuHlAtCIVbGolpZG2QP1HEWA13Rw5YC
	ibBIDj0uBImTgDjEKI1ksebc9EXjUM5wFF1bgpeskiH7uVp9w+U0paRcNImRnMgH
	XHIxM/1k7MKr0P0dXEb8WOrgWfyERZXsnH1rYEWTij/mLmj/eJ23EpGtqV/OBe8Q
	T5PaFKHc2h/9Fro2K7HjgCxcjSyj4+maVAaIFNim2UC6qRoOeFsIs3Upz8MpN9cI
	qH0yE379nZ2BS9FRT6Lxig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770641255; x=
	1770727655; bh=RDcaStnUbAimuMXULCprr5C0mVOOx8METC8SN47KIsk=; b=O
	w900fbyt87IxkXJT2AsPxUYnxxlYPMEforHpEx5CPXZ98jdk3dbJpmzDv6tVhw56
	UZPjGdfvZSfpmzleaRs8D+1JzzwvQ0vK0Gf7TwLJ5VYp1DgBUHUeLNey0uwnpDIe
	nzIHpsOSXgPdf+eBmj7thaQuhiWzwfR+GYUoJbmo4O7cSZ52cnIUrob26h1bcR+8
	0QtnH/ygJmWMZbCHRdVpxHhXgtJynKWRJ5QDMUGBRNTn5qfRYmoQO8nQfeAtuXoz
	8EgkGNRLoVVlp6pyHZalo2Z4xkxM7HRowAYiA8lubihBatWrhVvhPXrz1NCcs5ka
	cpWIODdH0yLdHcotx5mEQ==
X-ME-Sender: <xms:Z9eJaXbEXhglXPWGrPO5AOHVFWYm6KwpAlj7UZ2pBpVPyZl5bdA3dQ>
    <xme:Z9eJaRN-MtHwCR2Ilk9-EFB0uZ2JNqz5k1R8aDft7EZrq_vu5snk-11worPP7Ri9X
    Qetii5Vf0B6WKIUik7_XJZWPtnYBfh3lsaLW18OqI96TbatVi8bng>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleeikeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfgrnhhn
    vgcuifhruhhnrghufdcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnh
    epheejtdeffeethfetgefhffejudegheefueejtedvhfeuheevfeekheetfeduffevnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnh
    hnrghurdhnvghtpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpd
    hrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheprghlihgt
    vghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprh
    gtphhtthhopehnohhuvhgvrghusehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
    pdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtghomhdprhgtphhtthhope
    hlhihuuggvsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:Z9eJafRDMNB8Ht9QmdK8mSnBw6HC4Cgwtx7-cL8lQGHzIDxn0XyqNw>
    <xmx:Z9eJaWS9FIWcvPA1rW2tMG-WfiJa9XKugPgXafxEYhCHWJWTrNE4ZA>
    <xmx:Z9eJaT5NK8f9JDN6x8R6xYss1PiDz2wtDKUq78HLPpSgr71qkhHaCQ>
    <xmx:Z9eJaTWllneQ7EVqss2cw2wi2sZat69ZyT0EyD-dwhP3w7hWI43FKg>
    <xmx:Z9eJabKjI2htXehQeK4wYM1p8LyV8JZTvs58GGIyJjzI5cBXYI_E46n8>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3925B700065; Mon,  9 Feb 2026 07:47:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AFB7yJ7vYniR
Date: Mon, 09 Feb 2026 13:47:14 +0100
From: "Janne Grunau" <j@jannau.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Lyude Paul" <lyude@redhat.com>
Message-Id: <d2b1efd0-dfc4-4ea0-9bbd-74f57cfaabd6@app.fastmail.com>
In-Reply-To: <aYnVvFwBk1SfiJGQ@google.com>
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-2-lyude@redhat.com> <aYnVvFwBk1SfiJGQ@google.com>
Subject: Re: [PATCH v7 1/7] rust: drm: gem: Add raw_dma_resv() function
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NYUBBVTMSHVN6VWQQBFZAFJP2BKHELFO
X-Message-ID-Hash: NYUBBVTMSHVN6VWQQBFZAFJP2BKHELFO
X-MailFrom: j@jannau.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Daniel Almeida <daniel.almeida@collabora.com>,
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NYUBBVTMSHVN6VWQQBFZAFJP2BKHELFO/>
Archived-At: 
 <https://lore.freedesktop.org/d2b1efd0-dfc4-4ea0-9bbd-74f57cfaabd6@app.fastmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Feb 9, 2026, at 13:40, Alice Ryhl wrote:
> On Fri, Feb 06, 2026 at 05:34:25PM -0500, Lyude Paul wrote:
>> Reviewed-by: Janne Grunau <j@jananu.net>
>
> I think this email is misspelled?

It is, likely my fault. I noticed a few of those particular misspellings in the last few weeks.

Janne
