Return-Path: <SRS0=5S4g=H2=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EC6C433DB
	for <nouveau@archiver.kernel.org>; Wed, 24 Feb 2021 16:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 845E564F03
	for <nouveau@archiver.kernel.org>; Wed, 24 Feb 2021 16:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 845E564F03
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cetitec.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B546EB13;
	Wed, 24 Feb 2021 16:53:40 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4B76EB12;
 Wed, 24 Feb 2021 16:53:37 +0000 (UTC)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MplHR-1lcFYS1bLR-00qCYi; Wed, 24 Feb 2021 17:53:29 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id 0A66D1E01E7;
 Wed, 24 Feb 2021 16:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5n7A7MvRs19; Wed, 24 Feb 2021 17:53:28 +0100 (CET)
Received: from pflmari.corp.cetitec.com (8-usr-pf-main.vpn.it.cetitec.com
 [10.8.5.8])
 by mail.cetitecgmbh.com (Postfix) with ESMTPSA id AB55D1E01E6;
 Wed, 24 Feb 2021 17:53:28 +0100 (CET)
Received: by pflmari.corp.cetitec.com (Postfix, from local account)
Date: Wed, 24 Feb 2021 17:53:28 +0100
From: Alex Riesen <alexander.riesen@cetitec.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <YDaEiDkTiqhy/r+i@pflmari>
References: <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
 <YDUg/9fjsvTkRUqr@pflmari>
 <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
 <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
X-Provags-ID: V03:K1:s3p4GpPlIibtMtsd0T+rBx1YemifN++yxDWIFYvsZPGHGjbbz6N
 FFqCtUDVgYHLEI2TojNYZyBnUqcLMaMjkh3IfmxhA9wfytC/DUzljYzY3oW+c4FLpQ7CNO4
 Ckx6L+hzK3N4cGACh37B3ANZQbvwzTan9Ccrf1Da0WAElXIFadWUgcdgtRUFd0HUPBaDcrl
 LzoKCoxv00P0Vyn5jbzAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UfVP4Ro3J6Q=:rZK51hNjVR63R271OD30XL
 ur88ubHDqdN9Im069WAh1mIr5PRkOL59BgX9+qLhHhZFaRBsmhY5vOlUGWSsxp2WHtdgGRNZc
 qX8oJnPSj36A1WjGsd0gX0+gYPMNAt57pHpvTJ5Lk3ni+h+1nq+uZvrqLcZX3tyOx9LSXdeGY
 8x4tn+xniat/0+qKA4jeciogl6lTVjBZQAcbxOdkO0zhn5+nZCPJLJ2o9OPe4LJSvWDdJS9Ve
 +TykXCTobwO8SYY1w9R7ccqlVc+gOCif1W+zY4N+7kSJrOqGrdubq+GwjXL9oMHvZ+7v56jZJ
 cOmS5r8AQoMS4lEzlw2l727BKTTTpDxxFWBfmhTkxYoOrTNZA1k1HkeF7620slgz2grlxkgYP
 lYe0V1pt366fJTuywDdmlW0eUSDGqzRviZljOuonbJ1bOrPoO7QtfrQ+cMz6hGQhsuHgta0dP
 ATbGeq7kvA==
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ilia Mirkin, Wed, Feb 24, 2021 17:48:39 +0100:
> On Wed, Feb 24, 2021 at 11:35 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > Ilia Mirkin, Wed, Feb 24, 2021 16:10:57 +0100:
> > > The fact that you're getting lines with modetest means there's
> > > something wrong with 256x256. What if you do 128x128 -- does that work
> > > OK?
> >
> > Yes. Unfortunately in both cases.
> 
> Just to be crystal clear -- are you saying that 128x128 works or does
> not work? (You said "yes", which would imply it works OK, but then you
> said both cases, which would imply doesn't work since 256x256 doesn't
> work?)

Modetest with 128x128 cursor works. Without damage to the cursor: modetest
shows normal cursor in vanilla v5.11. Modetest also shows normal cursor in
vanilla v5.11 with the commit reverted.

Which is unfortunate, as the only way to see the damaged cursor is to start
the X environment with modesetting DDX driver.

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
