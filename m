Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940E3D49C9E
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 10:48:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 02C1310E99F;
	Fri, 30 Jan 2026 10:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UzeRJfBD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 911B840F37;
	Fri, 30 Jan 2026 10:38:56 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769769536;
 b=SUfNKfLsQccmY2/J/UYr5mBb2cJFp/ao90U0xwiSms8d3/tpA30HSC98JF8lYFtvfitv7
 V33uyHoXUt8dw5dSc7/G959C8ixpHChVYJAd4o5A37vzYnJKKWJEkouKJjN8sbywqh1FAyr
 GtkkwWBY9ZpEnO8CmkjNgPf4acr6qi5BF1m17mA7yUUl+evS6JE+3N42Pypp43iiyoIQ7w8
 ERvyU7+fls+4zR35yrw4tOMsGN6MoTSAp14jYYAakbG06/6lxL3c0O/L22UsusoppBJ9HEt
 7jHlLQlnuqnI/PhCTrF6L+X0uI1G5CveRB9LDRVJkfmCnsWclD6eFTCwCiMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769769536; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BU1TLiyM4pSOOCbNwWx+ktn77BIiSxV11z6iEfmhsbA=;
 b=HqI7+zaQ7kWVhBBeTlgJwzzRH5nIo372NdYrheCVTYmmqhkp42ioYJjP0XjUuakgVGGnQ
 yAkB7HNS26stIW8BmFs2CsgHgsZiv2GRrhw4bkSvWY62tDQMgjrvnCfcxeXiGVB0g6yg3Eg
 SOl2oApnntXI7Op7dn0ugfKjdTkEHheFGvk1dOTiSMXV9EMMPmqF0jSFbvsWYGts0Vz/jxT
 bJvLoFlFR9IpkOFdGUxE6l+2nPyWJUabYL1rkIZToZJaY2q7SC/2WzsBQeGJ6qC4x+NtHfs
 W/qNMECRG/GUDH6XcstFNEITAIKulVljTApsYvRv/C2BKiGY/HdvDPnxHeJA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 914554015A
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 10:38:52 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CE04810E99C
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 10:47:58 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-88fcc71dbf4so13709646d6.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 30 Jan 2026 02:47:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769770078; cv=none;
        d=google.com; s=arc-20240605;
        b=aMUgfhrEK40vvdg2e0qPp9KrRJivWyAtJjLCLVpIOGWZOaQmyTv9ZY3tzdvtw+dBJs
         wCW4+qoKx5HyJG2iECwmm/9fzWg1wXo44+FVkm0xyP+7qOLIrhZ3Jppk8vi6PsGLk7h3
         5q3sBU10B4fsV0N4kissoDRXPRGxouH/EvqFExVI9K3Kxr/G9gkq9ACsgkdZDezLabAM
         No0t6q24J5LaOd+tLCSLgPxdQb3OpHBigE+dQmYJzAWh4u1MqDtmu4EoeHZoUizwD/rH
         CigJXS7Ag0Pf3lr24ws+U7Kj3p6TMtPFh+XgfShm7izpxkNFANY1PsWCwvAvTfThGL7S
         Re+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BU1TLiyM4pSOOCbNwWx+ktn77BIiSxV11z6iEfmhsbA=;
        fh=lo07UYGoHZMz9PthEjpArsGLdZWFYkznDFSaX1CsEU0=;
        b=RvZkRJFNp2vgXlevh0wNm7ZABuXQPWAwQkrUzsv3mFevoL1TgKFeg6cqsQI9DSpNVL
         NVfbKCvkj7KjXgvev7czkQvoD5wFh7PxpK+tgXAmk3++1SBSDJqEi6AuWnSpF2W7vAYN
         u6F+0YOnEfuku/efCAgQ6ySF6FGh6PcjcG/VuQnaegN/mUadO4mDqmlNF7EV6juH7LFF
         SIGCJrKwjdHhJRvUrmCd/yXq9MCgAU4MdFAb/GjwZbJm/rn8evSS2DaJmbLzIeud7u5/
         WIjmDXfI6O7msRNu2/14X33hYL3HoiI7EY6py5Ngfd2HfKfVHjJoYaaCiymnk5e4sg5I
         wEew==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769770078; x=1770374878;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BU1TLiyM4pSOOCbNwWx+ktn77BIiSxV11z6iEfmhsbA=;
        b=UzeRJfBD7Zb17j2tj2nJEL5E5a3S7qsQYQnsici8IdKyRtPWnAQjG5BXwINQ+QHb31
         SCocXAetlK/P94l/H4XC1OF+EmjMlEp/oxZ+zcSvp56gpicEMJOylJhOxi546vtIqxg4
         O/HZfe0g2u6fWVpPf9UDG5PRayZrArK3gnZBQarSG4F5RpROyyxoi6cYd5nAJ4qF/Pvr
         /oXu4YadEzL88LNYJTcis2gUE1eoWOg43tJ9pQlB8Zs9jgeoij45wVS77uJ8e+45uPDX
         aotUpuKlFYAPcJgiU7Ai3wjPfk1uECVArY+vlM5pZw4/gWQGT6Cm7n8Oo6oFIIOlIY7y
         i7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769770078; x=1770374878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BU1TLiyM4pSOOCbNwWx+ktn77BIiSxV11z6iEfmhsbA=;
        b=mKsNeXfqEwFOgg12o6XMjvbMLHRPkXjPOt/XEDCf+ugPEx+z2o0rH0CDea3If1WsN+
         LM30R9WArkMa07mmo7UcJUxH6H9PxryTAUJ4s12g9siCIAU2+Ee+cmyFM4tZ5gSJeIA+
         ZoeSB0feoknU4c3Hid8NIDWRG62CKLtqjIhuAF1EiXuLvHw/VD8IHcOqW5u3oPRliV2n
         YIs0WCWu/xCrfQiQHbUFOGsfnXJjDxkbTSVhnzRheUDqFgoMZ5hVC9RHmZusX59xolZ6
         SQjBffsnIGuUyZ2l6LpLG0iTUammX+K4MpXKvtMhDNc9QsJtwLiHk/Rbb49+AfbGMedb
         oyMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI5tyO3KFfd4eFh74EcKmuBEMLMdt75pRBs9ytCHpSQJp3cW/wt4c50v7SHWuLM2+okwzwChVD@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw3rrZ9pkL0CfHulP7q9ObdMWVvDqID/+uQHtL0Mh7skwxDgRl
	l3vtW85cJUc3YkTHWyGb1IOA5onve2dUCnsFDY4QLRgw8xYbxGEbzIgkFwXEyYcclebzrf64wTH
	WwKr/ullMUktsMlVXn+E4LTJwTJAu0tw=
X-Gm-Gg: AZuq6aKxmAPhbsKlSAnu9t+FnO+ugx6iTGNLkRAOBNcgOvFkg9MeL+uaX6zJoQ1lzRn
	V+hADsTCDc4V541x3GaXJcFhqZSF84WDtxCfK7FQgnmAXR3oMdZUdB6cG1jGcNe6U08G9lBwIJD
	8CGonREKDI2ybCh+mF/GubWmdQ2qzThX/o4nhGZiMnTHTzBgccoOptm7OcvnSXmPKWHJ0dTaQUA
	n+7pk3HPU0jUJs2t7jme1MGmygCATVry2U10StNMCCmL8yoVj31u3Q+thBPAq+qPSlkDhbzosSi
	lAqNlpPnl/C/9gp4AIrVfhfmsAchah32gmQhoo/UxbR95JV7xSQUzyE=
X-Received: by 2002:a05:6214:20ea:b0:88a:277d:10c with SMTP id
 6a1803df08f44-894e9f8874dmr32317756d6.26.1769770077681; Fri, 30 Jan 2026
 02:47:57 -0800 (PST)
MIME-Version: 1.0
References: <87ldhf1prw.fsf@jogness.linutronix.de>
 <87h5s34d36.fsf@jogness.linutronix.de>
In-Reply-To: <87h5s34d36.fsf@jogness.linutronix.de>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 30 Jan 2026 20:47:46 +1000
X-Gm-Features: AZwV_QimU45fHN7_4cEw9UXdD7YCfSc3kfEPiFQwR4lIsamoUkrGrJvX3Dgzpzc
Message-ID: 
 <CAPM=9tyzBxS69GtwzfaudZBM9SsuZ+ENGJJbT_mXG2qxFkaK4A@mail.gmail.com>
Subject: Re: nouveau regression with 6.19.0-rc7
To: John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: QTKZ7LLGVJ7XMS2KYRIWCDX2QJJOYJ4I
X-Message-ID-Hash: QTKZ7LLGVJ7XMS2KYRIWCDX2QJJOYJ4I
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QTKZ7LLGVJ7XMS2KYRIWCDX2QJJOYJ4I/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tyzBxS69GtwzfaudZBM9SsuZ+ENGJJbT_mXG2qxFkaK4A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 30 Jan 2026 at 20:19, John Ogness <john.ogness@linutronix.de> wrote:
>
> On 2026-01-30, John Ogness <john.ogness@linutronix.de> wrote:
> > On my workstation I have been using 6.19.0-rc4 with no problems. This
> > morning I switched to 6.19.0-rc7 and now my graphics explodes when the
> > nouveau module is loaded.
>
> Reverting commit 604826acb3f5 ("drm/nouveau/disp: Set
> drm_mode_config_funcs.atomic_(check|commit)") allows the nouveau driver
> to load and work again.
>
> Even though nouveau "technically supports atomic modesetting", it seems
> more callbacks need to be implemented than just atomic_(check|commit).
>
> Should I submit a patch with the revert? Or is there a quick fix to
> allow drm_drv_uses_atomic_modeset() to return true and properly support
> atomic modesetting?

Please submit the revert patch at this point and we can work out the
proper fix later.

Dave.

>
> John Ogness
