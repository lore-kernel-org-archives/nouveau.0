Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1420DFF8875
	for <nouveau@archiver.kernel.org>; Wed, 29 Apr 2026 21:57:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C003E10F1A1;
	Wed, 29 Apr 2026 21:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tr//Kw2J";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7FB7E45D4B;
	Wed, 29 Apr 2026 21:45:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777499121;
 b=hG5E8yii8UU1933JuF+UwBF5nKZ+/HfDzr0WKLJ3rbqMSvsktxoAmrLyYsTDKINGuZDjD
 gtUH/QLrSHmfXX/DhqgkC5QOdHbsBrdHLkI1kgeBcpo7Dq96ABCjIXMnJ3jBhuSPsHSbVjc
 2h8AEfs//v+YRm2VhoWLkPrMp+8kXLHoI07PVNpn3XmzQkTrXCq801ZdhwbN6EDUfLAjmDj
 z4OUIvwTDODu0fH9fAk1FxHBh3CvryYqwfzO0wStjg0Y4JEn0OpXM2xGh7o1pDvNAAa239L
 uIzmvdTf7Vqz3YkGe2QE17+lIxpX7wPtxZMf77UdnCFRrgnngHiM4ZKu3tEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777499121; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=v03iEOHN0LyozBtnajJ7bQh/kfefsbnc5U3BJcWJTy8=;
 b=nbGVhFtcB74HkQv6YGhPSBU07ESFXtEjbX/6gfWIS2+HHWB+RecN3Kn31m+5r8WHajuUt
 Xp3m3hYyvmkWl4irXs4gtTv+p/xC5tLs3MpvcDgYWWh2/a9JoezVlbLRd+ZhE3/l+KffNiI
 2GiQF23a4l3OCM50cs4tAkbGmPT9SPwcv71s5TlYSJYNexSVUx0MlBSwQmX4Bz7AYf6kwyz
 6FR+pIS8cPdt5f9+sxq5A2Fw9PkoY2XwE7NeIiJcXk+IVnwEG1dRfqyvC5vp1e6yxDJk5Ik
 lAsyLWHVGf90AyrzjQmbolK1pVi7KUhXdm1jhetvaWRVlYZ7lL+c0vUwSNyQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BFBBC45D38
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 21:45:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CEF0210E119
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 21:57:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82C4840BD7;
	Wed, 29 Apr 2026 21:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172EBC19425;
	Wed, 29 Apr 2026 21:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777499862;
	bh=N01a/k5MXOieQhcloMxSXNGdvUKXSc+hvLYYZNJ9LaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tr//Kw2J17Ed2WiVTy4Lf1pJUFQKcMjmSyvEOJ9oPrMSWKJuXhwPH1pM2+eBjnOp5
	 ww4KqyL0ctIlSAflVoffSPl9oGklLxGnuPx6xvuBqe/guema3kOzm+Ja15Y1YpjmTZ
	 DU37rn8tOckISfEd/vihUQAFIDIbigN874g9XcQngqbgoY0FGs+VN/TCJOQn19FVMX
	 K53/F5hyv44yb8D+caHzz04NXRV/PX1q5ttLRqrFRfi21A3QrPeIa7RCsfQdiuXOTB
	 ItqHDEAL8Ipm09W5pFLWF4Yp5zKdIFtUg2mfq6l71lYdTvWm4rG5fx3lsKkqpPKSed
	 qOHCsDaKasovg==
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH v2] drm/nouveau: expose VBIOS via debugfs on GSP-RM
 systems
Date: Wed, 29 Apr 2026 23:57:34 +0200
Message-ID: <20260429215734.5282-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428202825.1123719-1-ttabi@nvidia.com>
References: <20260428202825.1123719-1-ttabi@nvidia.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2UZGDZMFMXQT7KQURV4CNW2FI56EWSGH
X-Message-ID-Hash: 2UZGDZMFMXQT7KQURV4CNW2FI56EWSGH
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2UZGDZMFMXQT7KQURV4CNW2FI56EWSGH/>
Archived-At: 
 <https://lore.freedesktop.org/20260429215734.5282-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 28 Apr 2026 15:28:25 -0500, Timur Tabi wrote:
> [PATCH v2] drm/nouveau: expose VBIOS via debugfs on GSP-RM systems

Applied, thanks!

  Branch: drm-misc-next
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/1] drm/nouveau: expose VBIOS via debugfs on GSP-RM systems
      commit: a5640267d6d3

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
