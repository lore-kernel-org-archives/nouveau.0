Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166B3CD98F2
	for <nouveau@archiver.kernel.org>; Sun, 21 Jun 2026 13:35:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA8510E3AD;
	Sun, 21 Jun 2026 13:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bu2rVS70";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8347146BDC;
	Sun, 21 Jun 2026 13:21:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782048088;
 b=X330xre/YN1RLmjCgJ7F6wIQvu+8Yt2CnNo3sZHorPNzdr78e9omwx5zdGlqw9niqQO1r
 Mkmimkg30jy0QXS5S+6yRl2U0nr/lJzpzIku0SO6u9etQwmndhDqdFuZ3u3t1xLcHTgDoUn
 SMhAM7HUsKJPe4ffNDDSnI9ZWgGDxg05vE86l3ugSkNoK1ujRAVjMoFAa+Ng423ZWDI5aGw
 WIXrgdHo6w8k1QEK10Om5ZuIsxkK4A/7IgBuFTR4jlPtIV4uvGCOv7Zgf0itxRzGHgBkOSJ
 iCRtKB5q1qC3wVrUkemRYaTQkxaHX94Z1kCgSdcjCYPdBfSGxxDcMNQCJB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782048088; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=a4xYOjXUmeXKiNZBk3/FakjN1MIv8fVkL9//J3Rm4VQ=;
 b=VNY5hXW7B/5kTO4VFUN/jA+tAp8U4SIBfGJAqWk0YzkmrizJKAjx+XMvkXSeHVGbrFZwx
 qabRMOk4U/RIytcvHPzclC3P/3i0uPWGcNLL3liVuulajdO7GWTq7R6Wb+3Ta1X8nOTvtQ9
 ZYmvl90VPdGlZY3fD5Hn16+xMBPwvPeQogcE6gu0+W1/w8xfWQfLJuubvhSFuXKazdr0y67
 OLLotaF0WZVcp+e5raW/nobk7swGJQEBsBZYRtDej8SslsiCXBbfKU+70xk6Z4kCdCKAlvk
 Qv8ZHqEAEz9zI/DzoDM1YQbmuyDPBtBQgC2D7yAiA3XX+qOH5aYoMspRTEHQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EDBD746BD1
	for <nouveau@lists.freedesktop.org>; Sun, 21 Jun 2026 13:21:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C549310E39B;
	Sun, 21 Jun 2026 13:35:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09F1F60051;
	Sun, 21 Jun 2026 13:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BA21F000E9;
	Sun, 21 Jun 2026 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782048945;
	bh=a4xYOjXUmeXKiNZBk3/FakjN1MIv8fVkL9//J3Rm4VQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bu2rVS70AE7q0539unYUHl8ifOUfopApEuWITF2YFKX/a5/N4RVtP8oWqL7eYPmYw
	 TqdGOGPfZBNulrQ1ib7GFqcsrsGUWsbG75npEstvkHMakn511zcy6TD011HDsw3vJb
	 dDs+wdBeBv9OEjTeb467IMmtMraySDY/xJde7APVgFS/u9D9wL//WJ3vD5Pke1nI6o
	 B6ppi5lZQZpDdKiJE2gnU/114gmX+wIgh4nzbjFKtvX3FeSAkSOvFo5V7kDPeOsStv
	 rivSYD3yw0MfpUq0aMV3Ma7guyFGC5owFXfgsSQv1o0Wp/QhDXiEGTq0uzTB4Ufpil
	 +8R8q8AQVt8Gg==
From: Danilo Krummrich <dakr@kernel.org>
To: Junrui Luo <moonafterrain@outlook.com>
Subject: Re: [PATCH] drm/nouveau: fix reversed error cleanup order in ucopy
 functions
Date: Sun, 21 Jun 2026 15:35:35 +0200
Message-ID: <20260621133535.5892-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: 
 <SYBPR01MB7881484D91A6F80271415F71AF1A2@SYBPR01MB7881.ausprd01.prod.outlook.com>
References: 
 <SYBPR01MB7881484D91A6F80271415F71AF1A2@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YVJTWKVIMPV4ULZQU4UMDI32JDML7U2P
X-Message-ID-Hash: YVJTWKVIMPV4ULZQU4UMDI32JDML7U2P
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YVJTWKVIMPV4ULZQU4UMDI32JDML7U2P/>
Archived-At: 
 <https://lore.freedesktop.org/20260621133535.5892-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 10 Jun 2026 18:01:28 +0800, Junrui Luo wrote:
> [PATCH] drm/nouveau: fix reversed error cleanup order in ucopy functions

Applied, thanks!

  Branch: drm-misc-fixes
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/1] drm/nouveau: fix reversed error cleanup order in ucopy functions
      commit: ab99ead646b1

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
