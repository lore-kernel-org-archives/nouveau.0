Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186E7CD6E45
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 21:07:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C99310F5FA;
	Thu, 28 May 2026 21:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FZSu0fT0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 73BC546688;
	Thu, 28 May 2026 20:54:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780001643;
 b=Wn+Gs3MJXcTCOcUE87Qv4Iv0GlOowERrsJHECxs8Whhj6HYsO/P0ejxUazqaFWNYWcsmi
 ALqO10hGPtEb8QKXHsHzmIND+7dBF6Ry8+bPH/IsQbe3g8kxQUeZrziHnry57LYsK0Lz56q
 XDthttP1PcvYOrQI36Y7yZ/T9F0HhaRWZvsHrflm3beY5GJixDlQINYGMi1ldY1Z5ai8V7Q
 g4blXHZRdpsSBS9g/N00OWC1VqwARe4Ijk/STlT5eE1zDdmhsiX6jPh6cW2AoC46E5EmKbX
 9NhqG7/63S0ZP2Dz9HN4iVylU/s2iZbt+AFXESWnKNdT096IDBdzt1tQ7evA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780001643; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fowJXGyder4bQsc7MfVmAwFTMAFL1nJkdD2VVv22884=;
 b=W+dQtVlciiB2BP3Qw4HaWI1NiyYMwMArfwPE0PiGBOxa6BaNTDUdZK0JsZJxAwHUwjyYw
 ZU0Jd2FL8ztNLLt4qd6SkBqovyQJA9sYbl9c/DzXHGFfhPOa4RvLFxh4F98Of5w3FAEPuRH
 Fx68Fl898uMPpjCijvX+1JgYIPSknq6xBhO41U7E4FAc1ja1sPlftXtWVdDmKu6f5dgExqH
 r2U2twCpWVJTwFLYTMTnO/gFb7n1do2mJajKSu3a6OhpoSl3UEdVXxnPZD0MEB1JdkC82Cp
 QwV/7NLBfAYc+vMLEwurOkMl/D60glmGXgT7csg6w4RlAGEkUi026/biCuvQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 26BE745DAC
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 20:54:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8119410E7B0;
	Thu, 28 May 2026 21:07:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C9FC40837;
	Thu, 28 May 2026 21:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F5A1F000E9;
	Thu, 28 May 2026 21:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780002450;
	bh=fowJXGyder4bQsc7MfVmAwFTMAFL1nJkdD2VVv22884=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FZSu0fT0FGaAH4AxLkt3DS93Ph42wwlCCSS/HHZyqQN80np3ElAgAtffQg/CawLcs
	 ukFTIJ2TjDGKRPUPrskQbq+qMejlyWhIYS5GGSlUR9wZ1KAGICMchAWgy8FHfNhTNL
	 XmcjmniR90FZvsTd3k2gVHNZKocRdFUjGov4TfUkAEQ1v2jfvKLvrElXFSUgCWvXA3
	 3sDtu8Rv1FtPa8UsmhdgaFVkY8DTsvqN0NrdpfpMmfAIzP8g8i6ZBu7fvlTZHH7HOa
	 dM/qShlMIKyGc28aE+nIwTTDZ8Xbs3qgSDwyj/2g3NG7URZGbXdTukv/siE4/HLsmR
	 yrL0yPgIJkGSQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 0/5] Revert cleanups for IS_ERR_OR_NULL() usage
Date: Thu, 28 May 2026 23:07:17 +0200
Message-ID: <20260528210717.7078-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260528192847.4077458-1-lyude@redhat.com>
References: <20260528192847.4077458-1-lyude@redhat.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D46BSIUKUO5KY4RVJHDEEZRFNGCJLE6X
X-Message-ID-Hash: D46BSIUKUO5KY4RVJHDEEZRFNGCJLE6X
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D46BSIUKUO5KY4RVJHDEEZRFNGCJLE6X/>
Archived-At: 
 <https://lore.freedesktop.org/20260528210717.7078-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 28 May 2026 15:27:14 -0400, Lyude Paul wrote:
> [PATCH 0/5] Revert cleanups for IS_ERR_OR_NULL() usage

Applied, thanks!

  Branch: drm-misc-next-fixes
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/5] Revert "nouveau/gsp/rm: cleanup remaining IS_ERR_OR_NULL usage"
      commit: ebddb00faa82
[2/5] Revert "nouveau/gsp/rm: cleanup IS_ERR_OR_NULL in core implementation"
      commit: 1a8117455d0d
[3/5] Revert "nouveau/gsp/rm: cleanup WARN_ON(IS_ERR_OR_NULL)"
      commit: dd516da348f1
[4/5] Revert "nouveau/gsp: cleanup IS_ERR_OR_NULL in rpc_rd"
      commit: 80fa10569b90
[5/5] Revert "nouveau/gsp: cleanup IS_ERR_OR_NULL in rm_alloc functions"
      commit: 18178f2ac176

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
