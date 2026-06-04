Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E28ACD6E4A
	for <nouveau@archiver.kernel.org>; Thu,  4 Jun 2026 13:25:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8B18111A06B;
	Thu,  4 Jun 2026 13:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IBHe1fmA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 24F65467D1;
	Thu,  4 Jun 2026 13:11:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780578704;
 b=O1iMAs4v3Y6P+t6EJvTqn9u8wKgs5mJTk55Fl0GYZCrRPCR7UzHKMAEhYZZJvNfoCbwlN
 YDWDAxc94oSWTeM18Kgrvp/apzpXtZyFrIeqrjtT6UTMB/yZS0Dxfh3IvqcMvX0q+hHtdhr
 MJJkaJaZ6PwP0+rtsOIUxr1ioa9yrtlDCli9jcBzeQfDUmk1xLF8Jg/HNXXpxz6Y183bTni
 XA9Nf+vlktvtiTOpTXD4kP0pkUbded4tkBK4XHumE3JYHhmWW9ceiOaSChudhn5cjLkAgUR
 sySFPnWbjaeBAST4Dw4mp4ZWn1QCqxBHRmpSGQJtGkYoLKCAqwSilrgifLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780578704; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qlQij+VDTTP3ZvbjE5k4vvhLH/DNgI7reApsvnTxVoc=;
 b=RiLaFrdeBF+0gdtuV5XEGW/EUuMSuKocJ59rCJk6cctGEUFIb6rWTJhO/WXMyK+lsQiC+
 edZmMWMVUNATeKY/i7PT45Y94qs9YV5J99/0XYFKorRQTJ4pouYQ903S0k04Tof/0vNNz5b
 DUKDijBwVh9lk3P9zNzQtsUchodYUmKKW2wHn0ihYkKnKLZmmeakfPQEBfy6n2p1v5PDmIh
 3tTqTck/bqIKvS2/Gaiq1jwmxChPxi8C8n92yEbf6FNpBRob/QkHsULEo7PmgIcc7uCzRlg
 jFZknRFPZRPUOL2YwOujrnINfwKlI4E1ba2HgNPxdcFAVaI62/TmY7TgBHNg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6A43840638
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 13:11:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBC811A064;
	Thu,  4 Jun 2026 13:25:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E46DA6024D;
	Thu,  4 Jun 2026 13:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D971F00898;
	Thu,  4 Jun 2026 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780579525;
	bh=qlQij+VDTTP3ZvbjE5k4vvhLH/DNgI7reApsvnTxVoc=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=IBHe1fmAC8iMdLdxYgxl0M78EObVs/QYGXWdc/WCHfEPWbw1ChvNh/EyOWM/D0n2k
	 7iNFkgMAD0XIJIn62sEB+Add4oUz5TAmRdRlN+67wLd+kvtGWPATKCg09p9H52gU5R
	 OajUnykzwUUb9D3lq3r4nkPfoD4Hg93s6mxCBVkJikFg5IpwK3SNa8d4MlrF64idXF
	 jpuw35iKLfMvyEwWnwhAFwW/9nLubnmwzLoADPwofPCbAUj37hqnEuj70SlHQ1BrEh
	 nPQ3mlcFDmpzShJ10qBkP30hZJdUdHL9TGGUkiKV4B5Ao+Cn21G0kNJlcHBpT5Mgdo
	 k9sotwcAGqjcw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 15:25:19 +0200
Message-Id: <DJ0AREWNNJPT.9XEZC98B76II@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v17 4/6] rust: faux: Allow retrieving a bound Device
References: <20260603195210.693856-1-lyude@redhat.com>
 <20260603195210.693856-5-lyude@redhat.com>
In-Reply-To: <20260603195210.693856-5-lyude@redhat.com>
Message-ID-Hash: RAMW2J22LCGT3OAYJALZRRMMNFW7VEH2
X-Message-ID-Hash: RAMW2J22LCGT3OAYJALZRRMMNFW7VEH2
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RAMW2J22LCGT3OAYJALZRRMMNFW7VEH2/>
Archived-At: 
 <https://lore.freedesktop.org/DJ0AREWNNJPT.9XEZC98B76II@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jun 3, 2026 at 9:42 PM CEST, Lyude Paul wrote:
> When writing up some rust code that used faux devices for unit testing, I
> noticed that we never actually added the Bound device context to
> faux::Registration's AsRef<device::Device> implementation. This being sai=
d:
> the Registration object itself is proof that a driver is bound to the
> device - so this should be safe.

Yes, it should be, but the reasons are non-trivial and should be part of th=
e
safety comment below.

  - faux_match() always returns 1, and probe runs synchronously
    (PROBE_FORCE_SYNCHRONOUS)

  - suppress_bind_attrs =3D true on faux_driver prevents userspace-triggere=
d
    unbind via sysfs

  - mem::forget(Registration) is not a problem; if the Registration is leak=
ed,
    the faux device stays bound forever

> Signed-off-by: Lyude Paul <lyude@redhat.com>

I can pick this through the driver-core tree already, as it seems this it n=
ot
needed by this series. Feel free to resend as individual patch for thus pur=
pose.

> ---
>  rust/kernel/faux.rs | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
> index 43b4974f48cd2..e0856b2964a2c 100644
> --- a/rust/kernel/faux.rs
> +++ b/rust/kernel/faux.rs
> @@ -25,7 +25,8 @@
>  ///
>  /// # Invariants
>  ///
> -/// `self.0` always holds a valid pointer to an initialized and register=
ed [`struct faux_device`].
> +/// - `self.0` always holds a valid pointer to an initialized and regist=
ered [`struct faux_device`].
> +/// - This object is proof that the object described by this `Registrati=
on` is bound to a device.
>  ///
>  /// [`struct faux_device`]: srctree/include/linux/device/faux.h
>  pub struct Registration(NonNull<bindings::faux_device>);
> @@ -59,8 +60,8 @@ fn as_raw(&self) -> *mut bindings::faux_device {
>      }
>  }
> =20
> -impl AsRef<device::Device> for Registration {
> -    fn as_ref(&self) -> &device::Device {
> +impl AsRef<device::Device<device::Bound>> for Registration {
> +    fn as_ref(&self) -> &device::Device<device::Bound> {
>          // SAFETY: The underlying `device` in `faux_device` is guarantee=
d by the C API to be
>          // a valid initialized `device`.
>          unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).=
dev)) }
> --=20
> 2.54.0

