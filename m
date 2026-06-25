Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D3DCDE012
	for <nouveau@archiver.kernel.org>; Thu, 25 Jun 2026 21:24:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 140D710F39C;
	Thu, 25 Jun 2026 21:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aXaG0RFQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 579DE46CE4;
	Thu, 25 Jun 2026 21:09:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782421788;
 b=Y6jOx7hGvCz/nu/pTtzi0tCeDNkp5+Zvx2vKvyVdYbwU6Tyut8lXX7sP8tgzmo9aSimn7
 DBNRB+8QZdTT/l2QUTGPaAmTMcVpCqg+Avgdo9zo04pTAHds2A4wYArV2GjEQHZcyiMm42G
 yIjYx0tNC0lChvV4l0fUJUXtN35G/uFjjrJzslrnPK/e8CS7DHgytT4lSElkhiT2yO49bZn
 oPPsq71HWLdYBLsIueNyCApBJoDuvGAOmxbS7VPJEd8sXZnZ3l4uO7b7GSEFSiX0foWWSzn
 NNBZQPreBa/3IpQb/+DNWIHuy/X2TlNiLFlvMWBSoP7j40mQKjMyzGjHgygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782421788; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wImZ55sVV9nR2X0lKBaLNBzw+hjAxNnCMhbKwyH8aIc=;
 b=zIyaTPUe8FPOhB682smge2HY+MEec3mx2NExGxPZAlwfaz+JLnQDjrfwYHbb+G7D/WOLH
 WLe6zWOM5tx7j1kRRZLLmlgUQktu5hQzPSrbDrLgj7GIemvVWTsohSEa+/1zP+LV3WHNE2D
 p/QTAhpHobREtP6dcyto8tD07XM+1t651TjW3CZ/NukDG3xWmPj0A5LZeTJZAJIqedxctKl
 dekCKPR0F1QMrqiJtrVH647l3J1g+4fC6HhyQPt7rsmHv/Eafyib+8fEUnGPJLiikjKD/ey
 o2EXkIfrc8Ly8ZBScDq3uy3lo1AbfGECGjTpYZCA6gT8kB0aAA9i/gCvYSEw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C413040382
	for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2026 21:09:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 496A310E2A9;
	Thu, 25 Jun 2026 21:24:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E224341707;
	Thu, 25 Jun 2026 21:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2671F000E9;
	Thu, 25 Jun 2026 21:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782422656;
	bh=wImZ55sVV9nR2X0lKBaLNBzw+hjAxNnCMhbKwyH8aIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aXaG0RFQ2QD6DQCWgtnBEW1Fo/ftIhfkexvZt0D32is5v/ZS9+MlTaUQxnm2VZTtM
	 31Usjl5AD3CIpRNfKuLtC8jRxljf2PvrSCxTddGaQjlQdbzll39yCZ2MmRqGRigE0g
	 pRhiopc5kg8pPWvHV19qK2yS9tSQd/yhOTthcgysbZ1QpJYUEfnbKqKJIjL3f3UTDw
	 +HlM5LHosr86Kb5JwdOTzjOKmdrpkYiVceZlFFLGul9zpuSN07HYcEVb5q45eEV/f8
	 lAezZYXiEtZnmvqYFKw5mfV9phwf5qNel1z4R7V+EnnjGYn/Y8sg/YRk9vg/XcuVIz
	 8tgYvK0DJe8yg==
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: (subset) [PATCH v21 0/4] Rust bindings for gem shmem
Date: Thu, 25 Jun 2026 23:24:08 +0200
Message-ID: <20260625212408.1618423-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612194436.585385-1-lyude@redhat.com>
References: <20260612194436.585385-1-lyude@redhat.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KGYL4C5PQEMBFITHU6VB7BEDPYVRW6GB
X-Message-ID-Hash: KGYL4C5PQEMBFITHU6VB7BEDPYVRW6GB
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KGYL4C5PQEMBFITHU6VB7BEDPYVRW6GB/>
Archived-At: 
 <https://lore.freedesktop.org/20260625212408.1618423-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 12 Jun 2026 15:43:32 -0400, Lyude Paul wrote:
> [PATCH v21 0/4] Rust bindings for gem shmem

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[3/4] rust: faux: Allow retrieving a bound Device
      commit: fa8cc4e3067f

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
