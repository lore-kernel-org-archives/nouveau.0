Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F01CD6E6E
	for <nouveau@archiver.kernel.org>; Thu,  4 Jun 2026 18:49:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D22D11A24B;
	Thu,  4 Jun 2026 18:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PSbb7SOb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 59472467D7;
	Thu,  4 Jun 2026 18:35:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780598123;
 b=G8HUgW/ehmZogggxe47Z8NBSyhRzSs1OYk1AczVV6rsRgLBsFqmQq1JR3aM5Ews7Ga4AK
 mAqg3LIfVbcVz/yDHZ67oyAG966eYzFxmOb2CD/PDASuTkl9Sq7bsTFqSJko2LB/6nelA9E
 yvmX4NQqxj2jWwOcb9hQCl4oXZu63g+WqwN855dSfifwROGjo92Vh/f7EUSAkzHEuS36Nel
 zOJug2wAYMRHmf+BHQwIfsu/Vhw+jne6aem8D7GAReduldyfchUmy1WvUEWrkiuHhzBzlt1
 DiZSur7ZgL6l/WEz1X/IqW4llJR3vkVNaoOkVoZw3jLRZFZsMAosoTB/G0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780598123; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bSOB8kwgdkJuUcuvvGWTTy+0BwGIhrEyhn+sNY27Rlk=;
 b=U5eIfO8Bln1WayGo3xmHZkGp0ni0nXeCBLcrqQ6UGvw1Vjje6ATW0v3Mb4rNL1OhHx8X3
 O0tqRzzDdJi/4QRYcGU68mo3GAMkMbuW82NTVfIEzHUe92wY1GWNnBJqFU4jOLM4j9cTue4
 MUefh7XGxFb8sxsBQwSiQIFnETjTh7KFx0vHjDN1NUhsn3pJOFLddTdQXkkMcly5pcT4BIM
 tY/ymZBTcdyGoF5ywwM5GvVDM2GC9pSkDceFiItROPTmvVtmZdvbImuVkAUeWSUwFDZr1KS
 0M0QFpYEWV0tyDZljpKqnn0wR2mBv75SJ5iY/+B3zRZB8Mj6odl5RZwMI/cA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6BBDD40638
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 18:35:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ECCFC11A248
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780598945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSOB8kwgdkJuUcuvvGWTTy+0BwGIhrEyhn+sNY27Rlk=;
	b=PSbb7SObVM5nZdYrjtxzPjiV/PWbSZf6AJPko1z1A8q2EkfM9DCLyox47Na+y47KoSyFH1
	v2HIgC9texiDZkweVlQFlI18rGH3KXMaVQTWhNEtHjGoYg7YYVLelcy85AmTVmvjGcX4m2
	ULnnjN5y+J8Y98vtwI0rBIiHtjteoKU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-LkQrCpF-P7mYwytvge1i3g-1; Thu, 04 Jun 2026 14:49:04 -0400
X-MC-Unique: LkQrCpF-P7mYwytvge1i3g-1
X-Mimecast-MFC-AGG-ID: LkQrCpF-P7mYwytvge1i3g_1780598943
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8cce1de2519so21179106d6.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 04 Jun 2026 11:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780598943; x=1781203743;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bSOB8kwgdkJuUcuvvGWTTy+0BwGIhrEyhn+sNY27Rlk=;
        b=Q/FRomQ9tMi9AeXdC2KhNAk/vLP6bcFvute91pvRH7Luv7vQ/a/T4fOxuaqGOPN6/8
         M4GrBP09WB5n8Mu+RE0G9T+FpenWD8PYWrWLhrFoS1POmqr0F9jc+XWnr0Ny20uplp6p
         fpVcM9HerAJ61Ex/atHG81w/mmCIB6Jza2aVWG/PTrhgoW7qQxk6lA1HmCuog6/MWEYC
         A/DbAkdXlTtoXzqPTrGFalcG0gvvQsmaT6l2PhO7a5Ea30RQLF7j+tdUb81SedLlDNJl
         N8DMPms1Fd3Q0pDrY/HwcKH/mm//1D0mqHZJ5G9PUH9lzT5jEar4QAB0yPXQxNSlAjK+
         q9mA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8rnNLmLByXMGvOqnLofaxWQIUneg+IvPjgqvFvEaOTldk7uf2995gg0lDUoaJKNCbuSpNmKWuI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpzYhP/D16J6D7NWgthO3R6hGgmZYMa9dmY20MkLTZdLy29oNH
	7Uv3iHYbB+BS9OO+AacChPO4/NIiDweE8ApbKnl6hXKT6Rc/Jq3crlbwVdtcRFlnvI8sCE3Mv5X
	rQ4pvxccOmO8I0r8L5f9nL4Jw1Igj80ECv8zOzXwcDAhH/5QzgYJJ8++xZYV5BfOWZMs=
X-Gm-Gg: Acq92OFGKHcnMUqgHr5k99rGYNjWesx3CPFqZWCh2IC3XpHQsyXUriYMdf3hxIKIae5
	0h/3729MW6OAnIedX+fX5umYqN3qU1RsikHWKNQBMeqY3Vvxn+Kp43CmwGA9oshYbj1x3QmExbq
	FoKTLCCGsB1IJx7WRXucNp0E9si6624uOW8pImAsY4u6zIdOZo4UzbkjYA9A0Zzwr94XQQ/fdc/
	6E5ae8acJp37H5+r83GyHnOpWU/AlL6BIsueSFAUw48zEMEnXzBOqTbQ/Py3U9UbtIfLkENfzyF
	dppeI5aS3Rgj0lL2vVeD9qR1QMUbtEd42/1LFYKFDLfnsWRd2BLqjauCYqd30qGgfIlwCI8c5wO
	xwUaP7s2/rMEPFftJ1Xdb6lPWEYq9
X-Received: by 2002:ad4:4e09:0:b0:8cc:dd12:a545 with SMTP id
 6a1803df08f44-8cee5f9e8c3mr5118936d6.8.1780598943329;
        Thu, 04 Jun 2026 11:49:03 -0700 (PDT)
X-Received: by 2002:ad4:4e09:0:b0:8cc:dd12:a545 with SMTP id
 6a1803df08f44-8cee5f9e8c3mr5117046d6.8.1780598941090;
        Thu, 04 Jun 2026 11:49:01 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ceccd9fda2sm60367866d6.2.2026.06.04.11.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 11:49:00 -0700 (PDT)
Message-ID: <f8a49ca906428f6190f5df2ae93a7966b7734199.camel@redhat.com>
Subject: Re: [PATCH v17 4/6] rust: faux: Allow retrieving a bound Device
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>
Date: Thu, 04 Jun 2026 14:48:59 -0400
In-Reply-To: <DJ0AREWNNJPT.9XEZC98B76II@kernel.org>
References: <20260603195210.693856-1-lyude@redhat.com>
	 <20260603195210.693856-5-lyude@redhat.com>
	 <DJ0AREWNNJPT.9XEZC98B76II@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pSfo4n1OLNwnwwOf05jNcLEfMqFzJSMuNg7Bg0RTi0g_1780598943
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PFWVY5RPA3ONWELUZ2UG2Q2AHZ6RALRF
X-Message-ID-Hash: PFWVY5RPA3ONWELUZ2UG2Q2AHZ6RALRF
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PFWVY5RPA3ONWELUZ2UG2Q2AHZ6RALRF/>
Archived-At: 
 <https://lore.freedesktop.org/f8a49ca906428f6190f5df2ae93a7966b7734199.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

I mentioned this already to Danilo via alternate channels, but to
clarify - this patch -is- actually needed, as we make use of
`AsRef<Device<Bound>>` in the kunit test for SGTable

On Thu, 2026-06-04 at 15:25 +0200, Danilo Krummrich wrote:
> On Wed Jun 3, 2026 at 9:42 PM CEST, Lyude Paul wrote:
> > When writing up some rust code that used faux devices for unit
> > testing, I
> > noticed that we never actually added the Bound device context to
> > faux::Registration's AsRef<device::Device> implementation. This
> > being said:
> > the Registration object itself is proof that a driver is bound to
> > the
> > device - so this should be safe.
>=20
> Yes, it should be, but the reasons are non-trivial and should be part
> of the
> safety comment below.
>=20
> =C2=A0 - faux_match() always returns 1, and probe runs synchronously
> =C2=A0=C2=A0=C2=A0 (PROBE_FORCE_SYNCHRONOUS)
>=20
> =C2=A0 - suppress_bind_attrs =3D true on faux_driver prevents userspace-
> triggered
> =C2=A0=C2=A0=C2=A0 unbind via sysfs
>=20
> =C2=A0 - mem::forget(Registration) is not a problem; if the Registration
> is leaked,
> =C2=A0=C2=A0=C2=A0 the faux device stays bound forever
>=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> I can pick this through the driver-core tree already, as it seems
> this it not
> needed by this series. Feel free to resend as individual patch for
> thus purpose.
>=20
> > ---
> > =C2=A0rust/kernel/faux.rs | 7 ++++---
> > =C2=A01 file changed, 4 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
> > index 43b4974f48cd2..e0856b2964a2c 100644
> > --- a/rust/kernel/faux.rs
> > +++ b/rust/kernel/faux.rs
> > @@ -25,7 +25,8 @@
> > =C2=A0///
> > =C2=A0/// # Invariants
> > =C2=A0///
> > -/// `self.0` always holds a valid pointer to an initialized and
> > registered [`struct faux_device`].
> > +/// - `self.0` always holds a valid pointer to an initialized and
> > registered [`struct faux_device`].
> > +/// - This object is proof that the object described by this
> > `Registration` is bound to a device.
> > =C2=A0///
> > =C2=A0/// [`struct faux_device`]: srctree/include/linux/device/faux.h
> > =C2=A0pub struct Registration(NonNull<bindings::faux_device>);
> > @@ -59,8 +60,8 @@ fn as_raw(&self) -> *mut bindings::faux_device {
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
> > =C2=A0
> > -impl AsRef<device::Device> for Registration {
> > -=C2=A0=C2=A0=C2=A0 fn as_ref(&self) -> &device::Device {
> > +impl AsRef<device::Device<device::Bound>> for Registration {
> > +=C2=A0=C2=A0=C2=A0 fn as_ref(&self) -> &device::Device<device::Bound> =
{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The underly=
ing `device` in `faux_device` is
> > guaranteed by the C API to be
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // a valid initialized=
 `device`.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > device::Device::from_raw(addr_of_mut!((*self.as_raw()).dev)) }
> > --=20
> > 2.54.0

