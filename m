Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD7EF36B97
	for <nouveau@archiver.kernel.org>; Fri, 10 Apr 2026 00:36:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DBCD210E882;
	Fri, 10 Apr 2026 00:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XHH/JDKv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BB5B0457D9;
	Fri, 10 Apr 2026 00:24:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775780674;
 b=Sq31KgnRwwwws6U68fcMYmHpaBZoeWKRA58khs9/h8mSkt763ta1v6mOJntCzMNqIZhBN
 rQNgd57ajvN0TUxYDXsCUN+x3cadyf7au3BM3vG4M8bqKWdsZ8/vsde4Bn+4WljVBBM+q0R
 y7WFBfAWdrTk963+80l7lZCi7E50t3X1SlsvIVFxPgJvK2ByBk2UfLg/CEAE7t6d4xwUTxl
 ARjAj36mQXue2v9RtWQIuWDn3DgPJHAjKodihVomFsk3dkxv6+xqZnQvH2DyYK4DjtW2br6
 Jq2H/cDTE9sEhNgS7THZAAM1nGeAzyVur38Wf/xjzsG+MU4Ml1qghlOpCdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775780674; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AchvuAPEe31n/VufYTo18TAsxb7hkgQovTaQdmORCws=;
 b=YAXesMbIzXtuVB8E2jnYc8f16Tsj8rvROf0L7/agYTA3bqdPmDwo+a/vDtecA8pzzEnqK
 UB+BXy+5tKMdxn8fQqg/qeEOeROtIMp4RtvSD06Af8+j2lIWWGD6hPKigp51H3urX7hWPGO
 ReYjKWjclN3y28eE+Q9Im/mO46fjin/iOAvrtdC7dNxB1Maku8wZV9ov+9bdEPOuTAzE2gj
 fk6qEnl82wkPQwELfOlyWdj9Awar42jhP7tyndmNPDyFFwtlCApgJV5f4FCdz6KnexMfbox
 A2nSTzRjKytOohQTs03NdJAIAzQdNNIkUwQRD9ExqxAmST9RzYgj52qzEEXA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C1D5E4520D
	for <nouveau@lists.freedesktop.org>; Fri, 10 Apr 2026 00:24:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7007910E150
	for <nouveau@lists.freedesktop.org>; Fri, 10 Apr 2026 00:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775781370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AchvuAPEe31n/VufYTo18TAsxb7hkgQovTaQdmORCws=;
	b=XHH/JDKvIzRyBnKxCkK/jGvStaKNEd4zKKXAAPbXXpUJmpWNzGUNW+oVTIeV0isRDZ002x
	ZmhbRZXuoGNg73H/aB2JymDEoEKPF0YAhxPXmV29sb8Gi0tf5uzDa7tHdoKbWV0o1uSVy7
	2s2FFQXas7cOAmu2agBFikiDTl9w23E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-YSKnf20OMfqSIp4rDgNIlg-1; Thu, 09 Apr 2026 20:36:07 -0400
X-MC-Unique: YSKnf20OMfqSIp4rDgNIlg-1
X-Mimecast-MFC-AGG-ID: YSKnf20OMfqSIp4rDgNIlg_1775781366
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8d5b5d607d1so294654385a.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 09 Apr 2026 17:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775781366; x=1776386166;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AchvuAPEe31n/VufYTo18TAsxb7hkgQovTaQdmORCws=;
        b=kvGL59xqTKa/b98mZ7Oc2D30vnQKRAYr0RUddZGwYxJ0UhllnVG15t3dh6ywCjlM/K
         erocaYQPMHQpcufmHNbdhlfcLbKAP5ze+IUMIMbVIPEAL4vlS8wshBPIt7atBv27RSHP
         C4SUaPGsoAWIRLkTfzlT77qXZh0mvTaYTxLvsOOVjxR/XMlrcIULktFPCPSMj/NqfYJ4
         sEZblyjI0eRj4vOO2G+wHm2O2V3vamziqa4Z2KqXxbtI2l4VpXdoqnlep8fANBdM5fbF
         K4gbWh95bdWmtu+uO9S5BZ0Wb8x/gqUliETMZH+ZlgBp/B3OgHqFrjdEmjdTBc8imSvv
         hj0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8BXBhS9duz7CjgAlg1UXPVIEJBIfCvY5rfdOnBRQoKaEL2Z5RQJdlgWoIXc7wZJ2Q3w8RLsDY@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzja8G9QuaVnbna+DC6WHPV5z5gZ7tGGz778xVXdLBzcAdXpKOO
	8rVs0dqneYrUd+nkpub5VW0V/PsnUODP7Y4UKQ6WOTS5JUQ8Tv150eHXpKDL0Vy9b8hiDDVQoVG
	yLCqHN6VM+W7CtUnpJdtPXC6N3Cbgc1SZT/S4WUIzkAk9qsc92uj7FPY8x2rrUfUY9xE=
X-Gm-Gg: AeBDiesrrk2qiZidcSwQgu7jkWQGOA9aH879KGanhBgGroCcw197OHWl/u+s5CQ9t3h
	uMogq3hbCZ1e6/3kea0E6uCELrLRdOlVABhOVlSvk5VBiUaDyPDlP+fkGedG+cpw8GTxWb5b5QT
	3+cZDJbu7aReV/ETZ5qwF9ehgg/VeGJFQS6f/xnWaCtZMpxGLasnik4mV9KGSC12Bey9tQhXDC5
	lrx0+jjFVgdzHm0DBbC48j91+tdoZeY/lN0cuGf9qj6EiAKD82jJlQA77/q7N8FDfiSowKuEuOR
	WqW2HIhrUu7EX0pGMhNTFUPC5OVox/auIVIP7kVJimhQrUSOWeIzzpxca1VGqglGnj8Vtn61Ny5
	IM5PyHhwv6LDgOIl6DA==
X-Received: by 2002:a05:620a:46a8:b0:8dd:b1b9:85d8 with SMTP id
 af79cd13be357-8ddcd119928mr156358285a.9.1775781366516;
        Thu, 09 Apr 2026 17:36:06 -0700 (PDT)
X-Received: by 2002:a05:620a:46a8:b0:8dd:b1b9:85d8 with SMTP id
 af79cd13be357-8ddcd119928mr156356085a.9.1775781366081;
        Thu, 09 Apr 2026 17:36:06 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ddb9830344sm111469585a.41.2026.04.09.17.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 17:36:05 -0700 (PDT)
Message-ID: <92b6cb4184f163054a35b5f69f6558f05bcf8e42.camel@redhat.com>
Subject: Re: [PATCH 0/6] drm/nouveau: fix GA100 issues
From: lyude@redhat.com
To: Timur Tabi <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>,
	nouveau@lists.freedesktop.org
Date: Thu, 09 Apr 2026 20:36:04 -0400
In-Reply-To: <20260407192122.3055293-1-ttabi@nvidia.com>
References: <20260407192122.3055293-1-ttabi@nvidia.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oCsJL_2mK1T4wqPaRe9VRbSjVHcLzaLCotkUv1eWr4o_1775781366
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: D64X4WEPGZRRCLUD6TOUSK42GEZWRHSN
X-Message-ID-Hash: D64X4WEPGZRRCLUD6TOUSK42GEZWRHSN
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D64X4WEPGZRRCLUD6TOUSK42GEZWRHSN/>
Archived-At: 
 <https://lore.freedesktop.org/92b6cb4184f163054a35b5f69f6558f05bcf8e42.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thank you!

On Tue, 2026-04-07 at 14:21 -0500, Timur Tabi wrote:
> The previous commit that claimed to add GA100 support, 20e0c197802c
> ("drm/nouveau/gsp: add support for GA100"), actually had quite a
> few problems.=C2=A0 It falsely claimed that there was no VBIOS.=C2=A0 GA1=
00
> does have a VBIOS, but it has no display engine, so it cannot use
> the PRAMIN method the read VBIOS, so it has to fall back to PROM.
> For whatever reason, the VBIOS on GA100 has an "Init-from-ROM"
> (IFR) header where the PCI Expansion ROM would normally be found.
> So to find that ROM, Nouveau needs to parse the IFR header.
>=20
> The previous commit also claimed that there is no graphics (GR)
> engine.=C2=A0 That is also false.
>=20
> This patch set adds the IFR header parsing and a few other missing
> pieces to allow GA100 to actually boot and shut down GSP-RM
> properly.
>=20
> Timur Tabi (6):
> =C2=A0 drm/nouveau: check for GA100 specifically when calculating FRTS
> size
> =C2=A0 drm/nouveau/bios: specify correct display fuse register for Ampere
> and
> =C2=A0=C2=A0=C2=A0 Ada
> =C2=A0 drm/nouveau/bios: skip the IFR header if present
> =C2=A0 drm/nouveau/gsp: require GSP-RM for GA100 support
> =C2=A0 drm/nouveau: parse the VBIOS on GA100
> =C2=A0 drm/nouveau/gsp: enable FWSEC-SB on GA100
>=20
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/device/base.c |=C2=A0=C2=A0 1 +
> =C2=A0.../nouveau/nvkm/subdev/bios/shadowramin.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 3 +-
> =C2=A0.../drm/nouveau/nvkm/subdev/bios/shadowrom.c=C2=A0 | 110
> ++++++++++++++++--
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c=C2=A0=C2=A0 |=C2=A0=C2=
=A0 4 +-
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c=C2=A0=C2=A0 |=C2=A0 10 =
+-
> =C2=A05 files changed, 112 insertions(+), 16 deletions(-)
>=20
>=20
> base-commit: dc2d30e7db8321a6696d266838f7af7e9d1c7155

