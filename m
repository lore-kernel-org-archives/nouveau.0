Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED06CD98F0
	for <nouveau@archiver.kernel.org>; Sun, 21 Jun 2026 13:13:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DF1D610E3A1;
	Sun, 21 Jun 2026 13:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I5CfqH6g";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CA3E846BD8;
	Sun, 21 Jun 2026 12:59:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782046741;
 b=EqAWFA4ZIpOYifwS/uxANfjyNiNwYBLsmXGE4l2290nZJoBQz9jqzTbULiNpcvD72gKW4
 4V6SwFpijsEvRcSJOUjSTwcnA5Dm2glkMlV/hpnUUBvS/eQhm5vCdnEHmrAj/zzsI7wjVqS
 OEbQZFUyX8ukmyQqnHkw0NSFCxEo/EY5dAf0KPuDrvw18El1gQ2z6a6dVYIGdjZDXzqgOVx
 IiLPnQpgUkB2Z2Q4tH7gKxbxUHIBtOmqsBVb0dp83ZSgNoC3Gpn7DjNaw0hQK0JhAGIhSI4
 mQZL7MeK7Cglqi9/i2nY1UhiwaN3sK2W9HlNgK28d0upzJdTikwvG5GT3/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782046741; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dzuTGsXHWnUFFlf4w6v0xDSvKV+lTAJBsA0LpxaiREM=;
 b=xplKprV/SJmrJogzGjBF84cn4P8P/aCOcZVMCA1GtWOPSUOTqJW77o7a35GgBSlvl9TPJ
 4Zcgf/nYwpp/vFxkM8Y/1nLLEzKISsnnZomOrEEZa3qpIfXqGHxlUi9jZ9i6j7KPCN90rFS
 tiWwdABZ745jiRMYUHbnAmTH+/AYyuB7tCiEc2B2NhCyAROMDFJYH46Bllde/3KTay7TAx1
 OKhFaHAInkubMfBMeFOHnzcCFU5oETgyHnOopmTFBx5uWNuxc/JVKcATRe6eXmlqAYqSPkp
 6ODwYjb+sGeFiRgFYCbf2DejnG2G9wH+DWvj7HW8QVXhe9KPHBSuN5UaTEWg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B81AF46BBF
	for <nouveau@lists.freedesktop.org>; Sun, 21 Jun 2026 12:58:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 995DA10E030;
	Sun, 21 Jun 2026 13:13:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CC3942DCD;
	Sun, 21 Jun 2026 13:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40C91F000E9;
	Sun, 21 Jun 2026 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782047601;
	bh=dzuTGsXHWnUFFlf4w6v0xDSvKV+lTAJBsA0LpxaiREM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I5CfqH6gPdXXucwP6yOGU4artKH2QLhVG0qGr/JwlXZc4DSn0XQajzUomOB9brj6m
	 UgrCst2nHkoNdmOhbATdqCjhaIKUTJPZ/isy2ymJRAvmujj1jIeXp5y1k4A+z/ikY+
	 ppaFj71DqvYSWPBDpUET/WOi68CjCvtSGOabTH+ivznSH4hNmZt2dM4oNsuip23zVm
	 eSs6KJT1cv9JHcRZ3o07pJDk0sSkGA6r8r46MNZcYQBexvsUuBgio1Q5DCifTBc1e3
	 zUJn9sSjHQnLZ/wz3tyr04dd0yjom5s+foVfZj8FZ9XFmyMw9qrBEVMsr5XW4Db6RR
	 DV4CjQn8QyV5g==
From: Danilo Krummrich <dakr@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] drm/nouveau/acr: fix missing nvkm_done() in error path of
 nvkm_acr_oneinit()
Date: Sun, 21 Jun 2026 15:13:10 +0200
Message-ID: <20260621131310.5004-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606155606.77593-1-vulab@iscas.ac.cn>
References: <20260606155606.77593-1-vulab@iscas.ac.cn>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HGIWVN2OXJTQRI57YLWLWRDULEJCYPHO
X-Message-ID-Hash: HGIWVN2OXJTQRI57YLWLWRDULEJCYPHO
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HGIWVN2OXJTQRI57YLWLWRDULEJCYPHO/>
Archived-At: 
 <https://lore.freedesktop.org/20260621131310.5004-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat,  6 Jun 2026 15:56:06 +0000, Wentao Liang wrote:
> [PATCH] drm/nouveau/acr: fix missing nvkm_done() in error path of nvkm_acr_oneinit()

Applied, thanks!

  Branch: drm-misc-fixes
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/1] drm/nouveau/acr: fix missing nvkm_done() in error path of nvkm_acr_oneinit()
      commit: c3027973f692

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
