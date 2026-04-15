Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13A4F433CD
	for <nouveau@archiver.kernel.org>; Wed, 15 Apr 2026 22:15:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B50CF10E766;
	Wed, 15 Apr 2026 22:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iOucmPgH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7E0B645957;
	Wed, 15 Apr 2026 22:03:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776290586;
 b=e/bbTovc0mydjHNRu4Yl98/LW/E2pdZU6OT+pyUxqa6lx3tgmaXigWGqftSHJce0K+hjV
 N+dBEQlLTEKLGCU+ahu9soBLi2oLMfMpuH3ZeNCwgYvGSmTxCpEf+kLsZcWUfqAQ0vIAcUt
 MXYECB8AmDXTKmnOt5rex8yWpSHO+r9rGamWAeMDcGjs/KMmtoQXQ0NfLAMOKEaTk/pVzsm
 9h/Fv8YM+4Hdq8tANsznOoi8/fxqgZ1d0lW1ydtrt5NSZ3w2svqIvG8Sxbow0DL21EXGo30
 1YV4LCn2qHWEx1k4b+IsX/5+VeBVfy1lMoD8KAQ9EH26tOU3edHUl/hDb3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776290586; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bfuYlL93gGn6ykFgBUomRhqhY+tKf3wIN1ljQ+qs0cM=;
 b=Mbto2x07kDr4aintKP2GzQ+jfHv0Wmntcp91g9NJDH0BC2go7EVAa3JbNESskB2hk4f6b
 O1WY1mP019EmChhvmhLJCjGHdqQe4Yw2spZpnLrR35sUkyUPgFu/D2cstV5SK8rfiZA0+MC
 q2X11gxqT49YXi1qmlgVhYGKhbdA2cfwkWbZ7xidbVbP0XPnRhgLjttU/YJGBfDMh+L2oH6
 OG3EBBZqmMnGumoypMRrxtyyyR+hpi4ll8U7SS48Q7/TlCW4gwQ5YKryuidMmNIVx8/9iEj
 B0+N8olr7sa0vDevOGo0+iqojvd0+/zKf1URRjuJX+H9ujaNpu/8MkGEt0rA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 684F345850
	for <nouveau@lists.freedesktop.org>; Wed, 15 Apr 2026 22:03:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDD010E1F8;
	Wed, 15 Apr 2026 22:14:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EA8144289;
	Wed, 15 Apr 2026 22:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAEAC19424;
	Wed, 15 Apr 2026 22:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776291297;
	bh=dx2/GieGQas5ZAKeKK6KdkErC4+FKtE6PISPEw+PXos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iOucmPgHfgUrblt1bPIRS6oWss2sOJ4NWc5Vxpcu0s6lthbWz290pmsndn0G4RTAs
	 OdxSLVdzrMWchbGqbvB7Y51Z5LrE5F6tkfvaebzqpSHx9VHD+/owzxjFfCKmdnAgs+
	 H8Tzq8B3IxBORhqYP5cmCyaGFS3QmcLKr3+9cyQGMUJbHPT5D9PBgCdZ26XSoULSYm
	 Klaypqqhxckw1eo7Jn3wrqhIK7/0iG1wr+ERmfDftaA2/MgQwDtGiQbz2ZoODs0mri
	 4RSVhzKSIOyQKqsr7jLGB+KUOM9UBQXKS58byATbrOIEU36wqpHCHBM+KnXDTKhtu3
	 a+6sFuphHXKJQ==
From: Danilo Krummrich <dakr@kernel.org>
To: David Carlier <devnexen@gmail.com>
Subject: Re: [PATCH] drm/nouveau: fix nvkm_device leak on aperture removal
 failure
Date: Thu, 16 Apr 2026 00:14:49 +0200
Message-ID: <20260415221449.2911692-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411062938.22925-1-devnexen@gmail.com>
References: <20260411062938.22925-1-devnexen@gmail.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OPBF6XJ2JLQCX2JYDANR5E24QMA5UEGS
X-Message-ID-Hash: OPBF6XJ2JLQCX2JYDANR5E24QMA5UEGS
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dakr@kernel.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, bskeggs@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OPBF6XJ2JLQCX2JYDANR5E24QMA5UEGS/>
Archived-At: 
 <https://lore.freedesktop.org/20260415221449.2911692-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 11 Apr 2026 07:29:38 +0100, David Carlier wrote:
> [PATCH] drm/nouveau: fix nvkm_device leak on aperture removal failure

Applied, thanks!

  Branch: drm-misc-fixes
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/1] drm/nouveau: fix nvkm_device leak on aperture removal failure
      commit: 6597ff1d8de3

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays.)

The patch is queued up for Linus's tree and should land in the next -rc release.
