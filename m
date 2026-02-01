Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C40E65298
	for <nouveau@archiver.kernel.org>; Sun,  1 Feb 2026 21:47:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1D39A10E1F6;
	Sun,  1 Feb 2026 21:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rSSQ1vvB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 368DF41AEB;
	Sun,  1 Feb 2026 21:38:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769981902;
 b=psPALkzHIOBljp7m1jnKIaaALL46ZTCy5oJJ75RDAEh9r2vQcnjNNestuWMyLkOorPtsb
 BxeyM5jdWV9LWeK0jRJroCMTOlXSyxJhvJnd88OjNkBdajvKsdQj1fOVxSPhJJoU8M8cYxO
 aeML7lTmBVoeuVq8R4B7zll5x8zaCOb0HrV2umoMC8YoBrsblnOGsa4SPIYDBVIbJJGUfTU
 A29V6Vna1URITVH7D0iJAt3T94CRACMEp9f0edQE8NjR3LSYBHPfneiDzZaxWvb68Ea4S2Z
 0hqAZMyRQgTzTrJ+6Chxpig3vBBNgV+hB4m5Ia21UMf1XJd7c7yVyvUiq9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769981902; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UUJi09olw3z2alBOMu1Tzu+FggHp8iosUalWgPJFN/I=;
 b=SmGq3f89HtnqiJgqNlZsNjxvPcmktMw6Lnyup0ME5P/iCTJWsCJpqnIMxRrcV2nVZJQUI
 Z8BdR+FNt1pfWPmxUr4T91lGyM9FES+L7VZQtIkfbQ1t9JhvZNrtSDnKLqfZU9bL+JaH53R
 j86AmV+1xP1JeTn79ypxKCQhvuDBSSp9IocMxwRVpVzTc1RnxLkknVMDQ4R4kc2yH8lXKDw
 X5bkQdJZyj6cbcI3tfGCgNB41AKTi0wqBJIOCRtfLsElRGI48cmbDYTl136qS0J0TtgH+3G
 rE1fK+R8NzKnEo535Zu6DfmzIxuAJ3AR108L3wLJnlhKIiDL2y7cAHraep1Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 61CE440805
	for <nouveau@lists.freedesktop.org>; Sun,  1 Feb 2026 21:38:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EEA6710E09A;
	Sun,  1 Feb 2026 21:47:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5CF54381A;
	Sun,  1 Feb 2026 21:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A38C4CEF7;
	Sun,  1 Feb 2026 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769982450;
	bh=UUJi09olw3z2alBOMu1Tzu+FggHp8iosUalWgPJFN/I=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=rSSQ1vvB9dkWUjAJ3FRKZ5I1CInEoEmQpvhHB1yQgkKMY9A5uorAcxj6fB8ytGKh1
	 qT26KzMBy8zYnI/CiJ6PC59GGuEW5p6liU917BsqSxtoLL5skP+JtJdcrKsFP9QHci
	 T77vLP6BbWMgok5mdjdPQnq+kSNe9L4QTWx2iTKZ9EIeeBrSLIMiln/fgc9n5V1Bom
	 5i8ZMSkjT/oFApnIsu3lCAHj7EdH20Dj59bmDHXWf71w2DL287MlB1fZXnyZSG+fHI
	 Xl/LD9RcxMrCopXJPSwEC7MQqdkh3D6iLRVmypNmQLdzUbcxx+iHppF7gElD5CjvwI
	 Bbti8kDaSuokA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Feb 2026 22:47:26 +0100
Message-Id: <DG3YEUPVF4KS.2VA7NB95JEQ2U@kernel.org>
Subject: Re: [PATCH drm] Revert "drm/nouveau/disp: Set
 drm_mode_config_funcs.atomic_(check|commit)"
To: "John Ogness" <john.ogness@linutronix.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130113230.2311221-1-john.ogness@linutronix.de>
In-Reply-To: <20260130113230.2311221-1-john.ogness@linutronix.de>
Message-ID-Hash: A6TB3ULN24YC4BOK63AQJC6JOYOER27K
X-Message-ID-Hash: A6TB3ULN24YC4BOK63AQJC6JOYOER27K
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A6TB3ULN24YC4BOK63AQJC6JOYOER27K/>
Archived-At: 
 <https://lore.freedesktop.org/DG3YEUPVF4KS.2VA7NB95JEQ2U@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 30, 2026 at 12:32 PM CET, John Ogness wrote:
> This reverts commit 604826acb3f53c6648a7ee99a3914ead680ab7fb.
>
> Apparently there is more to supporting atomic modesetting than
> providing atomic_(check|commit) callbacks. Before this revert:
>
> WARNING: [] drivers/gpu/drm/drm_plane.c:389 at .__drm_universal_plane_ini=
t+0x13c/0x794 [drm], CPU#1: modprobe/1790
> BUG: Kernel NULL pointer dereference on read at 0x00000000
> .drm_atomic_get_plane_state+0xd4/0x210 [drm] (unreliable)
> .drm_client_modeset_commit_atomic+0xf8/0x338 [drm]
> .drm_client_modeset_commit_locked+0x80/0x260 [drm]
> .drm_client_modeset_commit+0x40/0x7c [drm]
> .__drm_fb_helper_restore_fbdev_mode_unlocked.part.0+0xfc/0x108 [drm_kms_h=
elper]
> .drm_fb_helper_set_par+0x8c/0xb8 [drm_kms_helper]
> .fbcon_init+0x31c/0x618
> [...]
> .__drm_fb_helper_initial_config_and_unlock+0x474/0x7f4 [drm_kms_helper]
> .drm_fbdev_client_hotplug+0xb0/0x120 [drm_client_lib]
> .drm_client_register+0x88/0xe4 [drm]
> .drm_fbdev_client_setup+0x12c/0x19b4 [drm_client_lib]
> .drm_client_setup+0x15c/0x18c [drm_client_lib]
> .nouveau_drm_probe+0x19c/0x268 [nouveau]
>
> Fixes: 604826acb3f5 ("drm/nouveau/disp: Set drm_mode_config_funcs.atomic_=
(check|commit)")
> Reported-by: John Ogness <john.ogness@linutronix.de>
> Closes: https://lore.kernel.org/lkml/87ldhf1prw.fsf@jogness.linutronix.de
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Applied to drm-misc-fixes, thanks!
