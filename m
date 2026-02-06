Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5808EE20A5
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 13:48:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5D25910E78F;
	Fri,  6 Feb 2026 13:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="JsBG5J0O";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 14EC541B4C;
	Fri,  6 Feb 2026 13:39:28 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770385167;
 b=LcEm4E69XGvpxI7eo5XnSgniLMWaGi9KO7lsecbF/ZmOlJnqLs1KyINd7eScGd5BfgwHd
 nDkhlqD9EKr0qV48TA9XGDrHBmQ0U0yictaG89mQCUOWGiqFvA7l9y//sbIJi7TKcvmCFoU
 wZu12CTCOSMGYRNqmr9kCXfWMonr7oo2f1EBiw4PiP8OJsAd6w4lvAzYLOilZKpu8GdNdnQ
 duzXSsExtue0J8Q5EBK57ngo6PqjkTYHSm2CQ9xNCjB4lRPPLc2LaJVJqfMTeK/0N+KVdZ1
 pGdlMY3Egc0sWsw+FFGKz45wqhT0fXi7wgVKS3kUdBKiEMeVDytQ9YojDWwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770385167; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LzPiNNptRxNCTQFdfUnfCjZ/Da5/h5a44gaaAAfD6Fw=;
 b=LpgNjM6uWBAkU0MMePTErWFwuDY/4OFUFQM32MuxKsoU3+AeLdguWO3vFL1blGDYWgzie
 1rArIoVVwyFMb2cCJd9pTzGT+1mxI+e+q1097eTodEluRSl5z1wsrkHwVpBF4t04ckwWvJ2
 53FVwPcHUt9qIEvnftoPZDpRQVZ7Q2G5QeIcdC9zWHZOiX2EBolpM8bUYMnAY6WRHc/WAd5
 fx4hQ0uDBrbemft+6sz6XKEo5wDKhgP8MVEcofR3JSl136u7S8rdCGhdIZzliWEZuDqS9pZ
 AW1aSXy2uUG9OjYpcY+1EMY/rQcngyTnIIZaaTwvq4OfrEsCDc03P0MWEUaA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EF637402CB
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 13:39:25 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 091C810E74F;
	Fri,  6 Feb 2026 13:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770385725; cv=none;
	d=zohomail.com; s=zohoarc;
	b=eLADfDh5ZCG7FahJ0WDSoJJw3WG/E6sg1kBr91d1CAzJzJ2jBLLP6x/vNsE4+Lc8NOBnhgScH7CmbgStQf0dToSoI4t52hv9Fpke68kF2sLnsGzZPvwKmwcwHVWhv27+iG6IURND31icveANQAM5OCqsNx1UXPk27d/Nl9B0J0g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1770385725;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=LzPiNNptRxNCTQFdfUnfCjZ/Da5/h5a44gaaAAfD6Fw=;
	b=JgPcy0BcL0k3sj0DyP25viHH4BRI+G8gSzMN4xxbs9akM4YPfWaqZSODzOFEaNJppwwm3+snAJiidoEEvLgHAOYTNRF6rYem5GOyW2UDsArwbarvmWtvlixcAcG4SOPq4qi891kKVO4r1vsmdF/rEx6EpGgmYjDYKEnrnoHjPqM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770385725;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=LzPiNNptRxNCTQFdfUnfCjZ/Da5/h5a44gaaAAfD6Fw=;
	b=JsBG5J0OosF+DKNKjZbozUujKQ83cvNeSAEIpFjnr1nBs3MLdCZdPc/sLPg3XhkF
	JwfBYIopxkego5nPuPgCIrgm8ZXW5PHh79J7vSnhLBGulBYZfN3lHtYPem8CZWoconL
	gh92Sir9qISd08fibtCSWiWb+zfQcsz03uLfA3oo=
Received: by mx.zohomail.com with SMTPS id 1770385723877534.8156522665855;
	Fri, 6 Feb 2026 05:48:43 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 3/4] rust/drm/gem: Add DriverAllocImpl type alias
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260131001602.2095470-4-lyude@redhat.com>
Date: Fri, 6 Feb 2026 10:48:27 -0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <A3285F15-8EE1-45C9-B54F-703C7BC4E161@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
 <20260131001602.2095470-4-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
Message-ID-Hash: M5JXY46NWBJQQKESPORJUU2SRATQCHJ4
X-Message-ID-Hash: M5JXY46NWBJQQKESPORJUU2SRATQCHJ4
X-MailFrom: daniel.almeida@collabora.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M5JXY46NWBJQQKESPORJUU2SRATQCHJ4/>
Archived-At: 
 <https://lore.freedesktop.org/A3285F15-8EE1-45C9-B54F-703C7BC4E161@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



> On 30 Jan 2026, at 21:13, Lyude Paul <lyude@redhat.com> wrote:
>=20
> This is just a type alias that resolves into the AllocImpl for a given
>  T: drm::gem::DriverObject
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/gem/mod.rs | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index b4199945db378..ad74c5159f725 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -33,6 +33,11 @@
> /// [`DriverFile`]: drm::file::DriverFile
> pub type DriverFile<T> =3D drm::File<<<T as DriverObject>::Driver as =
drm::Driver>::File>;
>=20
> +/// A type alias for retrieving the current [`AllocImpl`] for a given =
[`DriverObject`].
> +///
> +/// [`Driver`]: drm::Driver
> +pub type DriverAllocImpl<T> =3D <<T as DriverObject>::Driver as =
drm::Driver>::Object;
> +
> /// GEM object functions, which must be implemented by drivers.
> pub trait DriverObject: Sync + Send + Sized {
>     /// Parent `Driver` for this object.
> @@ -42,12 +47,12 @@ pub trait DriverObject: Sync + Send + Sized {
>     fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl =
PinInit<Self, Error>;
>=20
>     /// Open a new handle to an existing object, associated with a =
File.
> -    fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: =
&DriverFile<Self>) -> Result {
> +    fn open(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) =
-> Result {
>         Ok(())
>     }
>=20
>     /// Close a handle to an existing object, associated with a File.
> -    fn close(_obj: &<Self::Driver as drm::Driver>::Object, _file: =
&DriverFile<Self>) {}
> +    fn close(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) =
{}
> }
>=20
> /// Trait that represents a GEM object subtype
> --=20
> 2.52.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
