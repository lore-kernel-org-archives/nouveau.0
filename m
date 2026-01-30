Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D73D49C9A
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 10:19:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F295610E986;
	Fri, 30 Jan 2026 10:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="MXUAQv1t";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="btQnOSj6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9420F40F37;
	Fri, 30 Jan 2026 10:10:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769767840;
 b=qvUfNPlFiJsT7xcOgSYV26KFTipHtAiu86KIQEJqL70jf87yL9VKktNNqjtlxmbDpOjKE
 /3Sj7TJHfCla5qppp9ztzA6GqfDkWes2p4N4PH6vMJaJb83Y1KgQyXsYPPpmWPhxtnfDGGr
 pg7h3nqr/jT06+U2cw/uy0PkBrb0vIM/8VUNTU4iRUctDTdozhCWRsUW74KJ2D95zueIYPs
 QEZcND8XFs7fZyuZ0ShL12QpLgHlKinG+/dbFpCexqfluHmSBWtw2RtpD29/eePSyvJt/Zm
 45RWgwmdVld0tSDfLZIKPdPTAtNPGnKDyTFZB0D8qshOIStNM2XRIOy755lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769767840; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MDQReRTTA6Sdb+48RVvFkziz88dbrVuuDKUTtXCwsok=;
 b=hiOtj2hbl1Q6ZC8B91vrCaMJrzULUu7COozxnNelM6cdvuKyaAECTBwrRWo8qRKuMxyu4
 WuwuLm0CXCF9hoSfYfK5EvggZN/wwySgqMj0etviq/J9jCuuqOIJX6pU65Rk9CQCdcCEyJe
 3viuh6SDiCxuqDPI3KZlF8Z2cyj1fsONgRdP4VD9QMq3Sz/QmS6mlzh3TH3252rhlfaZOif
 r9hJyB/qqpOYM7X1t2BKpdN2Tv2OpdkoMHQyzwfr3D2Jq1GkUeZ9b+DZ5Q4B378K/gtWBC7
 DzZ9GiFquvFSz9cC8gEJXvkh5cmtcrtkQOdlF0yhn4bjj/oSHZW8s+eW/Q1w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linutronix.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linutronix.de
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linutronix.de; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linutronix.de
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 18A6D40805
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 10:10:38 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6EA10E2C4;
	Fri, 30 Jan 2026 10:19:44 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769768382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MDQReRTTA6Sdb+48RVvFkziz88dbrVuuDKUTtXCwsok=;
	b=MXUAQv1toSe/JyZj7c3+FzrvL3i2P8hM2QF/zHvlaVYHdcCEYALa1cGcXBp9agBf/JtT4E
	+uEAPz7tI5f7jNysKtKFmOiBNCdGIV3XYLn88GkD2jMrN8gxVZAq7c1kKrq4/2cJzrZ5Ds
	2uKv/gkHVliNcSTyp44qvmO6eh4cIH6y0uaNzF+8XKFppxYJ1rhObCDgN9go2LlQelba58
	fSfMsaXLKcR3JyYOG4PyCX5wFwHCWpmOFrTtawfhAVl6mtjfwaCONfDDEecqKQb28kQezL
	bCYllcNDZKLiZq594ssQCk22EczJo7Ps6lxEzyYP/k/K9vpRofxHNhgcH73ZHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769768382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MDQReRTTA6Sdb+48RVvFkziz88dbrVuuDKUTtXCwsok=;
	b=btQnOSj6arJLWadMl0nAZ5T05xVOfLwEBi5bY1EaWNzjhpITVrtgZQCuplNG8tUpVkMFe+
	LQkgX2vFmH5OWQAg==
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: nouveau regression with 6.19.0-rc7
In-Reply-To: <87ldhf1prw.fsf@jogness.linutronix.de>
References: <87ldhf1prw.fsf@jogness.linutronix.de>
Date: Fri, 30 Jan 2026 11:25:41 +0106
Message-ID: <87h5s34d36.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: YKSNKK3XJXW4JGYW3I6HQPBYHHFN4MPD
X-Message-ID-Hash: YKSNKK3XJXW4JGYW3I6HQPBYHHFN4MPD
X-MailFrom: john.ogness@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YKSNKK3XJXW4JGYW3I6HQPBYHHFN4MPD/>
Archived-At: 
 <https://lore.freedesktop.org/87h5s34d36.fsf@jogness.linutronix.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2026-01-30, John Ogness <john.ogness@linutronix.de> wrote:
> On my workstation I have been using 6.19.0-rc4 with no problems. This
> morning I switched to 6.19.0-rc7 and now my graphics explodes when the
> nouveau module is loaded.

Reverting commit 604826acb3f5 ("drm/nouveau/disp: Set
drm_mode_config_funcs.atomic_(check|commit)") allows the nouveau driver
to load and work again.

Even though nouveau "technically supports atomic modesetting", it seems
more callbacks need to be implemented than just atomic_(check|commit).

Should I submit a patch with the revert? Or is there a quick fix to
allow drm_drv_uses_atomic_modeset() to return true and properly support
atomic modesetting?

John Ogness
