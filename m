Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1ECC43458
	for <nouveau@archiver.kernel.org>; Wed,  1 Jul 2026 18:05:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFCB910F0A3;
	Wed,  1 Jul 2026 18:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aQ42iYJa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0AE6746E11;
	Wed,  1 Jul 2026 17:50:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782928229;
 b=lqhtGVZ+inC2s9yTEaxw+xeX3qAXLvQL/eJ3P6AhDK/FY2E2iTWiuc9Ko7Cb1bDkD8pHQ
 f+tqZEZUNoeZBiIMFs9PugbOOzPkRBjwo35VDL2gvhPq2G5uaQCctZEn0v/JT8VP9xiQ2vW
 3O4bKam5ecqzfAx8z9LWBvuboeIZILnAYwHJANlRx84AVAKzkzpGFrcMtK/BTCAZKoveuTB
 1JEO7xDNqk2pxVx3ToL9Kce1kRPQb1FJd4VJuw773E0m249Ud/MfNPy6qnrdHchvPuY4F08
 JG/dHLxXPgNh/Tm0q/SjA4WfT+TxgW4yMo7k82IDFpfb8NWhG0dhDM7OvpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782928229; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OODTaDnvsDCSyQDqhi+9lLSiHjNYGjnSHMMEy2JQgew=;
 b=V4m3r9QjAefzhbHheIcWaLsgTCpLH5sW2YG385TsKTnhpWDMG+qn7VMILOUQDK/Jcyvnk
 GpuxWKYiuFavl1ogoROvsC2DCDZC+fSVd/QSSw/dm2JroVzHxLomONf3ZAIKnPSzUYvR1ee
 4POl5EIpIXRAVosas1ODNuS6xw63JMYA/iVulVfBElre17CUTjKYaMi8MgwAfJUz0y31ILb
 x2iBT4bVG2G86N4fN35Z5iULD5kATmzbywp/dQiNsZLkxggs7WMn22U22WLcEXG4CXkfFtS
 sGq8mWjXigcavXIsSWhJGlZS3DOMurrdhjrd3KIZfRH+ZsNP1bOlDO6uKejQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5BF2946D4A
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 17:50:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD0C610F08E
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 18:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782929110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OODTaDnvsDCSyQDqhi+9lLSiHjNYGjnSHMMEy2JQgew=;
	b=aQ42iYJasLORRPAlrHV5QyFx9GLSVqs96Ungg/W2MtrCIqfkkdqfy243KE5wbvyVhdgOFV
	YgJ6Vn1zIxlGh1GRBOO6MZOB0VEvuGjd4BJI3U4giPpTGBy69D0oLl1l9e1stEl7RWbwin
	LyC552+fHxufV3P9yUhTZo5e8+zS8cw=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-L-3Tsq_wOWiXvB17w1vcPg-1; Wed, 01 Jul 2026 14:05:09 -0400
X-MC-Unique: L-3Tsq_wOWiXvB17w1vcPg-1
X-Mimecast-MFC-AGG-ID: L-3Tsq_wOWiXvB17w1vcPg_1782929109
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-738ffe90415so249076137.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 01 Jul 2026 11:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782929109; x=1783533909;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OODTaDnvsDCSyQDqhi+9lLSiHjNYGjnSHMMEy2JQgew=;
        b=pskXLv31SxuAI9h2lHArfTvHB3ENYlBIuHMX/AewkOkcRCcPr+YUVSTFpIlRBNy274
         gYHfSZX2MwpWHihJ5xUiwD7I9IZxZsMwAlJOdiV9zcEKmaXnoRe2yi4XJztumJoxNnme
         FOIrUBw5X9MPzvG0VnMgn9aKmSDf4/ZJj4H19JPprEJU6Jsh55BUr1kFWm0OYkjost/P
         fPFkb7Gxk+QKhydJFB7fNGVUMp+q69PmhOdpyBjvJL7fFwwmgP6zZaFjXx8L377EVujg
         R7EQCCvdFE947VwSyWzutrw+G7aKTCO0/3sQz/hFDx3VSG78jA/d/KmtxAg9gyOk6qEL
         DK0w==
X-Gm-Message-State: AOJu0YwXfICB8L2mQwMWasmKl9ziG6PBNZtCYM04yEcPEnY36NS6YM+k
	dxCnjxtnMJfVZZAJNmCY32krItikcIAxjxwhCStyvhkMc3YBPlSnpeyY9dIUUaxIkUOkKijOPFy
	YiDWVN8S52aMSDco1HQoN/C/DPxesDEbWKYoOBuhWLx2cgC5bcrzZPgw1J1Nnhon2vm4=
X-Gm-Gg: AfdE7ckAk9QL2Zp8vRLAzgRaiP8KhOZr4GkitqK9CSQg0omnlbNoJuP0Zb/P0bVpkET
	ftLjHUIgxofrL7PXFafNTFoiups7JtHy07v4J0Pe79u5lsxzbq81TL/sKjF5NTK/dAKk7olEAvD
	w0ZVIglLVHza6q7ncanwaWx2mQyttmOdgz7+WovcHUZ6SpgXo3Z0GLSuR0ZKFc/dAmlkuViqeJ5
	y65VXod6K9B9WLJfA3H58K1jMyghkmDItkGPZO2yBzsrqnPx7Asx5k+PvQkZ9rs/bCm36BJhyh0
	vd+QUpKeATGt58vQzdR0UOUFZMfbGF1xbNkc6DIAf/HvgNlI/XetubFfga9A9Q3+lXMLiebgOAg
	Okv8KuJw=
X-Received: by 2002:a05:6102:161e:b0:739:8c52:f2b with SMTP id
 ada2fe7eead31-73dab0e55b1mr1293972137.18.1782929109021;
        Wed, 01 Jul 2026 11:05:09 -0700 (PDT)
X-Received: by 2002:a05:6102:161e:b0:739:8c52:f2b with SMTP id
 ada2fe7eead31-73dab0e55b1mr1293859137.18.1782929108349;
        Wed, 01 Jul 2026 11:05:08 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8f46e371bdfsm3587256d6.1.2026.07.01.11.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 11:05:07 -0700 (PDT)
Message-ID: <a364263867ac16831a93e3ca3a5e4125da347c91.camel@redhat.com>
Subject: Re: [PATCH v2 0/4] drm/nouveau/gsp/r570: Fix runtime PM
From: lyude@redhat.com
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 01 Jul 2026 14:05:06 -0400
In-Reply-To: <akOthKT6XeaUnhH6@ashevche-desk.local>
References: <20260629224350.2870201-1-lyude@redhat.com>
	 <akOthKT6XeaUnhH6@ashevche-desk.local>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o3dUGO38_gpo_6D2bX3Ead2ikOHNXrfAtB5kMKHBjwA_1782929109
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MEA6Z3NJ63OL6GJIZ2NZLZN2C4ZUB6AR
X-Message-ID-Hash: MEA6Z3NJ63OL6GJIZ2NZLZN2C4ZUB6AR
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MEA6Z3NJ63OL6GJIZ2NZLZN2C4ZUB6AR/>
Archived-At: 
 <https://lore.freedesktop.org/a364263867ac16831a93e3ca3a5e4125da347c91.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

I forgot to link to the previous series:

https://patchwork.freedesktop.org/series/169227/

I also thought i hadn't sent a cover letter for it, but apparently I
did - I would have reused that if I realized, whoops.

Regardless: I'll be sending out a V3 today, since after doing a lot of
testing I came to the conclusion we should drop the change from LEVEL_3
to LEVEL_4 but keep pretty much everything else for now.

On Tue, 2026-06-30 at 14:50 +0300, Andy Shevchenko wrote:
> On Mon, Jun 29, 2026 at 06:42:32PM -0400, Lyude Paul wrote:
> > Runtime PM has been kind of unreliable with GSP for a while. It
> > works
> > well enough to shut the GPU off and turn it back on, but more often
> > then
> > not it ends up leaving the GPU in a broken state on resume - which
> > makes
> > it impossible to really do anything else with it.
> >=20
> > Recently however, I discovered that it's been failing much harder
> > on
> > some ampere systems. This lead me down a rabbit hole that lead me
> > to
> > figure out one of our previous fixes for runtime PM wasn't correct.
> > After fixing that and combining it with some fixes we had tried in
> > the
> > past without success, I finally managed to get nouveau to handle
> > runtime
> > PM with the GSP perfectly. These are those fixes.
> >=20
> > Tested on a Lenovo P16 G1 (100 runtime PM cycles!), and RTX4000.
>=20
> This is v2, and no changelog. What's going on?

