Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A36BD77880
	for <nouveau@archiver.kernel.org>; Fri, 23 Jan 2026 17:00:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 97F1A10EB69;
	Fri, 23 Jan 2026 17:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MkHIYMvZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 34B7440564;
	Fri, 23 Jan 2026 16:51:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769187116;
 b=UA3sNuW4lhQ96+sL5m+40qI4XbT5H87H3/iFIQqVgoTUW+cz0HNpWVHaoXQQ2ecDDbgYw
 BI3EWnRzpiWGNeZhT8zscZoEJ/J0FRrTgRVr16DIm0PngKIq0ytpKvIDPo25aw+6fn2pQTX
 1NKogbCa0une7IXkLL/rXPx+zK5i8RtbGplTXYNsYuJgDMbCp4rK6QMUc65rqmvtvPRKbSJ
 f5tIZQwOer9E4epnh2JN+WxMm5Pu/DZcT7qO7ufXVs5aiI0vKTFzFOGGEIxDvBvsFmDKcRz
 bnicQYI5+zs7xK6hXr3Dy8+KM+9ItkJaodweAllsLOTa3lhL9RFzDKsa/EVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769187116; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oYRZQtOI+KB8tYFyNN3GRXz5SFLWYG0fejboN/bZV20=;
 b=Z+AlvY3xt0+c6co5Xi12lodhu41WqpJUQOmOjcxBhJGEzA7ZcBn2bjeQVSGKJRdm0j/nS
 RGKymX6ockSAXqxfZpT2y0ss5R/5PSknsAqF5yNJckmsPOPFPxf7/PYTeq784pM5JBshs6f
 ygB+/yPahZ8IH6jlyD2HNA74guDvib6nGvgbilWTH1rkmWSKHoER5xL8RpjZTqZdGNjLMeQ
 T9JzvZE3/zSdU9tmnqcreBiSKnkmlAfxfp0GRZdQzvFIOA1jMWWT3IW5WqcO/5ZWYV04Xnv
 8R75qkbGf+U/ByzNK6Cl9Ck1RxsxI0x9Eum0wH7uD+hYf8O66QRST15tbG5Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 894364031A
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 16:51:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCEB10E2B9
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769187644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oYRZQtOI+KB8tYFyNN3GRXz5SFLWYG0fejboN/bZV20=;
	b=MkHIYMvZ6kKr6vE0SscKDl7QNF3hZE/RdEim2x3NiIg56XdlreXCWb+7WDiPSfu8O6N944
	J6mHmQhklZJHutpWr4fGiHfrlhkc+MsTihL8CJz9xIoL+G+U70Se/Qtr7qklOTgCRAEqkC
	JCPYnVS6ZBKdTW+2uugYDFITMG5HLGE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-TXfWWhnDMhuGJtRBOp1MnA-1; Fri, 23 Jan 2026 12:00:43 -0500
X-MC-Unique: TXfWWhnDMhuGJtRBOp1MnA-1
X-Mimecast-MFC-AGG-ID: TXfWWhnDMhuGJtRBOp1MnA_1769187642
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6a341ac9fso600958085a.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 23 Jan 2026 09:00:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187642; x=1769792442;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYRZQtOI+KB8tYFyNN3GRXz5SFLWYG0fejboN/bZV20=;
        b=ERqneVZTQe5JbG7Lao68GO1xHuyP390Yrme4nOGjZAX39hiFID0gMANKE+qH8DY8Rq
         L1OOZC/eyvjf+MK4WtBj6r20pO318lEREesjy3ZdmEPsLeW9CIkBIwnU9jb2UYibyY9b
         j1cH0cxfunwI/hWPhezNDzsE37feZpVMxa8ZavcgAfCZKrVwjGbXIs3rcfKKYGWfJ8VU
         6HM9LXrZOjH6MoYtFnezOjcxbtyucfPT5FeVIVMuWQ9wPcFHw/LxRjNEQAH0GFquQghN
         +0u2K4fv+FsDY1FkQb6b0QsCMsBXdqZ56bYouJaiOrXrzoBeqteVW/ynaZ7C3RDv83XD
         ZiEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGTYgpO8VmgZVv9Gbr5fx3G8Dqx5HV76d7MStBRUwwRUorFGtk7HAHmQ1ew3QsE7ZXD/Caslwt@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywcbqikjcf5V9MwWXjthWLv/Di3ujvvN1/oqEmF1tGtmSZY2tul
	x2ZhijX7tISn4yua8JU/xC1VtazbfTySQe/Tl+8btuC8ntNfHGlEf4PuX//NRoiBqAEJs/8r/cs
	wB1uAsiR23t0bnBCCm4bVlV6wd5QTVmGBYZ4fnloEEAlyfjrzbjkuzrfYXnG/Mv9A5jM=
X-Gm-Gg: AZuq6aJG2S1WvWv71SziIn4w/1qx6kaZ1lBOFGLWAQ20pqo7NBq7XqsQFTeZL+JTQOR
	BZUD8/D70D4I1ITp5mZgs1CCNh/zn8R8x3FqzcERvSeVYerwwDlwSVo40GIl9uWJaiSpbNwjQD0
	O3QfRyHPIivPHBuMRKxAIW67y3lD99cc7EO0zbRvZD7R3IjmORblxuYBlQ6ronG5KDkP5bC+Zrr
	ekjhTvaK3BuhU4GD/tWPVbFoXYQMfFYgtRPG/RhV8uNKf2FtTjJJqjxtgqOxgK9PIjCzy5uL1xB
	Sf06T++uoKgfq1WyIBFXw5hazuafqAi1Vl0qDjGObWqFAVccHFFpym097zalnw+Sv8yPGQ3LUgo
	ulVIQFQ==
X-Received: by 2002:a05:620a:40cd:b0:8c5:38b3:fefa with SMTP id
 af79cd13be357-8c6e2e4c7cbmr393958285a.79.1769187637841;
        Fri, 23 Jan 2026 09:00:37 -0800 (PST)
X-Received: by 2002:a05:620a:40cd:b0:8c5:38b3:fefa with SMTP id
 af79cd13be357-8c6e2e4c7cbmr393887885a.79.1769187633428;
        Fri, 23 Jan 2026 09:00:33 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8949193add8sm22302406d6.45.2026.01.23.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:00:31 -0800 (PST)
Message-ID: <47cbb2bb4462331e5ffa56da488d8ffab9a5fcd7.camel@redhat.com>
Subject: Re: [PATCH v3 2/3] rust/drm: Don't setup private driver data until
 registration
From: lyude@redhat.com
To: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 23 Jan 2026 12:00:28 -0500
In-Reply-To: <E3CBBAB1-4EED-4052-B9DC-AAEB58D67265@collabora.com>
References: <20260122225057.3589500-1-lyude@redhat.com>
	 <20260122225057.3589500-3-lyude@redhat.com>
	 <E3CBBAB1-4EED-4052-B9DC-AAEB58D67265@collabora.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7gFidXU8A996YCVSVxrVj1CQYYtq-pDRjN04QrGCDns_1769187642
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WRLGPFIXRKGLE63L72736EQNDGFV44DM
X-Message-ID-Hash: WRLGPFIXRKGLE63L72736EQNDGFV44DM
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WRLGPFIXRKGLE63L72736EQNDGFV44DM/>
Archived-At: 
 <https://lore.freedesktop.org/47cbb2bb4462331e5ffa56da488d8ffab9a5fcd7.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2026-01-22 at 22:52 -0300, Daniel Almeida wrote:
> > @@ -254,7 +240,15 @@ pub fn new(dev: &device::Device, data: impl
> > PinInit<T::Data, Error>) -> Result<S
> > #[repr(C)]
> > pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
> > =C2=A0=C2=A0=C2=A0=C2=A0 dev: Opaque<bindings::drm_device>,
> > -=C2=A0=C2=A0=C2=A0 data: T::Data,
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Keeps track of whether we've initialized the de=
vice data
> > yet.
> > +=C2=A0=C2=A0=C2=A0 pub(crate) data_is_init: AtomicBool,
>=20
> Why don=E2=80=99t we make the data a member of the Registered context?

A couple of different reasons. For one: not having it embedded as part
of Device would complicate trying to go from the device's private data
using container_of! to the actual Device struct, which isn't great for
workqueues.

The other much more important reason is that Registered isn't going to
be the only typestate that has access to the driver's private data in
the future.=C2=A0With KMS, nearly all of the modesetting callbacks for a
driver can be invoked before userspace registration. E.g. consider a
modesetting driver that needs to perform a modeset pre-registration so
that the hardware is in a known good state before being exposed to
userspace.

To clarify what this looks like: you'll recall that I made a diagram
showing a high-level overview of the DRM initialization process for the
documentation for DeviceContext. The second stage in that diagram,
which I'm currently calling Init, is the context that we're going to
need to eventually add a typestate for.

FWIW, this is more or less what the flow will look like with this new
context. Indenting indicates calling down to a function from within the
function above

 * UnregisteredDevice::new(d: device::Device) -> UnregisteredDevice<T>
    - // Creates Crtcs, Connectors, etc.
      KmsDriver::probe(d: &UninitializedKmsDevice)
 * // The driver sets stuff up
 * Registration::new_foreign_owned(
   =C2=A0 dev: UnregisteredDevice,
   =C2=A0 data: impl PinInit<T::Data>
   ):
    - // Initialize `data`, so driver data is ready at this point
    - KmsDriver::pre_registration_init(d: &Device<T, Init>)
    - // Perform actual userspace registration

If it wasn't clear too: this means tyr won't really need to do anything
when we add the new DeviceContext typestate :)

>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 /// The Driver's private data.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// This must only be written to from
> > [`drm::Registration::new`].
> > +=C2=A0=C2=A0=C2=A0 pub(crate) data: UnsafeCell<MaybeUninit<T::Data>>,
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 _ctx: PhantomData<C>,

