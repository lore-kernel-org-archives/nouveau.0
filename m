Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ACFEA3C20
	for <nouveau@archiver.kernel.org>; Thu,  9 Apr 2026 09:59:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 21D0410E77D;
	Thu,  9 Apr 2026 09:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="WGwtQzZp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4DB45457C9;
	Thu,  9 Apr 2026 09:48:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775728086;
 b=evCivG6QBYUNWIW+jqZhIQPfx4qAM5DucUwjXrOXKuuFJJ76vIe94JJ1USfsNoWC86qzi
 CgRsxKKVvLaldi7HLrZFui5QyhLTXymGoh0Kd5D4rvtNOoNFWrnENXro2b+XDmgBP4cp+35
 Y6U67JWliED1/YqNZ7DmyIanKnc1L9LEdzuqtCAXr/c1IGXJw5b0zFPyE+2LlbTZn3eku3N
 eiuPfRDbiPV+IuMzLJj37zI6/4a1WfCohv3tJkPzLHwUrgitrbc9HAyn+MmJ1U9tGG+GdOS
 xdeTyUTht1SVOOfeCyWQokJWmQDkWgSDGJQfYKnrFr4iU+un7D53Ht9so8Lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775728086; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jt+KgaptQwnbiIvGQXs1XTKytg2nwifhp2nHDe/NS+I=;
 b=sUkaEA6cGp3KOmCVnJG6iPYWYrFJsQoY+KbYjs1mO6L8jlED2nLE3IR+ERwZeqrSTBpxp
 YEJP+AerBXtQP7ymCCQtSDkRTTuiGMx3qWRlDW28n8jVbsUu/FzcXym2koJUxGm8swWMp2f
 Z9pzxD4gsosmrK+2jWFNrxnLs6kk2AdDU9H8T2qHw5BHRwxChyLXEVzIOATammO/cYY4q4J
 rFeh2eut10fq+3gPTaI0mTvMqMEzgdYtfJDKd8kA0/EkDqSeRrHeJDr7lvNqdmnEtmTCAIm
 GOb4fI1/Bb/OrlpKus9fpik7Pc8CSiW1wf3cvXcJf3/0hiC0d+cWHb1l10YQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=suse.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=suse.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=suse.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C3A62451BD
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 09:48:03 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A98C10E74A
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 09:59:43 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5a2a70bb66aso765995e87.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 09 Apr 2026 02:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775728782; cv=none;
        d=google.com; s=arc-20240605;
        b=hMA5mo6aKISGpCofVNen1Kjyhn6foP1bZ697BJtQD5aoBRSyO2O/yGsRXEf4XWG3Cj
         E5RkID5qmnM0hVBSM1RRyqrfLKlSN3c0By4RXvhk/9FixODeaK3aZHfFZIPWkrIo/tvX
         8Ml+FoiWkfDd3TxRCajuOcyvV6xGbKhKi1dRk0bItfg48Hxw+xkPKrsRITurnEnv1pyG
         1G1B0/b5OuY0/9ejs49NNSDuZI0M53JVDl7LR7pw4so5IR2ufOPyk8bzl379pvanky7C
         YkWYbCAZy0mWCOXzpcMaJ6LVK3I2Oknlmb4nG2nj2/+6NV5/LOIYcppSDVMz07b5QqRt
         lpbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jt+KgaptQwnbiIvGQXs1XTKytg2nwifhp2nHDe/NS+I=;
        fh=9JaCPDBxNVLSHOQlEEz0Ch+Ibi7QFNGlN6oBXEyvVCk=;
        b=dd8s0urrU0EdTAnDHqx/MhDQKw8oBg7w0XD/P5IedKWpNadkHUw449cASut6JTItAm
         R755o84znfQSeyrLO+4KL2zCn6qICGO2vjSt65CoehaxeQhDPnTY8V/0ldVaTFaDnrph
         IDhJEZ7i0wW+Y4I0WAUc0vmx/HHjy2lgfKjiKXx89CIBNzvMJxNM+gyCIQz7tU31+Y3E
         dP34oME90KpWuZudcOaE2XoBU0UHuMVFA3nTVeExXeugcUoLmaLZ7GJMPPL2mQFTeeNq
         2tgA6UpFuHiklrDEoA8zb8He/LLuRlxbsbc4oHijJQtGCrb1X2TsSgm6tAMsCIKUqVHX
         Qddw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775728782; x=1776333582;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jt+KgaptQwnbiIvGQXs1XTKytg2nwifhp2nHDe/NS+I=;
        b=WGwtQzZpDrxeM04FT3lSsiGynKNl9tV6fr5Mf3cQ0dhRdxBrMdX9YjQoRGrA5Hn1hu
         fIZKjxNQ9AJdqxSdOfaRMyq1hYGinsrU3nC694GHI+qRovvY9WP4E0RcIYZsxFuphzlc
         wWItrfDq9IPpPhH+Cf4CHDOViOcEBMVqoPaQ4Ey+JjvS750jiNoy809AmnE+AHWKmma5
         Cr4mjjhgF2oEuNAQG25s5ZK/ncluxn1xcnHty9PM99MsgXxtQ9KY0+77EGIig/3dOD77
         nT6T0jLuI5ehKnh1ft6bQ+qu7yvnuQap3DPyZhSP9XhjD2tJi/bhFBDjHmOPVSnoUNCP
         fUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775728782; x=1776333582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jt+KgaptQwnbiIvGQXs1XTKytg2nwifhp2nHDe/NS+I=;
        b=NEgqKquRofxeyQ2JfXlXSktxxF9R5xCS9PTTAm0gAkE5mvIrCnRUwfdobRs8XB7Y58
         M/f6iVB9DXyLptS1qQvJbTbdYiMXl3N0j0hz6f+XqkKRtPoiR7rbOfLpv4bDuDLczpHl
         VjulJe3d72ifAg1KzxvBNgo0w7jKjoLK7BqwbRLgjlpPSaqU0xs95U99Qt0pcT1OitJe
         /LG/Tfoe5FVSu2WXGtQrxjxImVCGCOIBpYyl0CFtK6n/iy7+pHuYg9hXN1zF68rqL+0L
         5QnGCM4e/CaLTepqwuRYf39ysHw2wfTkki017eCw1ymYG/COFZLhHk4Nx3FoIEXrI7XF
         QI4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTwxmLkE0kNMg1lDG6R8VdxAjOieKRIvJnZHcRRXKXjuaX6/WxXXTOX1O6btX0iVjqZHJ6SOSb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrRT59KJuV5XhWgPoW1uWAT91gFTK6S++9+a8YG9/ooPyh3J6r
	rLFnhrVNoMaCepzjV2OLvl8RaQqK6W0bW5GBwFD2efyASbVEWcwEvXvvZEj6cC2BgLbIHAsD9c5
	kcy/GV7nkOW8tKLvLWZEuCjpI7HQHTlCbGiY71ymKHA==
X-Gm-Gg: AeBDieviMAXeL5LoKEWDy9p39AC954sGu43RaYdkSdcRlxZDsbU2bcaWGfuRtTexmK0
	oQFWeiW8DFoECtBjhqNSTSCM0QXLiYYwaxjGuCsWKeCnwy/A9xTpNzW7Yd9AfRYLkwU4NUaVDDu
	nGHA69rWgLeEBoF6GpQqOynB3dIr8x2wesVz5GSqJOyPjLG9ztOPKCGXHw43mMENCxnoC+MmX6G
	WyDpk6t4CCyk7miWPsT5AikdjMv2QlprZ6yDJdWjtIjP5uvl6l/WIVILQ6nBD03n4JIDVVTCnY7
	uwO+xPTY9rAhtKyySJQpZSczpkx+WFtwdzw2KEDxxXHTV0Yz/xY=
X-Received: by 2002:a05:6512:2201:b0:5a1:3d21:7b55 with SMTP id
 2adb3069b0e04-5a33778569amr7413966e87.43.1775728781591; Thu, 09 Apr 2026
 02:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251031102020.95349-1-marco.crivellari@suse.com>
In-Reply-To: <20251031102020.95349-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 9 Apr 2026 11:59:29 +0200
X-Gm-Features: AQROBzBqe7bIwFZ6E3imviQffF2vEGLSChI_VwvP5fAtQWlwxHZL3ZF5baJtnx8
Message-ID: 
 <CAAofZF6QF9fY3U9sF2FT6XZ37hfyvZ20+canggyOskWynKG+Sw@mail.gmail.com>
Subject: Re: [PATCH 0/2] replaced old wq name,
 added WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5STWBKNTNMO4RJRY5P7EEZ6P3SWS4RIK
X-Message-ID-Hash: 5STWBKNTNMO4RJRY5P7EEZ6P3SWS4RIK
X-MailFrom: marco.crivellari@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5STWBKNTNMO4RJRY5P7EEZ6P3SWS4RIK/>
Archived-At: 
 <https://lore.freedesktop.org/CAAofZF6QF9fY3U9sF2FT6XZ37hfyvZ20+canggyOskWynKG+Sw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Oct 31, 2025 at 11:20=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> Marco Crivellari (2):
>   drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
>   drm/nouveau: WQ_PERCPU added to alloc_workqueue users
>
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)

Hi,

Gentle ping.

Thanks!

--=20

Marco Crivellari

SUSE Labs
