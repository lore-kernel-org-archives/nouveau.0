Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E161CD13DE
	for <nouveau@archiver.kernel.org>; Thu, 30 Apr 2026 23:10:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D412310E4AF;
	Thu, 30 Apr 2026 23:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t3wBLkRe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4116945D62;
	Thu, 30 Apr 2026 22:58:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777589892;
 b=uPb3INeny3JnxGAz/5x8RNOLoZH78zrvERbD87n7kn/lCO6IlGD4SHtHt/f3he1dEek+Q
 Tm90IGymJcbcHmEurjTCoOTNtty6gqpxeCivVC8ch5wrf92KboeMUZZPSw5F52e47nHb5dS
 BOLzfX/05GCZlDo2pUWoGojLhaCEkTLCSDFSXnKE3xLdVT6IOaCvkliEz3TL3HODpq/i5/F
 EAFbNUDdRcxONiCO1YZKlTrW322I2bITD94robmfblM+kKtQmltQrcpCiA1PoMrPD5FF9+n
 Rc7t8KVtJg3HlUztrcACYzkq4DpWyRu5q6mY2ra8+aQ+hGJcrMqHieUVeZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777589892; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Wv0N+7rAWjv8LtDjv7sxpB24U++wHsCY0pxJU898EeY=;
 b=i49MYCBVPwGsRQzJrel6YRBXhLmAujTMjQpONnS9jftyOpE5XVLSWK8Mz96Mc+hF4XjWs
 8d/JnVz4/n+2sKM/1GOcqGrj6zJqtvgZ3UiziPt9rgXA/0onHK2VrmiBPafKTzKkJmzy+CL
 JK8VenWxb68UcsfKjbgCv9u5DFN6rctJMQ/doy+g5t3xuq4hpmBwt189ISlFEbF6JtpQOXt
 /2h4IvGgmMawO32Epr5kFAvsaqsN/hv78Vp0ghz07InjYx7SCBWcUkLt01YEOr5JvapHCr8
 GCd3J52Mf99I0zNnknc6pEYa0KGt6scGia4Hz+mXBwtZjL6Rl+cG7rtTnQAQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 967E045D4B
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 22:58:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CDED810E49E
	for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2026 23:10:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F56A60142;
	Thu, 30 Apr 2026 23:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A82C2BCB3;
	Thu, 30 Apr 2026 23:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777590635;
	bh=mYscaMYt2sfwMhX1sAPrAa8OTooAwM1yZYLW4d5Xw0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t3wBLkRelbuMzGARZvj/b73bb0QbZTEgWg2ms9kqIq2m9yru4/Y7ZmScEXee6HZP1
	 eE+O+bVPH85bWhCUkvhk2rCSqABTwQ2pfFZL7PQ3YUcsNtMtrFl0+VESTVbfBj/1bC
	 G0/mxeZ5iFAhChSXTxyLF58otNI8dldF+l9usDdtlP4APWaQaX12WksR0OimI5ApiE
	 eeLUiw3q6hh+QyHKFyKZSJwdU9o1P/ZyvwLOeEGmGl5x+AxxUzqNgWBA01E+Yuv61g
	 xxH9WnKfjoSmpnUaE1E+GSIZGY1OY7Cytnk98t6BUz+dvJ/jTQ/8qTeU0Jjc5M0miV
	 JyUweLqKSfx5g==
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Subject: Re: (subset) [PATCH v2 00/10] drm/nouveau: fix GA100 issues
Date: Fri,  1 May 2026 01:10:25 +0200
Message-ID: <20260430231025.5063-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430223838.2530778-1-ttabi@nvidia.com>
References: <20260430223838.2530778-1-ttabi@nvidia.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5UNET74AGD3IYHUO3J3DMQTPGSEWKS24
X-Message-ID-Hash: 5UNET74AGD3IYHUO3J3DMQTPGSEWKS24
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5UNET74AGD3IYHUO3J3DMQTPGSEWKS24/>
Archived-At: 
 <https://lore.freedesktop.org/20260430231025.5063-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 30 Apr 2026 17:38:28 -0500, Timur Tabi wrote:
> [PATCH v2 00/10] drm/nouveau: fix GA100 issues

Applied, thanks!

  Branch: drm-misc-fixes
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/10] Revert "drm/nouveau/gsp: add support for GA100"
      commit: c9e3878ae2f5

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
