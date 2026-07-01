Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E682C43458
	for <nouveau@archiver.kernel.org>; Wed,  1 Jul 2026 18:16:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E44D10EFED;
	Wed,  1 Jul 2026 18:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GxrZja9w";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9711A46E15;
	Wed,  1 Jul 2026 18:01:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782928884;
 b=en7MdSYZwgp/xptmHxBzp3/6vyHHRtx/eafS/zLFCVyiYNkZPGIfZ+cLL6hUaZTl7WfWB
 gQbIaNHlfmIJurg+VYl370VBoogZx4j52SCE6GKPWQavoCjdkH9tTTmfylBsaHXe8tBahUV
 3WbCZ4AE50H//sg7PlLENOK+mJhjDEL33CaKt0uybRRSUUJbGaPRFKD7dg9ghXPvAXmk4JD
 +OihfCIA7O2OyiSYPJj3oAVRHTiCWILjxQxyNuYh0GU5doSWaNZZJ0p5a8+nAqyoJ7ta05a
 bFF0qjNc3o/r5MX1kYvwiXUFaYVxJei3V3qilde+7ZBYGxTyahnICChVF6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782928884; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SQoEdvMv6/pXDC6SALGlSvWerPwNr5G1/PmjYcz5yCE=;
 b=xjQdCpRo0PGg27VOSIJUgT8q1fsHEoLGvO76+HpVOiah4SzykAxNpi3nLDycIGUmsFygv
 xGfJSekRUCnp1dbx1qzb37c1kdPBT34oFVz41eNugPYlEjvLCcRx9viRXZKB4+eioaIa1tX
 kyAiE8iEBpM9I2woLvEWsAjNyPb6jH4hKUT/KqsbdxUjPgFY7JpQ2FRsHXkkPFITr203yIE
 F67hxKBxg0oDoyl6cBU61IZxJE/yWhaYmACcpID/bW6QsSDAkqy+uo2L7eS894LlXYU4ZEP
 12MU5qRsmn9mP5XWAnX72SGHsoWQQCH3wLs5ibPJ7Whxx5+6EZw5s9nKXCBw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C2D7B46DEE
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 18:01:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA3410E3E3
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782929765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQoEdvMv6/pXDC6SALGlSvWerPwNr5G1/PmjYcz5yCE=;
	b=GxrZja9wB0DuylRMpyAgkjsWUB0hfP95c5axpHLF/4hS1uNU3XQSWU96xH8pBi8tm0o/8+
	1dwLFvN79XbkOOwlMsF+wRmB4Ej7fk24MUXn3IxiZp6/0y1aY+3Y2lPZYROtu9WVh1e1x6
	Q/NHu+15kyRnIVg8Z7rPhncI4aqoe7A=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-9L5Pt4gyM62n5uiYl6Yu4w-1; Wed, 01 Jul 2026 14:16:03 -0400
X-MC-Unique: 9L5Pt4gyM62n5uiYl6Yu4w-1
X-Mimecast-MFC-AGG-ID: 9L5Pt4gyM62n5uiYl6Yu4w_1782929763
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1d7886cdso15919241cf.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 01 Jul 2026 11:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782929763; x=1783534563;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQoEdvMv6/pXDC6SALGlSvWerPwNr5G1/PmjYcz5yCE=;
        b=jivWe3gg/VBYFiYJTnihgMxvVFaIhVnElIVoQdVw033iUi9TIkduFjozU4LSN5vFXm
         RwvibHVvl2RPuG5M8qVv9Rl12pBGE0baGjuoFw6NsMkSLc0vR3XV8B1u6elU512AxHzO
         irCCVFA7JlIIXJjDPewtC6rlAC0IS9RpPk+epLJuIFqzR+XJTWDAZTX3q6yUQiKag5m7
         cSZfNl96+kXvPjR6FRwN9nhM0MPYBTtACOAJ7/TRtP/DTwZObIlrrlmIbxu+kphN0+4N
         2d9VoBnhwTVStaVumVQC4sbfiSj/aWu8QCQ2GuShQTiTf2BK4lbsP0N3rRVGNIV6X/Z1
         dbFA==
X-Gm-Message-State: AOJu0YygsSJoLowqljlzZlpKROxARBOAWKVMbJ8RRQgIjPNhNs5R0TUJ
	xg6/tl2rwqWZdy1gytMvoCOqmyccmJ4xchIbhbRUMsQNRwWEpAaH1MmxWRb89iNzpSBioxDIE2N
	++bF6Sty8hE+rZLn2FQOI9/026lEZ1VAhSa3/NcnbBLFJ6S648NLTiuoEmzQZbMpLKv0=
X-Gm-Gg: AfdE7cnmKniCdx7OzvfA05K6Yh0RU5OreQ4pEComg/vgvOjfVtRP/w/SfxYNu3lt09C
	Ru8p8KlY4VhPxsVeLc7w1m+GiRSyEO+QnfjRMUkzsACRKzlO4eInKKFg6MVIHGdLCAj8A8z9JUF
	jDNacKXXnxqewGjxaw3CMPGqHPZL69u9EKmYB0AQ1pOGAcryjaI17wr5TsTRZOnXITZ8pmEu2th
	oCJH6s93zQCasdgXPg3yrvzL2Cy+RHb+M7UV9M84MQSFKcTssCnQIsa7nQ/IA3ou2G+VNBcmcM+
	otbztmIvC1DcZ2oK7IzX9HjsYe8PB7i6cyTy3Q8QuFlPz9RIOoe8nm7KQEhRYk2r/U16Etcogc6
	mc+1E4rQ=
X-Received: by 2002:a05:622a:997:b0:51c:a70:5ed with SMTP id
 d75a77b69052e-51c26a7ea3fmr38528891cf.30.1782929762920;
        Wed, 01 Jul 2026 11:16:02 -0700 (PDT)
X-Received: by 2002:a05:622a:997:b0:51c:a70:5ed with SMTP id
 d75a77b69052e-51c26a7ea3fmr38528451cf.30.1782929762509;
        Wed, 01 Jul 2026 11:16:02 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c10a360e0sm51905511cf.30.2026.07.01.11.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 11:16:01 -0700 (PDT)
Message-ID: <b23948367e3580f45c1d6d61db6e38b582f219db.camel@redhat.com>
Subject: Re: [PATCH v2 1/4] Revert "nouveau/gsp: fix suspend/resume
 regression on r570 firmware"
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko
	 <andriy.shevchenko@linux.intel.com>
Date: Wed, 01 Jul 2026 14:16:00 -0400
In-Reply-To: <DJMIGDHFYCIA.271V0T10TID2J@kernel.org>
References: <20260629224350.2870201-1-lyude@redhat.com>
	 <20260629224350.2870201-2-lyude@redhat.com>
	 <akOuPQ37-zxIJWWH@ashevche-desk.local>
	 <DJMIGDHFYCIA.271V0T10TID2J@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CHkFQwJW4wmgkZnuIKkMIWOYkcdxNqD1_DvAN7Uyw9g_1782929763
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 54DB3I7VGFB7F6YM7P3D3NKXHMCVAE6N
X-Message-ID-Hash: 54DB3I7VGFB7F6YM7P3D3NKXHMCVAE6N
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/54DB3I7VGFB7F6YM7P3D3NKXHMCVAE6N/>
Archived-At: 
 <https://lore.freedesktop.org/b23948367e3580f45c1d6d61db6e38b582f219db.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Sounds good to me - will update the patches with this on the next
respin, which should get sent out in a moment.

On Tue, 2026-06-30 at 18:05 +0200, Danilo Krummrich wrote:
> On Tue Jun 30, 2026 at 1:53 PM CEST, Andy Shevchenko wrote:
> > On Mon, Jun 29, 2026 at 06:42:33PM -0400, Lyude Paul wrote:
> > > This reverts commit 8302d0afeaec0bc57d951dd085e0cffe997d4d18.
> > >=20
> > > It turns out this looked like the right fix on some systems, but
> > > it's not -
> > > as this causes runtime PM to actually fail on many a laptop.
> > >=20
> > > [I have set the fixes to an older commit then the one that is
> > > reverted
> > > here, because when applied with the other patches in this series,
> > > this
> > > appears to /fully/ fix runtime PM in addition to the regression]
> >=20
> > No need to have this in the commit message, move it to the comment
> > block...
> >=20
> > > Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
> >=20
> > I'm not sure, actually, that this is a correct approach. You can't
> > revert
> > something that never appeared (in time range between 53dac0623853
> > and
> > 8302d0afeaec). Have you consulted with the stable kernel process
> > documentation
> > and/or respective maintainers?
>=20
> I think it should be as simple as picking
>=20
> Fixes: 8302d0afeaec ("nouveau/gsp: fix suspend/resume regression on
> r570 firmware")
> Cc: <stable@vger.kernel.org> # v6.19+
>=20
> for this commit and keep patches 2, 3 and 4 as they are.
>=20
> The commit message of this revert can then explain that the commit
> that was
> attempted to fix with this revert, i.e. commit 53dac0623853
> ("drm/nouveau/gsp:
> add support for 570.144") is fixed with a different, subsequent
> approach.
>=20
> This seems correct, as reverting a bad fix does not claim to solve
> the original
> problem.
>=20
> Thanks,
> Danilo

