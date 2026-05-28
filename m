Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAD9CD4F54
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 22:29:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 199D110F6A1;
	Thu, 28 May 2026 22:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FW2IwTF5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6CAE846692;
	Thu, 28 May 2026 22:15:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780006535;
 b=DxA+TghPBe+x0OiuDx2tpYfHl6sJDXhoygEZj3JOexR0LsNDG5OofJMwt0n/eSsW1D5fd
 J2bdIWqN5gkgeCE3uGOYoaXUMwGy2fHEhfY8ADcXYPfPHf/qU7I0xAMyEx9b/awPEXCyWfw
 kh5NY03TlXfLkbu7wwyLtN/ZekiTjuvwEk42ejy65S81Ox9ltg8PaIyQ9tTlH0fV51uPJFs
 MECpf9wGidnPTLGQoYj4yG3+W3g7qnPz6PUxxSCfBZq2pKnmufZHioPgupZvaK7P3w9m1Kc
 mcBUmq21r07R3lpXHEj1auaWbEqKpsiVV01/KNo+QJqUn+Bo3rS2sGtTcX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780006535; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AcmcKtW66rkEfNJaPB3hjWA/qrjMeNxbkC1G44RKtHU=;
 b=X0f3B6ZwPqw3SEGEU2ykPeeKobcd6RwXfL/Ns/UGZ2Yn0Y+TTAFewpeBRjmqwpuuNFUqg
 foN9b6KTem46newMp7lHCM8c6nsDAwLyz3peH3kaDmNLcOiUWIER8FxoyAqH2/TP4p3c0pO
 NLq+IxVX39pB/qMXQppF0gFSXNjmbvHBprH9zJZImxu/hYo6D0xb7qBiyOIksaoHDHsQLXc
 ghxev1BbQMnBa7YYv0S6ou4/hF21ohYi0vVDbHz9SQxVfke53bLusLCei4z9rc3qTG7MHaN
 /NkGI7Oapb0dGIuq3dq7HHi71HveKYh/x+3Jy+hmrsUz4O4UD086pijUwPQQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 190BC46627
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 22:15:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7EB10F6AC;
	Thu, 28 May 2026 22:29:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DAB4460565;
	Thu, 28 May 2026 22:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118821F000E9;
	Thu, 28 May 2026 22:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007340;
	bh=AcmcKtW66rkEfNJaPB3hjWA/qrjMeNxbkC1G44RKtHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FW2IwTF5y9ZTJHIUsJ2SS3nGEQy5vUaaBxX8bfIoe4NiHEvLjMAxJFtWijE0kOL0o
	 DlwBmtz+uBzA+RYuar+B2CvYv8buHUqFwQj+JZIOQy6zbxLfoqW2IdVyNMJ3hkb6zz
	 0GHVni9rBrJj14wdOuxBYq95Zhqp/5ceCowk8iHappxHh7uO/rAjH88BmivtumwsrW
	 GcnH9kRUukwlWWGw+pxf7uXqS5BrU4h7+BTIznifQeucJw50GDkycao+ZC3AueXhn8
	 p8RDOQ81JPE2Xty24VUsG+khyywa/ya162f3Se7MTc4RD1qGqGsM1rJutYosnTUu7Q
	 mCWFeH29qG2LA==
From: Danilo Krummrich <dakr@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Subject: Re: [PATCH v3 0/1] DRM 'feature' support for DRM drivers
Date: Fri, 29 May 2026 00:28:54 +0200
Message-ID: <20260528222854.2129473-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507080914.95478-1-laura.nao@collabora.com>
References: <20260507080914.95478-1-laura.nao@collabora.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7VC26BPY7NLVI73JOWV4ZTXRSPRXAYV2
X-Message-ID-Hash: 7VC26BPY7NLVI73JOWV4ZTXRSPRXAYV2
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dakr@kernel.org, aliceryhl@google.com, simona@ffwll.ch, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 boris.brezillon@collabora.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7VC26BPY7NLVI73JOWV4ZTXRSPRXAYV2/>
Archived-At: 
 <https://lore.freedesktop.org/20260528222854.2129473-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu,  7 May 2026 10:09:13 +0200, Laura Nao wrote:
> [PATCH v3 0/1] DRM 'feature' support for DRM drivers

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] rust: drm: add FEAT_RENDER flag for render node support
      commit: 9c81596851a3

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
