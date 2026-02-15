Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDBFE63F08
	for <nouveau@archiver.kernel.org>; Sun, 15 Feb 2026 19:05:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3177910E37C;
	Sun, 15 Feb 2026 19:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bxo3XoZ/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 577E942D96;
	Sun, 15 Feb 2026 18:55:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771181733;
 b=iaHNukSIh5DnOcCt31d2gcB2BOl5Cx0KcOxnduHUmA880oi4TZRpSrqKPflXhsNncJGdI
 KfkQZovcKsl+V0mRmUM9y5ixF3ms9cA3/FlLP6JBnA/kaf9Ue2mkJ0WYfudBGu9uwSgNASB
 emErKnntUARXmxRJTwsQs5QRB2cibAUImgMflfyFfj6q421cNwYsgGnzXmmi7c7HwEJomiC
 by/cB5sJBB6ydE3xYF63rowwg5XHAFDKMX7Iu8pMIA/wJF74hlNkFNs9qryjwN55Cv+xmwQ
 22T1hRBvIqPnLjSRtyLqLmDD9QfkXA+pTh9uN2r71WdXGNcLSTRkuMuoRGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771181733; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ghv5BvEemFndNNSAtzwW5lE25/z8dZ5hmF9gHu0ALqc=;
 b=ZT5QxkAczmghuEYL0ZnCMXfeEsPw4RF72fbRwKwb1jX8ckQRnu/PCoIBrtvL9OmYWuuP1
 7RV78P7oE7+xzPIX10BJHrxdWTU/5Nv4MCJ2BEisITUbXCIFLSp03YhQo3SIlFV/DQE169Y
 EtQG7SpfdoG8LGWsJRE+bUEK/nz9cWxSBI739eJhxNN5IBJqkEi+NR3f7CNtJPr+NncWl+a
 WCeCdjegThAaZZKrosw4EqQd+tg5M4nHLTWXdsHLATeMqz5QClvGxE1ZfcvF4j+nA57FvX2
 YxW1qxzEwA0UHWbLUu76hp12r5YOKdbTBrVGzGhTJRTnHyYcIfnlL0kAlH1Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 59BA040696
	for <nouveau@lists.freedesktop.org>; Sun, 15 Feb 2026 18:55:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B335810E0E5
	for <nouveau@lists.freedesktop.org>; Sun, 15 Feb 2026 19:05:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3CC860008;
	Sun, 15 Feb 2026 19:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A466C4CEF7;
	Sun, 15 Feb 2026 19:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771182312;
	bh=pH9rQN1W7l8i4m0Q0Zu5O3RUZKpi+uUSOwQpGAasFh4=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=bxo3XoZ/i1Bn5NrrBB1rsiHHPYVXJmXPJijeNLjlVNCxSD9w6yH+YCGL8GheeiaYp
	 ahPH6pwBy4b/pJVpGclfhwnSNr+mKC8QEoXamb+LDsJgMlbwAI2ldq257F4yOJHixQ
	 2hW7qzCO3aRE7SmucFX4MRzOSyeRLX3HQ98A+hNFWju189IJ+A+Zkr/wv0Njf/bt8w
	 65ghikG8lghOYYY9Vrf0ZqehjM2guMaanLfR3NNnaJIzuCcFwQN5hW1/4sz1R4QT/r
	 vIDbSlH1piLnrVg3kFrt5hT+En11OCv6igCridc9/K0ZYjHwQjlrZokZ+1+ZCxkCZD
	 vfQTlfy26Y67A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 20:05:09 +0100
Message-Id: <DGFRQ88IPT2W.2AOQQRWS4BHQY@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau/gsp: add support for GA100
References: <20260209224036.3283326-1-ttabi@nvidia.com>
In-Reply-To: <20260209224036.3283326-1-ttabi@nvidia.com>
Message-ID-Hash: RHSOAUL7YS3G2FHTPXW3N5NNZR2MVPSZ
X-Message-ID-Hash: RHSOAUL7YS3G2FHTPXW3N5NNZR2MVPSZ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RHSOAUL7YS3G2FHTPXW3N5NNZR2MVPSZ/>
Archived-At: 
 <https://lore.freedesktop.org/DGFRQ88IPT2W.2AOQQRWS4BHQY@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Feb 9, 2026 at 11:40 PM CET, Timur Tabi wrote:
> GA100 is a compute-only variant of GA102 that boots GSP-RM like a Turing.
>
> Although architecturally like an Ampere, GA100 uses the same GSP-RM
> firmware files as Turing, and therefore must boot it like Turing does.
> In addition, as a compute-only part, GA100 has no display engine,
> no VBIOS, and no graphics (GR) engine.
>
> Since it doesn't have VBIOS, there is no FWSEC firmware, and so there is
> no FRTS region that needs to be reserved or initialized.
>
> Although Nouveau now supports GA100, there is currently no real support
> for this GPU with either Clover or Rusticl/NVK, as both require a 3D
> engine.  This is in contrast with GH100, which does contain a GR engine
> and is supported.
>
> Also note that this patch partially reverts commit e8b3627bec35 ("nouveau=
:
> don't attempt fwsec on sb on newer platforms."), which added fwsec
> pointers to struct ga100_gsp erroneously.

Can you please also explain the consequences of this? It also very much sou=
nds
like the patch needs a Fixes: tag?

Also can you please use scripts/get_maintainer.pl and send the patch to all
maintainers?

> @@ -343,9 +348,12 @@ tu102_gsp_oneinit(struct nvkm_gsp *gsp)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D nvkm_gsp_fwsec_frts(gsp);
> -	if (WARN_ON(ret))
> -		return ret;
> +	/* Only boot FWSEC-FRTS if it actually exists */
> +	if (gsp->fb.wpr2.frts.size) {
> +		ret =3D nvkm_gsp_fwsec_frts(gsp);
> +		if (WARN_ON(ret))

Since we are about to change this, I don't think this should be a WARN_ON()=
.
Most of the error paths within nvkm_gsp_fwsec_frts() already print an error
message with nvkm_error() or use WARN_ON() themselves.

Besides that, I don't think WARN_ON() is the correct tool for this, as we a=
re
not violating some invariant when this fails, it's just a normal runtime er=
ror.

Thanks,
Danilo
