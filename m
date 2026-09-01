Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A072C61DD3
	for <nouveau@archiver.kernel.org>; Tue,  1 Sep 2026 09:09:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA6110EC3B;
	Tue,  1 Sep 2026 09:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YnrUBwmc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C93CA47D3E;
	Tue,  1 Sep 2026 08:52:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1788252736;
 b=lIme/E+f7WHaCbmFI6l/+Y03pBds4+eqw6MndZTCHiwO8pnBPHvIykS5bSCG+lnkzSrcn
 PU18UK3MLCulks3vVTsJUmR6wIDGV0KR4vML2jlFiUkYdnjbG7Q0nsb0twTtoazwHXOTbKv
 7dkz4mGCS6CvrldXP/rViJfI3gSK+qeUVf7/WMX570HzzgkjZJJfYqBO6L9KP+zNLvQlhfx
 PYJoB9X6iJFaKXqfTP5p5moBTH8YzGcKbxIFIh5dBZmMoVi7ZldA1llBUacgJiXyRZ17unt
 Cz54xaHAmy0jIedIJl2+j4at09hkwYyUt3nB8J6uMJb25ApD01oBySkewMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1788252736; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LmKfrcBCf+s8osjs3jVsCHiYNiCClUW4L4OdCzj7khA=;
 b=FXTNdzuzQhzNAYhFck12Us3pqqLeblHrDhUoSdEIvTaWSE3EzPDy+Jv2RhvbZn4aOwPH3
 rk8Z2GfjqwyWVfbKP913BMKiTaWDjRNhZxyT3jZgsBggWXjmbuNFRlK0V3KHu9Gp/jRYt4g
 jVKJbGdwaFE/XzOyCxW7Ri/1n1F5PkjnCnTottVMxdhifR26PFpwP3hIDJnwdrRMG7ZZYbF
 UHKBmVRw+HF6X6ghghhUHL0Te8Z9dFv9MvUUKbUss5OEiri3VSmdsOJ9DJf4LN1FvPe3tZ6
 sckUysRvpGQXP3Y5dVFNg0kPjnP+BQmN0N9v/TzP32OTCH+ILqssDfEr8vkQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DF00247D25
	for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2026 08:52:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8B510EC2F;
	Tue,  1 Sep 2026 09:09:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D2263414D7;
	Tue,  1 Sep 2026 09:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A711F000E9;
	Tue,  1 Sep 2026 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788253755;
	bh=LmKfrcBCf+s8osjs3jVsCHiYNiCClUW4L4OdCzj7khA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YnrUBwmcU16iObto6eZ28OSGICXXqpQwOYQmO0TYOq5CQfa7E/B+PpKfZZWF99luc
	 cBm9ouOQR0xvoptqhFsD/RwfI7UWymejWPA3WUz04Ai4UMrwyQ16XLyoQqzZZ/x4qo
	 whkGPwTjv59R9Pf5XsoVBrhMPkOO2+I+fC10PtfWMChmXmk0KDzyEx7XoHSpDXfmtH
	 2dOMqYqsta3kPueISufHoKrqkvIHJ0+GsUvRynvoFTm4vmQCk9M9xnlq98RzlJ9l9T
	 miQDmvMa3HNvUSjukOrA/HLPOIv8x1QT9cj35eZhStyZM5PXgVf55/ORdZg/iEHjBE
	 0PSlySt2kQ15Q==
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] nouveau/instmem: handle iomapping already existing
Date: Tue,  1 Sep 2026 11:09:04 +0200
Message-ID: <20260901090904.9188-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825030615.3464436-1-airlied@gmail.com>
References: <20260825030615.3464436-1-airlied@gmail.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ID4NFRH244JSNYSLSCPDX6QW6QJRW3MV
X-Message-ID-Hash: ID4NFRH244JSNYSLSCPDX6QW6QJRW3MV
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ID4NFRH244JSNYSLSCPDX6QW6QJRW3MV/>
Archived-At: 
 <https://lore.freedesktop.org/20260901090904.9188-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 25 Aug 2026 13:06:15 +1000, Dave Airlie wrote:
> [PATCH] nouveau/instmem: handle iomapping already existing

Applied, thanks!

  Branch: drm-misc-fixes
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/1] nouveau/instmem: handle iomapping already existing
      commit: deced5fa01c5

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
