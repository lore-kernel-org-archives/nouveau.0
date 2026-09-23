Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E870C9830B
	for <nouveau@archiver.kernel.org>; Wed, 23 Sep 2026 21:02:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2203310F1C4;
	Wed, 23 Sep 2026 21:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QIzdP5xJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7457048635;
	Wed, 23 Sep 2026 20:44:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790196272;
 b=s1UVzODddRzBLcJ2rxs0G8wpNzmC3U9G0xhTyHu4tFcyZZddRItNwwF50jBXm7rxPM8Wt
 bBMOpjfAQ4U1pb1Pamar6XJ7ss3YR2xAVDlWYuyFIdnN4Jr6zuCPWpnV8hhl7GUNlzTyRcs
 CTKVg6KfhAD+l0CqO98Mb1d764OyBBcWYRWhgZmtNOkpyU+oVHA8f/HOl4rOumW19H2lxV1
 eqRtHWql60/nYK/lwj2CBWet0lnqezDhh3NLMU1g6mcO0T1C/DIuMGtmI6+kJ7MgJ3mnKJt
 BLfDcChreiYoWFq5rvpVrcN6BZ4cuCH4Ietj+K8+ZhB6KC1OeLkaGIEPIBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790196272; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DKzsQNntyGjEwsAIdx0pWG37GNuIJKd5sAW4Gaaxezg=;
 b=RaZmJw8O7y84bv3riztpyW2j34ALjwdP3ctZsVvUNTPQxYGwxcm1vYfmfrTT5Ug8FPv7H
 iQWpN9d3c1x+smb+/biQVFSIo4Kp8/IZWV4x40kDZ28kOix/66NDizdU9ueUJvOkN17JEeC
 sgB3cHq8fKW3sLiFAMpzA2SFr+1ijl75T+A0fuXGLQKpls5fR/tSQEsxbJ4XSyzPVRk7WlG
 oT/p96FxIBLTCB9jnpjWshDxKoc9NSIXT7o3gULblCHhKvqvEL2htrNUnVq0EW/14abisbo
 dxI7yVNLyT+l5cxQ1xdp1MzTwYGaPA9si7/Fq7/5htPmGqZpzDRUj/d2orsg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B6A1948631
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 20:44:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C5BF510E9A6
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 21:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790197339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DKzsQNntyGjEwsAIdx0pWG37GNuIJKd5sAW4Gaaxezg=;
	b=QIzdP5xJORmrFuUTqGHDiLGR5oHJtsIsxGnnDmnssibV2BudDD66r1kQlU1Zq+Fjcmc6Ps
	jo8vmE0s1ncMg74drcvIS4ov8nLJqZI4bs7kxASt6SgTiSogBHUSAekRZYZh1fJDwPEl57
	ge/4D4FTsQOEh0fBTlj1bhZwy1Ppxfo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-Pwlmai6-MF2xFKEPvQdhWw-1; Wed, 23 Sep 2026 17:02:18 -0400
X-MC-Unique: Pwlmai6-MF2xFKEPvQdhWw-1
X-Mimecast-MFC-AGG-ID: Pwlmai6-MF2xFKEPvQdhWw_1790197338
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-53122a93eecso5642661cf.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 23 Sep 2026 14:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197338; x=1790802138;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKzsQNntyGjEwsAIdx0pWG37GNuIJKd5sAW4Gaaxezg=;
        b=JvEqZdprWIyvVhfL05+S17JpLxsojVrMv+EyqBpJlZVaUSJ5hY515MaikFLR5g+XsK
         84IG6lYO8EjhnSnF/XOjis3l9WZaVUg5sT98iiLhuKIiyT5/3C0joAM2HWmpJ+Fpdun2
         aiX3R3uRUo2wXSdXsfu+Cadkq+dh9rxCElHp3vMXPHwbmM1uByDNETTit8sbEeaxKNSl
         O3w0X7LW4bdOXq/P/Nkkf1ECJKkx4SdKY0LcB82L6jQXXaQpq3RyGqdKs1Rh63LxCgdi
         k1CC75NHZkprAJr0jBbrFIR5EhbSVs7cEloVQVS7A0Koh7BG2JBZxj+wRuB0g3fd6pj1
         TbNA==
X-Gm-Message-State: AFuF++lRpzPQBZS7mNPTuK0DjaNbapWrPg7Uybx3yGQTF3OJH8tVOx9L
	wU5XdGr2iKfvNq27rIkL9GNTw2lKPe5cyN05iEZEFrxbVdUcbwDU8CEQMjdI8VLAXUpp6QP9ltA
	pB0SR+ipSvxf9f2yIXpovTNuSKdNg2Wuyk5VKvKXmiUFrC8mEgpCBiQwEKC7aIC5DdzRC+LthHa
	o=
X-Gm-Gg: AYBFou1n2k/J5vUjMUzDUY0VU/kKdEEtq/VNX7dFUswSHH4SB27vLznb2AbJj0UUyvP
	Wn1SieB7YqyOsdX9Q8w5Mh5kqaNG1e+nCV1x1gH0qLlcOvcZ+Gq9bXMI9MWGjtTxvhgk483E9kw
	h/cjGH4sxs9MeAhUuxGVTvl9DzHKs9rYhhnwgg8usjUlzTpmSiO8qCK99Qap2RWXN9WYLTAEdUO
	dx4Zx6mEpLUHZxDdODpIZydpgslCg0J3vysGMsR6o8cC6TtDfne+4rk9DY8GJvtIgiGaIijXV78
	RH2boEO23OcejsjasKqSoHZUZrsAivYvPzLoL5jUagwhnLr6zGcNfimjE3Q+o8/6sDEoUvk=
X-Received: by 2002:a05:622a:1e18:b0:531:1e10:acfe with SMTP id
 d75a77b69052e-532fb6879a9mr5732311cf.10.1790197337671;
        Wed, 23 Sep 2026 14:02:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1e18:b0:531:1e10:acfe with SMTP id
 d75a77b69052e-532fb6879a9mr5732001cf.10.1790197337073;
        Wed, 23 Sep 2026 14:02:17 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-532eb364154sm28033471cf.22.2026.09.23.14.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:02:16 -0700 (PDT)
Message-ID: <d5a7e1c598ca3bcaa8cd9eabd1c952a9734033c6.camel@redhat.com>
Subject: Re: [PATCH 0/6] drm/nouveau: HDMI output colour format and
 quantization range
From: lyude@redhat.com
To: Daniel Campos Ramos <Capitain_Jack@yahoo.com>,
	dri-devel@lists.freedesktop.org
Date: Wed, 23 Sep 2026 17:02:15 -0400
In-Reply-To: <20260923201930.1836730-1-Capitain_Jack@yahoo.com>
References: <20260922215336.612239-1-Capitain_Jack@yahoo.com>
	 <c78df20bd86437dd3987053765a550b3bac0cc65.camel@redhat.com>
	 <20260923162348.1037898-1-Capitain_Jack@yahoo.com>
	 <07d66ea7e0f0c7aef313b11d0881ca9170f05c77.camel@redhat.com>
	 <20260923201930.1836730-1-Capitain_Jack@yahoo.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7zcGHPm21wi_mLsBMBHti29LbWLChKd4h-333jpeNIo_1790197338
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5S37E3EPOVFWUBUGD3QRDVOMQBK46F52
X-Message-ID-Hash: 5S37E3EPOVFWUBUGD3QRDVOMQBK46F52
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: nouveau@lists.freedesktop.org, dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5S37E3EPOVFWUBUGD3QRDVOMQBK46F52/>
Archived-At: 
 <https://lore.freedesktop.org/d5a7e1c598ca3bcaa8cd9eabd1c952a9734033c6.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

https://gitlab.freedesktop.org/mohamexiety/nouveau/-/commits/nouveau-imp-up=
str-v120

>From Mohamed: "the old one. new stuff still not pushed anywhere yet as
i am still hunting down some bugs. works ok as long as usage bounds
dont move in different directions"

On Wed, 2026-09-23 at 17:19 -0300, Daniel Campos Ramos wrote:
> Thank you, Lyude, for the detailed answer; it makes sense.
>=20
> The bandwidth point is fair: my sink tops out at 225 MHz, so deep
> colour at higher resolutions was never exercised here.
> I withdraw both series, this one and the HDMI Deep Color series v2.
> Please treat them as a proof of concept, in the spirit of the ray
> tracing work, if any of it is useful.
>=20
> Where can I find the other developer's work?
> I would be glad to test it on my bench and report back with a Tested-
> by: a GA106 driving a Sony KDL-46HX855 (HDMI 1.4, Deep Color 30/36,
> no VCDB), including 12-bit frame-packed 3D at 222.75 MHz and full
> against limited range on a sink without a VCDB.
>=20
> Daniel

