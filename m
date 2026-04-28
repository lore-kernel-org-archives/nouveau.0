Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93817FF8868
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 15:07:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCBF10EC6D;
	Tue, 28 Apr 2026 15:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZbymHast";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DFDA545CA2;
	Tue, 28 Apr 2026 14:54:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777388097;
 b=QLIGraXN8iy91PfWWZApKMkBpkLpvChYF5m4YKsyj2Rrw5ld59fMhs2wdZtFESxmb3Js3
 +0R7DG92VV+v0stZ0iIHxg7rQ8vBtVM1AL+i2bxPvsa+/mwiCFVJx/9QbK3ecX9b+9uO3Qf
 dQCJxFcGgoLvlz2nthreK5ji2/jkQKaHYYc2J+/BHXwti9vz2TdtoY+QoLeLTJyfKwG6f9J
 RrlF3Afp88VqNCHdoUsl4dW6X4y5d9jlw6CJcvE/dAZ+M2aV5q0cLHqCuvo6SskR29ewz9V
 6RDKSnUqWNafGRwrTKLS8RFXdt6+aCfc9EVHDPrftzw64j0aFcCj/1webG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777388097; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yKQhz+O7/MK+waNnCswL1MZKaeK2I5kc9QfUFGyOP0M=;
 b=MdwdHkdDSOatDXk9U1FESTtKQDPkg+UI6LeyH3YoiODPEJFfBeLpQbUyC+BAttoemGTEc
 Vu88ECRRp3VUCGlx+0fBfvlAXLJnOVD7zgfQUTZJVNnI426i/Dvk0I3dHlmZEgxguEMuCaZ
 RA6eNuZAhsrNiTB+qPPMivkO5kVcMYSap8QIa0YJ2rQyy5CK/kOPIsZgQ0mv7/kIA4T3yUc
 cZa1t8YjkAMsR03zvNQjYbpXXx+5wCYs61PL8kITOiNOtUzXgH9FCcSrEXudl/QQ6iDjeKw
 m9WmvEocpoRfLT22R2E/fZRa9sWOSp+nO4Nsa+C4QdFhH4JY3mKg5ZNMUDhA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8D52A45C90
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 14:54:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B3F4C10E110
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 15:07:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7A5560008;
	Tue, 28 Apr 2026 15:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633D6C2BCAF;
	Tue, 28 Apr 2026 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777388835;
	bh=HI+yTAT8Tz2f/qzRTyeKCeBLJ4X0e60wBJ4hqKkDsAs=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=ZbymHastsJWNxcsWrf8A70Ffdqxo01ZTXE/Vmr5dy5Ch5vOI2g56HPP8ug6AqqJe3
	 8b2Zxeazt2fT6I9Aj1FJ7YZBjUq4KJo7hqfSmGRFuENP+h9Xe5LRnqZzwyO7iZ+3zM
	 Ut62RJXPsR4ZG603zcExdY52uhPjvfW5+/DewEGQr6ZJCHd4eglg46Shj8Ioqfan0F
	 MgPNyiBh6t96rImqk6PGDhlPx3EfbuqlGBhr1K6w557IBJ/xgRjTF1X1MuiCerT6GR
	 mbRMBmGEBhcD6cgs1+TAyui05725Vps5jjogssY2HvzrJbJyHhZaFyZz/lB1dDKNMo
	 gZpWRJS6eYRSw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 17:07:12 +0200
Message-Id: <DI4VR9K4MH1Z.IDI6P1QIS02O@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/6] drm/nouveau: fix GA100 issues
References: <20260407192122.3055293-1-ttabi@nvidia.com>
In-Reply-To: <20260407192122.3055293-1-ttabi@nvidia.com>
Message-ID-Hash: TKEXLPRJEHP6JTYHPGSBB6TPVONPMG7J
X-Message-ID-Hash: TKEXLPRJEHP6JTYHPGSBB6TPVONPMG7J
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TKEXLPRJEHP6JTYHPGSBB6TPVONPMG7J/>
Archived-At: 
 <https://lore.freedesktop.org/DI4VR9K4MH1Z.IDI6P1QIS02O@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Apr 7, 2026 at 9:21 PM CEST, Timur Tabi wrote:
> Timur Tabi (6):
>   drm/nouveau: check for GA100 specifically when calculating FRTS size
>   drm/nouveau/bios: specify correct display fuse register for Ampere and
>     Ada
>   drm/nouveau/bios: skip the IFR header if present
>   drm/nouveau/gsp: require GSP-RM for GA100 support
>   drm/nouveau: parse the VBIOS on GA100
>   drm/nouveau/gsp: enable FWSEC-SB on GA100

Hm...this is five times the size of the patch adding GA100 support in the f=
irst
place, i.e. it doesn't feel like -fixes material, but more like deferred -n=
ext
material.

Thus, can you please send a revert for commit 20e0c197802c ("drm/nouveau/gs=
p:
add support for GA100") and make this a new clean series adding GA100 suppo=
rt
for v7.2?

Thanks,
Danilo
