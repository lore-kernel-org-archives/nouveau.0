Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE2ACD8CA4
	for <nouveau@archiver.kernel.org>; Mon,  8 Jun 2026 18:50:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEB610F8CE;
	Mon,  8 Jun 2026 18:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JerpZAoU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D215C46887;
	Mon,  8 Jun 2026 18:36:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780943795;
 b=T2br4DSMmvYfBuQ8v0+m9YUqj5mweIU0Vyu5vZihWDAVdqcOtegh5Xph6yVpZRCJWS1Op
 LgWKp3tY3oKr5GXvdTJnYchaFJeOFYmmRjU/fGiPQQsii0ZDeuNoPqlEuFi58AQdbisvoKI
 dqdC/Lh72O/DnyOTFFAO4qapbk7JH2HoTd7vfUZydIlDvlQa65EPLR+MiRiX1riN9BqucR3
 sSs2VijVFujVsI2NJu4gSM5W0yda//1nI2tXrJlXzKgkovyg435nGynWmspmljJLQNwhoyr
 3CUY+O3DEDBgTLyFYcvCuj3fSRc2izOHzpc0TOLYUu4nT+NcO+5x1YHAvdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780943795; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HjZFDO402ZDsm7mMfRjPVjHrawSFxpu7iqkTSYlsac0=;
 b=mDxsYPOFgEvlo/4zfqxYFfW9LMiVq6YZ8lwtZPqFMHFZFyAv0UqGzBgtrjbv3ddZemaTy
 GImn7ksodC1e2BIVW91uArX1cuW5ZkCIpWUgxphQVB0Mq/7tOo945PxspOO+A/vl/H9zuz/
 2yUKHAxxIfuHMi99QVOry76JTX6MhJjcWd1jMbeVJg5L4660azU+XOGgSTavEw/BJTXbppY
 oIoBjySk8flHTb0WpP5nYAgMB6wZs15ocFMJyVv0BhhsxMv0sDKMH+zOY+wNc1hfCCMta2f
 xTA/yKfw0z6uUrHgJ28pKT+1R+4Vk+TFTXB3qaGLbJJtNVwnqXRQxs9l/4Mg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DA36846870
	for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2026 18:36:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6CED610F8CA;
	Mon,  8 Jun 2026 18:50:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4088D40173;
	Mon,  8 Jun 2026 18:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE231F00893;
	Mon,  8 Jun 2026 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780944626;
	bh=HjZFDO402ZDsm7mMfRjPVjHrawSFxpu7iqkTSYlsac0=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=JerpZAoUcN8RRH6FY2mqcHqv3G9EBFHXMREWaesJnn/P9WJewz66UROs393HxHyNT
	 ur6WEDzFmvjKrRgJiyAQdlQ0h9LJ5XksGmmcDUeqAI/TOG2eh2omxxjcb7fftns4vf
	 mNAu6qSjSuHJopkqS1bpoAnoghSHEJZF7XlHAlCc361Ux8P9Dx1DumrofMHOjm99xB
	 1vuwNzws+r24uxhfZjPVHQlarkTbXD/ZQOKrM+eCfXEClU2U0+JP2cYzIS4lxsBSkh
	 DgTkOvD5ooFE6SdVaRMsaubs0F/Rwmf73eQTkCpX8dEeBQdn+hQI236VVWJw2SDkiA
	 E0kApa1eeJWTQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 20:50:20 +0200
Message-Id: <DJ3W6FP39GZZ.3988HCMO7NN86@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v19 0/4] Rust bindings for gem shmem
To: "Lyude Paul" <lyude@redhat.com>
References: <20260608183057.2001376-1-lyude@redhat.com>
In-Reply-To: <20260608183057.2001376-1-lyude@redhat.com>
Message-ID-Hash: WXH6QDR5AP5C7CJ32BPR4KTZZK7D3LPY
X-Message-ID-Hash: WXH6QDR5AP5C7CJ32BPR4KTZZK7D3LPY
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WXH6QDR5AP5C7CJ32BPR4KTZZK7D3LPY/>
Archived-At: 
 <https://lore.freedesktop.org/DJ3W6FP39GZZ.3988HCMO7NN86@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jun 8, 2026 at 8:29 PM CEST, Lyude Paul wrote:
> Lyude Paul (4):
>   rust: drm: gem: shmem: Add DmaResvGuard helper
>   rust: drm: gem: shmem: Add vmap functions
>   rust: faux: Allow retrieving a bound Device
>   rust: drm: gem: Introduce shmem::Object::sg_table()

Acked-by: Danilo Krummrich <dakr@kernel.org>
