Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF799C61DFD
	for <nouveau@archiver.kernel.org>; Wed,  2 Sep 2026 05:05:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 895D310ED0D;
	Wed,  2 Sep 2026 05:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DZnp7Cb+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4998447DFF;
	Wed,  2 Sep 2026 04:48:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1788324536;
 b=x+OqmAAUfkuDRwJKsDLT5SZh2KTwuXBMQTkqd821ln6Jc/QXRqh5CkirR3z9IBWAOtpGA
 4wZqfAvY4E9KatHT7VxnE0EcFt2on93U8LodGIEtxwQGZ8W6CdVPYhFkrPKkF/zp+eRgA6d
 EiJAjDr/upisXXuDBASZKrYwUZej6qqGHUDHSfqRUu40I8FLO7+Ef2kCEzc5wlsbH+AEpyu
 dkf3gtaiNM2aIfxryUod7sWxGlrAmeBenoPs0VvTis8Ni4al5SqVmHT/kodxMs27vjVMnY6
 w6gg67rYrqVws5uLvEpNsSqud0Ym0Il1+q+QdqQokDPVY85jKLtxx7yEiYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1788324536; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ItPrb8m+8Z75krTp11hhE6Jc3K1gPkj7qQ/v5ze/0As=;
 b=jXa4jJdFW2dKT1/NLRBfl8FXWZPzYwnF+d0DsdIVG+joYDSZUJdL+TDMovauhRt2bya3H
 IhmalqEqiF9+y53eIzrGR9mH09Ax5s5YiJhiv4gedpuDq+KenhurQK8vtkwwIHOhJpojozW
 lqT7yqxYgXgGp0Epq7naEmh19NLxqNg+TQMsQVHSyomwZV2evm5OjFwupL+vfEkvNYDiL7b
 2uEU1xshOQcJAvPFf60lm0AwtAAVSQYE1EKMb+oLByhZ/RuMDxzjhGfjVPpALaE1CfPGCLb
 a/xUdmZ3T/RJAEwPcDyGEU/fdACBOJrpm2ls79kV9DwrOh2h2xTVdeTUZKDg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B07B547DC7
	for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2026 04:48:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C71D10E308;
	Tue,  1 Sep 2026 20:29:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF5F243C53;
	Tue,  1 Sep 2026 20:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38511F000E9;
	Tue,  1 Sep 2026 20:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788294550;
	bh=ItPrb8m+8Z75krTp11hhE6Jc3K1gPkj7qQ/v5ze/0As=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DZnp7Cb+mm1iS1vX2nH9QUjMDPPWrpfvCDM3ZbIQC0REkHUwO/19ZK5AmjML+IWpA
	 sKqY07WnE394O1OfphCqtORuUbXwLb1uSRZ7RGkt/tLK7xUVF2RzclQJ99giNkREDm
	 4mhoUSXOagxpB2o4CVe7zQzSXOusS8oIK/ojra3VAJgjKxERGjNIyQetisv51ta8GB
	 ZPFslsUeOKlJxzG69AgC/6gRtaiuh1UNpT+9n5JJy50orhQ1hVOfXTGvvqyS9Ieq7N
	 v/RgsOiFoBRCTI3pySCePHxaIGUTNRYklb+HPOK8lwSDG38p1e3rL8Xo1fIylumCMn
	 8wEhPCCu0JyaA==
From: Danilo Krummrich <dakr@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH v2] drm/nouveau: Use write-combined maps for coherent
Date: Tue,  1 Sep 2026 22:29:00 +0200
Message-ID: <20260901202900.6808-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
References: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XNRMM2KF5XXOJTLQCSUHNWLMNNE2ZI5V
X-Message-ID-Hash: XNRMM2KF5XXOJTLQCSUHNWLMNNE2ZI5V
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Faith Ekstrand <faith.ekstrand@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XNRMM2KF5XXOJTLQCSUHNWLMNNE2ZI5V/>
Archived-At: 
 <https://lore.freedesktop.org/20260901202900.6808-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 21 Aug 2026 23:42:59 -0500, Aaron Kling wrote:
> [PATCH v2] drm/nouveau: Use write-combined maps for coherent

Applied, thanks!

  Branch: drm-misc-fixes
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/1] drm/nouveau: Use write-combined maps for coherent
      commit: 774b73428e6e

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
