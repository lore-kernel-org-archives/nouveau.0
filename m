Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D6DD74EFA
	for <nouveau@archiver.kernel.org>; Fri, 23 Jan 2026 16:23:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BCF4110EB5A;
	Fri, 23 Jan 2026 16:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dkkNGGLQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5F1CD40564;
	Fri, 23 Jan 2026 16:14:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769184876;
 b=Q99xg0tPOVbp/ig6ysZOFGw0l6C8dC7HaDPkKm7/+akS6/hoJdkOYgFX+t02zcoTW3f0Z
 s29UmWTVnK3rJ95PoIz08CF5UGVOQxGdT/Uc4Xt1VqqKrC/JvkU7RS0ViWPeOaxPshzWubc
 lnh4uMd370mGX+6gyOYDGWipR6l0D5pwChIxIc2HWVzUCJxqYFGiyt9pXS73f48HeOEvPjC
 rRT4zqjSfGJYCDn9kZvgWm6Zk5L9ZbCgQSronPBEKvGZFidGOh7IePzzL5WOAXeVMK3GQos
 RtvHYbuv+9/e5vFhRgMMuvFp5+ZswnAJKy8Zpl9Zd5BGci4j9AcjidxniwxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769184876; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Kub5IUdQZ0gHyCCupB3lGIRpLX/NNLM/jlXCs98rgXg=;
 b=EuGpOnHZRk0QELedrRN3sYYmbgmYdQxE679DZnL0fGy2Sw6yGJzksvCvPeeMyEWlHoaB8
 ojcpo6/AKBaAvWVXYQvdaIxVDEWR5S9zPikLc4g9Pkkr6Y4yNoE1GmE/Xvzz+wGK3y52ut0
 K+sLI01WDdfCj0S7SfhHJ8XpxH/sjWW+cf4R3nEd90da08igAnkIDdOM59+dmGPiRLuvLDu
 pHihBDypvywk7rTH/Xcx3+bguFjlQSjKmnfaBTu1e/lx+L5ANNZEh2DxMoqLpRItTpPkzmE
 YawnqPoDWy4l/OMccQqHOpcjhNUbx8/P1I80bxKb0QYuR/aDOrten846b1pw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EE9DE4031A
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 16:14:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 165FB10EB55
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 16:23:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 441A6600C3;
	Fri, 23 Jan 2026 16:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9090DC4CEF1;
	Fri, 23 Jan 2026 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769185403;
	bh=Kub5IUdQZ0gHyCCupB3lGIRpLX/NNLM/jlXCs98rgXg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=dkkNGGLQcyWNl8z4J10nf1N0gvIlbg9U1521vJyLGSb5x5ry8CwRRDgaHh7BC1veA
	 nOvayn0OQkzPNQ1FmhkLFtcKU1GXWClGQzgDFQOFGsmboMloS8jWw9Gna9ywMU28Tk
	 LpXJwUQLmRF5PK1UkbjoAqAHiZKhnLXI2FZnsKp2ccRoBLMaCW1cZR3X+1IzeXfM7h
	 acwtcei9+HZWUw1p8HXnTvqLnT7oOnCzmKle91A/XjNJ3n8okd/F8RLVMcFyc0beY8
	 JN30+YFzm0Euc1/iNAOQb2aP1fy971IIzL7oIeeI7PgWMDN8AetGNpqQQBa23SUuk2
	 mbi1P76UI6ZAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 17:23:19 +0100
Message-Id: <DFW3VSJRDEOG.374RHLBPHFVVZ@kernel.org>
Subject: Re: [PATCH v2 1/2] gpu: nova-core: check for overflow to
 DMATRFBASE1
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107201647.2490140-1-ttabi@nvidia.com>
 <be1f31d3036fa12af42133dc09fa22c27cd71764.camel@nvidia.com>
In-Reply-To: <be1f31d3036fa12af42133dc09fa22c27cd71764.camel@nvidia.com>
Message-ID-Hash: 7JRE4F5N6HQAY4FWUGFE4ZPH4HUPXMUZ
X-Message-ID-Hash: 7JRE4F5N6HQAY4FWUGFE4ZPH4HUPXMUZ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "ojeda@kernel.org" <ojeda@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7JRE4F5N6HQAY4FWUGFE4ZPH4HUPXMUZ/>
Archived-At: 
 <https://lore.freedesktop.org/DFW3VSJRDEOG.374RHLBPHFVVZ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 23, 2026 at 12:44 AM CET, Timur Tabi wrote:
> On Wed, 2026-01-07 at 14:16 -0600, Timur Tabi wrote:
>> The NV_PFALCON_FALCON_DMATRFBASE/1 register pair supports DMA addresses
>> up to 49 bits only, but the write to DMATRFBASE1 could exceed that.
>> To mitigate, check first that the DMA address will fit.
>>=20
>> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
>> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
>> Fixes: 69f5cd67ce41 ("gpu: nova-core: add falcon register definitions an=
d base code")
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>
> Danilo, is it too late to make 6.20 with this patch?

This patch is already in drm-rust-next.
