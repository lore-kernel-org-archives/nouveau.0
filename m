Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC9EF8DFFF
	for <nouveau@archiver.kernel.org>; Fri, 17 Apr 2026 19:44:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9D510EA9D;
	Fri, 17 Apr 2026 19:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ScaF/hWL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C74E945A38;
	Fri, 17 Apr 2026 19:32:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776454355;
 b=Nzqdl2tpN/h4/qEWZtNjI/KiwhISbUG31rWx2VA0uOInc1Uw3QVSIIpzhuABSLrqVsZ2R
 +Ixp2TnGNHLV5f0WVlN+TRrvHfFSHgoDL8FDFDoOlRVb49lo3zl0Oml3zjTVoFbHKBrvy57
 SGHGIhxDNzL0lKrr9wJlpvBx/LryK/UC3xAXewoEn0j+ZPPyfB4QedQ4j7N3nCkNGozhTK8
 7RKnV0nEv9VOtwvcMQVMYw7rmwColvoQwTB6GMPr7IgzZ06IUnQweqgjDTREkiZmXGlYAR/
 N2ZMyzc5P2+G6ufKfZbl9ou4PSMTYxc6PDXXCDRC+Z9Chq+Q8PDuZTD3KFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776454355; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4AUae5KcEeFvFh3msKQXl5hQJhIopamMvxo6YZ4ukss=;
 b=j5ZE12YFkkKFuLutognP/itqMw0rPmfWCIT99Zv1nhgeqgkyMHfnZD9ahMvbfEQAM8P+I
 SVTwi7nwJvjTSP8BiX4cSRxjrh7IUuEwLe4XVzOb2YDGc/6XU6sB2Gu/3EYVUcVrkDUUbK/
 YjAxtqbzrJzZZXCu3cnFXFqhi3hJiXVGGCeNlEWjMFn9QDFK+C+5VZ/ySbGyNJ11CCwwUS9
 Nzwig9gCu0P+nYBFypzXXj+6vPrxK2AedeCrCVGacuz5dOyTGdLPD/SSc6R5iGTT9qvA7np
 L+2oUIKJPlLQqnEuKbCg5XySjw3f227PKI/R/kQtWCBI2j5Kh4n54vAGOAtA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7FD2445A24
	for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2026 19:32:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F03310E2C2
	for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2026 19:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776455069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4AUae5KcEeFvFh3msKQXl5hQJhIopamMvxo6YZ4ukss=;
	b=ScaF/hWLflWAYuk0Z4w1zIK1BB61+gW2jXF0SUApYSVe4x6/DlccDRXxhm43jDEX7nGOx9
	zpJDpXFvARmjPhSqh28hZWVRlV5edsVAyQnK5OAATzw/144O3EdunQlqWyGIvYlNIBil47
	UtPKuX9K10QLLhIKOqjAgb62EcvYM1s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-iZz6hyrIOvG5qTINFzdyjQ-1; Fri, 17 Apr 2026 15:44:28 -0400
X-MC-Unique: iZz6hyrIOvG5qTINFzdyjQ-1
X-Mimecast-MFC-AGG-ID: iZz6hyrIOvG5qTINFzdyjQ_1776455068
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-89fe39655f7so51886676d6.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 17 Apr 2026 12:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776455068; x=1777059868;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AUae5KcEeFvFh3msKQXl5hQJhIopamMvxo6YZ4ukss=;
        b=jF9yaJEyCOUjwegF9X9n/gz8aumHQ3CEsnAbn8T/D8WgWHot0jxgtbmFYim7OKpwFw
         hBzAkmSYKKsaA74UBrduNtmT6t7/1LW/1wUfpE+qtCtOu0KUruQvxn9FN//R9qBa4PT8
         FvXgfDt9j1T55XVEeEvjSt7WzDI4ecYDwabxMeKIUpDv8+0S/ZFP58zZaV1iYWKhmS+c
         I6HPkgTzUCcaP09A7o+qCie+Udzw1tP+mWm+LF/BncOLhB17QMtx85dBENfVLgaNsf7r
         aRoNNqYeMtWE/+r+nrdmaMyTo7M7jo94TsgtQDFt3gdxbSPGfIA31Lsu3k0ZWXAZFSgi
         dCEQ==
X-Gm-Message-State: AOJu0Yx2XTlwU97ijY+5+BEqAfxQxwI1Nl4Jo9KMwUn5hthiGDWL5otx
	yUTXy7OpoKwyjV5dCsuugIfmMx07V388JnW2tNt3whkqpCm+D/1Mf49xKWOTrcve/aTuZjMNUU4
	5dDHzpFGPOIYNiHrSS2M3DFUwHRZ6KHfjm7+o6lGoceQ2IYo/jDC1wXtI6u9QU7AFWHY=
X-Gm-Gg: AeBDietFc9/LskwzVtqfCTpf7NDcFbe80JEPn5bX9CeF8GHbXY0qweQfDHVeBl2f090
	OV2+6Rqce6ASaClheIwZM9DjAhs/prxGPbl78rRghESzJRLslmfl8tf2weG7+94mSN7JmVTco8l
	Lb7kwXOmIYDjuujWG0W5oT4TuCdUTRYoCiIRQIbhcxm7BJQsw2f+hapFAyjw9ZNC2Up3r/rzOZa
	AyIfln01DGDrvl1Jf+EVRkAWA1bWYfpFqpxRl6jgYVgoMuxE1NMWpa8uud7A67otc9lU20oZsef
	fHVwyfOl6vCr7E3ixZLKUJWugKiV62yGW5osWStC5g377q4VV+pWMyLHWP0zAy5eLrLrad6wx+E
	pWa7KEcq1K4OzFpfSnylmWDdibLOx
X-Received: by 2002:a05:620a:4408:b0:8d9:ca3b:5ca1 with SMTP id
 af79cd13be357-8e789c5ab1dmr528960585a.9.1776455067619;
        Fri, 17 Apr 2026 12:44:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8d9:ca3b:5ca1 with SMTP id
 af79cd13be357-8e789c5ab1dmr528955585a.9.1776455067197;
        Fri, 17 Apr 2026 12:44:27 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8e7d9abce59sm243352085a.46.2026.04.17.12.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:44:26 -0700 (PDT)
Message-ID: <ba9d6fbd12a42d95e6349e232111d5e72e88e1d3.camel@redhat.com>
Subject: Re: [PATCH v10 4/5] rust: drm: gem: Introduce shmem::SGTable
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 17 Apr 2026 15:44:25 -0400
In-Reply-To: <DHPBAVQHIM11.XVBHOWYFRITF@nvidia.com>
References: <20260409001559.622026-1-lyude@redhat.com>
	 <20260409001559.622026-5-lyude@redhat.com>
	 <DHPBAVQHIM11.XVBHOWYFRITF@nvidia.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0hE7Bzr0QizyE1HJN2o8BqtL0dPFLfU1rBBmNrvxo3g_1776455068
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3QEKCCHE6A4JH6EBUZ7QK5AIMNCKE37M
X-Message-ID-Hash: 3QEKCCHE6A4JH6EBUZ7QK5AIMNCKE37M
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3QEKCCHE6A4JH6EBUZ7QK5AIMNCKE37M/>
Archived-At: 
 <https://lore.freedesktop.org/ba9d6fbd12a42d95e6349e232111d5e72e88e1d3.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Just so it doesn't come as a surprise in the next respin - I don't
really see a reasonable way of using get_or_insert_with() here (though
I had no idea this was a thing!). However - I can get rid of all of the
ret =3D statements and also clean up the indenting a little bit with
block expressions as I forgot those exist.

On Fri, 2026-04-10 at 16:55 +0900, Alexandre Courbot wrote:
>=20
> nit: let's use `let ret =3D if let Some(sgt_res) ...` to avoid the
> multiple `ret =3D `statements?
>=20
> Or maybe even better, you might be able to use
> `Option::get_or_insert_with`.

