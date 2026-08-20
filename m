Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65024C5DF86
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 19:21:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2428510F17E;
	Thu, 20 Aug 2026 19:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Bd85xN5w";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6036C47A6E;
	Thu, 20 Aug 2026 19:04:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787252693;
 b=Njp7ee1PBmTW90XcvLbq8FxNwtrSiPXGZYYuUHf08977qQ1KwXYknzB7VsHK/tgvbfu9V
 T2oluAyqcl2OCqAdDK4M7OMEv95m+5WA7ZGqu/iHSpj6xVEGHS5GYLz6au+zpxzo1ZlfcZG
 HBMgMkfQCWTOqk9f97DYk+u1dyij7GJqZ7I5NqzEAWCmJ6MwfEj3f3kMAjGloDeINQe4Ap2
 9PQBrlnJaFm7GR2KaR/db24CVHKOhVNqVBpHmxxgFF1Nv93r76Cvr99iB2S6aFSca8ZOGH/
 B/hAFaZtdn+0FlqOzWRTWMB53RBC0avl6U68QUvgb4IGQLQ80j7z0baAG6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787252693; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fhaFBj8frGzXeQE938JwPttRSZ/huDZP2vb0SnctFr4=;
 b=PfUAGhAl0g43kCyjjqt+ckNBqyleJkAjPiqzHVn3ppBUbfRBIkNSjcm2ZbwOcsqOxikn+
 XOcYm9coBGBSVugJV9QxZFfWpqKdyjR2qtXtqqdSd5Fn9XuXytSesTKrl7XV57wNqqOQYlS
 AGOPZI0CV8AkrjJW7/GcnLjNdqSfg7j4bqQ1N2ttfpbzFaDBrJJI6sRtejpmRhEMMB8MKxd
 L9l/L5yKDD1dBHY97e+5L+/5zxctz7GxxbrJp8AJodH2d0cmc3idHnuAg4FNWTqXoexy5uy
 nDn0q8WWbc7uAZGf4XtLyDf2lzOU/ZiKBAULBnuVQK4E1LzFu5trhLIRSVkw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 92CBB47A37
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 19:04:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0107510F177
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787253685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fhaFBj8frGzXeQE938JwPttRSZ/huDZP2vb0SnctFr4=;
	b=Bd85xN5w2oG1XlsDxHI4AUeHPn6kpWJaCr2A3BnclEiL8/1EcXw+dHOzwCW9AvPr7ferRy
	zquZ6FJ8l+a2rXUO/dopt0/I7J6epg5NKKEFUpsXdaNck5hLGOLP+AYtaqfdmBWiIi2MFA
	90VwQLvdEsgeeYOlpL1q/vj/lHP+5aE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-jNyMCnX3M3yzx5vjPgjOEg-1; Thu, 20 Aug 2026 15:21:18 -0400
X-MC-Unique: jNyMCnX3M3yzx5vjPgjOEg-1
X-Mimecast-MFC-AGG-ID: jNyMCnX3M3yzx5vjPgjOEg_1787253678
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-907c59bd73bso3875566d6.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 12:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787253678; x=1787858478;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgFrJA0kGHjEoIJ3Eqsw42ND56xZloAUAzXc6L7b5qs=;
        b=LEBri7DVsFsYjsYyjkvdIeTstbXO1NN+zyEUkD2GpOKTyLbPKM0ZFrxhasdOsE8xgF
         ycWWgyg4EiwLnPvMVGkznHhj5tFwAiQw/LugAjViensS+zqnYwHf0e2n0sr28jHj7czE
         5v9UXIdV8EbRKmaH56QhGObsIoI263+GHlDBWXDdeuLVtfmbrguBpTBL6yI0xLxJltZv
         38CD5MtL7vdv+vrgrEBh8dsrVDoafkLOVsl6J8YLoilvYbW5x78TzyRF5nkKJtAcffeP
         ozzIkPcpRrLctboelofCUvGZPZm/QlUTwqISjXz8OwGU6myBXx6bqfKm+3ljqam4++ul
         el8Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp0rf5RDudYGGIb1IlsLQoJ05xZrBkxTaQBUP50s7Xekh614y/OV+IyIIygVAD3Lj2thiNTwq52@lists.freedesktop.org
X-Gm-Message-State: AFuF++lg9+ZV1NO1JDMNEo0ZlQg7DILr30T5oK8E5f1G4/gRI3wv6lQr
	Ym8kPB6t75z5VzZFcxM2q+mTZPZtUxndmAr3cZgTt8HMTX0yEmvUNQPNM7vjlwYTC95G9SyjgAT
	DpICUFdRyOG9IGC6sRsKDEN5pSS/zjW0GAbG1WvoZUDIeTJy118333B3naQ3KWnFTxVM=
X-Gm-Gg: AR+sD12kWr8+wvGvIcGQFXstkhJ0gjh1ADEaHOpYNLxjxXWWK0ZV/dy2YFJQIAOZlCN
	k0oHNNwzqEW7vf7jYqD/v11UjfSm4o0LJonSyGAz/DK6OCtQvA7rNr53SECB7nE5QIIwVkDRw2N
	goCBJMqz4eksARDErWlFsnIBw1s8WMf8k1QTXp//6ZX/8+romKnaHm0gZt5aORozagnCFLBLnMA
	0C5R2WMqnGxy/GoYmsHJoziNdYIF7BHmRSrcIdqTI+TuWEyNFZjkYnBOeOYDr7K5lol/oz9mJxm
	oklW7iX5i3WSOBkBqEON+LdQpamkaA11ynRNLQsoKaN+tLdpzniMEVeADA9npafehlSK+A3J
X-Received: by 2002:a05:6214:4b09:b0:8ce:ca7d:b099 with SMTP id
 6a1803df08f44-90c80cabff4mr5132356d6.18.1787253678208;
        Thu, 20 Aug 2026 12:21:18 -0700 (PDT)
X-Received: by 2002:a05:6214:4b09:b0:8ce:ca7d:b099 with SMTP id
 6a1803df08f44-90c80cabff4mr5131856d6.18.1787253677671;
        Thu, 20 Aug 2026 12:21:17 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5f2a2d62sm44581786d6.38.2026.08.20.12.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:21:16 -0700 (PDT)
Message-ID: <c07891a66d5373c12b2baf8ef97540b34169955f.camel@redhat.com>
Subject: Re: [PATCH v3 3/4] drm/nouveau/fifo/nv04: filter benign CACHE_ERROR
 from Mesa NV50 bind probe
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 15:21:15 -0400
In-Reply-To: <20260812231330.705425-4-mczernohous@gmail.com>
References: <20260812231330.705425-1-mczernohous@gmail.com>
	 <20260812231330.705425-4-mczernohous@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gOFnAGCCQ05EgIBUMRm4iOnUAEAVVSjGP0N4WT4-5tc_1787253678
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DKQC2YFSZXEKOYR37LXWAN6A55QAX3OT
X-Message-ID-Hash: DKQC2YFSZXEKOYR37LXWAN6A55QAX3OT
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DKQC2YFSZXEKOYR37LXWAN6A55QAX3OT/>
Archived-At: 
 <https://lore.freedesktop.org/c07891a66d5373c12b2baf8ef97540b34169955f.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2026-08-13 at 01:13 +0200, Marek Czernohous wrote:
> +=09=09 * chip that reaches this handler, not just on
> Tesla.
> +=09=09 * Demote to debug to keep dmesg clean while still
> catching
> +=09=09 * real CACHE_ERROR events.
> +=09=09 */
> +=09=09if ((mthd & 0x1ffc) =3D=3D 0x0060 &&
> +=09=09=C2=A0=C2=A0=C2=A0 (data & 0xffffff00) =3D=3D 0xbeef0200) {
> +=09=09=09nvkm_debug(subdev, "CACHE_ERROR - ch %d subc
> %d mthd %04x data %08x (benign, skipped)\n",
> +=09=09=09=09=C2=A0=C2=A0 chid, (mthd >> 13) & 7, mthd &
> 0x1ffc, data);
> +=09=09} else {
> +=09=09=09chan =3D nvkm_chan_get_chid(&fifo->engine,
> chid, &flags);
> +=09=09=09nvkm_error(subdev, "CACHE_ERROR - ch %d [%s]
> subc %d mthd %04x data %08x\n",
> +=09=09=09=09=C2=A0=C2=A0 chid, chan ? chan->name :
> "unknown",
> +=09=09=09=09=C2=A0=C2=A0 (mthd >> 13) & 7, mthd & 0x1ffc,
> data);
> +=09=09=09nvkm_chan_put(&chan, flags);
> +=09=09}

I assume this won't break anything, but hindsight is always 20/20 - so,
I think we should probably keep the print of the channel name even when
demoting this to debug in case we have to investigate this someday. We
should also move the nvkm_chan_get_chid(=E2=80=A6) call and nvkm_chan_put(=
=E2=80=A6)
call out of the conditional, and probably move all of the printf
arguments into their own local variables in this function so there's
less to maintain for future changes.

> =C2=A0=09}

