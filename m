Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712CBFF885D
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 10:59:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4C98D10EB0A;
	Tue, 28 Apr 2026 10:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fl9aE3Mp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4775A45C89;
	Tue, 28 Apr 2026 10:47:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777373235;
 b=ZUjoCVqiI3HVkwVrq4lRqwQ8h2WHW+u6Nypy+h7Wn2P/33se6NajOUvBX5mrFtjoHZU+b
 ujh7kTIaelLOH7BRRWWvTHm3W726h4ypfCQXGC9kXMEhLnM9T3vJoaGw/3aX3HIqHjMgQBm
 ATwVqgiPKVSeFX5D6L2IAMjEC066YLt4di9MdS9B0SmSgohiKc0emQe1+crI1CW31W1Fh5+
 eeri457Ma3Xd0X347g9UzUL/gqT9BwOmAeUjCf6Y6b6nUXVNx1p0wdjddcCk1If78JF3AGm
 UUoept49wOuWGSzHALttceW5SSsC5KsWosdmV+mYexhZyk9L6kH0g3v/hC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777373235; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kdzPcsD7NbLTbTpGwcx2V5++lrpvwaE5zLG9tBpt2dQ=;
 b=JU5eowxPCiltQucguZ5VRVJRSa1Gzh+ayYu9hwlliJ5tm8CEgfonzb76QtNMdZk6mKJGR
 ikyVQpgmLduXTlHCUq3Ka7lHg2jweXy+SoecpvTplLE47APOB/8tDortcU5LpH23htjXWJ+
 QsUIdRqJWPlvsYb+X2yWT3YoxJRKeYrkixpsRMIAzjur6Tn35DRC/dzGMY7gNNp2s4jkrUw
 gRkUxjRshuGnajhE5GtwxEfQEJALae7UPKSoOJzpJ6Ct3YIr6YOrYztlw3tNKMW69cJ0Q38
 1JqvqrAC+pKM6HFX7DcuK5XP6KLtwZJ9cpEnhLgEo73mIzh4C7ggWwKdj3kA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 09B8D45560
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 10:47:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C751810E321;
	Tue, 28 Apr 2026 10:59:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 25CF361141;
	Tue, 28 Apr 2026 10:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F79C2BCAF;
	Tue, 28 Apr 2026 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373972;
	bh=nhPS0LRCwd7c4oERcoYYS0MODmHmudGcky7g8cDOQVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fl9aE3Mp2ep6jjbtGG6jJgbQ1s2YfgZMYA/GqcVi2XFx5nZ0F1fCSRpH72yjps6/r
	 V9OTrQ7TEsgL1Tpn37LI1ulHFnEzPw6BTpuL9bKOCrAtbcBETAuZtP/eEyhlYug+ll
	 EoVL1OrtkeMC+NeJeF3fAVV6OLhPq11xAdvqikqUoy1E1bNkgG3Se4Aiijtion+XjI
	 LGWLruuibGgc7vmRCZsx7DD1RWeqnIbvUK8XS4QxTdYyK3sJcakWv9QQRydJg3HrkB
	 Ulap/o9mfx8KtsZbuU9HKZRbQ9JgHTsSCDuFUIwbmryarOIui22yyGxPLNgFoGVbgG
	 YumD1RPPEyEvw==
From: Danilo Krummrich <dakr@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Subject: Re: [PATCH 0/2] replaced old wq name,
 added WQ_PERCPU to alloc_workqueue
Date: Tue, 28 Apr 2026 12:59:16 +0200
Message-ID: <20260428105916.6108-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251031102020.95349-1-marco.crivellari@suse.com>
References: <20251031102020.95349-1-marco.crivellari@suse.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EENKKTG5V5QGPLEODYA3ENIT4XZVKWZK
X-Message-ID-Hash: EENKKTG5V5QGPLEODYA3ENIT4XZVKWZK
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EENKKTG5V5QGPLEODYA3ENIT4XZVKWZK/>
Archived-At: 
 <https://lore.freedesktop.org/20260428105916.6108-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 31 Oct 2025 11:20:18 +0100, Marco Crivellari wrote:
> [PATCH 0/2] replaced old wq name, added WQ_PERCPU to alloc_workqueue

Applied, thanks!

  Branch: drm-misc-next
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/2] drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
      commit: ef1b53284175
[2/2] drm/nouveau: WQ_PERCPU added to alloc_workqueue users
      commit: c82a16b0caac

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
