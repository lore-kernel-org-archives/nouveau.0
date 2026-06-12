Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555ADCD98CE
	for <nouveau@archiver.kernel.org>; Fri, 12 Jun 2026 20:17:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1A41910F6B5;
	Fri, 12 Jun 2026 20:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GdpxwRGB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4E38446ABE;
	Fri, 12 Jun 2026 20:03:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781294617;
 b=NiBQojtOqP4VX4dL5lNV1pSPFVv5YykgdI9j1lwH443FZG0I+sYljbeb2Db4m1AYT3pNt
 nqMc6MrsSoq4MGrvGQieQktUQAztDP3r9sbWPtnliIxSdCymfRE0ocax2Qg2Pa1vl7gisv/
 Tc2ajaeeixGgWBY4NZ5m7wuc2UE+pRIzrOiM8wKA3frNUHntNt3TTgyFatk0P9LtRsMjbuz
 jmN008oR9cj8Clcd3imrtcYT0qlSh82CG8CvUnuk/6CuwPPipSxEdLSo6nOc49h4GkJbjUL
 biW3rWlgJQMsK2skEhLnRq94c1+rew9VhlieFCOQNn4t1HGGVjjVGcrtwWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781294617; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pJzuNVWTNf+53sy5yuKPcqhP0sKI2LYYj8cvjNu/tSM=;
 b=P0lIQ/G5AME/KAekux+5sqAMZIIudkhwf6IOFDnRdGQOI30o58QT/M3OlO1RvRky5DBRn
 yotifwptUIoq9MKKJY8SNMed2KVlNW5tef/wLH22zGTT0beGeQ2Gt3TG0QTiIbl4CU6znji
 XyE6PqrZNBr3R6riv4ZbQwFhSc4BB0sRpM6oWwhP0LzcKd+VRGK8H5Pl/Xyv45w+Pt242fG
 acQVrHEg2wf4lorKV+InuiKUV1ny18t3utP8nkvczkUg1UpOWu4DnDuv64TEazrHfjz9ICz
 u8UM175tjYmgcVEv0echHGcq96aGRjb8gEN03Fs3tGbAJU0WchZbIOTaUShw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5DC3946A78
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 20:03:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E6FF510F5D8;
	Fri, 12 Jun 2026 20:17:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9F2B41665;
	Fri, 12 Jun 2026 20:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2371F000E9;
	Fri, 12 Jun 2026 20:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781295456;
	bh=pJzuNVWTNf+53sy5yuKPcqhP0sKI2LYYj8cvjNu/tSM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=GdpxwRGBrf+qpXAR4d0Nz/svA8GnlSNp4xm1JkRSb71qW3Vv6kndMHbj1bAUWD/NM
	 clLsSWhWXgMw0G4JPYmRM1CVs9R4G39GEuZpZ8fhyLOmcvFBNi/AdHdY76Jjw9J8le
	 HVVbR0yVWHjAT7t0VQT1yh5x+i4wH10aW4joDeSLt0a5oqmAlMnSdwwk6OBm4FMmF7
	 ap9Q4T0B+POpHfHaBJVwAdSxLuXzvSiaMfoJvQP2RVNluhx8jpaR13jfqs3ewInCWY
	 7PYGYcg87etPCjusox7PGggnG6MQ9ng+hjaQeZQ3PMA9sVyoKm3sDk98mVHBeK8PkO
	 AN9JkZRDDvjNg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 22:17:30 +0200
Message-Id: <DJ7CJCZRHT1R.3LZDILZ7HTXQ3@kernel.org>
Subject: Re: [PATCH v20 3/4] rust: faux: Allow retrieving a bound Device
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260610162433.923550-1-lyude@redhat.com>
 <20260610162433.923550-4-lyude@redhat.com>
 <DJ7AXOH0W92V.1L1869KO4C1H9@garyguo.net>
In-Reply-To: <DJ7AXOH0W92V.1L1869KO4C1H9@garyguo.net>
Message-ID-Hash: UKJIMPSJW3M3AVEKSSII6TXLYOUXAIOH
X-Message-ID-Hash: UKJIMPSJW3M3AVEKSSII6TXLYOUXAIOH
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UKJIMPSJW3M3AVEKSSII6TXLYOUXAIOH/>
Archived-At: 
 <https://lore.freedesktop.org/DJ7CJCZRHT1R.3LZDILZ7HTXQ3@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jun 12, 2026 at 9:02 PM CEST, Gary Guo wrote:
>> +impl AsRef<device::Device<device::Bound>> for Registration {
>> +    fn as_ref(&self) -> &device::Device<device::Bound> {
>> +        // SAFETY:
>> +        // - The underlying `device` in `faux_device` is guaranteed by =
the C API to be a valid
>> +        //   initialized `device`.
>> +        // - faux_match() always returns 1, and probe runs synchronousl=
y (PROBE_FORCE_SYNCHRONOUS).
>
> Please quote all code with backticks.

As far as I'm concerned there's no need to do that for things that are not
rendered anyway. But also feel free to do it anyway of course.

Thanks,
Danilo
