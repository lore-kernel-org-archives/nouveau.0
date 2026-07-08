Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF919C43458
	for <nouveau@archiver.kernel.org>; Wed,  8 Jul 2026 23:30:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A630E10F091;
	Wed,  8 Jul 2026 23:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ed2y06MF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E436446FB8;
	Wed,  8 Jul 2026 23:15:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783552510;
 b=Zqk/tgcfENsYV7W4hR3/9LKYiFdqvFGT0ST/ymB7J8rL9sHxefS85DLLeOmpGwG98xbBQ
 J7havL1YCkj+uzpCKzA6Y3RD7swKZm+gNuKJilNtHIGnIUyCEbfSiVxHTE0614iYJRw4S3K
 4Ao49cTOlRxFQXSdBKx4vKqU6XUp30hqqrhJqsZxkC/7t6clAJ0ReUSNrJSbrxb0wm954FF
 OYGszl0U5Px1GW7aWMfUGQrDhNfo0qRO/zJilF6GPxjwXa1963s9+qQqn/CHAYUiNTzk5GX
 WmzcXaJVER32us2g/U99PMLIheuzQzFcQTlbxh4KUxnAu/uSt8rEyfe1ffHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783552510; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1pvBgwYa7lCn2bz7uXEDmoBIfHlXGdkFiLetg9jZiKc=;
 b=pNF8m6Xkccvk5LgIvl7T7Uj4nZqE5VaYe/Jvxv/nJdiFVjLc6+GCe9bp3tfEvCkdjP7m1
 V4LW7TR4YUaDVHm6Fd1AUMZRF0oK5n0YBsYNd8N+3j6ibZJeb4xltC1bqAWTNUbIMF4Pgzj
 2Mby/OPt8ljXbDZNFYwUgok3H7RSAyBZW/s8ybbqGflwJn1Ns1XWXyqVN1yyKEimzdj6klN
 0zJmzmkfV/LWemd6uXwHNHAZmZT8xLaSnGCpU4iOWee0eZgvFVAx1gTATw4JwkJcpTMJYce
 tQzfyo/LkJszSj7knZ+5mhwLh1xfuNrSy+O9dFMyvKOsTj54wi8f+EBw7jbg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BADCA46BAA
	for <nouveau@lists.freedesktop.org>; Wed,  8 Jul 2026 23:15:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5BD10E9C9
	for <nouveau@lists.freedesktop.org>; Wed,  8 Jul 2026 23:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783553408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pvBgwYa7lCn2bz7uXEDmoBIfHlXGdkFiLetg9jZiKc=;
	b=Ed2y06MF+UZ10efArl4vqWuC937NxrVi3UTxJHg9V3aY1w7AOGNLST57ViUMyRDlD7RgS0
	vGkGpbrffL/kou2btTHJrXIIyi1xM5aow+haMJ8yHMRXYYFTwztesF7V11PrU+yUDAriIB
	6avHwppOVcYO4Mdwz1589lPduX+RkVA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-6AfcbLzBP7SaG1AN8MTWPQ-1; Wed, 08 Jul 2026 19:30:06 -0400
X-MC-Unique: 6AfcbLzBP7SaG1AN8MTWPQ-1
X-Mimecast-MFC-AGG-ID: 6AfcbLzBP7SaG1AN8MTWPQ_1783553406
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8e9b9f30d65so3660666d6.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 08 Jul 2026 16:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783553406; x=1784158206;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1pvBgwYa7lCn2bz7uXEDmoBIfHlXGdkFiLetg9jZiKc=;
        b=K3rF7E9L5LmmTxTpvLdFqX73eSJ2QjRs2UcSCEsWz5msrB3ZCwGzHCG5jzVVCmKHGe
         KohmSM+2h32HzhU9KdmNuHW5JzQ+A6Ff6+/fbAEXgP9QlAe36PZPOTQVe7wiMnMGSF1j
         ene/KLFL/lt30YtFDyOTM7LWVUqNKuh0H97nDLhxXBzugbDtTGJ2DmpKDIOAW8e0GNLp
         N1JgEeL5zMrF6MrpN4sh7tUhE4YI5r49j8+4ssTOOtcXwN9FZuvewslCGx5Dwr2rNBE5
         LLdCAx5/2aoz3lkEBMKxL8il6yal+uAxHfYEiQV0EyeTEjPVpUbjnvKRS/L8Bn8d40XV
         +j8Q==
X-Gm-Message-State: AOJu0YyB5uX0yeyWc6Ck/T1D4Mm0U6S8rd1SJ46dk6cWwFbrFTtefjw6
	/9Ry19iRLUWirpfDFbxBP3qlKU5SbuZ7IJpWPhNfPOqLupcmw8bgB9rlNFTsc22NUcLiLQlh7fe
	WeXpJDOkmYBLw19Dm66+vMayS/vl6lNtToNigQSdh56DspDKhUZc1oy3WCNTj0sdE4Mc=
X-Gm-Gg: AfdE7clmoMyUOg2/zX2//TDmYUSdj4Mq/EmR9Rd1jmNwfynCZ8nK2Z8ymLRWbUI8srv
	eR2fAZ89EM+cSs0RDk4gdGaiSp3iHnV5kD8U4gAPkJ6eMy3YvQVJZewVjDnzFuPz3/+tbjIMskr
	lt3z9j21G3Is1VwW0I9wm/mF2kOheMIrp+11UmocM2XZuZK+OETi3plrzcttWaAJZDYpnLmkux+
	0U7YFrgAmFwxAENKUJzjylPAT/vs1uYZZBd8J/vvc/ne3qR8lRjlzapgs5NWwC00MT5EX6JRWdF
	SzSOLKoTVSOC3WHAB9PRASHz18YxG+56hpdu1L8Tr6tsaGd+MYEYDD5vb3ZcJ7oaHpIUc8wSD9A
	/frjWVTw=
X-Received: by 2002:a05:6214:4517:b0:8e9:a4e2:e43b with SMTP id
 6a1803df08f44-8fec4bc9476mr52194246d6.1.1783553406275;
        Wed, 08 Jul 2026 16:30:06 -0700 (PDT)
X-Received: by 2002:a05:6214:4517:b0:8e9:a4e2:e43b with SMTP id
 6a1803df08f44-8fec4bc9476mr52193736d6.1.1783553405866;
        Wed, 08 Jul 2026 16:30:05 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ffd7c1e8aesm3791076d6.28.2026.07.08.16.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 16:30:05 -0700 (PDT)
Message-ID: <51b38994ed2032a83160881e53994fb4487a7b02.camel@redhat.com>
Subject: Re: [PATCH v3 2/3] drm/nouveau/gsp/r570: Never enter Gcoff state
From: lyude@redhat.com
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@redhat.com>
Date: Wed, 08 Jul 2026 19:30:04 -0400
In-Reply-To: <58219e62-99aa-4bb3-9c6b-5f96dae12649@nvidia.com>
References: <20260701182857.190713-1-lyude@redhat.com>
	 <20260701182857.190713-3-lyude@redhat.com>
	 <DJNNQVO96RR1.141CE7TKF6MZP@kernel.org>
	 <CAMwc25qA6GFb1Q=VHTa8BcM85B2dr22RrgdJcHTz70P5Xjj_bA@mail.gmail.com>
	 <DJNO6SIE8T88.1F0ZUILIRVDJC@kernel.org>
	 <b5d08cfe-aead-45f2-937d-6e9ef4dfea50@nvidia.com>
	 <971d09c47689981c1ea44c89555f71fcc0b5db41.camel@redhat.com>
	 <58219e62-99aa-4bb3-9c6b-5f96dae12649@nvidia.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IQFDW7BQMxqNOnF1zjmp8kohd9_qqsC7fx6scJrww8c_1783553406
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BBFJABBWFRSL4LX6YNLOJDS54FVOUVU6
X-Message-ID-Hash: BBFJABBWFRSL4LX6YNLOJDS54FVOUVU6
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Aaron Plattner <aplattner@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BBFJABBWFRSL4LX6YNLOJDS54FVOUVU6/>
Archived-At: 
 <https://lore.freedesktop.org/51b38994ed2032a83160881e53994fb4487a7b02.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 2026-07-08 at 16:25 -0700, John Hubbard wrote:
> > > not
> > > derive those flags from srInitArguments.flags. That field is read
> > > in
> > > only one place on the resume path, an unrelated display
> > > workaround
> > > gated
> > > on the PM_SUSPEND bit. Neither 0 nor PRESERVING | PM_TRANSITION
> > > sets
>=20
> This "unrelated display workaround" might be related after all,
> perhaps.

Would be good to note too - while it's not impossible it is actually a
display workaround doing this (as this secondary laptop GPU does have
display connectors routed to it), I currently don't have any displays
hooked up to it.

