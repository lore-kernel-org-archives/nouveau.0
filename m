Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E714C61DD3
	for <nouveau@archiver.kernel.org>; Tue,  1 Sep 2026 08:59:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C03110EC18;
	Tue,  1 Sep 2026 08:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ji8DgA39";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F115F47D33;
	Tue,  1 Sep 2026 08:42:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1788252176;
 b=OpDcjxB1jdWTQ7gzA9hhWbuniYT904bs4HbOqMtwF9Qbsd5xdUeQkP2lCH/gq6E99X6Qk
 ppDCIjY4V9a6b/v9sYgEbzc+JNdp9NpiHlkPBFcaxT95poTHjKd/OaHQqRdbY/xtvs3CWrY
 90W20FM4LLq9I8aSvknVphgOn3ouBVnke1JzJn4bgeRjVEY+2AdpXSJuSlLDIKIwjET5yTy
 EzQERfZotE/Z0VPWH5UdXcl27cU7tUmsKLNHXnUUumItrbZVQKjxA5+h01B/7FFlF+1BfiB
 aWWSzYpKAqnMyuUcOdwjKXuTpzW6Fdx8Khhmo3kqeADAchX/9pddqhWXA0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1788252176; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=I4tVjKFRMCMBEBYtZ/jvpvYXOEsbsYRbHOBLaaKAGe4=;
 b=q0EDjDVIkQU9NZFtwEWNCwN0QhaXnNP93Xxi0hD52i6GxkeYGjm03hMP9CldlvPwIApJp
 KTp2g/ugSa6h4w9ql7nbhwmERj1K68L3Cp+2coGTd/qBIH7lpF+ZOaD6gqUsNcGTVmMymin
 YL76zr94rk1xDCftTYbsGbP4Wai2rm+WpCz7XnimWDiGTmzy1+UGkA61FECFpxPPMJAhVbX
 0+n6ytnPqYNd6NIm4MvwVqparOn4cdryAiCtFCI5Jr3snXAsjtTF1Nf94t0u+WsUiuv7vky
 cg9WGM+7dXAL5zZcNMOBwJxY7MpKEi3Sdzc6YX543mfWkd646C98qTcCx0qw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7C39147D25
	for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2026 08:42:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B1D7410EA29;
	Tue,  1 Sep 2026 08:59:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6862E407FE;
	Tue,  1 Sep 2026 08:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D681F000E9;
	Tue,  1 Sep 2026 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788253194;
	bh=I4tVjKFRMCMBEBYtZ/jvpvYXOEsbsYRbHOBLaaKAGe4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ji8DgA394Ucs/DIGdUZvv+n72muWpoqGsh5/E3KwLC2BwopSMEKjDkoZ6/keUiJbk
	 ejJGVXlbeSrcUilODOlkpuMRCqeuNR8JM0Xkiy3IDpVCsH4kmRrh9v4IY+9NRMwL/Q
	 hlFxEfKaMBeFZwq6oh9qdzOAMiaECP3vNfBxWi61NXMz1UYI6em/b7dxl//4oZAfgf
	 O1y/UFAt6WrPOb2xg8V/CjHcsz5PtPcjFqBSh2bdmTPuMj6lmGg9ZyarQoJBnZQ0cg
	 h9VOhtMw4kyjex0MhMtmu2bYQYXZTWK93ZstVzxI1L0spDrSHjUO3GbfAl4XQY4GHp
	 FP32OZZU9rsnw==
From: Danilo Krummrich <dakr@kernel.org>
To: Zhenhao Wan <whi4ed0g@gmail.com>
Subject: Re: [PATCH v2 0/3] drm/nouveau/uvmm: fix VM_BIND submit/unwind
 error-path bugs
Date: Tue,  1 Sep 2026 10:59:43 +0200
Message-ID: <20260901085943.4360-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811-nouveau-uvmm-vmbind-fixes-v2-0-aaee4b395d04@gmail.com>
References: <20260811-nouveau-uvmm-vmbind-fixes-v2-0-aaee4b395d04@gmail.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NKTHZEOHMUDFFVD3U5VYMVU5BCHL65PT
X-Message-ID-Hash: NKTHZEOHMUDFFVD3U5VYMVU5BCHL65PT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NKTHZEOHMUDFFVD3U5VYMVU5BCHL65PT/>
Archived-At: 
 <https://lore.freedesktop.org/20260901085943.4360-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 11 Aug 2026 16:46:27 +0800, Zhenhao Wan wrote:
> [PATCH v2 0/3] drm/nouveau/uvmm: fix VM_BIND submit/unwind error-path bugs

Applied, thanks!

  Branch: drm-misc-fixes
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/3] drm/nouveau/uvmm: fix NULL deref unwinding an OP_MAP_SPARSE op
      commit: 412a6ceb56d5
[2/3] drm/nouveau/uvmm: fix premature region free on failed OP_UNMAP_SPARSE
      commit: ccf930812f23
[3/3] drm/nouveau/uvmm: clear the dirty flag when unwinding an OP_UNMAP_SPARSE
      commit: 38a62306c426

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for Linus's tree and should land in the next -rc
release.
