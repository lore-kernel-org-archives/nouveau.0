Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8EBCD5BD5
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 19:09:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5879F10F5BC;
	Thu, 28 May 2026 19:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="i679GdDB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E89D7465F8;
	Thu, 28 May 2026 18:56:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779994584;
 b=S92wV/3k4k34IfdDGvkvszjwIwilFkJqOiVs13DBqIjw5K/B60aXc3DVODVLIojWkonR0
 aGXUoHBDfRD0MN2G5/vtfOvuliWsN4Hf4L1hfccEnSY13LsmaKbXatNzkMfdegg3HghoX/9
 +Qo5DEfs6RVdvy8UQrhzOZ9K+jMeo6cHLIN/WXEGNp8/o+8lODy5QKHSaaCpVoqwRQU6YlT
 DR25qmhG38vOj7Bb541p5XeL89bGjRe/+UvCVkVshGgopvnrKUrmegVjQnU3cuUHMkAlopb
 EgmiGwKcD63qSBNWAKTUozav+C9iV86rmJlzdzawuh/41Kqpy8kMXmHmAe1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779994584; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fakoTULzpL8x2UFOvAiDOqwXfj/NdneAEJE6VOYhXQw=;
 b=ln9KeG9pzgP/5NKfWczjuwEsIvoU+A92h1g7HtuoTWUcElwqUSR/RtyWYItfThOCHx7fk
 y0YoopcZcIFGjGfkIzbz9uBsU7Pa7Knqtk2NSjji7NskoJSYFgG1huQuWFHHUHVaP7fChCn
 xDfmScAeoH7mfe1KR8BDk/nSxwyRzwKiGhOi+9/waR7//nEls5c4pCyvZWw+Z0jZPMpk64g
 Y7JrRrl+TqOXHdwTNHiUiuDBw8eGhY5mTE/reps6Op24K1R8TL5JX554BDz+AnHx0zqzlnh
 6n+wj3PFBYUOsQcTbSDaVIqM3ZyqmhJAm1qrjGHBLqapuIA63DPBKp34P4ww==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E45844021F
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 18:56:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D713D10F5BC
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779995389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fakoTULzpL8x2UFOvAiDOqwXfj/NdneAEJE6VOYhXQw=;
	b=i679GdDBINvo9/G+J1nKimaS/fLZBwjNdtfBPJJDU6tdDoknilMJ8qFzGeES4V2J257TnO
	Pvx4EMa/Va7HxnQoKyY1ssphif62licRSY52TdjArUPN/gkWBARW9Z9JDj9IFEaaHU+F42
	pfGixEmCavquUE1pczebFjHqBTPZedo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-tkwbv9E4Nvy_zyme4wRtZg-1; Thu, 28 May 2026 15:09:47 -0400
X-MC-Unique: tkwbv9E4Nvy_zyme4wRtZg-1
X-Mimecast-MFC-AGG-ID: tkwbv9E4Nvy_zyme4wRtZg_1779995387
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8aca29dcd69so168980286d6.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 28 May 2026 12:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995387; x=1780600187;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fakoTULzpL8x2UFOvAiDOqwXfj/NdneAEJE6VOYhXQw=;
        b=gR81gI5+K9cG33MI95iRdISLPdgWgBRVdQIzmTmSi3lE3ZzCx/E+YKI6VSVW2sGC3x
         C/38Ix7cM4kYlVi7q5lYYHTlBXqMDn1+UyvDXlpSQr8rA4s5Ln/wxlDvZYL2eLhmJlaE
         rDwS2QgYiKV//gvMBCrjSVMJlKFRoTl/ZsqUBVvM1N4XLh+94ex36cJUxlRVEwPJTsYi
         JT5WXmPMilPTMSjc/FUlJswi1yTlVm87fcZuifNSTU/ui0MPydo5MWmfsYa/02t06pFv
         KFWkYBY0hkAScS7ZxZRSJTAmUoYlr1hhwuVN5a2YsCGPXfiAgcxoMbkhKrVkiIHHyGjs
         MmgQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+JHDADYn/CsROJiHH2pRKV/Mxghz3ttHrCc9PnDVC8B67ag9OtiDjeGzeyEzSI/OavAKBgGijM@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8mTKVRrIhxhKxSEIS3U72vVNMgfnpTV3v8Q1legdIqwhLpCKE
	X1u9UVNLDzg7UMo9x50a42OWQBbkVZc1ZbUCcmUITSY2ge4YXMEvjXJ+Nj7gOUQxZnKukRIuoqf
	DrmofC9tRUZDOZiHAi0KEBp823gtuD3SmRUe5xIWAINHiDBI/l6FJrF79i/0EGS3n3R4=
X-Gm-Gg: Acq92OFdLbgvQIj5S8sklL/P9JcwB5ip7gUybgEOeb6DhW9vAD/S06VNJht5bjO9Fl8
	B92DFdbfk9DkmMCrXscOK1+TBef4by2/1Q+7JwQrWolhmeVhnZwJ+8W1I66iMfWh37OkUVOUr4D
	F05rHdtVNnAlloVQcPbxze/Gq89EuNxMLFt6sHYWSX2PMQxrdV+ON8gw8Pd/1zbT16Xf+GEUIvs
	9nHTUZFenqe6rZAZEoCDtRCixKdB3GiGGVKIP5i99urMvNqTfUjsMt2CXKKMo5rVhrl0c8XAUEd
	92yhrj3hoktPxyg+0YP54WIa+/Z3n28cey6+dOjXQzohhM61xuIXNs5xtuDrWg7BeDmM3tNFi+V
	1K2i7FPYC4rlImtDHDCdpmux5VjqW
X-Received: by 2002:a05:6214:252d:b0:8cc:1010:bbcb with SMTP id
 6a1803df08f44-8cce216ca21mr7628956d6.27.1779995387394;
        Thu, 28 May 2026 12:09:47 -0700 (PDT)
X-Received: by 2002:a05:6214:252d:b0:8cc:1010:bbcb with SMTP id
 6a1803df08f44-8cce216ca21mr7628396d6.27.1779995386957;
        Thu, 28 May 2026 12:09:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cc812e2018sm211434596d6.28.2026.05.28.12.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:09:46 -0700 (PDT)
Message-ID: <c45c2e9096df0b407fa67ee5caee6b4641e2c8ab.camel@redhat.com>
Subject: Re: [PATCH 0/5] nouveau/gsp: Cleanup IS_ERR_OR_NULL() usage
From: lyude@redhat.com
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Date: Thu, 28 May 2026 15:09:45 -0400
In-Reply-To: <ad1ab3a555ca34f37ca4d7c20af5f4cadc4558b5.camel@nvidia.com>
References: <20260528062451.54107-1-zenghongling@kylinos.cn>
		 <794dbd35fd81f03478cdd3238d3d506d0d800187.camel@redhat.com>
		 <DIUI56CABZAF.3TU7XCIKTV93R@kernel.org>
	 <ad1ab3a555ca34f37ca4d7c20af5f4cadc4558b5.camel@nvidia.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IZL1FMH0o4OF15PUwIy-z3YXo-lhGczhyTelXmbrVEI_1779995387
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PRI4JRJCZODC3UW3SVUELLOCJFRYOTSU
X-Message-ID-Hash: PRI4JRJCZODC3UW3SVUELLOCJFRYOTSU
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "zenghongling@kylinos.cn" <zenghongling@kylinos.cn>,
 "bskeggs@nvidia.com" <bskeggs@nvidia.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "zhongling0719@126.com" <zhongling0719@126.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PRI4JRJCZODC3UW3SVUELLOCJFRYOTSU/>
Archived-At: 
 <https://lore.freedesktop.org/c45c2e9096df0b407fa67ee5caee6b4641e2c8ab.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2026-05-28 at 19:06 +0000, Timur Tabi wrote:
> On Thu, 2026-05-28 at 19:56 +0200, Danilo Krummrich wrote:
> > I think at least this patch has to be reverted, it causes the
> > following oops
> > probing nouveau on my machine.
> >=20
> > I can't currently look into this, but I think Sashiko [1] has a
> > valid point on
> > this one.
>=20
> I'm not a fan of this series.=C2=A0 When I saw the number of patches, I
> was suspicious, because I have a
> hard time believing that there were so many functions that never
> returned NULL.=C2=A0 The call tree of a
> lot of Nouveau code is pretty deep, and it takes quite a lot of work
> to ensure that there is no
> "return NULL" in any code path.
>=20
> Nouveau is kinda sloppy in this regard, which is why IS_ERR_OR_NULL
> is used so much.=C2=A0 It's a safety
> measure.

FWIW: I already sent a revert for the last patch in the series which
needs a review, but I'm happy to send out a revert for the whole thing
if we want.

You are right - I did actually sit down and try to run through all of
the codepaths for all these functions, but there's clearly a number
that I missed and should have checked sashiko for.=20

