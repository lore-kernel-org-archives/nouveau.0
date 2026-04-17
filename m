Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AA3F436BF
	for <nouveau@archiver.kernel.org>; Fri, 17 Apr 2026 19:46:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 98A6210EAA1;
	Fri, 17 Apr 2026 19:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Jx4ahSJ7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 29F1B45A39;
	Fri, 17 Apr 2026 19:34:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776454442;
 b=gaz0zNC4SocM3F8Tyy9iVPigwdstN6Oe5ggqc7K/5y41JCHfNLDFQ2VrRp80Y3DljSRmf
 kKG2Ub+6tspjDlp9NsOlTtEvK1AwRGTw24yvecdfqnzj9RdJxS6gq5gF5tUmnmZIOTu1gz6
 c96SboRVKmUbCNfCw+udPlUUYJ8tF3ArRlZfOhTAIU7H4/eL7z2gtd9M4WW9oaYkh2hbcS4
 EgnwJfR7LHix1xv6VjxzTF6VpkMvzJu7z5oOktLKSnAkge3dtgP90ixJ92SK9y8QkRhhbk0
 vP8rclxFDewbvKGkfyvkLjG6qi9dDHG4ZtJiYNorLqLmaQ3Tqwp+yU4H+v4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776454442; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JyF/IwexmA4DSB1w6L4ViBDKOIzXHAQn3+2YDMuup0k=;
 b=OmozKjVjZcLs2wWvSJ6MZUXUQXdNh4x6+aZkhUX94Agf7dYgg2tUwFzzSMqJJLswdqnHh
 4SQ4ZyMkQdbnCWjHwmWaJdgPw+kbsivDPvmTNIgvuq5fdBPQRnDSljVg71AZb+8OmcNEncP
 pWn/g+ZD64K7k4Va4GGYHOFFrf1YtrzP+OTnIIXfadU55+oiwDrmg3z3JIfPDcsPOSE0gjS
 5CPg02Ux6cGyUjzDIWU2bN7Jv6x4e2gRxWujONqD9LV7ixrWRucoDUP+KAVhJ+slG/zm0Gh
 2lvvdRHA78tdRgMY9w0O5+TAn9EGCipF7h8EpHapHgWq1InGFIVV4Kiuwi5Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B915845A24
	for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2026 19:33:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D667510EA99
	for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2026 19:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776455156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyF/IwexmA4DSB1w6L4ViBDKOIzXHAQn3+2YDMuup0k=;
	b=Jx4ahSJ7BogJhhKDxUjAmYdeRiJe5ufGIP4fT8PnYUG3fM98EYtof1mHDEg0fjP/K+kpVC
	QGZrR07kF6u9T/2YSTjYaua6Ngaad9D2aaVyFiZrubPuRwNRtpoN0kVs/lCgAY2w9IkcgG
	0Qy0OJR7fvreYy5QCvo5MeaxfSgZAg8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-BLW2FPq7PcqS9ZN8auOwEg-1; Fri, 17 Apr 2026 15:45:55 -0400
X-MC-Unique: BLW2FPq7PcqS9ZN8auOwEg-1
X-Mimecast-MFC-AGG-ID: BLW2FPq7PcqS9ZN8auOwEg_1776455155
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50b4ca7e7c2so20020481cf.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 17 Apr 2026 12:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776455155; x=1777059955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyF/IwexmA4DSB1w6L4ViBDKOIzXHAQn3+2YDMuup0k=;
        b=Cf0Pw2AvZpTQVzyijn4FyPreNkghJQSE9nqmIPajUWJ9wk1tfDuyQAFI4fDHw4it57
         BySpWfwAmV4+kfHqntCtxpxm7SLokZMHBvdSJ45jLGCNBVuOU9dsJJQjbz/xoBDfBp2u
         HLbAR5ypUSGfW+zTY+xMoRCnftU2upfHHXVHk6ifnqJnaR/35MNEMYY8iu0UaFG8bAb7
         WNAUecvPV7wReDHdX5MxgsDVthx/segF/kSHx6cM0tqhF2l1u5YXzjdGCgjCFd/izB6L
         4mO0Dp3tSe5Mr+61jhNc9c715eieg3LAzeqsx0noBi+hmq1MivLNJzC3f+On5zMGr8y4
         x8BA==
X-Gm-Message-State: AOJu0YwId3ZICwJiHDPInFeBiYfwRpNoJRosVTOT349CzY+etqwbAtgi
	mIom197GrQWRU+N1MZh6yB7SK3VsIlEJESaimc9XfvM9I43YQd0lxX3fLAuiCGSfJ7Uut1kWXkX
	1D4xqPJwzxr78VdmWjO38hImWI67V/kp/m8lQA9yF4TK2ANIC20v/Nu7LIEvjqrdlOuo=
X-Gm-Gg: AeBDievCVoqPULBS+OhUKCAWM+aWEZeO+8zKKAN6O5TFrVVO2EX4uHJaLSRGX8ONh+1
	taZJtmYgJYBQU4r8+S2nIYIDQZ9ZbMaNfbpTt5dqPLk2QrzEyfUVXt1Tlqus6LPeWHOKbUyQjpR
	BJRHeXEENAzj0v2LqNj4k3J0eRpABsg070T20s3M/iZraLkdIuDys/X6kL/cCf6imODNBaNAKMk
	NckeVl78oh2tQ8Oo+9jVfPIRL2dzU23IyI9Eaj/v6UPEpffkrju2epDQCbZqhgbr/bpo0B4DX09
	H7x+AmUzlfcuOAfC2eVUkvcclGXYAjVDepvmEa2Qp+qTIAYWSy6dEZsz47gJljEy5RSHRhjfDAZ
	wT2TmdU9ShJMyfdyvG9EVUN1HDKH2
X-Received: by 2002:a05:622a:1189:b0:50d:84a7:72d0 with SMTP id
 d75a77b69052e-50e36e9c0c7mr60319541cf.36.1776455155151;
        Fri, 17 Apr 2026 12:45:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:50d:84a7:72d0 with SMTP id
 d75a77b69052e-50e36e9c0c7mr60319041cf.36.1776455154662;
        Fri, 17 Apr 2026 12:45:54 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02ae97347sm18023616d6.41.2026.04.17.12.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:45:54 -0700 (PDT)
Message-ID: <34695156e1db9195eee105bcfd89b554b6ad32cd.camel@redhat.com>
Subject: Re: [PATCH v10 4/5] rust: drm: gem: Introduce shmem::SGTable
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 17 Apr 2026 15:45:52 -0400
In-Reply-To: <ba9d6fbd12a42d95e6349e232111d5e72e88e1d3.camel@redhat.com>
References: <20260409001559.622026-1-lyude@redhat.com>
		 <20260409001559.622026-5-lyude@redhat.com>
		 <DHPBAVQHIM11.XVBHOWYFRITF@nvidia.com>
	 <ba9d6fbd12a42d95e6349e232111d5e72e88e1d3.camel@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aMWdb3lHjupsyQX3lS-UnkePLtGe5b631UfI-AmCWrQ_1776455155
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WEFKKGOFFN2RRQ227S2BWP74KWDHSTEG
X-Message-ID-Hash: WEFKKGOFFN2RRQ227S2BWP74KWDHSTEG
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WEFKKGOFFN2RRQ227S2BWP74KWDHSTEG/>
Archived-At: 
 <https://lore.freedesktop.org/34695156e1db9195eee105bcfd89b554b6ad32cd.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

...realized the moment I sent this I meant to say labeled block
expressions, but also I realized I won't need those either anyhow :).

On Fri, 2026-04-17 at 15:44 -0400, lyude@redhat.com wrote:
> Just so it doesn't come as a surprise in the next respin - I don't
> really see a reasonable way of using get_or_insert_with() here
> (though
> I had no idea this was a thing!). However - I can get rid of all of
> the
> ret =3D statements and also clean up the indenting a little bit with
> block expressions as I forgot those exist.
>=20
> On Fri, 2026-04-10 at 16:55 +0900, Alexandre Courbot wrote:
> >=20
> > nit: let's use `let ret =3D if let Some(sgt_res) ...` to avoid the
> > multiple `ret =3D `statements?
> >=20
> > Or maybe even better, you might be able to use
> > `Option::get_or_insert_with`.

