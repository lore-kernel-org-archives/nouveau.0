Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83935C61DD6
	for <nouveau@archiver.kernel.org>; Wed,  2 Sep 2026 05:00:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 122A510E466;
	Wed,  2 Sep 2026 05:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Un8UzOe7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A94B847DE3;
	Wed,  2 Sep 2026 04:43:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1788324232;
 b=PUuX+kaWFebcQNYZt3+r5ndTsy6eQ7hBSFBUveFsKqzoECsEgb7aZoXjAYt0dTdKgNeAt
 dXdQBHln9LZk3mLoRwDpdQlE1nAbO4t0+zv/+PlqE8tAVRHTcV8sxkl3UGwvFG5RPvxtjSa
 zSlw6/i+16z/A9adLyty3rTxXkvlUiGoiHik3I6a01UNUiH6TDESVOdTcNwNoDLUjAWY2un
 4UF/BuMKkNNZYMl6uMfcVqSdUoz03XJHsblgpBYh/mO5GwIu24BANZYaQPHsOdfSPKSHBEt
 +WFR58kc0XW9ONJwc0kquRddBwEbHMmqiBHZw99Brjz/yZ2hRS5NfW9DOjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1788324232; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jPLfUhAriQbeMNme/A39zpXETQORrdj67BYHQz8lV2w=;
 b=TagFlSOgiTVhPiGr3yDJVjurs2ozfCb58aRyURLiFzM1HhxJG61wkoENvtZNQkwqliaUv
 ZWUOwpnUy1NNmHJg4wD88QyRGQMBYWPdkmoDQQlaqtKlWH/6cSqv6QChRM0JkKHwDroQVoK
 2oJj5rwgAShvZRnw2uZLbOyr/RcOX34z/1PKA4dTqiI7xscu2c9eVJRnSsTQ4c7D9lq3ILP
 /PWbQ7g3Pub4l9ejCBuaX4C5Mc1e9oswfKFkRxXZmjTuDXSRKyyE2ZNipFBk1s3kDjepLEx
 Yn8ZImZyW9km1LpdwqVGbXx9hLP5vCuJfQXvF+2T+HTvkzA0IWW1Yp3bLaWw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 254024002A
	for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2026 04:43:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 12D9010ECEC;
	Tue,  1 Sep 2026 14:04:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C399F416C7;
	Tue,  1 Sep 2026 14:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD371F000E9;
	Tue,  1 Sep 2026 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788271492;
	bh=jPLfUhAriQbeMNme/A39zpXETQORrdj67BYHQz8lV2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Un8UzOe7yvDiZlaJZYrUAKFkDH0TegzfLYcYwy+uq6CIxgPM01vHXE/PBTJaAXpT+
	 8RD+s30Zgh3pa1hXsVaQ1qrZywD1ADplz+F5qoyL3AmIgUCjpgRaQoJ6H5Zo9/U8oA
	 UatVwWKsocdWy/GE2xJ/pSlMMVpbC12NG/Y6dyfRtKvKASHCcP0nlcgNkdWWjUlDLK
	 vWoFZc732Pz2vmoSXttFuMD93jSLT7QToAF3Kpd8tL4lKGThza1Z7hF/7/8am6ufN6
	 BpjGPsn37pyqDkFAgL+6EqgW2FBfuytFEx70wR/cF3SPuiXzYolByTX7WNHJpXcLCw
	 8fhzaK4ghHrNA==
From: Danilo Krummrich <dakr@kernel.org>
To: Zhenhao Wan <whi4ed0g@gmail.com>
Subject: Re: [PATCH 0/2] drm/nouveau/dmem: fix DMA unmap size and callocated
 accounting for THP
Date: Tue,  1 Sep 2026 16:04:42 +0200
Message-ID: <20260901140442.4036-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811-b4-nouveau-dmem-thp-fixes-v1-0-2cdf9860af2a@gmail.com>
References: <20260811-b4-nouveau-dmem-thp-fixes-v1-0-2cdf9860af2a@gmail.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NDEJTIUEYWZBU6ZJHBGZGJYBLMJU37AS
X-Message-ID-Hash: NDEJTIUEYWZBU6ZJHBGZGJYBLMJU37AS
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NDEJTIUEYWZBU6ZJHBGZGJYBLMJU37AS/>
Archived-At: 
 <https://lore.freedesktop.org/20260901140442.4036-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 11 Aug 2026 22:28:49 +0800, Zhenhao Wan wrote:
> [PATCH 0/2] drm/nouveau/dmem: fix DMA unmap size and callocated accounting for THP

Applied, thanks!

  Branch: drm-misc-fixes
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/2] drm/nouveau/dmem: fix mismatched DMA unmap size for large folios
      commit: caa1bc2a0a6c
[2/2] drm/nouveau/dmem: fix callocated underflow on large folio split
      commit: c2256c044a1d

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for Linus's tree and should land in the next -rc
release.
