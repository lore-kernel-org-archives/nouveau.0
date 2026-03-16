Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33999F53D81
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 18:09:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 93E8210E364;
	Mon, 16 Mar 2026 18:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nppct.ru header.i=@nppct.ru header.b="eRmVWXNh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 52F5045160;
	Mon, 16 Mar 2026 17:58:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773683923;
 b=Od8C4M/R/zlKpvih5zrvQLzU6Hd8peD1wARZrUpSp8XOlKPOFEtP1LXWgnoPdbQLUGgaz
 9tuaWKi2HtmrvQKef2Its0NHreHdxFokeWrIGLyZkXnsstxo9dbFRnzNmDOa+JUcviIHgmb
 ioeR8L+M1BlRUCcYvHN4IYrjikotHU4DVzxnz5EVcXtfdVswuXFNSeAcS79r2aX8bLjyF9O
 lFQtQlBRdWqd4N+bTbGs1SQUYleYYb+sEWqKv28HIlpz2fgQDMum5EczZZyY0a6GbAamzc/
 J8pHYjH0SAWfJDREzYba389Domj3HUFzVZZBXi0jO+Wz/0gK6mkQdAni62iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773683923; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9cHkJpaZj8MctJs55QOyYU2k+l6IIiaEqX5Tq6Is2bQ=;
 b=d0PTxQSzZ8a7VdNSmFsgHbeaVK8jkD+Ee27Dnw8q8wxWfzoYYQw41tr8dvOQZtndLqRvl
 scNvepRx0H72ama1kDYl+CKyNwtef7Un+Nor3xOC3GLt5z8wtDGYV6f3qsa/b1Pk6SefFtD
 HGdonL0ckIbhZPNmfyUdxBJ2ETITBTUPhzFNemXt5iDvoJD/IVR53YSQieON4T1FnBkbxUw
 AjCV/4Ygufhn8MKYRpBKV8Coiiej2rT2mjXkRsiXvroArtpsohxxlzFU5D9L9hRj/mV5fem
 TU2meDbcnzDtSLL2qFylcAZ9IkAz0Z3ptVK27siGntdDPUm7JiGl2dp4GqHQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=nppct.ru;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=nppct.ru;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id ED32045143
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 17:58:38 +0000 (UTC)
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF6C10E321
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 18:09:23 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id EED6A1C0F8A
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 21:09:21 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	in-reply-to:from:from:content-language:references:to:subject
	:subject:user-agent:mime-version:date:date:message-id
	:content-type:content-type; s=dkim; t=1773684561; x=1774548562;
	 bh=YURiV9pptYTQKRccB/77x8YtapLBcnScNw7i1orzlhM=; b=eRmVWXNhx2Be
	hPlvMASTJhJfM84/ztC8d4qNs9ghaIxu4ZnV/2DD7NsqvJzZlOOF/gf9lnjaSylk
	+le3/SKpK2A+qXDPpFVUcAB4jSOpKkodrgJazyNnU386Oiaiap/u0Y4dLKxr8LIb
	OB6wM7DzoXzLJKI0gI2CemTSDDhbwkk=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Hl4fYAvDsoRC for <nouveau@lists.freedesktop.org>;
	Mon, 16 Mar 2026 21:09:21 +0300 (MSK)
Received: from [192.168.1.67] (unknown [46.72.108.30])
	by mail.nppct.ru (Postfix) with ESMTPSA id B39071C0E83;
	Mon, 16 Mar 2026 21:09:19 +0300 (MSK)
Content-Type: multipart/alternative;
 boundary="------------6ieCqH3cGP44nV15ppG6N5YP"
Message-ID: <4dcb40c5-0a11-4e25-822b-98f5883751aa@nppct.ru>
Date: Mon, 16 Mar 2026 21:09:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/disp: Fix potential NULL pointer dereference
 in nouveau_dp_irq
To: Timur Tabi <ttabi@nvidia.com>, "lyude@redhat.com" <lyude@redhat.com>
References: <20260316172631.82304-1-sdl@nppct.ru>
 <ac4867a4c6da6aef61b189960c0142a660b2122b.camel@nvidia.com>
Content-Language: ru
From: SDL <sdl@nppct.ru>
In-Reply-To: <ac4867a4c6da6aef61b189960c0142a660b2122b.camel@nvidia.com>
Message-ID-Hash: IISS7WWT5K2AQLXVFBH6XC5ZLMNXPEXA
X-Message-ID-Hash: IISS7WWT5K2AQLXVFBH6XC5ZLMNXPEXA
X-MailFrom: sdl@nppct.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IISS7WWT5K2AQLXVFBH6XC5ZLMNXPEXA/>
Archived-At: 
 <https://lore.freedesktop.org/4dcb40c5-0a11-4e25-822b-98f5883751aa@nppct.ru/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------6ieCqH3cGP44nV15ppG6N5YP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Can you provide an example of how/when this would be the case?

The issue was discovered through static analysis after reviewing changes 
introduced
by commit 773eb04d14a1 ("drm/nouveau/disp: expose conn event class").

Originally, nouveau_dp_irq() checked the result of find_encoder() before 
using it:

     struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);

     if (!outp)
         return;

Commit 773eb04d14a1 introduced the line:

     struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);

before the existing if (!outp) guard. As a result, outp is now dereferenced
prior to the NULL check. The patch simply restores the correct ordering 
by moving
the initialization of drm after the outp validation.

--------------6ieCqH3cGP44nV15ppG6N5YP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
cite="mid:ac4867a4c6da6aef61b189960c0142a660b2122b.camel@nvidia.com">
      <pre wrap="" class="moz-quote-pre">Can you provide an example of how/when this would be the case?</pre>
    </blockquote>
    <p>The issue was discovered through static analysis after reviewing
      changes introduced<br>
      by commit 773eb04d14a1 ("drm/nouveau/disp: expose conn event
      class").<br>
      <br>
      Originally, nouveau_dp_irq() checked the result of find_encoder()
      before using it:<br>
      <br>
          struct nouveau_encoder *outp = find_encoder(connector,
      DCB_OUTPUT_DP);<br>
      <br>
          if (!outp)<br>
              return;<br>
      <br>
      Commit 773eb04d14a1 introduced the line:<br>
      <br>
          struct nouveau_drm *drm = nouveau_drm(outp-&gt;base.base.dev);<br>
      <br>
      before the existing if (!outp) guard. As a result, outp is now
      dereferenced<br>
      prior to the NULL check. The patch simply restores the correct
      ordering by moving<br>
      the initialization of drm after the outp validation.</p>
  </body>
</html>

--------------6ieCqH3cGP44nV15ppG6N5YP--
