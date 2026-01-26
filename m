Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BCAD1951B
	for <nouveau@archiver.kernel.org>; Mon, 26 Jan 2026 20:52:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 70AC810E49E;
	Mon, 26 Jan 2026 20:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Y8EIJNOQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0530A40ACC;
	Mon, 26 Jan 2026 20:43:14 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769460193;
 b=qhx47Z6RrUTmjFcz8l3YX7oCUG2radKLb1khdhRJaO4eh+KuiS9Fnyxq6xSDBUcsVwKgx
 dhsdt4VMM3OHvGKXelLJhAheDYDRjuQESIBscXEZILQCYDAffBxKPbiUJ0/S0THA/Z+62yN
 5Clmz5E1WCmmgrDkEZ++ooG4TenlvGuDmBjDAnnQKlkvbgGhcimLIuwrLDZxEQJbXVtM84k
 5nMwhPzz65LwVmz+/5T34/pkE9gAKT4VDJFBGvjLYHzpPOVsmNtMsrZphwWrd1Zhql9ICMI
 Fmx2Ud1muNvD+0ri7L1HCXmwC7yr8blFOnHpVPh/UeNu0nrnKucbij5+V6KA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769460193; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rEHkKpBcmkOspe2hK05VCnHAt4UqLafts8UPtI4RO7A=;
 b=bwRQgmxCucnmdSn+3vL9nXL97+rc9EGpGr4kG9PofhEMLkIdnJkRyPhs0Xg4Dzkjo+eoe
 MSDNUo3Z5PPRVy6XFuG871LotA9XrwSFKUCxYiCF46EFTfse9gL1d2PyWlUFPra8fv7DDN5
 JsgGfAnUUShRyrEPxStJdlq0FY8WPja6picV6egCqXWWfEVUeZ7WL1p/7otGt/hGJ967MNX
 JXOfX3emmkzV6kXticLFnE/cElT6vcIJ7JQOOTzdodqlXTv8CqAMBZAbRYvV5o9Rruexjyf
 1VeWoVs0d4EngH5CxHaz+0BCpFZYnUgP4qU1xOoVkbRJyfKh4kDMa2Iddg2A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C4A0040371
	for <nouveau@lists.freedesktop.org>; Mon, 26 Jan 2026 20:43:10 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F112810E16A;
	Mon, 26 Jan 2026 20:52:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769460724; cv=none;
	d=zohomail.com; s=zohoarc;
	b=aOWNmqHI0cSjGLHm+y4IvVLF/4YJLWB0zo4lhon7+FpCMYil/lFbTCKiQ+fuzR76evoPHzATFQXQk3Ux6LlttaL8Wy6TLgfyqvb2nO2xTepqGjgAIuaHFhjLMiaOsmMPNDZvQ1one6KK/f5csZ3VuLri5lAjttCQTtNDn0i9D0s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1769460724;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=rEHkKpBcmkOspe2hK05VCnHAt4UqLafts8UPtI4RO7A=;
	b=Id+rb4XoeYpfNBzlQfMBB7nKN1xBTtUmXyBaX3EtkdzjJDAxatIjBGgipsldscZwtpGT5WlEti2IYy1N9ZjYM5M4toqQDyIjUF0pdDkNWj3VpN+Kwz/RKxF7TCE2gbpH5g/8UzqU91deNakSSvKYs1Opfb09goQ+rRXdlRKPyz8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769460724;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=rEHkKpBcmkOspe2hK05VCnHAt4UqLafts8UPtI4RO7A=;
	b=Y8EIJNOQIwYw0TiQ0WIJKtdg3ymohxI+YzA8n891zeE2pUX5jhjvsAVWJDralPHO
	NyuHibCeI5Yw0/FXbtwAxylTxJWkemin4uUOIXuak4HYJw1GSnLmbcuvsmzhvQbr8Rs
	zJSZ2CM5gOSXwUufqXv1st7TYWF2Q43wPDBCfYJo=
Received: by mx.zohomail.com with SMTPS id 176946072310858.48046846843215;
	Mon, 26 Jan 2026 12:52:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 0/3] Introduce DeviceContext
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260123231230.248500-1-lyude@redhat.com>
Date: Mon, 26 Jan 2026 21:51:46 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1EA1F0E-0A78-4F6A-B67F-03E5CB8F0135@collabora.com>
References: <20260123231230.248500-1-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
Message-ID-Hash: HGO2ER3WZKUTB6K3YFEIDYETRYBADJO4
X-Message-ID-Hash: HGO2ER3WZKUTB6K3YFEIDYETRYBADJO4
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HGO2ER3WZKUTB6K3YFEIDYETRYBADJO4/>
Archived-At: 
 <https://lore.freedesktop.org/E1EA1F0E-0A78-4F6A-B67F-03E5CB8F0135@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Lyude,

> On 24 Jan 2026, at 00:10, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Previous version of this patch series:
>  https://patchwork.freedesktop.org/series/160217/#rev2
>=20
> One of the unsolved issues we still have with the rust DRM bindings is
> the ability to limit certain Device operations to contexts where we =
can
> guarantee that a Device has been fully initialized and registered with
> userspace, or vice-versa (e.g. must be unregistered).
>=20
> While the previous solution for this that I had was simply not =
exposing
> drm::Device at all until the device has been registered with =
userspace,
> unfortunately this isn't enough since:
>=20
> * As we found out with Tyr, drivers occasionally need to be able to
>  create GEM objects before device registration
> * We would still need to be able to handle KMS callbacks which could =
be
>  invoked after KMS init but before userspace registration (not handled
>  in this series specifically, but DeviceContext will be required for
>  handling this).
>=20
> This patch series provides a pretty nice solution to this, by
> implementing a very similar solution to kernel::device::DeviceContext:
> introducing our own DeviceContext type state.
>=20
> This patch series depends on the two pre-requisite patch series:
>=20
> * https://patchwork.freedesktop.org/series/160523/
>=20
>                          Series-wide changes
>=20
> V2:
> * s/DeviceCtx/DeviceContext/ for consistency
> * Move private driver-data availability to the Registration
>  DeviceContext
> * s/AnyCtx/Init/
>=20

Did you forget the changelog for v3 and v4?


> More changes described in each patch description.

Seems to be the case for the individual patches as well.

Anyways, I will do a second round of reviews here; please
wait a bit before potentially merging a new iteration.


=E2=80=94 Daniel=
