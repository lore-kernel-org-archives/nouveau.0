Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0FBC5AD7B
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 04:06:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD1A10EA53;
	Tue, 11 Aug 2026 04:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ecfoKKH+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0B67C47695;
	Tue, 11 Aug 2026 03:49:48 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786420187;
 b=bNjRmDcMQQI9bWIe/dayzcSZx9E0drcu/h9XKyVQGUUtZHp0cxB/N/waMa0uhNP5+gR5A
 8aPbHNqhiegdly5sGd42GXB9iQ1YnmXrWixcUiOCtEQozX6j7zVWu27y64zVdaKjV6sm/Xh
 HTUxhn3awz8LIZojN5W+n9DwNh14ntqOuSvlWVM8jE3o5FsQhvC5+ltI3s2coJSjQeHXsfO
 Y7GiKOmdeDpiOMSCRaHgDo4qY3rQgifkk168bj3zi9QTMS/ve56S2zmBIx21c/JRA5ujodZ
 g3umLMYDogNT87QrOOolfoPBGEmpbT7fbrgFvbhqmDGdvRcKWGyauMsI02SQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786420187; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cHpnkGdhgzlYq7979nZPO/96+5OTEhnencdtJNs5i5Q=;
 b=jeD7MT6p6NrOAeRYsZOPzqRH+uJdFkuta3p6Q1idrX+B3ELx3sII+V3ofsxAV2fymYlRZ
 NGgkRW7Nk3flyfFu83UcdVKImGwsd1C9xmEeAwz73GGDzigUcm5WDGVvVfBC5cQXb7u6+0q
 ntm1gODva6jJi6KDBx0cLapUAMAhBsVyCZMlMS3yXYsuOYKavZevg5XNB68Noh2j2gIPRcW
 LAV0IJclCwvK9GuqOZ99+J/GiYY4ks+uc5zTLVOOH30mO9iiTIwxE243BSD9MiTibDwKoe5
 e3c56ihAficv6rH+XK/VGNpE3evM8HDsaWo9aNCu/rRJ3XCSuQIrOPkjl9dA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8686A47682
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 03:49:44 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com
 [74.125.224.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACD7E10E27D
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 04:05:58 +0000 (UTC)
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-6689402c7bfso2752873d50.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 10 Aug 2026 21:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786421157; cv=none;
        d=google.com; s=arc-20260327;
        b=ED8x9ahpWpHBcHiFksGDioVOY68AKgkcehe/HmTPJSFpVGmsLyCeMlLWF/I3rI9dX3
         Atrwxc9uoox66NpXGOqYNpi8+khdn5hraxr98HI0GVdfwvC3IgKU2YlZYcN4i2OT3+/1
         mVLDl1PRvHtATZ1Qke75kWjl4f5xmmN+8CdM96BxjNJ96kLGdztxxQp+3Zos2zZdFrJn
         Re1WIJbZvEykapnof7Y3rfvCZ2y4/XSG/551qnRazg6pHJ7mdaqeegmgocVjf0T+rPHu
         3VBoyxRtPCVcAymGaKFRsOrX/ptEMrDl0N1zgehgCaGfsA4hA9zNJ+Wjeh5tOMGgXkrH
         0QiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cHpnkGdhgzlYq7979nZPO/96+5OTEhnencdtJNs5i5Q=;
        fh=TNIEmG+KVuYq31h9IeEhfmVBUH2jVmV6pyif1VVA5WI=;
        b=AUPRTsnXSwolUz7y0MVoCccLBEmSFpJ706ssthlseeoDg3bbR+sjQPwlkRhqSu/oVO
         rgEuprfdc2lzcFRIGGod251HcVUDp5+2IaIiWFS+sZ4nrEoN3a2o1J9pFGYVu0PFPCTQ
         9H97a+DMcuF+3i8psJABhHtfNf82g6LoCbvaq2gzrIrzJpLGG3mpK0DIVIPaD1LAPuP1
         xZAq5fEERRPYATWgV8xKDyuEr0rjj5+mVpJUD0ARUvBGSHJqCHT6z4cweT3GnaazBbiY
         fgUylMP4U2gJi7r9vqiVt+Hc7AOOkjUQdGDI0YTtYtA4AGTNNpzNhLuGNBTVv8lhvdsW
         C53Q==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786421157; x=1787025957;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHpnkGdhgzlYq7979nZPO/96+5OTEhnencdtJNs5i5Q=;
        b=ecfoKKH+ibHW6lzi8iuVRK4LaJkztYPh+wpVEdAALMLwCXz1uAWEn8n33LPCo3XWBP
         9VvpvQMgTZ27yWegGZVwbHLpsL0o2hL92rWSgCM3CJ0WjZlpTtOtBThGavySsmZ+XiUk
         Crz6PbOwi0+8hKFfFWAoPtofKPBPTBwlB7XEbCvHmaEgozg1nCugDfqvTG+U6TqrXJ2A
         pMVu4EqmknGM7mTPeUX7ftvxxngBPFh95LkD5QSBELlqCNsX6CK6vnL0DfbQcLcL9e9s
         tGO5sbBCL6AKdWpi7z4ZQQtSIPfFRJuovTyRlx0Pq4uUw9EQUqf9EKNDY+2sayH/sSom
         RfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786421157; x=1787025957;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cHpnkGdhgzlYq7979nZPO/96+5OTEhnencdtJNs5i5Q=;
        b=rDa6KMNWmAh8guDx1bKSXYNjZ8oh1BshlLgQAXUAB4QsYzIzTE9ALjn0Rnw1t9K0GU
         guDepMopdiLq+NOestrPx4W6yrQGJfH1+s3xEJterEsSdHpuUJxtGibaSC0QjKDEsx79
         3QUQyW/bXeIlVWjn6e1n1oHG4sqGCGB7sN5mfPBOUny9xXixBfb23/38RuRIUWQQoKnI
         M9MZ2S6YiyREGq1SnS5J4jgYfiI9kGzrSZRhiDUvEFJ7y7C/jIkHt5m0QSPowZJ7+eJW
         C9yBBZX/wMQLy+0r2FhN6mCqNUvi6XYrAljmvEjxorj02aVSiSaxqqqU+HuxoSpZBJoz
         Kxdg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpkRc+tUGz5zzeVKhuhRXKmZtRSu5f/HAiKIIP8BBFnoHACgZjPDln/3G24yNMF+9i+0qCA8o4I@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2pz7h5VUn6eBh8ahDArZtyeGHVh3o4hlV+4zDoz9qKTjp8amk
	QX8LUeDYXq2Jc9ywyGMQ5UsigBjQfNxbF1YCzaSWHjLapLVDSQSWHRZ0G6UyynVh6JyQls5GHdY
	lmZ0WaIWicuMg7mR8vl4WZ3c2Ksi2zSQ=
X-Gm-Gg: AR+sD139lQ9XKPWGTi/n85FeCMOLqKsLXnVTQPm2sjXRqXno78hqQMOfTQtcDnJV9dE
	OpnH/gK+kMzyckLWy7tilSP5vlmOWvBFMfwjStH7kmHFgIMGFCmOEULp0uiTegNVbvBNbhqeEkq
	x4qn4lbHE6UU21ONWM+K5X3Cj86n6cAhpYs8eHPzsN5Mdilu6mBf0QU0QUuQXnmjA7lLVLdqjdD
	btWSyxnkpXcTkxDWbvJGDjpLFJGVECEXhThPuJMI56DXI++KLYcrCoyLZhz2fW+SeLY/ZFhNE7F
	d7D90IVzPtgBm7oFZPK4FbQubelyabd5rhoS34ROSPGGAzweYIAsW3d7CEij4NVNaLKY6qvmK/R
	c4wbQjDd0B+e2ScC7r0FQf7XUz9liJA==
X-Received: by 2002:a53:acdb:0:10b0:666:541f:6355 with SMTP id
 956f58d0204a3-66b22ed1439mr132084d50.35.1786421157461; Mon, 10 Aug 2026
 21:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260808-nouveau-fixes-v1-0-c3ebdc17a89c@outlook.com>
 <20260808-nouveau-fixes-v1-1-c3ebdc17a89c@outlook.com>
 <CAMwc25qozGSRw8KKNzVhakH1jCNWsFS_z=mFn9hswxjdNNX0GA@mail.gmail.com>
 <55965C34-9026-4EE7-B2F0-1D5D9807D682@outlook.com>
In-Reply-To: <55965C34-9026-4EE7-B2F0-1D5D9807D682@outlook.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 11 Aug 2026 14:05:45 +1000
X-Gm-Features: AUfX_mygO8g3uDRlU_tKv8cfeWEPc5DomvcU0l-wKoJbB4Wcs1CRG-FE0Jl6bRo
Message-ID: 
 <CAPM=9txG6wEwx_L5RsB+3gEuT6dYJQvrPpQnHHF4V1gFZpWNFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: bound sync and op counts in EXEC and
 VM_BIND
To: Junrui Luo <moonafterrain@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: I2CVRWMOLBT4VJS2J7RKK2MSUJDT5CUT
X-Message-ID-Hash: I2CVRWMOLBT4VJS2J7RKK2MSUJDT5CUT
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: David Airlie <airlied@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yuhao Jiang <danisjiang@gmail.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/I2CVRWMOLBT4VJS2J7RKK2MSUJDT5CUT/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9txG6wEwx_L5RsB+3gEuT6dYJQvrPpQnHHF4V1gFZpWNFQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 11 Aug 2026 at 14:00, Junrui Luo <moonafterrain@outlook.com> wrote:
>
> On Mon, Aug 10, 2026 at 08:43:50AM +1000, David Airlie wrote:
> > Have you run a complete Vulkan CTS with NVK across this with no regressions?
> >
> > I'm weary of those limits being too low, but I think the only app that
> > might push them beyond CTS would be Forza Horizon 5 or 6.
>
> No, I have not. I don't currently have the hardware to run NVK, so I can't
> offer a CTS run or any other regression test for this.
>
> Is there a better guard that avoids a hard limit here, or does this need
> a test before it can go in?

Looking at xe it also has 1024 limit on number of syncs, but it
doesn't have any limit on number of binds,

                *bind_ops = kvmalloc_objs(struct drm_xe_vm_bind_op,
                                          args->num_binds,
                                          GFP_KERNEL | __GFP_ACCOUNT |
__GFP_RETRY_MAYFAIL | __GFP_NOWARN);

Maybe nouveau could do the same.

Dave.
>
> Thanks,
> Junrui Luo
