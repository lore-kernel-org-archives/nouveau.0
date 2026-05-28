Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DECBCD5BD5
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 22:28:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D5F9510F69E;
	Thu, 28 May 2026 22:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="li/1oKA+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 268764668E;
	Thu, 28 May 2026 22:14:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780006477;
 b=ud4fMvq3W2gof50bUgz0OEanpjdHgUXZwn4LFldULm25nvMeNw+bGZjlFOrJSNHPMQTfX
 wU09ltuMnmedOOlDiArTyg76mvB1kitPvSAhrGaiMzGLpaAdqqZmEREqgLX7DA6mST87kxf
 +W9ydw4KL0HawsYwWW8tEQljQ8RRO0C4fIlj3/z8TyxFfzaqRp8cx1ySNkRpkI6mWdqfFRe
 A5U69WSQnLTupZGBzjEvfTNZrSjcmMVghRHdNDL7MveXDmSPJIdg/uNhWYDVks081EMpw0M
 j7pHxsZO7XwcB0qO+kL22cSoEgUupnxjBUrEcyRdfUG/mHdwvg7ZmXLp0Q5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780006477; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lJodPUarOR8wGQDRsCbfN6impEITQVF2OzJly9uaExc=;
 b=xoCFt7dbJo0KWcIjmKafnq/EpDmfqEcx8m4qzcpFhMNVpjbpnpOhw72g6q2EXnYQhW7Wi
 H0TVxzjvYYR7OPRM+WvQXW49KeO07AeIV7z8hPJWS2ABDupSAuTT5tbps4KN7F1PhLjJ1Rv
 h+OUP861gaYnQqaEVUlRw3GuqXIZd28attc31iodpacVw3idgvbjhhKC7kNIqjs+EvuEg1l
 1WgGHh5M5COs9cm0bk5phxL0OyzxOLhzBjxX/vv0srv31aJirmyB0k6LCv7Cgk4+u8JQKCi
 t5TMmEwBeVJEU8fZm+bMBIOqTYQCucQ9WeDE8V8z6OeQ0rMI/ys26ayvF3KQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 61C3846627
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 22:14:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA6D610F69A;
	Thu, 28 May 2026 22:28:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7999741502;
	Thu, 28 May 2026 22:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31D61F000E9;
	Thu, 28 May 2026 22:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007283;
	bh=lJodPUarOR8wGQDRsCbfN6impEITQVF2OzJly9uaExc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=li/1oKA+LOrS8vX+EF1yIBouswvrN8EdnPOg3IBLoISANATEr190coNu/wWY3wKeo
	 kd1zNl2ZGCjNyIl0S4R6X5J4ieo4lmBTlfIuojuKwOrAsj+ve2lVcNDbGFhJ4YCUD0
	 lT4iSQH6qNM06LnVJWA5DGXUv6+jKoT6OiR7FaPcJpuwKxZfJ2AugPyxt6VHp3644B
	 WSyTYIseuHryWniR2mbZ8sYn+nUsTnQSwoQpWHx/8IyzgMArBWlOkyKv0uLrDXHoUc
	 z8D6erJ4VmxB+SpM40apIE4ksWlOMjLZiSiN+9QoQglZ1YjTPLv8H7H0m+tb1Zo/fP
	 n3IhA3QMXJZig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 00:27:58 +0200
Message-Id: <DIUNX2Y69INR.HKKUZE3OSEEY@kernel.org>
Subject: Re: [PATCH v3 1/1] rust: drm: add FEAT_RENDER flag for render node
 support
To: "Laura Nao" <laura.nao@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260507080914.95478-1-laura.nao@collabora.com>
 <20260507080914.95478-2-laura.nao@collabora.com>
In-Reply-To: <20260507080914.95478-2-laura.nao@collabora.com>
Message-ID-Hash: JQFFO25FBBKFESW2KAXERPFYJ4A7EQ2C
X-Message-ID-Hash: JQFFO25FBBKFESW2KAXERPFYJ4A7EQ2C
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: aliceryhl@google.com, simona@ffwll.ch, ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, boris.brezillon@collabora.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 kernel@collabora.com, Daniel Almeida <daniel.almeida@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JQFFO25FBBKFESW2KAXERPFYJ4A7EQ2C/>
Archived-At: 
 <https://lore.freedesktop.org/DIUNX2Y69INR.HKKUZE3OSEEY@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu May 7, 2026 at 10:09 AM CEST, Laura Nao wrote:
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.r=
s
> index e20a5978eed6..f0c2d6e4db3a 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -186,6 +186,7 @@ impl drm::Driver for TyrDrmDriver {
>      type Object =3D drm::gem::shmem::Object<BoData>;
> =20
>      const INFO: drm::DriverInfo =3D INFO;
> +    const FEAT_RENDER: bool =3D true;

In general this should be two separate patches, one adding the feature and
another one using it in the driver.

But in this case it is minor, so fine to leave it as is.
