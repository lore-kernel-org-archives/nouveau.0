Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1004E7E0C7
	for <nouveau@archiver.kernel.org>; Mon,  9 Feb 2026 11:17:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14F10E3C5;
	Mon,  9 Feb 2026 11:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VQRjsVLj";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A6ED741C6C;
	Mon,  9 Feb 2026 11:07:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770635268;
 b=woXAYZhOYHMDwIXxZAtcnNxEHMXeaRFWKzR4O9LWnW5wlGTP6iEytA/9fH7RZ7Tb6iXDV
 DD3AySyxu4AWhjRyr2erntNOVTXMLrhgpzke6K33daK4IqRpp+geazkdbE5cL1B89kn8lYl
 fbGFFbsvHAK2k5KYF6PQz1YCryxQeaCO5Yox8JIUFCo00Hmmyy5zutY2QjQ4JdBX3VTNRA3
 HuIPY8nfV4bO9eGGD1dI4T0zZc3mRUf8m5sq/1kEP/hwbnt2ep80/HNbnTji12N+m3glnlo
 gHFXocsTaBk0ZZGVV0kChaMUDtDwyxW+s0WQ9sFYodydE6VMFaU78n17RwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770635268; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=N9DBbbJlIeFcG+6U4ZE8zgHd8nn8IjmqQg4frbPJRNA=;
 b=JRjV4yZ+Dx0m7vayMaa6OoZBndW4pXa5OxH8rveY7LpComCgtfaom2HTIogw/LoRc/Ias
 tNy8/sfB9Vb79gFrLKWvz2zkIBki+WeaNNh5kLMGO6tWAyWodCFv7pD2K4HkuBt/8pXAaua
 /nRD22/GfrAFaStHdB+uj0tLU1G/H2h3kZGQ4S54a5zd/SahnqTCoOZQ7xF5BobN4r0Rusx
 44poRo55Igp5MgDG/ZYUuOP+I0FKvL8M79sCt5AX1u0Ry9x92c0ZTSK8tAvhjvtfVjVsD/K
 QeGG7Oyx04VvnyVM648AJgoMdzV5RbuEwl0EQXOhDQTKBK38834M7VZR60Sg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2B14F40B8C
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 11:07:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 79B9C10E0AC;
	Mon,  9 Feb 2026 11:17:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A158444E9;
	Mon,  9 Feb 2026 11:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4607CC116C6;
	Mon,  9 Feb 2026 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770635832;
	bh=rkjWDYmA+Gv4imCPiiPARsynkjj0DK/cDi4XGUpA6Ms=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=VQRjsVLjLWT1MrF1DBlVdjjWR6ga2Wp+NvD/EvTo8QihVuxkXVa0xYQXZQf5ntODl
	 aI4IQ1KP67cTrRkYwbZmUHlQ/m8i3A/TsTB8dKV6p2eGJu1ydQ+pa8xuU9wjG8DPVs
	 qsB1f6jk4rJJpmaNFylLSsuTQCBA4fUeJ2NRd/zuAbjH2gaU6wNtY/1Xgg4qIB9A2q
	 ROQiA1j//1vQK6AUMjJGKB0oLZYMbIDmj0OvKXRu4iKk3EOR2B02yGBFL3Xp8zgDgX
	 cz6pjeA2TdjFpA8Fobu8O7w30a4wcxDCL+oHMcpB/9I4mM/8buOxn7hQUo4rM9749S
	 ATD+qcWiAUaJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 12:17:08 +0100
Message-Id: <DGAE0M87A8X8.3OWL23XSZF7I6@kernel.org>
Subject: Re: [PATCH v7 6/7] rust: Introduce iosys_map bindings
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-7-lyude@redhat.com>
In-Reply-To: <20260206223431.693765-7-lyude@redhat.com>
Message-ID-Hash: TOREK3EVX3YOLFKGZ2FOW2I3AGFITGXF
X-Message-ID-Hash: TOREK3EVX3YOLFKGZ2FOW2I3AGFITGXF
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Janne Grunau <j@jannau.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TOREK3EVX3YOLFKGZ2FOW2I3AGFITGXF/>
Archived-At: 
 <https://lore.freedesktop.org/DGAE0M87A8X8.3OWL23XSZF7I6@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Feb 6, 2026 at 11:34 PM CET, Lyude Paul wrote:
> +/// Raw unsized representation of a `struct iosys_map`.
> +///
> +/// This struct is a transparent wrapper around `struct iosys_map`. The =
C API does not provide the
> +/// size of the mapping by default, and thus this type also does not inc=
lude the size of the
> +/// mapping. As such, it cannot be used for actually accessing the under=
lying data pointed to by the
> +/// mapping.
> +///
> +/// With the exception of kernel crates which may provide their own wrap=
pers around `RawIoSysMap`,
> +/// users will typically not interact with this type directly.
> +#[repr(transparent)]
> +pub struct RawIoSysMap<const SIZE: usize =3D 0>(bindings::iosys_map);

I'm still against using struct iosys_map as a common frontend for I/O memor=
y and
system memory.

Exposing this as another I/O backend instead of just having a Rust structur=
e as
frontend for a "real" abstraction around the Rust backends has various
downsides.

  (1) We are limited to the features of struct iosys_map. The corresponding=
 Rust
      backends may provide additional functionality, which we can't access =
with
      struct iosys_map. For instance, they Mmio will provide a relaxed() me=
thod
      providing access to a borrowed backend providing relaxed ordering
      accessors.

  (2) We loose out on the capability to consider compile time checks regard=
ing
      the guaranteed minimum size of the mapping. (To be fair this could be
      implemented on `IoSysMap` itself as well, but it would duplicate code=
 that
      we already have in the corresponding backends.)

  (3) You have to duplicate the safety requirements of the backends that st=
ruct
      iosys_map wraps. In fact, this series ignores that if the backend is =
I/O
      memory we have to guarantee the it is revoked when the device this I/=
O
      memory originates from is unbound.

Having a look at patch 7, it should be possible to read `is_iomem` and `vad=
dr` /
`vaddr_iomem` from the struct iosys_map and just construct the "real" `Mmio=
`
backend from it. We also have to create a backend for normal system memory,=
 but
that should be trivial. :)
