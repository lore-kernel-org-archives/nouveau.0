Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6F9D6CFA7
	for <nouveau@archiver.kernel.org>; Fri, 23 Jan 2026 22:52:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 151CD10EBFD;
	Fri, 23 Jan 2026 22:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dqbJYBxY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 202714062E;
	Fri, 23 Jan 2026 22:43:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769208199;
 b=w6Sb3zIdf3Agawb/39/RRRhQiw0qSDnWPJWhdF6fP8Zget4HCp5WPiufNM+OMLWeDhg0x
 KjdFiNsPqLecwqu1Exx95aUfA5Qjlfzcuf7mgiceGImFei7/nPlhWQ1K6Y2nODjJbGVGqmi
 H/zUQO9h/EJgPDq8oZV3c0nzNpZwGBSwqarICUgnSQ4LPTEOLL50mhkEUpcOHaN62jK75Y1
 o+TKkEkFkYFcPYDgejvdjFQXhZ/WL0z24TGDZzP4Q43E3M3Orm4w57wnz6wsBr7ZHUT/R2b
 qy3Xat7U21HL8I1UiN8rfitP4pqWIK3QU63Juau/De0gdQS/au1EbWPk0nwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769208199; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hr+K0/x9vYaZJhaVKfaj8TuReLDryhxjoKzint7DlB8=;
 b=h+4J01QSNmxZppEvxsYPh3V181mgVkGSd5oHxpdfY6IFV42Bjq+QmRKmUci+njhMgC2xk
 eBJRagwYbDPvJL3Bt1wiHtoEzgB2Y9ZbW1TAkknYzhHPRYBsSSEZ66UiPXteEMgAXZvFogA
 nSTojpGu8c+TZLBYqOwOHJX/P6jSFhgrVt6+eEWJ5E0U1g+sQkjPd1KtOZvh2S2Fk9Dx9/2
 IPWeBFU1d1wonV0zdIkkj2CEpcolmSdth8FWME0Ljscrx8Ts2fck64IKf3eGuSpC185WDdT
 CITIhgls4H/LbfmY6DaPSGdX+14W9yq3JSKjfa8iW4LJOUKKVyvYKvQV+H8w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 07EAB400C5
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 22:43:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBCB10EBEF
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 22:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769208726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hr+K0/x9vYaZJhaVKfaj8TuReLDryhxjoKzint7DlB8=;
	b=dqbJYBxYsHAoG2pWO52AwuaimIwAWOC7kD1w6+n32tXjUxGzHvnEaDE1QnMqruWf/ldred
	N/pATyBB00mWtG5m2BzK66tkX5K68HcMKOCTFRt95b3uTfQD8k2SjwtXaTrMlNXIPIW23J
	kAr2+QPwlqGupnXkdscqmm9fSlmeOuI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-8V25j6FqOwi9jyccY-8WPA-1; Fri, 23 Jan 2026 17:52:03 -0500
X-MC-Unique: 8V25j6FqOwi9jyccY-8WPA-1
X-Mimecast-MFC-AGG-ID: 8V25j6FqOwi9jyccY-8WPA_1769208723
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50143b67424so88449841cf.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 23 Jan 2026 14:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769208723; x=1769813523;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hr+K0/x9vYaZJhaVKfaj8TuReLDryhxjoKzint7DlB8=;
        b=Qv724cGxXz+A2OgoWS1olD9rl0UqRPFFLyI1CD7rkVT2qwjEy+OOfyENAhNWcgsDrY
         mU0oFmhB0uHonxrU6Dt1eyIW2lLE3ngkAfGoDHd5g1ky4O7+KN4Nq/u1M1ZEca6GFmtW
         uoOUglimWTYwvLjM/PsYAHsPJ7rzCttk63bnIwzGn7AIstZ28z+VhO6yKYQDehmuJC6a
         /B1NWivfsvdwlUHVWF5TkPon/h22QmQcfaoponHCw36ZJP9rfqryOWgQU4SD6B7eP0cn
         bZRNAFshvPccg6qCtA0fOwfsNIpPLoOjmWoOClk81iJd4RkjzqLyM450KV51q7XSHqS4
         GrAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRzoa/2dxLHETF5Gv34M4HQQY9wI8VQnhcjOmjhY8fPmSbPAqj0aB0wZQ0nAfcSsRTePPQcx7K@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/VH6cxUYvDQZ+I47Oj+TwT7MXumW0zLCNwCuWfQaBNWPGOlbc
	ZMsH3d2JEBZdG0GQm4qJ7gHL6297YFfwIky+ToEtyhWxCc7zdMW1B3PNFNP13xyY717o4sJmNtB
	tbZknlyDcQD2Rwnwm/QMH/bCN7XpBOFqwFufGn2yxzF5GRzC+lIJZ+9x24rJvZCjPJNR/HWtXz/
	Y=
X-Gm-Gg: AZuq6aJwEF33m7j2dhccakXb72GkXlnEXuA9hg6LvdcwrAonLhZoS6hiKGBxgjoGjsY
	6SriKJZIzEne6Bkcs0mwgwy2C/9keTXZgvZah61kEJaWj3HyfjT1O9UiRC+h2yy8qO5Eec4+oSd
	VbC3B0HjgpY1N2CaO0YCTMyIlOQpNzh0SiAxwVHaPzMy3/dnReicrNT7OGZhY8LgyAe+wVbZbvq
	6gBik8oHhcvx2UxIoGjpAzNdrgp3sZUIUyhwirTcTQBptsxfCo3bMxy26KO3hX/v9CZ2M1Ue3gv
	+wYp0GmQQDQO+A4iwcMUt9mI3I1kRsQw+MScJYRCaExgcAtZwdd6zgWZVNvWNI6Ojk/+bW47M+5
	7qEp4Iw==
X-Received: by 2002:a05:622a:19a1:b0:501:147a:a215 with SMTP id
 d75a77b69052e-502f77d0621mr57859501cf.73.1769208722985;
        Fri, 23 Jan 2026 14:52:02 -0800 (PST)
X-Received: by 2002:a05:622a:19a1:b0:501:147a:a215 with SMTP id
 d75a77b69052e-502f77d0621mr57859261cf.73.1769208722588;
        Fri, 23 Jan 2026 14:52:02 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8949bdd0a5asm13002476d6.9.2026.01.23.14.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 14:52:01 -0800 (PST)
Message-ID: <4b46771349a474a3d81c29a6b0cd946071c58d7b.camel@redhat.com>
Subject: Re: [PATCH v3 3/3] rust/drm/gem: Use DeviceContext with GEM objects
From: lyude@redhat.com
To: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 23 Jan 2026 17:52:00 -0500
In-Reply-To: <EEE2F67E-7F61-44B3-805B-0794C9BB02F6@collabora.com>
References: <20260122225057.3589500-1-lyude@redhat.com>
	 <20260122225057.3589500-4-lyude@redhat.com>
	 <EEE2F67E-7F61-44B3-805B-0794C9BB02F6@collabora.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jODY1fYwgANW2JA8f3jPVYRhTlNafS6h1Q2AowwMicw_1769208723
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: GQNTQ7557OAIINYL632N6FRDV2ZITEES
X-Message-ID-Hash: GQNTQ7557OAIINYL632N6FRDV2ZITEES
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GQNTQ7557OAIINYL632N6FRDV2ZITEES/>
Archived-At: 
 <https://lore.freedesktop.org/4b46771349a474a3d81c29a6b0cd946071c58d7b.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2026-01-22 at 22:56 -0300, Daniel Almeida wrote:
> > =C2=A0=C2=A0=C2=A0 }
> > }
> > diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> > index 0e81957cf8c28..4c03105e6a817 100644
> > --- a/rust/kernel/drm/device.rs
> > +++ b/rust/kernel/drm/device.rs
> > @@ -163,13 +163,13 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 master_set: None,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 master_drop: None,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugfs_init: None,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_create_object: T::Objec=
t::ALLOC_OPS.gem_create_object,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_handle_to_fd:
> > T::Object::ALLOC_OPS.prime_handle_to_fd,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_fd_to_handle:
> > T::Object::ALLOC_OPS.prime_fd_to_handle,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import: T::Object=
::ALLOC_OPS.gem_prime_import,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import_sg_table:
> > T::Object::ALLOC_OPS.gem_prime_import_sg_table,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_create: T::Object::ALL=
OC_OPS.dumb_create,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_map_offset: T::Object:=
:ALLOC_OPS.dumb_map_offset,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_create_object:
> > T::Object::<Uninit>::ALLOC_OPS.gem_create_object,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_handle_to_fd:
> > T::Object::<Uninit>::ALLOC_OPS.prime_handle_to_fd,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_fd_to_handle:
> > T::Object::<Uninit>::ALLOC_OPS.prime_fd_to_handle,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import:
> > T::Object::<Uninit>::ALLOC_OPS.gem_prime_import,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import_sg_table:
> > T::Object::<Uninit>::ALLOC_OPS.gem_prime_import_sg_table,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_create: T::Object::<Un=
init>::ALLOC_OPS.dumb_create,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_map_offset:
> > T::Object::<Uninit>::ALLOC_OPS.dumb_map_offset,
>=20
> Why are we specifically going with Uninit here?

I think this was just an assumption that similarly to KMS callbacks,
gem callbacks can also happen before registration. except, that some of
these clearly can't happen before registration - whoops.

But this being said - it doesn't really make any difference what the
DeviceContext is here. The DeviceContext generic here isn't actually
used in any way, nor is it used by the C callback, it's just here
because we have to specify it on the associated type.

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_fdinfo: None,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev_probe: None,
> >=20
> > diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> > index a16605b407159..94ebaf19ac069 100644
> > --- a/rust/kernel/drm/driver.rs
> > +++ b/rust/kernel/drm/driver.rs
> > @@ -110,7 +110,7 @@ pub trait Driver {
> > =C2=A0=C2=A0=C2=A0 type Data: Sync + Send;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// The type used to manage memory for this driver.
> > -=C2=A0=C2=A0=C2=A0 type Object: AllocImpl;
> > +=C2=A0=C2=A0=C2=A0 type Object<Ctx: drm::DeviceContext>: AllocImpl;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// The type used to represent a DRM File (client)
> > =C2=A0=C2=A0=C2=A0 type File: drm::file::DriverFile;
> > diff --git a/rust/kernel/drm/gem/mod.rs
> > b/rust/kernel/drm/gem/mod.rs
> > index b4199945db378..3af9f52f8eda4 100644
> > --- a/rust/kernel/drm/gem/mod.rs
> > +++ b/rust/kernel/drm/gem/mod.rs
> > @@ -8,6 +8,10 @@
> > =C2=A0=C2=A0=C2=A0 bindings,
> > =C2=A0=C2=A0=C2=A0 drm::{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device::{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Dev=
iceContext,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reg=
istered, //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver::{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Allo=
cImpl,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Allo=
cOps, //
> > @@ -22,6 +26,7 @@
> > =C2=A0=C2=A0=C2=A0 types::Opaque,
> > };
> > use core::{
> > +=C2=A0=C2=A0=C2=A0 marker::PhantomData,
> > =C2=A0=C2=A0=C2=A0 ops::Deref,
> > =C2=A0=C2=A0=C2=A0 ptr::NonNull, //
> > };
> > @@ -33,21 +38,30 @@
> > /// [`DriverFile`]: drm::file::DriverFile
> > pub type DriverFile<T> =3D drm::File<<<T as DriverObject>::Driver as
> > drm::Driver>::File>;
> >=20
> > +/// A type alias for retrieving the current [`AllocImpl`] for a
> > given [`DriverObject`].
> > +///
> > +/// [`Driver`]: drm::Driver
> > +pub type DriverAllocImpl<T, Ctx =3D Registered> =3D
> > +=C2=A0=C2=A0=C2=A0 <<T as DriverObject>::Driver as drm::Driver>::Objec=
t<Ctx>;
>=20
> Should this be a follow up patch instead?
>=20
> > +
> > /// GEM object functions, which must be implemented by drivers.
> > pub trait DriverObject: Sync + Send + Sized {
> > =C2=A0=C2=A0=C2=A0 /// Parent `Driver` for this object.
> > =C2=A0=C2=A0=C2=A0 type Driver: drm::Driver;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Create a new driver data object for a GEM object=
 of a given
> > size.
> > -=C2=A0=C2=A0=C2=A0 fn new(dev: &drm::Device<Self::Driver>, size: usize=
) -> impl
> > PinInit<Self, Error>;
> > +=C2=A0=C2=A0=C2=A0 fn new<Ctx: DeviceContext>(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev: &drm::Device<Self::Dri=
ver, Ctx>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size: usize,
> > +=C2=A0=C2=A0=C2=A0 ) -> impl PinInit<Self, Error>;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Open a new handle to an existing object, associa=
ted with a
> > File.
> > -=C2=A0=C2=A0=C2=A0 fn open(_obj: &<Self::Driver as drm::Driver>::Objec=
t, _file:
> > &DriverFile<Self>) -> Result {
> > +=C2=A0=C2=A0=C2=A0 fn open(_obj: &DriverAllocImpl<Self>, _file:
> > &DriverFile<Self>) -> Result {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Close a handle to an existing object, associated=
 with a
> > File.
> > -=C2=A0=C2=A0=C2=A0 fn close(_obj: &<Self::Driver as drm::Driver>::Obje=
ct, _file:
> > &DriverFile<Self>) {}
> > +=C2=A0=C2=A0=C2=A0 fn close(_obj: &DriverAllocImpl<Self>, _file:
> > &DriverFile<Self>) {}
> > }
> >=20
> > /// Trait that represents a GEM object subtype
> > @@ -73,9 +87,12 @@ extern "C" fn open_callback<T: DriverObject>(
> > =C2=A0=C2=A0=C2=A0 // SAFETY: `open_callback` is only ever called with =
a valid
> > pointer to a `struct drm_file`.
> > =C2=A0=C2=A0=C2=A0 let file =3D unsafe { DriverFile::<T>::from_raw(raw_=
file) };
> >=20
> > -=C2=A0=C2=A0=C2=A0 // SAFETY: `open_callback` is specified in the Allo=
cOps
> > structure for `DriverObject<T>`,
> > -=C2=A0=C2=A0=C2=A0 // ensuring that `raw_obj` is contained within a
> > `DriverObject<T>`
> > -=C2=A0=C2=A0=C2=A0 let obj =3D unsafe { <<T::Driver as drm::Driver>::O=
bject as
> > IntoGEMObject>::from_raw(raw_obj) };
> > +=C2=A0=C2=A0=C2=A0 // SAFETY:
> > +=C2=A0=C2=A0=C2=A0 // * `open_callback` is specified in the AllocOps s=
tructure
> > for `DriverObject`, ensuring that
> > +=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 `raw_obj` is contained within a `Dri=
verAllocImpl<T>`
> > +=C2=A0=C2=A0=C2=A0 // * It is only possible for `open_callback` to be =
called
> > after device registration, ensuring
> > +=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 that the object's device is in the `=
Registered` state.
> > +=C2=A0=C2=A0=C2=A0 let obj: &DriverAllocImpl<T> =3D unsafe {
> > IntoGEMObject::from_raw(raw_obj) };
> >=20
> > =C2=A0=C2=A0=C2=A0 match T::open(obj, file) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Err(e) =3D> e.to_errno(),
> > @@ -92,12 +109,12 @@ extern "C" fn close_callback<T: DriverObject>(
> >=20
> > =C2=A0=C2=A0=C2=A0 // SAFETY: `close_callback` is specified in the Allo=
cOps
> > structure for `Object<T>`, ensuring
> > =C2=A0=C2=A0=C2=A0 // that `raw_obj` is indeed contained within a `Obje=
ct<T>`.
> > -=C2=A0=C2=A0=C2=A0 let obj =3D unsafe { <<T::Driver as drm::Driver>::O=
bject as
> > IntoGEMObject>::from_raw(raw_obj) };
> > +=C2=A0=C2=A0=C2=A0 let obj: &DriverAllocImpl<T> =3D unsafe {
> > IntoGEMObject::from_raw(raw_obj) };
> >=20
> > =C2=A0=C2=A0=C2=A0 T::close(obj, file);
> > }
> >=20
> > -impl<T: DriverObject> IntoGEMObject for Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> IntoGEMObject for
> > Object<T, Ctx> {
> > =C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::drm_gem_object {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.obj.get()
> > =C2=A0=C2=A0=C2=A0 }
> > @@ -105,7 +122,7 @@ fn as_raw(&self) -> *mut
> > bindings::drm_gem_object {
> > =C2=A0=C2=A0=C2=A0 unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_=
gem_object)
> > -> &'a Self {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `obj` is guarante=
ed to be in an `Object<T>` via
> > the safety contract of this
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // function
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > &*crate::container_of!(Opaque::cast_from(self_ptr), Object<T>, obj)
> > }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > &*crate::container_of!(Opaque::cast_from(self_ptr), Object<T, Ctx>,
> > obj) }
> > =C2=A0=C2=A0=C2=A0 }
> > }
> >=20
> > @@ -122,7 +139,7 @@ fn size(&self) -> usize {
> > =C2=A0=C2=A0=C2=A0 fn create_handle<D, F>(&self, file: &drm::File<F>) -=
>
> > Result<u32>
> > =C2=A0=C2=A0=C2=A0 where
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self: AllocImpl<Driver =3D D=
>,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object =3D S=
elf, File =3D F>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object<Regis=
tered> =3D Self, File =3D F>,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 F: drm::file::DriverFile<Dri=
ver =3D D>,
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut handle: u32 =3D 0;
> > @@ -137,7 +154,7 @@ fn create_handle<D, F>(&self, file:
> > &drm::File<F>) -> Result<u32>
> > =C2=A0=C2=A0=C2=A0 fn lookup_handle<D, F>(file: &drm::File<F>, handle: =
u32) ->
> > Result<ARef<Self>>
> > =C2=A0=C2=A0=C2=A0 where
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self: AllocImpl<Driver =3D D=
>,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object =3D S=
elf, File =3D F>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object<Regis=
tered> =3D Self, File =3D F>,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 F: drm::file::DriverFile<Dri=
ver =3D D>,
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The arguments are=
 all valid per the type
> > invariants.
> > @@ -177,16 +194,18 @@ impl<T: IntoGEMObject> BaseObject for T {}
> > ///
> > /// # Invariants
> > ///
> > -/// - `self.obj` is a valid instance of a `struct drm_gem_object`.
> > +/// * `self.obj` is a valid instance of a `struct drm_gem_object`.
> > +/// * Any type invariants of `Ctx` apply to the parent DRM device
> > for this GEM object.
> > #[repr(C)]
> > #[pin_data]
> > -pub struct Object<T: DriverObject + Send + Sync> {
> > +pub struct Object<T: DriverObject + Send + Sync, Ctx:
> > DeviceContext =3D Registered> {
> > =C2=A0=C2=A0=C2=A0 obj: Opaque<bindings::drm_gem_object>,
> > =C2=A0=C2=A0=C2=A0 #[pin]
> > =C2=A0=C2=A0=C2=A0 data: T,
> > +=C2=A0=C2=A0=C2=A0 _ctx: PhantomData<Ctx>,
> > }
> >=20
> > -impl<T: DriverObject> Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> > =C2=A0=C2=A0=C2=A0 const OBJECT_FUNCS: bindings::drm_gem_object_funcs =
=3D
> > bindings::drm_gem_object_funcs {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free: Some(Self::free_callba=
ck),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 open: Some(open_callback::<T=
>),
> > @@ -206,11 +225,12 @@ impl<T: DriverObject> Object<T> {
> > =C2=A0=C2=A0=C2=A0 };
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Create a new GEM object.
> > -=C2=A0=C2=A0=C2=A0 pub fn new(dev: &drm::Device<T::Driver>, size: usiz=
e) ->
> > Result<ARef<Self>> {
> > +=C2=A0=C2=A0=C2=A0 pub fn new(dev: &drm::Device<T::Driver, Ctx>, size:=
 usize) ->
> > Result<ARef<Self>> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let obj: Pin<KBox<Self>> =3D=
 KBox::pin_init(
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try_=
pin_init!(Self {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 obj:
> > Opaque::new(bindings::drm_gem_object::default()),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 data <- T::new(dev, size),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 _ctx: PhantomData,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_=
KERNEL,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )?;
> > @@ -219,6 +239,8 @@ pub fn new(dev: &drm::Device<T::Driver>, size:
> > usize) -> Result<ARef<Self>> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { (*obj.as_raw()).fun=
cs =3D &Self::OBJECT_FUNCS };
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The arguments are=
 all valid per the type
> > invariants.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // INVARIANT: We use `dev` =
for creating the GEM object,
> > which is known to be in state `Ctx` -
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that the GEM ob=
ject's pointer to the DRM
> > device is always in the same state.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to_result(unsafe {
> > bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size)
> > })?;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: We will never mov=
e out of `Self` as `ARef<Self>`
> > is always treated as pinned.
> > @@ -232,13 +254,15 @@ pub fn new(dev: &drm::Device<T::Driver>,
> > size: usize) -> Result<ARef<Self>> {
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Returns the `Device` that owns this GEM object.
> > -=C2=A0=C2=A0=C2=A0 pub fn dev(&self) -> &drm::Device<T::Driver> {
> > +=C2=A0=C2=A0=C2=A0 pub fn dev(&self) -> &drm::Device<T::Driver, Ctx> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `struct drm_gem_object.=
dev` is initialized and valid
> > for as long as the GEM
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 object lives.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - The device we used for =
creating the gem object is
> > passed as &drm::Device<T::Driver> to
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 Object::<T>::=
new(), so we know that `T::Driver` is the
> > right generic parameter to use
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 here.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - Any type invariants of=
 `Ctx` are upheld by using the
> > same `Ctx` for the `Device` we
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 return.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drm::Device::from_r=
aw((*self.as_raw()).dev) }
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > @@ -264,7 +288,7 @@ extern "C" fn free_callback(obj: *mut
> > bindings::drm_gem_object) {
> > }
> >=20
> > // SAFETY: Instances of `Object<T>` are always reference-counted.
> > -unsafe impl<T: DriverObject> crate::sync::aref::AlwaysRefCounted
> > for Object<T> {
> > +unsafe impl<T: DriverObject, Ctx: DeviceContext> AlwaysRefCounted
> > for Object<T, Ctx> {
> > =C2=A0=C2=A0=C2=A0 fn inc_ref(&self) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The existence of =
a shared reference guarantees
> > that the refcount is non-zero.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::drm_gem_o=
bject_get(self.as_raw()) };
> > @@ -279,9 +303,9 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
> > =C2=A0=C2=A0=C2=A0 }
> > }
> >=20
> > -impl<T: DriverObject> super::private::Sealed for Object<T> {}
> > +impl<T: DriverObject, Ctx: DeviceContext> super::private::Sealed
> > for Object<T, Ctx> {}
> >=20
> > -impl<T: DriverObject> Deref for Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> Deref for Object<T, Ctx>
> > {
> > =C2=A0=C2=A0=C2=A0 type Target =3D T;
> >=20
> > =C2=A0=C2=A0=C2=A0 fn deref(&self) -> &Self::Target {
> > @@ -289,7 +313,7 @@ fn deref(&self) -> &Self::Target {
> > =C2=A0=C2=A0=C2=A0 }
> > }
> >=20
> > -impl<T: DriverObject> AllocImpl for Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> AllocImpl for Object<T,
> > Ctx> {
> > =C2=A0=C2=A0=C2=A0 type Driver =3D T::Driver;
> >=20
> > =C2=A0=C2=A0=C2=A0 const ALLOC_OPS: AllocOps =3D AllocOps {
> > --=20
> > 2.52.0
> >=20
> >=20

