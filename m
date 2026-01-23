Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AC7D7788F
	for <nouveau@archiver.kernel.org>; Fri, 23 Jan 2026 17:09:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D39410EB6C;
	Fri, 23 Jan 2026 17:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pCkq1BVR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 98DFB40564;
	Fri, 23 Jan 2026 17:00:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769187641;
 b=Oz9HZXgvrq+txOSHWrmkHbl+U2rSP/kAaodI4e5qxg5hHzRtnoFuTzs5MQSDysOyBm4NM
 xL5FDNE8ZN+AYiMVCaqNRAQghV4ml4vdFBCTp2mzfAYPJ01zupsy/Mvwt4Er5YFYOb0SzC1
 +zKNPQinGvAkWQARYXU5W8BENdoSD7vrMB2tQRDO2/2FqCh4NlhpdKgbybPs41rCX1MNAxC
 bic4O/hguc8rdFCwZUyZZzTLXxTbjBB32snJD3MhHztR8rLvkjnTf4g51jD9jVINcHMgSNP
 ymb57Lyd+lwIv7BqsfLN7q9DQRgTzJBinyDFVhX88U8r0gQzTNgDB1K637vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769187641; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZjygBu1pqjxwbb/k+Sx9rqudmdsxx0uvNQw1cW4SwPs=;
 b=H4I1oSgYMX04b9EwBMzfuxBH4wN7+BHJY5HOmB4kmt4u2GFTAHO5wb1XS7bIUB0lh/Duy
 0i0uo0Jg/r6zBeUL3v4OKHEFxqwUU8gl/v+f1hFBLo5aiDqvE2ftH36UCIJUpSFE8gGMyBZ
 CVuj+fpkhTc/B/x0Ot2MaY71tnKyfhjE3SHgaBCZ79Y669lMTfCjIDWpIeaOLPLyQjzkgl2
 6qEOp6A0TdDVzlpcUO6vXuiAfrbPy1QWZZFtmhLpJCps2MkI1OqGbPqDbGHpLgoZq0wLmCV
 wn1H+a/kYX526ElQ1t2J19EJuEElbTjxN2O2+iUtZnsTpTIhtc4L29mWx7qg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4A3F5400C5
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 17:00:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 874B310EB62;
	Fri, 23 Jan 2026 17:09:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 450C6442C5;
	Fri, 23 Jan 2026 17:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B204BC4CEF1;
	Fri, 23 Jan 2026 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769188169;
	bh=f+5R3JjKS78CLRcPp/zk8EZGYV2IyAlDbob41E0jGxM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=pCkq1BVRkt6UcdQekae22ylsavZ31j2jTyO8zTmWNTofhT5FduLMCzTiSC/wlIOQd
	 tVo4GSmp0pl1zQWgFpAcUSRKyJzs+gYg5VWzDeXcx/2eg1o/YaAX1tzPO78SwlATzj
	 eq5//FZKCyWVbxmRLlsofp7Le3K/wSIWkEssD6vw9ybk60joiOZDrCDeCivtf3leN/
	 413W+uG6Siydgo67ZqfGwNECbm6XRX/qANShby5hxZIobEAZ5rHaL3n+L0zAdbPNxN
	 2czIooc9BJcrFR44ZdSGjd+S+vBpNixHcOG1cFDQSUBv8BBm56jb3/rIOz+clV+zD5
	 c4sgFJQ/r15Jg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:09:24 +0100
Message-Id: <DFW4V2S0HUNK.1QCRUK104TQZE@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust/drm: Introduce DeviceContext
References: <20260122225057.3589500-1-lyude@redhat.com>
 <20260122225057.3589500-2-lyude@redhat.com>
In-Reply-To: <20260122225057.3589500-2-lyude@redhat.com>
Message-ID-Hash: LG4VGBER4746F4ENORQ2CX42B7GWAMST
X-Message-ID-Hash: LG4VGBER4746F4ENORQ2CX42B7GWAMST
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 Miguel Ojeda <ojeda@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LG4VGBER4746F4ENORQ2CX42B7GWAMST/>
Archived-At: 
 <https://lore.freedesktop.org/DFW4V2S0HUNK.1QCRUK104TQZE@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Jan 22, 2026 at 11:46 PM CET, Lyude Paul wrote:
> diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver=
.rs
> index b1af0a099551d..99d6841b69cbc 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -21,7 +21,7 @@ pub(crate) struct NovaDriver {
>  }
> =20
>  /// Convienence type alias for the DRM device type for this driver
> -pub(crate) type NovaDevice =3D drm::Device<NovaDriver>;
> +pub(crate) type NovaDevice<Ctx =3D drm::Registered> =3D drm::Device<Nova=
Driver, Ctx>;

Nothing for this patch (series), but I think we should get rid of this type
alias, I think it's confusing.

> +/// A typed DRM device with a specific [`drm::Driver`] implementation an=
d [`DeviceContext`].
> +///
> +/// Since DRM devices can be used before being fully initialized and reg=
istered with userspace, `C`
> +/// represents the furthest [`DeviceContext`] we can guarantee that this=
 [`Device`] has reached.
> +///
> +/// Keep in mind: this means that an unregistered device can still have =
the registration state
> +/// [`Registered`] as long as it was registered with userspace once in t=
he past, and that the
> +/// behavior of such a device is still well-defined. In such a situation=
, the behavior of any
> +/// functions which interact with userspace will simply be no-ops. Addit=
ionally, a device with the

This is still not correct, the are not guaranteed to be no-ops. We can stil=
l
have callbacks from userspace after the DRM device is unregistered.

> +/// registration state [`Uninit`] simply does not have a guaranteed regi=
stration state at compile
> +/// time, and could be either registered or unregistered. Since there is=
 no way to guarantee a
> +/// long-lived reference to an unregistered device would remain unregist=
ered, we do not provide a
> +/// [`DeviceContext`] for this.
> +///
> +/// # Invariants
> +///
> +/// * `self.dev` is a valid instance of a `struct device`.
> +/// * The data layout of `Self` remains the same across all implementati=
ons of `C`.
> +/// * Any invariants for `C` also apply.
> +#[repr(C)]
> +pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
> +    dev: Opaque<bindings::drm_device>,
> +    data: T::Data,
> +    _ctx: PhantomData<C>,
> +}

<snip>

> -    /// Registers a new [`Device`](drm::Device) with userspace.
> +    /// Registers a new [`UnregisteredDevice`](drm::UnregisteredDevice) =
with userspace.
>      ///
>      /// Ownership of the [`Registration`] object is passed to [`devres::=
register`].
> -    pub fn new_foreign_owned(
> -        drm: &drm::Device<T>,
> -        dev: &device::Device<device::Bound>,
> +    pub fn new_foreign_owned<'a>(
> +        drm: drm::UnregisteredDevice<T>,
> +        dev: &'a device::Device<device::Bound>,
>          flags: usize,
> -    ) -> Result
> +    ) -> Result<&'a drm::Device<T>>
>      where
>          T: 'static,
>      {
> -        if drm.as_ref().as_raw() !=3D dev.as_raw() {
> +        let this_dev: &device::Device =3D drm.as_ref();
> +        if this_dev.as_raw() !=3D dev.as_raw() {

I still think this change is unnecessary and the name 'this_dev' is mislead=
ing,
as it actually is the parent device.

>              return Err(EINVAL);
>          }
> =20
>          let reg =3D Registration::<T>::new(drm, flags)?;
> +        let drm =3D NonNull::from(reg.device());
> +
> +        devres::register(dev, reg, GFP_KERNEL)?;
> =20
> -        devres::register(dev, reg, GFP_KERNEL)
> +        // SAFETY: Since `reg` was passed to devres::register(), the dev=
ice now owns the lifetime
> +        // of the DRM registration - ensuring that this references lives=
 for at least as long as 'a.
> +        Ok(unsafe { drm.as_ref() })
>      }
