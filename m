Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168121061B21
	for <nouveau@archiver.kernel.org>; Tue, 31 Mar 2026 10:16:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E41D710E8E2;
	Tue, 31 Mar 2026 10:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="blyVjuiH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 15F5B4530A;
	Tue, 31 Mar 2026 10:05:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774951501;
 b=OkWwtIMNefyeeDPQCW2YsZrOFxgHc79sDCQ6P+CckG2ZTOC6R7K+37Cx1tx1JtnsWI4mc
 vyOrtOpPIXRsJJgpQoe8KwKa658S3GU//hmpQd61IQ11rrhKfRFWSKRasKnxX74JPuKKfx/
 0tarzcA7vaFpL686y7XzaSlMr/QyLDMkZpagXEeQxUGdv+jYheWpnZF+oS5N1kh5Q385/nK
 Kx0QyhGw3IJtkKbrxwwCb5Py/rX9V/p3S6XwbMHXdkcJd3OeVYwjklfdBN2qReDUBKt15FN
 2r92DPRkv2P+hWcsRPNoUdaGW7hy1eSFzw059/Lc5aAMLOWll6ogwaYfKADQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774951501; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u82NxCxMOoHokl6CWFUxRda+nqKiH6ew72AuZPbDCik=;
 b=0p+3+gDRh+H3GpwT0r4O9yQs2PGg6UUfAelElosE+623zM2pZyieDXHEj+skKdJ0mD2Px
 VZBTwSFP03PZVn0hrLpPuBMxtHEDXJUj86uR+oh6+/rm2z1U5ZQFuRzlKO8isS5GCyj89rM
 069vTLyQUeLmC/Ac4e134Sz1+KIGgUfdoqqm/1Z5BXUoLl0Yf8WCZiRSnbIf3b236KKW2H4
 QfcenbHwNLtIWbhx0vQwXKc9uWzLamsJvF/pLbzTzjy5TowZd/JKxvFIE5Kw9X9mMV5bkZV
 TJsD/dQAGhrhR3TKEtb/rjQ1iPzqKGm4F6qL7KGuUEzk685BzRV00Q9JmHGA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=suse.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=suse.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=suse.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6D35741B4C
	for <nouveau@lists.freedesktop.org>; Tue, 31 Mar 2026 10:04:58 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1E62A10E8C2
	for <nouveau@lists.freedesktop.org>; Tue, 31 Mar 2026 10:16:16 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5a12cd0bd79so6507507e87.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 31 Mar 2026 03:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774952174; cv=none;
        d=google.com; s=arc-20240605;
        b=ZzuiBdYAon9npWCijk7utnH3TA08KowqikvZ4WU2c5Tj6D0W5dWAnOmU5k4JJgSryN
         3yxML4Xftn1PkP6Qh5WixtmvzQCJZLukje3iOPB5+9pxzqeC1/EsaCvbKv7rtITYgsiT
         KdbIJnzfGXrevNWlvaRbWqBno3oOfu3R6D7LPKWLjEzNRTgIhE1ZghCu4FwWCG9CZgcu
         6w3MKt3Y3vf+9nmTD0dQH7eftELb9h4h/blYXxeoyEnfKGZc4eDjnPQS0zbApQ5rFO1J
         601Ld6+gUOgKBAdvRZ3jsyYYiSgP/LvBxYREz2us9h90uFvp7H6PObuz58rnswrUj8GW
         SqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u82NxCxMOoHokl6CWFUxRda+nqKiH6ew72AuZPbDCik=;
        fh=nwtMxYpP/idLYVvwVsEv585NXDD332l55JOc/j2V2UQ=;
        b=T5sTqPd37KjskbibbSUPbOh+mf+nOfNKkitnjZrVmXNy2FpLd8Ihc738YikRjR40Rl
         QTWzO/6D6mP7p5rHwYR4491RZvTyribGu4JT6DdA0V4LXJg8CP2R9qLBpRldic14BY6J
         qcBiy5jByEDEZvw3mFX5BrLbEavSSMmp8tca7e51EKV/dZLDo+ztGRKYii5P4zJHoUs/
         bYMIDqNj0yVk1mcc6CXXdrwtaLdeVsKV0Roat97d4qRP9Y9cCvH9mtNzz3AiNL+oUyZ8
         OtFJZeeFbKan3yAzmFW8Ss92Oyr1sioWk0q/ihu+cpc68gBNbvWcSFj2eGPDsNSV3oty
         vJHQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774952174; x=1775556974;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u82NxCxMOoHokl6CWFUxRda+nqKiH6ew72AuZPbDCik=;
        b=blyVjuiHC3GcFsmCJLIknid92jtdLVJb9V7lAgkJi3I7Mm+f0SsRefb7lwwuxFc8+d
         ogqblnPiPjd1NIKRDBW3bn8m+nwkmOzlSZl/oNfjrybsgwHrhso/Q+MTe8oIOUQfshnI
         0vswpyUBpRAX+sta1X0k4yoynFQWUFwgJSxKWYEISjWf293qGukEl3vWGBWmcBFFTbis
         AMtTRYTNAivHbbMBxvO0/cW2WPKmGP/vjtIAA3v98a1TqKBqePCehQR9m23wQmdLrfGl
         rkFEa/4DRHoutIPnCN7N/wdHZpEU4+tmmBaMCJeGISzdJKBA4VIdCXQino+6zZ1YKf6g
         S7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952174; x=1775556974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u82NxCxMOoHokl6CWFUxRda+nqKiH6ew72AuZPbDCik=;
        b=W2WkuLh0ZSTzjpSHtFac9fwCJ4Fbd77O8vNOi0LpSY1KwBss5kkamRBy2oZLYRIv/3
         LRIyuV5e0RbDalARCkgwb3g21IElO147VZnka/ml3EH+7zZT51upm3P+kwYQj/JKGc2F
         46tN8yG9h/ND93AqPxmwKnOQBMAt/NmgmYkr5tmWKVeiMGla3brskInG7w99qjYPNpms
         /sGqf6KMF+RS5/xwrzm+9idhww7HKFTt0eWcNzNXUyep/DqusXUqEOGHY5tiSmCKScko
         oMqjxkDFYEe2m3KobLFl7Or6jfJlXe/w3fj5ejPyYTfa9t2yVgTMmx7uTTqV5mLkQPiG
         e+pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpUst5wljeTrT0GPCNX3g6QYfm4bbySfM97cHJJ47zGFUw3HIUFMhq9S7CmXh3y3m/WuJECuw9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLyPjCIaAvJJMnCxHedgKgmzwbllb0bjLn6jmxgMuJQYJdR+bx
	REgvWUYODztn6xlqCxJQMz5kDJy4pifuwGeJqA2n63tfZ0nMYJseHOalGZcCqFeiBOBnFQb0KN/
	bavgzPoF0v8XM714pjskiZTIm0c19LCKHtoWlQhQvNg==
X-Gm-Gg: ATEYQzy6/0Qbq4Xm5zyOzRUAdEX0SX92I+fYPGsh0dFNPR7mDXWivfZQEcpYte9bzkS
	+86PJWVFP0eaBGXZL2XAZRXVD1ym5cOOUuaJ7o5ohV/Yebg30Vsu+j/0EpEEnawh9mu0mPH5kII
	cI+V6KOIldVcS85WB2yTaINp1zbwt4RtLP6XrX+qd0iGo5FqIArzqO7xmBnsAZUBj+/Ke9sWM+j
	cRHlSulwJR0zpln4Rll0UWdpEj9kjJq5utU57QgXAxz8K5i94iNKEpMA9CxLkNfkQL2o2BK+85i
	SMVo0pZcXTnPja1a+edc5Gp3V05UHwfohbDu4h1M
X-Received: by 2002:a05:6512:159a:b0:5a2:babe:3da0 with SMTP id
 2adb3069b0e04-5a2babe3e6dmr1186154e87.9.1774952174303; Tue, 31 Mar 2026
 03:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251031102020.95349-1-marco.crivellari@suse.com>
In-Reply-To: <20251031102020.95349-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 31 Mar 2026 12:16:02 +0200
X-Gm-Features: AQROBzAn2cAn3gEpMt82N1QLhNz98nbUv3YGR1QgS4BXC7xzjLgXrHHAT7NjA-E
Message-ID: 
 <CAAofZF6X=1+AeOR9v4zjfM91i9PQK3BdWKOes_oh+kgAMUdQoQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] replaced old wq name,
 added WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: RMZBRSCRFH7T5JVBKTNYKV4LKDBSZDXP
X-Message-ID-Hash: RMZBRSCRFH7T5JVBKTNYKV4LKDBSZDXP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RMZBRSCRFH7T5JVBKTNYKV4LKDBSZDXP/>
Archived-At: 
 <https://lore.freedesktop.org/CAAofZF6X=1+AeOR9v4zjfM91i9PQK3BdWKOes_oh+kgAMUdQoQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi,

On Fri, Oct 31, 2025 at 11:20=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> Marco Crivellari (2):
>   drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
>   drm/nouveau: WQ_PERCPU added to alloc_workqueue users
>
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
