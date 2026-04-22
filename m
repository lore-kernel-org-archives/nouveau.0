Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E970DFAD3F2
	for <nouveau@archiver.kernel.org>; Thu, 23 Apr 2026 02:55:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE1C10EF9A;
	Thu, 23 Apr 2026 02:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UlSkP8yL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 201F745AFC;
	Thu, 23 Apr 2026 02:43:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776912191;
 b=KEFWvixj/XwIfyR6MObfc/xnUWMuKiSAOYxghBTKPBcUjDcdqhrxREsf4v9jvJ/JEh160
 ixAcvUjP1ADiMZ0vrnfOQMTiJm3gTKn50JvGUV87jSnuofYdxTTMut2JMmnxUdRsuDn7t5y
 tgwLHF69/Ldel01+MIfjc7oaztQSW94iQTWhhCxUAX8mWfuwvdlMM/vCXMGzD7yvUl2MHXj
 o9ZCo40X4u9u+C1zFXQW9NU1OKtOveG3gIcvS1lVN/37YOzrgFt4TqkCkLd8Jj2VyUbbIl+
 saFqVf4vzhkAF19rmfuTqmq0XuJG2NsAtoAfiinUOzAXKtDwZYKRxPf8WLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776912191; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LNEiiKAr8tGgxUxPcWc2lJsVUeALFhcpoNoEGS7JOyc=;
 b=S3Czj43LP2j6rYuxQan8QEJotAAJRK8BL+pe0D7ZgwoSFYfvnQ3MlHAiys5j21T79W/MO
 gjnIx3XIbAqprG5K8urlJbX3xB6UbCDvslhmdDpg67lcW/rnhE0vYFc6cK1mpYYOYc0n4fm
 WuznvKraQOa+MCCakKsca5+l93uegVYrTcQBKV6NuWBf7mWfnk1tyHnafl6ETgqB8l/4gZ4
 Y8f0klgH7dP0gbbwZ/PFRQMY3bAICrqTdXJFaBpnW260GBOz84wKGp2Hu+gJgraL3ZnlIJt
 GhjIBdpmu040XspNzYHvU5AhxKGrJBrXwPTnrooS18yky9QDYVgKuVwG/KNg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6B20745A6E
	for <nouveau@lists.freedesktop.org>; Wed, 22 Apr 2026 22:40:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E15A610E2D4
	for <nouveau@lists.freedesktop.org>; Wed, 22 Apr 2026 22:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776898381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNEiiKAr8tGgxUxPcWc2lJsVUeALFhcpoNoEGS7JOyc=;
	b=UlSkP8yLGSSqGxDJ1XOe9SuMcKE4g22tQT5kqxy7BE0VmRNR4Mn4xrHua2iVx1UeqNeAYa
	KTh9qC02BTWPomaLemDqSLtstti6gCMOQ9R/t5bcBq+OWZ5UGgD5fZiE5byG62oLpb4NaC
	22FeXr+/kbZ4XBtbhTE0llx3n4aPLlE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-YOBeRDZDMQuGWzdyUacqTg-1; Wed, 22 Apr 2026 18:53:00 -0400
X-MC-Unique: YOBeRDZDMQuGWzdyUacqTg-1
X-Mimecast-MFC-AGG-ID: YOBeRDZDMQuGWzdyUacqTg_1776898380
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-50da31af14cso164780121cf.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 22 Apr 2026 15:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776898380; x=1777503180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDXm7aAVELWsp3pvLIzbso12bneOyuVrRAMZreDRWg0=;
        b=BR58lwdKhLe2aoDgg4ADQxs2cgN6CZDcK/gv51xn+cRgAf7qertLuQwVMSHBHd0uOQ
         fgyJcC21cZioR5AqlCzoaxUn1egym4ZxLZa3uEcwt2lOAcJQXO8U1tHTQiV3td2Lw7ap
         GaMWsRyUIVsNsH/2NNvOHzSVKPFsrmu4oVfAHjwyoESqA//5QRUSMDKWU43qPPIope9N
         mYG5bECBr4pewAjtT/CdXZk0D1mhuWByEVJIoT816Cn4Iz6EK7VXkCsPYgP1TAGjnjci
         rmen4MKjbtYZ5AwsTavkUyhT4dUrgSaHRFMzvIE0WEWfXTeYfiIm32kkq4xN0oc6ACeu
         QPmg==
X-Gm-Message-State: AOJu0YwqWU9LCVBQZvZJI4Bwaq109DjFYf9jskGn1z5Xt7QMPjG3P5ku
	VSPDNIAGh6z0QJtKupefXLDiBS9izqVt3HnrpUfy0oEqN6f2rX2wWW+ob92HE9HeFx9O9qO5RQK
	LAEPhsCctnBCaEn/Wd5d+el1oC6foQyLFSvnUrK8GKD4L9qSuXn1ltuKBBpJMJ+g0fghcLj4tJv
	Z3y4X9pM1HFZbAb6O3BMMeEfXxE0Fq1geeH/y04mwEgl2VLPk=
X-Gm-Gg: AeBDietHI+xlOXA4+JSAjbV1GFGob6OPy4TPEPF73C7p9cNcd/wZd1o9Uh5bZWdfy9g
	7+OEFP0EAi/fYuDks2DV8DW4iBTZSqvUag7lU/j/gcf05GoRLzzg+0R2QHsw/csIonnLdk5B48R
	BdsrYzqTsA1NphUo7CD+2Om9K4OSMc/U9rVqVZ9nPtBjZLj1uW97yQ6S3mmG6uX6Ym1IcHq9zsL
	5ViXZNl9g3LvrcBGvdFeIu11js7V5wqrSW0shCDlXNLWKVBgegHkDD1JPpSJggq344vPdf94W70
	0UCbbgXy5IMNkakFIHdX6EeWi1lF1lRJ7CEMsq/zdQ1ufT7kyaGvm+FNQfDr9w3NjzP3AJGi0Jp
	gL1zzciOokabJiAWqhQ0t5raoJUSs
X-Received: by 2002:a05:622a:4086:b0:50b:2876:586 with SMTP id
 d75a77b69052e-50e36820d3emr367722261cf.5.1776898379434;
        Wed, 22 Apr 2026 15:52:59 -0700 (PDT)
X-Received: by 2002:a05:622a:4086:b0:50b:2876:586 with SMTP id
 d75a77b69052e-50e36820d3emr367721591cf.5.1776898378914;
        Wed, 22 Apr 2026 15:52:58 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50e394c1fddsm151910251cf.30.2026.04.22.15.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 15:52:58 -0700 (PDT)
Message-ID: <1b2d926b919471fd3fbaf5b79d47e1110f6c4797.camel@redhat.com>
Subject: Re: [PATCH v12 2/5] drm/gem/shmem: Introduce
 __drm_gem_shmem_free_sgt_locked()
From: lyude@redhat.com
To: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org
Date: Wed, 22 Apr 2026 18:52:57 -0400
In-Reply-To: <20260421235346.672794-3-lyude@redhat.com>
References: <20260421235346.672794-1-lyude@redhat.com>
	 <20260421235346.672794-3-lyude@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zuhGtCSigL_mDorp118YP0Lzsrf9PjpG-y2H4HWGhsI_1776898380
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WN22KAOVEOWIGFBZGGR7AGJ352MXOG7O
X-Message-ID-Hash: WN22KAOVEOWIGFBZGGR7AGJ352MXOG7O
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WN22KAOVEOWIGFBZGGR7AGJ352MXOG7O/>
Archived-At: 
 <https://lore.freedesktop.org/1b2d926b919471fd3fbaf5b79d47e1110f6c4797.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 2026-04-21 at 19:52 -0400, Lyude Paul wrote:
> +/**
> + * __drm_gem_shmem_release_sgt_locked - Unpin and DMA unmap pages,
> and release the
> + * cached scatter/gather table for an shmem GEM object.

It appears that I misnamed the function in this somehow still, so I
will make note of this and make sure that it gets fixed in the next
respin of this series

> + * @shmem: shmem GEM object
> + *
> + * If the passed shmem object has an active scatter/gather table for
> driver
> + * usage, this function will unmap it and release the memory
> associated with it.
> + * It is the responsibility of the caller to ensure it holds the
> dma_resv_lock
> + * for this object.
> + *
> + * Drivers should not need to call this function themselves, it is
> mainly
> + * intended for usage in the Rust shmem bindings.
> + */
> +void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object
> *shmem)
> +{
> +=09dma_resv_assert_held(shmem->base.resv);
> +
> +=09dma_unmap_sgtable(shmem->base.dev->dev, shmem->sgt,
> DMA_BIDIRECTIONAL, 0);
> +=09sg_free_table(shmem->sgt);
> +=09kfree(shmem->sgt);
> +=09shmem->sgt =3D NULL;
> +}
> +EXPORT_SYMBOL_GPL(__drm_gem_shmem_free_sgt_locked);

