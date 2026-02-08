Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CC0EF06E3
	for <nouveau@archiver.kernel.org>; Sun,  8 Feb 2026 14:39:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD4B510E2FA;
	Sun,  8 Feb 2026 14:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J/ld5uUN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D528241C6A;
	Sun,  8 Feb 2026 14:29:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770560990;
 b=J3SrtCSs/1Xpn9c4qveN1yw8EwJaYp5UO7S3RfPoYZ75q001qTmjeyIvX4S8kTagBS+Lc
 pPdIvS/uhka7vq5hh8oSjhkr5u1UR/B7w8fxatFiJOWSvfGZpmw/SmLgAexnbmK8mLJLyO+
 3HEn+N1D187eSCFyfkg21YnLau31I2nXvBQjQG8GvAy3rO+M5vIFfkAMppiBLG+AeQfn63a
 o4UelWwmPcFTQAast8LuXNxAzHqEu7nwoU3rTIfIDhvmG4Dx3DGhY5b7Udfk86dSMFVaUm3
 13vPnLvS+j9WTe8gEPsj9E3DytEdVeu3ij1y2SA7t5GsRDwrrhZWNVZ3t/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770560990; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sCpUXs5hqD3raoioXWKHEBjb7sLilVcwMRdGPJfsY2A=;
 b=cc4BD4P6ywFWHsXwkK3b1oDcxbyrYgJo2Q2uDD0OeH/zdqSadb8X6QoMq9xlh+mkkPsur
 4kEY/itMj3fGnrbhf9dll/lhgn38ejhuQ0GV5aVQDKkK5WlsHbaBz0U2dbyZHffols8Syu0
 K0VgL/WrFtaie85k0q0s3fzmnaADZ5bcqLup0Ft2qR8Oh113+UwccE1lx6+q97OHKp4Rq6E
 03F/M5UT75IhSsyVkLA7f9xIIDP/xCiLuFB+6hA31ZpTkJm9P1M93kt5yTWe8AeJfx9vNGE
 QdxRFeGMDZCC75JAB6RZuMg+F3w3RN84wvhQf7sl81Yx6YYTo31Xix1JDlMg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AD833404AB
	for <nouveau@lists.freedesktop.org>; Sun,  8 Feb 2026 14:29:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7D910E0F8;
	Sun,  8 Feb 2026 14:39:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76E3A40C52;
	Sun,  8 Feb 2026 14:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEDCC16AAE;
	Sun,  8 Feb 2026 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770561553;
	bh=sCpUXs5hqD3raoioXWKHEBjb7sLilVcwMRdGPJfsY2A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=J/ld5uUNQfm/u6yC2Dlf8bitG+VKwLy0TaPFdNBlH6gqHYu8cXwK94vxeGKPbkMt9
	 /V2v0ctUgU/Bz+0cMDa2WfFvbVmWzbKUq2O7Q1seFGWXLMaEiPmxsB0WvM4Xi7evaK
	 9DhfHWQiLORlechHZh0C4waw6iPnNmTo5CPXPd28tYojyyNaKxP72ErWYIRnRpivI4
	 Z3GAoE3kZaQzvQmtrsVlZrifjjhzeTaJE7dpLopk1J/2MaVpJlr+idf7cc7hGbnx0Z
	 US4pbBRhKH3ztEoyps9XvdKTRDNn1A+gbQNbRnDXd+57wSYC5DMqyWJj51SvutEYHF
	 y5I9od25bhISA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Feb 2026 15:39:09 +0100
Message-Id: <DG9NOQTTH02S.1X58PX3EZ06MU@kernel.org>
Subject: Re: [PATCH v1 1/1] drm/nouveau/gsp: simplify code with
 acpi_get_local_u64_address()
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260120152049.1763055-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260120152049.1763055-1-andriy.shevchenko@linux.intel.com>
Message-ID-Hash: IQP7R2QPRDTCLRBBSR7CVL56N3EKHG6C
X-Message-ID-Hash: IQP7R2QPRDTCLRBBSR7CVL56N3EKHG6C
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IQP7R2QPRDTCLRBBSR7CVL56N3EKHG6C/>
Archived-At: 
 <https://lore.freedesktop.org/DG9NOQTTH02S.1X58PX3EZ06MU@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Jan 20, 2026 at 4:20 PM CET, Andy Shevchenko wrote:
> Now we have a helper so there's no need to open-code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to drm-misc-next, thanks!
