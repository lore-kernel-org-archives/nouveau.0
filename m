Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A064E87859
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 20:09:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E39D210E5AB;
	Tue,  3 Feb 2026 20:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C/rHv7GR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8B63541B49;
	Tue,  3 Feb 2026 19:59:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770148784;
 b=UNgqa8i53FKLV7ATUkyV+8S/8ggTV2625W/QbzeERcs9SpV2jI6HO09QMiW7etnFmYTnW
 d9C674N7bFppwsuuaOYkIGa8iB/3q1FtxmwYBjwMZrXCctzRo3bMmlBgNkwzDLJ93V+F56P
 xaRPetiGGpLyos/7FJVm7YSB6YwWVMUqVxtumrQ86eIFuH3beyWIB8s0MNKJWY2ajhDcXpE
 FXhBRhGtBrXY2hE9sciG+zcWviZqA4tSl2POCyUiIaO5OjNfpDsiqQTc57VAw/F2MEXjV0z
 dnhIUCZik0qyJYxkXRrsNo1dyqP/KTTmPE+adZZ/NxWdd39zagzSGqord9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770148784; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=K1gBAXLqnj32wa3OhrXJ3CgCcecMTBEZxnARKaIYHLw=;
 b=vquqJzEVsVam+C19JOQC/zudVy9cmD3z3Ey7uUdjqAyIAsD2LtNCVVir4rEwEv9fAN8FJ
 EOi6CIFDqSfilvaCUWwDilq00ZeALTJEjj2n9AmQp902Hak8SMGsPUlu7H9X05XJiYfJ+HU
 U5dgtJOmueVkk0yMQUeqEnOd62DPZgXebKwctt5x71+QWh7imnmr1SP6WL+P4wTSSDeFKxx
 LcvHzSFRXPtCU7oEyrXHquAFey3qKlsHGELo//RNgralURpaKRxGDMICgVGFd5CYIN9bzO9
 xgNjDSSdm5UjaWk/lvLc9pJyCE7ANbXg0iYR8tQW2qtmE7iGJ+WzqwbeMXCg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D501B41A0C
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 19:59:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B2D3210E5AB
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 20:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770149336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K1gBAXLqnj32wa3OhrXJ3CgCcecMTBEZxnARKaIYHLw=;
	b=C/rHv7GRVh9nrdrHgY1sJ3yDS19onXBwpK5Fy9ALXMXb7GMvSzsKm+7YyOex/hEKvsg4YE
	hcjvMCtqLH0HOVUIsDBY6YwcJFF9YYLNqudneNuNtFEYHG3i9PktN41v1q6mT7vBWtaKqf
	z2z7+IuhmxMIfQMFkSzPil3n/Wdxpo8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-RpvnmeWDMFCsGY5vWHJwCw-1; Tue, 03 Feb 2026 15:08:50 -0500
X-MC-Unique: RpvnmeWDMFCsGY5vWHJwCw-1
X-Mimecast-MFC-AGG-ID: RpvnmeWDMFCsGY5vWHJwCw_1770149329
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c711251ac5so1696577785a.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Feb 2026 12:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770149329; x=1770754129;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1gBAXLqnj32wa3OhrXJ3CgCcecMTBEZxnARKaIYHLw=;
        b=Nps7hmowO2U2UPf7FDZx5P1xxknDNOppDXcsru02rFaFB9c22pLiAKY2TfPG2SG6HU
         8K39BpS+TBM/BEmNsUytfapUEhl9N672Zytze2IjsgtTbDiMDM1KnMZWjYI5+nyAXMZQ
         g/OaGpkvCU/73suuIkzVFkVdAi1W170XQ6p/OPXA8PnBh0IWLxp4O9cy6mgDt2Fv9cc0
         x47QNy1D5CL64z4kKNTXcATeeh4J8tfPBUgcyGiqMQ/ofxLV6fZ/mwvhIKnWUNMFeuDf
         XI9u2rh5u32CEzLCxWKjLdfgRaD+tlmmxcC9vFBmCtsQDbgo75L0ePVRWMLpNxL1LfxF
         jN6A==
X-Gm-Message-State: AOJu0YzTNo4pKjiPLB4wlMUG7lJT7pQB3UWoqQKxkpbqItOYXtNAML7F
	33i9Z7wjuUZmQ9l1CuuUxuoEfkPWMcMqP06aqmzFgC3uPlIao9m40wU/ZUvqM+HWbYie5vwYsYV
	J4dPcB5PsEDWRn/J+xBAcrZ16DR4BQzj/wlH+sog/FY68tH/oAkOcuCDbfJ9/3ozBSzI=
X-Gm-Gg: AZuq6aLlI0RLGP2zYXyAGnITzQFJjU5Kv1LYtox3OTwqRZ2JT/sggrSkNcE/6Vq6/eQ
	4C1hvcNtps7OG4Kvwd3ppoDLNR/SbFPhPOshuPW2z/vfQc16WiXz1HTiREgRD/crw72rtjTjUcM
	h1QW94O9V3BRO2rYDvI4tzxS6HhfMWLDpgEinYoSfB3j5FJEvfc+XItIkdeac0nRBy0/AVdA3oA
	x+zp2ARrhiS6re5QbJm2s6mjsmA3IJ0nt1Y0jITHoRIz52vCHTmGyZFdSmvaI+Wtqs2nSaRqLoD
	je0FskVgqOzteRMIbJ+eWoR9nbQ+WBtOfNyDXX12r4njhzRtRCgm1dXD4wLiA1ZExrL72+RrSkg
	sKql2ig==
X-Received: by 2002:a05:620a:1a85:b0:8ca:2baa:770 with SMTP id
 af79cd13be357-8ca2f8457dfmr98284785a.21.1770149329537;
        Tue, 03 Feb 2026 12:08:49 -0800 (PST)
X-Received: by 2002:a05:620a:1a85:b0:8ca:2baa:770 with SMTP id
 af79cd13be357-8ca2f8457dfmr98282485a.21.1770149329060;
        Tue, 03 Feb 2026 12:08:49 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ca2fd41118sm38238085a.36.2026.02.03.12.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 12:08:48 -0800 (PST)
Message-ID: <b805ed6d234c0c154b8f824c4c900e1c41736f7b.camel@redhat.com>
Subject: Re: nouveau : fix r570 suspend/resume regression
From: lyude@redhat.com
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Date: Tue, 03 Feb 2026 15:08:47 -0500
In-Reply-To: <20260203052431.2219998-1-airlied@gmail.com>
References: <20260203052431.2219998-1-airlied@gmail.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XkDQk27unw1O55b7EVn0hslEhQQ7p1DhsFsTpDsqGOE_1770149329
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HSKOUO4JC6XIWZ3V27TSWED7KEYTMFNS
X-Message-ID-Hash: HSKOUO4JC6XIWZ3V27TSWED7KEYTMFNS
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HSKOUO4JC6XIWZ3V27TSWED7KEYTMFNS/>
Archived-At: 
 <https://lore.freedesktop.org/b805ed6d234c0c154b8f824c4c900e1c41736f7b.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>
Tested-by: Lyude Paul <lyude@redhat.com>

My power bill thanks you :)

On Tue, 2026-02-03 at 15:21 +1000, Dave Airlie wrote:
> Since R570 firmware got enabled, a number of GPUs have not being
> successfully suspend/resuming. Lyude showed it on RTX6000, which
> I reproduced and wasted a lot of time down various rabbit holes.
>=20
> There are two required fixes, the first one adds proper sequence
> numbers to the rpc messages, which fixes a bunch of NOCAT asserts.
>=20
> Then we have to pass the runtime vs non-runtime state down to the
> GSP fbsr code. This however requires replacing a bool with an enum
> which refactors quite a bunch of interfaces unfortunately, but it
> was the cleanest way to do it.
>=20
> The final patch hooks up the interface so normal suspend doesn't
> set the GCOFF flags.
>=20
> Dave.

