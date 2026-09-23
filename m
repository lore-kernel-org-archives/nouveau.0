Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E66AC9830B
	for <nouveau@archiver.kernel.org>; Wed, 23 Sep 2026 15:48:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3277B10E972;
	Wed, 23 Sep 2026 15:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dTfc5ECS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 35FA14860F;
	Wed, 23 Sep 2026 15:30:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790177454;
 b=HyKTNSYvVOdiUlnwGo04zt4icj2rKD12wwsLyVF7m/rHOkHORrjgC7bjNhW0R/YI81lDb
 4pbDaAXysS55aX61OYyqoBAccYhA3bA4ZImmiJOvjmmBKZesnJwN1FhjuZ8PapcKodgUQbK
 VHnjOWotatArQ+h96Jqx2tkFX03W52mNh5izhRB2yz+ZHfBuLckx7mRQ4tyyDCzNzgh+Dia
 1GkJ8oTKkPWwQgpxA/755/OyoebYzf0gkWDacljaZ8oYz5naDxxx7s2govHzAxGYMOVGH8H
 eXWl7TE1ul2VMZFt4FHngCbVWXoVZKo2HPukO0Lzn5zCwBD4750QpMY1y0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790177454; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ibL3vdJsdmHHQtVOWCaIDOmHeVB42ijie9E25CWgvfk=;
 b=KefS2RZKxHcBwN0PPK/RxocK1r9nxbLAChW7sPCEtv978VHliAgmELc2+w3cNoqnxgXZx
 gbc+fzJ+ETEnM2EqbYprDn4B9rKdCXA7NJrxNiD0bb8OFIPXMnegL4N+/aZm444MknUYa3W
 hVX30tfHBG6AMoBXhmUgPHQOOs3ZCZckiJgiEuSp8/YBDcyovMUJWu+M7XGPv0DTGoEnfUA
 16D8dM9dVRwmmjJoTXvbZThBQS5X0Mqb7PFLlo57akcVA3KmIT55Rxdpe5RupI4vX49OGcI
 HkmZjQg+4q5B43R8QPgVIOW9y3/Uh1WnbflH1dRTc0eWQso6kdunqAYk3ahQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CCC3C485C4
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 15:30:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5656410ED51
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790178520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ibL3vdJsdmHHQtVOWCaIDOmHeVB42ijie9E25CWgvfk=;
	b=dTfc5ECSwFC4rKZIB9ziSTLVeuhF5me57J1pLgN+kDY6NRWHO4AWGu/xFfCHSquvkccTpf
	eggb4Z4+oZejbCA0jDG2Lfq8JZ0gIgDdhLwFvcuGe8NE2vwILcWOykHTAHaSP82+pm878Y
	68OFelJqE8113xGElTxGnqoxVhDdFYw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-6wHVISCtMXWTRTUPIguZHQ-1; Wed, 23 Sep 2026 11:48:39 -0400
X-MC-Unique: 6wHVISCtMXWTRTUPIguZHQ-1
X-Mimecast-MFC-AGG-ID: 6wHVISCtMXWTRTUPIguZHQ_1790178517
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-3a208b764f1so4747261fa.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 23 Sep 2026 08:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178517; x=1790783317;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibL3vdJsdmHHQtVOWCaIDOmHeVB42ijie9E25CWgvfk=;
        b=r3GeYprKEHuj75HgyIRxMxs3M/xwBAKr2558/IX+oTLfyaOLjukAdFUgCPvFcXnzTQ
         RM/lNFyyFrAbFtkqkAvvvz2ilX3FrYMJzGmZIJFNoPmZW1m80bvv4zXzIb33yQPLUwfu
         v8T3JQA4VgDRfJlNdbkGsC8f2Q0r1mNH7jpPWvNtJtkWWqiIve1ONApMqP3McKOXtHP/
         LG6y/aQ4B9+9fNhP2DGYwq0JRs373eulcPV1zKBDkJvC5i4Jkwc5xNtZ7ohJ9ePhB7wb
         WngBRld3A8v7XTvJC4AMFOb8V6FNQzgHxYSMRFqDxMabMhmc0xBb9oU8LC+YEURWJoZm
         xubg==
X-Gm-Message-State: AFuF++n66ubIgahlLILrO/H8Q2SRokt2Z6E9188BUJWfKOh/SMGACwuJ
	eSZ7aBdU8r4Rv0v7zA7OR+EtF5ZlGa7pdT9vYQu0pgNjskIEr6oHLNIwy3oWvbdzBkTu2QMdtRm
	3fWYRtcWIoGuLfQztaJCVHF3hY2adgp1ZLFcFF4W0dr8C2P6J7w8ne2xuz5q9k/ITmSE=
X-Gm-Gg: AYBFou3bOVp0mJtU7ljrDzcucJW1wwkX9/GYnHNY1t+zb/unZC9b60T9tOAUlLH7nQ8
	6GoP1YP6Od8diW12m2q7blCbWO4+OYqtqqL4Z4IBPevUnoOEWj7gReU6/1B3qo1nRus+E3yQDpc
	wqbyskCCLUH097T21aSbqsf7eg1ndAt9SULn6dzXb8CYIJFkWKFmOa2a0aDLb6s0zYZHNG/SJG7
	n7ibg5sD0+KXYnIiARm/KsWZLN+qwIyf05JQRFwv0WwMy7F5SMLSpKnwFT98BxRLRv3hYV+NsZV
	n58r55IstmqtY25/66H6Xw4G7gpxWQSTq0LPTtBOAzNM4YWL/pOUU3G5tFlgC6akmAtVHQp+UXv
	Rvo722Q==
X-Received: by 2002:a05:651c:1443:b0:3a3:2127:8ef3 with SMTP id
 38308e7fff4ca-3a6305e4783mr8472481fa.10.1790178517388;
        Wed, 23 Sep 2026 08:48:37 -0700 (PDT)
X-Received: by 2002:a05:651c:1443:b0:3a3:2127:8ef3 with SMTP id
 38308e7fff4ca-3a6305e4783mr8472351fa.10.1790178516913;
        Wed, 23 Sep 2026 08:48:36 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8d85958f1sm708391e87.81.2026.09.23.08.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:48:36 -0700 (PDT)
Message-ID: <2493dc57eb887650642ddb7858c7c2f4def67877.camel@redhat.com>
Subject: Re: [PATCH 0/3] drm/nouveau: HDMI Deep Color link depth (30/36/48
 bpp)
From: lyude@redhat.com
To: Daniel Campos Ramos <Capitain_Jack@yahoo.com>,
	dri-devel@lists.freedesktop.org
Date: Wed, 23 Sep 2026 11:48:34 -0400
In-Reply-To: <20260922192132.114546-1-Capitain_Jack@yahoo.com>
References: <20260922192132.114546-1-Capitain_Jack.ref@yahoo.com>
	 <20260922192132.114546-1-Capitain_Jack@yahoo.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7pcm6XuFdHlZFnyAOvHrRr2QyI_3gGHIyc_tyHLPkHg_1790178517
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MAIFW45OW43P6QYBASQMARV2TWTCAMHV
X-Message-ID-Hash: MAIFW45OW43P6QYBASQMARV2TWTCAMHV
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: nouveau@lists.freedesktop.org, dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MAIFW45OW43P6QYBASQMARV2TWTCAMHV/>
Archived-At: 
 <https://lore.freedesktop.org/2493dc57eb887650642ddb7858c7c2f4def67877.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 2026-09-22 at 16:21 -0300, Daniel Campos Ramos wrote:
>=20
>=20
> AI partners were leveraged in the production of this work.

Can you please clarify how LLM tooling was used in the production of
this work? If you actually generated code with it that is part of this
submission, then you need to append a Assisted-by: tag to each commit
indicating that it was generated by an LLM. If it was only used for
research or analysis and the code is written by hand (also, this is
_vastly_ preferable to getting LLM submissions. consider trying it or
even better - try not using them at all.) then leaving the tags out is
fine.

>=20
> Daniel Campos Ramos (3):
> =C2=A0 drm/nouveau: select HDMI deep-color link depth
> =C2=A0 drm/nouveau: pass HDMI GCP deep-color state through NVIF
> =C2=A0 drm/nouveau: program HDMI deep-color GCP fields
>=20
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/disp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 80
> +++++++++++++++++--
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/headc37d.c=C2=A0=C2=A0 |=C2=A0 6 +=
+
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/headc57d.c=C2=A0=C2=A0 |=C2=A0 6 +=
+
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/headca7d.c=C2=A0=C2=A0 |=C2=A0 6 +=
+
> =C2=A0drivers/gpu/drm/nouveau/include/nvif/if0012.h |=C2=A0 3 +
> =C2=A0drivers/gpu/drm/nouveau/include/nvif/outp.h=C2=A0=C2=A0 |=C2=A0 2 +=
-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.c=C2=A0=C2=A0 |=C2=A0 9 +=
+-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.h=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/nouveau/nvif/outp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +-
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/gb202.c=C2=A0 | 12 +--
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/gv100.c=C2=A0 |=C2=A0 4 +-
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/ior.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/tu102.c=C2=A0 |=C2=A0 4 +-
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c=C2=A0 |=C2=A0 6 ++
> =C2=A014 files changed, 128 insertions(+), 20 deletions(-)

