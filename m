Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84F1C5DF81
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 18:24:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AF2C110EC3E;
	Tue, 18 Aug 2026 18:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ezQ1kMvs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 744B7478F7;
	Tue, 18 Aug 2026 18:08:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787076481;
 b=cslYz0SYpu0xlUSXERZOfIMs0ur5lqurB3w9w0yAnqYgoGzEV0uWvjl7CoClw2VoEIQMr
 jBdNRSVztXIJsdbCkAK7ieh2AXVFKw2rW/aigIC57qD1Msa9QFGVwYiX/MNRt8x1kYrIq5A
 6SmlqTZt1P7r+B7lK6vhIgsj+kOqpEcr3jf5ym3GKcuDbIvJAR+eONWV/3Zi4zTpPJwhgnF
 c5/ci4RBrHS/4hAoQZk1W0XrJPxZlnwgIp2P2ETEf0RiqtMcf8vfj3557cXTUxk0kGS74el
 Uvc/Iws708NZa1Xq9tmNwRHmaSnRZaKMDbzh/hZVjIEtjKAex2pj5BOhakyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787076481; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NRSlLd9Q7zWH/n4ZBhenQN+P3DSgLgejYrqhKOuEwfo=;
 b=pSk8zFk/24tg8WMSD8HsXgFd5stFAo8Btb7/q9g3UOsME7pm3zcVIXJuYGz7fG5sbpWZP
 I1cQ6mEJ5n9aVcN0CXJ+yDi8PgklRwF2zOcjZZ8kNliW0kvgcoqng+IjeZ9+kll6NY91TeB
 q+L1OqgwBq9VHRPrbxcKTA+yZ/h8Q5ZnrEp7eMjdO96hk1uE/Rr3Rze25ElYBfqFrhxKxFr
 JNzVR8ol8Ba8Vk5zU5LXPTHZhbW0hclUqtXUBXUfavKzqzvq6BQFtofDe/Gted0T+dWqQJF
 svtKXrLjWM/UcTaN/zhLwnm6h2fauoXxMKvuv38K+ftyiUrt6ArQCzVIH58g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 039E145297
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 18:07:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DE23010E4BA
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 18:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787077468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRSlLd9Q7zWH/n4ZBhenQN+P3DSgLgejYrqhKOuEwfo=;
	b=ezQ1kMvsqabdymitAYXZH7bQMS4aGJGr/vPdQDCXhVHQTgAGcbX0XPGKAJHRxKTYXf+RTd
	JHC1RUVZa7gAuzC9b8Po+95cK3FMR3QiPM8uQ/hSEGINJ+P/LbrdaJW45CtcSr52t/0ZsS
	DWcQm8/R9kL4oaNqxURZ1+RQH1iZuP8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-SkyxxKIJOjmAUWQcRzXHEQ-1; Tue, 18 Aug 2026 14:24:26 -0400
X-MC-Unique: SkyxxKIJOjmAUWQcRzXHEQ-1
X-Mimecast-MFC-AGG-ID: SkyxxKIJOjmAUWQcRzXHEQ_1787077466
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8eec6acbe21so3996566d6.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 18 Aug 2026 11:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787077466; x=1787682266;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EjK1grTNkC5kVSY96HRtQJcSC7mxO3Y6rELa2KIFGI=;
        b=IRU24pNX+d6d0xTQeSoQ2d6Wc3pY4qkoJuTMaHRtk1Xvq6Cxr5kcsKwIMX1M4Hdhq7
         Te02JAL5HELWj/Bomdc7vzsFUjTMpzDUlO/vOT1gXUiS4kRvaE0moW8SMFAHIFutLhAi
         KGzEDGKpC7ahFzOiLFK4OKBfD0ysstm6zGtbuQxMLPvzpTOnq5O3GYnUUTM5nmF6R0ae
         hL29tcm3upbtAJ6n2iSoFa3lI9S8UQbSuO+VtFyXOKgW07kvc3AhSaRRJZzG/Y6JIP7C
         zQQkPD3fR83INCKEtdelS3jlCi2pejjdpz4SYBiA0zrTCLQ4yncB1lsYr3Q/YPYE67Wc
         IALQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Robx63Hs0+OcTDu2BKCzSn3+m+kSJBlDhuV3E6VQWze+8f+I0jMDM2V7f3VRKdt9U0QdCgQmFyF@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyglyx4TyVgaqU8VQZf5UcI86xM5qRHQTQKvfI8KF4xT4i8Z7d3
	mPQ4dwo1Nmle7qkDIvgSRpql9FfkDXMtmEOHnQSQK8htrAVqv+rdMnjX2JjYdqFkmb1BpugTyim
	KI+HWtbH1zoA9w2sP6FaZxxlviTd2LvD6B2KdD6/HvhF1b4MIA76TguIUXmN+iF+lM0g=
X-Gm-Gg: AR+sD11SnbpWqg7Sy/JvJz3Xd571HcIhUIrl/NMbA6MafsrxU6r9tRU7XpP6VU+kVih
	oYhi0wW+E4HZBw4+Ex3RXLNbnjX2MD+vgVABV7HUn9np2bYawO6KXxpLGmrb/KS1F/yNfBl0bgz
	EFnocalBkPI/F4kWByUn2U4TG55hfbHXGSyCZEVHbgU771g1ThKBAuGaMmww07hmqldlkRV3o1v
	FnOKWs2RgOhuzA7Tr6+yjCJOOtRys8yxq6kqi73R6fxTIQHBHc6mp1LDb9FhWGYOWgUIv2otgWa
	MjEUbYjScJhv8CjrJ4//L4pM7RajVLhLnvRDWD8k91jtR4yRs9aNACzaUPrAaADwtKQY06sJ
X-Received: by 2002:ad4:5aea:0:b0:8f7:43f4:fe8d with SMTP id
 6a1803df08f44-90c5c423802mr2388936d6.29.1787077464214;
        Tue, 18 Aug 2026 11:24:24 -0700 (PDT)
X-Received: by 2002:ad4:5aea:0:b0:8f7:43f4:fe8d with SMTP id
 6a1803df08f44-90c5c423802mr2386196d6.29.1787077461736;
        Tue, 18 Aug 2026 11:24:21 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c4597695csm37005146d6.40.2026.08.18.11.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 11:24:20 -0700 (PDT)
Message-ID: <25ccdb08f6d84982fb211444dd766d054258e41c.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/nv04: check cursor buffer object size
 before upload
From: lyude@redhat.com
To: Zhenhao Wan <whi4ed0g@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Dave Airlie
 <airlied@redhat.com>, Ben Skeggs	 <bskeggs@redhat.com>
Date: Tue, 18 Aug 2026 14:24:19 -0400
In-Reply-To: <20260813-nouveau-nv04-cursor-oob-v1-1-3f3eb37d213d@gmail.com>
References: <20260813-nouveau-nv04-cursor-oob-v1-1-3f3eb37d213d@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zFLxmaKDE2MXW5hQrvxbwkfrXulgn-3Ts5nsOCKXU_g_1787077466
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DPI37R6LCUGGLWIMLUEASIKJLFACRIOK
X-Message-ID-Hash: DPI37R6LCUGGLWIMLUEASIKJLFACRIOK
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DPI37R6LCUGGLWIMLUEASIKJLFACRIOK/>
Archived-At: 
 <https://lore.freedesktop.org/25ccdb08f6d84982fb211444dd766d054258e41c.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2026-08-13 at 18:35 +0800, Zhenhao Wan wrote:
>  struct drm_file *file_priv,
> =C2=A0=09=09return -ENOENT;
> =C2=A0=09cursor =3D nouveau_gem_object(gem);
> =C2=A0
> +=09if (gem->size < width * height * 4) {
> +=09=09ret =3D -EINVAL;
> +=09=09goto out;
> +=09}
> +

A good start - but width and/or height could be UINT32_MAX, so a caller
could still overflow width or height. Would you mind adding an overflow
multiply check?

> =C2=A0=09ret =3D nouveau_bo_map(cursor);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto out;
>=20
> ---
> base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
> change-id: 20260813-nouveau-nv04-cursor-oob-ad2b6001de3d
>=20
> Best regards,
> --=C2=A0=20
> Zhenhao Wan <whi4ed0g@gmail.com>

