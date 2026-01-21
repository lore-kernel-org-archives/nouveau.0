Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6B5C44506
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 19:05:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D279C10E874;
	Wed, 21 Jan 2026 19:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Q+5iA1dS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A9974401CE;
	Wed, 21 Jan 2026 18:57:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769021820;
 b=xdbgHUu6ytpCG58Lb8z06hEYMk5bDRDoa4GvI1h415ZDNs64V34Z8QppOinSNgR4jLhHG
 gIwR6sfUCsTB32t6JJsQgwuIpfaLqN2LRWfLFbP0E7IDLHcMN2MKxfMvtKGQygkVykQyKFO
 wnPmYDGftyaPhub5tk310XPwOUsE4TZs3280tAkr0leftXfkHxBlrOJltEZAxrHv2mXg9Cs
 5CuQvrXETSNBDADUYyDoKwuHYKQ47lcf7Zis6dgESZPBUiM6Rnk3XbcR8PVwogt5Ngs8t/q
 6RWw/kwQ0NmC1tocGZwAGBhjMN+8dWaxAXpxi+y2dsp4XyN1P8N3/upr3h/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769021820; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GwUrV7Qj4EARXRM+GghZGm9v/6bAFT6QLlVPI91PR80=;
 b=ilDDwrdTRRnGnI699usL6+OFntQpb5Qe1vL4IR9dA+PiF28uk102kMYChaFzhgsDXYuO9
 fPcxcEnouZLjLEtfG1rP303T5BSiKX2gW2NEpS9WTjrknSgkP+xnK3RDEe9v7ipBz04ZLBa
 L5SyaiYm6knYh62GdQWE+mdmFl9TQuRHhGo6agOvn24E3EeLNo13GibJZ+qVBVI3/4mRtQG
 HqiCz440EJmV83Ssst2+cjk4eNdo3rJRibdI9sReBl7swXtxy++L5/WICKuE9prn5StEzzZ
 DJX+w9OSSRuu4RVbLD3LDbq4cBM9FBV3p9J/DGRVC9sJGYVxeHydNNQ4VXog==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=collabora.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D9B28400AA
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 18:56:57 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BD17010E865;
	Wed, 21 Jan 2026 19:05:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769022340; cv=none;
	d=zohomail.com; s=zohoarc;
	b=FfgGndmamLkoIWDKPYiKhzeLM5DSD0H6fhswkcAKM+lSN6G1xwBi5AGONl4blERew8prIOMgYKH0AwzS26wxIm3EOrosAIA+5VyDUGfeWrDbxzQSvKOENSNLd0XObH1L8AE08mMmAdiWR4wbFmkfR5Dx9o2M40FsUNC7nr63wjg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1769022340;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=GwUrV7Qj4EARXRM+GghZGm9v/6bAFT6QLlVPI91PR80=;
	b=KXtTDktyyvUFnpGYF9pwo/rpyHkAkeK1v09P8H3t+SkkqpfcP4gBWlOT5c2LuT0WH0FjzdwVo+BSt/Zm9Rg7LGQ/qcxVLz7js9ta8/Yp278QG6DbCuFnCB5CLhW1LHDN9fM1R9aWv2RxrsmTmFmP5aAXlqJIjzYTxmKHcYMZKC4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769022339;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=GwUrV7Qj4EARXRM+GghZGm9v/6bAFT6QLlVPI91PR80=;
	b=Q+5iA1dSt/3flpuK0Bz9f27pEJSWIbb01CBWcMNdoe7E9ljktRj31axsgQ0FyJi9
	8UI4nlvdyS98qJt26e2z5px3kuiQo4yRl4XirwyOg5A4qsOAIPJpVOLMID2Seny/NfO
	YnbW1Y7QyAW65eECwa/oAnJtczfXak1s4b1Bi3uM=
Received: by mx.zohomail.com with SMTPS id 1769022338505656.627659142558;
	Wed, 21 Jan 2026 11:05:38 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 1/2] rust: drm: add support for driver features
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DFUG2U4PVVTN.1DVPXGJK735F8@garyguo.net>
Date: Wed, 21 Jan 2026 16:05:22 -0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <FBB3C949-5568-4F26-95C8-8873F6DF1530@collabora.com>
References: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
 <20260119-drm-render-v1-1-8326e4d5cb44@collabora.com>
 <DFUG2U4PVVTN.1DVPXGJK735F8@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
Message-ID-Hash: WZEMYON2LEJ77VHVVIZI4CRHVF4T73MK
X-Message-ID-Hash: WZEMYON2LEJ77VHVVIZI4CRHVF4T73MK
X-MailFrom: daniel.almeida@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WZEMYON2LEJ77VHVVIZI4CRHVF4T73MK/>
Archived-At: 
 <https://lore.freedesktop.org/FBB3C949-5568-4F26-95C8-8873F6DF1530@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Gary,

> On 21 Jan 2026, at 14:31, Gary Guo <gary@garyguo.net> wrote:
>=20
> On Mon Jan 19, 2026 at 11:34 PM GMT, Daniel Almeida wrote:
>> Add initial support for drm driver features via the DriverFeatures =
trait.
>> This trait is unsafe, requiring the implementer to comply with the =
safety
>> requirements of each feature individually if the feature is enabled.
>=20
> I think such unsafe requirement is quite vague and also very =
non-local.
>=20
> Maybe we can use a single trait (the `ModesetOps` that you described) =
to do
> this:
>=20
> Something like:
>=20
>    pub unsafe trait ModesetOps<D> { ... }
>=20
>    // Maybe the never type in the future...
>    pub enum NoFeature {}
>=20
>    impl<D> ModesetOps<D> for NoFeature {
>        fn foo(&self, ...) { unimplemented!() }
>    }
>=20
>    impl Driver {
>        /// Reference the modeset implementation (typically Self),
>        /// or `NoFeature` to indicate that the feature is not =
implemented.
>        type Modeset: ModesetOps<Self>;

Yeah, this looks better indeed. I assume we can have multiple features =
by
having multiple traits, right?

>    }
>=20
> When building, you can use `TypeId` to check if it's actually =
implemented, and
> set bits in the feature flags automatically.
>=20
> Best,
> Gary

I assume we would enable FeatureFoo if typeid(Foo) !=3D =
typeid(NoFeatureFoo)?

Where Foo is =E2=80=9Ctype Foo: FooOps=E2=80=9D in the Driver trait.


