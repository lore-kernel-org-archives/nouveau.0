Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B63EA794F
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 00:43:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEF810E78C;
	Thu,  5 Feb 2026 00:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nD21dSDh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6822341B49;
	Thu,  5 Feb 2026 00:33:59 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770251639;
 b=dvRe8OeF7xpACVc5AUlNgwQwssxYREzNycDsgaPDD9DbE8EgMSzrdFNTqdmy2cBCWmFEz
 hfz7o4WkptraktPCvrr+Dy+Nf/sB6thD1JiZAWMVwkg9Pvv2nuBEW18/YDyugjP1EnoJAg8
 yJS3wS713nLUAhMzKyEBuT7d1GKtkaGzN1Tsf9JF7qTPzfXqzLWLornfTd/o7IWAMN4B7/+
 zJ45t9lR8O3r/PCjSN0z/RyiYEd4uzGrflq+qjzH/ZdoQ9j4uzEhXNBoIdZDhzWQHztL9UH
 BOLCk9NzED1+Rxeh6/CcQDSOhFWncC2j65aBT86brTRjraXFGXKmAN6DqVXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770251639; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MzvltOhqnqKNwuA8d7pZMRKKiJmiYA4xpLV5cbdudZk=;
 b=GwZQArWDlMlbuETsBMPS3QDR0pQ+3/+rCYIIcpUBNGSGiGMvJV3/9po1r5pbYTM7E8Vjd
 1F+e2a5VP+NGaW5tXezk5Mx359DeagL1DXV9n/I1UyrvO2oZz8SzKIRUQsr1kM7wTDffpH+
 8BXEPXfwvjrXOC4VIxYVkD2JW4COZaGNrBFbDalDSu4+isNiTxTVkV5/3nOjrjgaqKXmclS
 bCrutxSXYxIcR0JbHOppsIQV7b8QWEK7AJPi0xM1aBLlg9rCG3E/s61g+v/icj+pMkojNri
 /rdfgevTdbW6AYCqEMeQgzZjK+q/aSfooWT3Oe9SUK4AS/bO17sfvNj7mJhw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EBC2B40492
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 00:33:56 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9060710E789
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 00:43:15 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-8946f12b1cfso5183056d6.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Feb 2026 16:43:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770252194; cv=none;
        d=google.com; s=arc-20240605;
        b=FwhzKIosG7l18IoDtbTlAMulgMHPlZ5zwpvR22DrFubVlrToTMflg9ldm34hCZ5X9F
         FrlVmIGTerIVBSt7VbmMrMP3Ny/E9f1ByiUt3kPFt8dxeovFD55VEaga/72CQOcVu5as
         YtiO62IXeaCmkcN76Ak33CaZjQV6KruZayADoeVfFZvC3lcfYxMm7PICzondS7qPChzc
         oBtKfinX3LGcgFV+ze+goWcY8bBq0k+vv24hOPiALkI+jE5bnlfkiIvRifMx73P66GM6
         Ax232xFJ+RjvWus7UDou1xvwYwXKX7WQ3jC+/Nff9qkSbY4rCMhLY5sbU/+G7jVjUZ0A
         UWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MzvltOhqnqKNwuA8d7pZMRKKiJmiYA4xpLV5cbdudZk=;
        fh=k10GyGpjn/dyjidkh9xBtrxvRc35S8qP2beFXb4ft6A=;
        b=XZFGGGsJvV0vDqhuByCMmvwxh2pEbu4GxRvePjMTDU92uxjb9CdJo+dT6HzKiWjY/w
         ahkZVSpLW1Y6oYBmEkhWXT3IA2C2NN5KWVa41CH4RkykvCNX4N80DDkErIqYwqAUi7qK
         7wbMOp5TePEcgMsXAr+JIJOOYBB/n4+9Hj3gPK2Pm0MFqQcFPWExrV6ARDGKYLUwI2rB
         RyEWqR6GJKyF1EP/xgNBHLA7zjVfect3CseltpnpLtbncOhb/W/GBcm3gGiXpoiETYrL
         Bd4MZNO2phaU0M+HZfMrztShJFElsi0VNNNhJQruVYyEF9P233DwTZzEKsHQMSI77T5u
         6PEA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770252194; x=1770856994;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzvltOhqnqKNwuA8d7pZMRKKiJmiYA4xpLV5cbdudZk=;
        b=nD21dSDh8i88qC+7m120uLxGKOhVms44+sm18S8TvjdN8q21C/4kNMI3og2Th7Gpb3
         iIFjDKit/HTnRL1xgoESJZ2u9AuMz1oZXgE6F59h6lgDdOuaVECs+dLYvVtvqxJ3EdpU
         nx8zMWkZ7Jsx4Or2wkDdFRzWiIuarmMvpaZI/prcqwXw/tZJ1wpBmgHRdWTD0IDijIHF
         HAY8o8InxrAWqkzehm+EEErJ/QDo+hN6KlXRO0umPN8vQB3xn2GMFF6cB+rwUvSx5vyA
         B36OmYRd6WbqsJp0sXhonsV1X/7cqkqPY9QyA1zgKTvAcIY7PdRawviQwVpDeQvWGInf
         5kkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770252194; x=1770856994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MzvltOhqnqKNwuA8d7pZMRKKiJmiYA4xpLV5cbdudZk=;
        b=iWm6gtV1LtJkYrcHiqKFEiGCbMq+JsKJzTecLQUVP15jkGi5pQS7BoF0D6kgoTOpF1
         dx5l8KbxUeFvRpKZh/RL02w707BBKwXcsPsKAeGyH1VYuctmcqjeTRaX8tH8swUEYkvF
         7yk32xe8Zci5tczNK88AMV4Q7vy+DuKV2L1fnIAGTTi1hg86+ihqB1HYQCeBO8Nyk3hj
         poljPs19KutYbDnv+I5wTQ1AqFsZdAudSmkB0Q1qFxIzpmQ1zIfdS9FeY/kmF1phlmxp
         CQEX+j3Y31Gp+wzb5+3IY66nn1WbknDLz23me2VwMsqUB9q89LyvO9q5jk0VuBiCJNiD
         WXig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoRGXYoDwh+hwqdrpasLEigCND2xpiTGMuDn3JbMzlSBJoqs7xQvWGcPIgCjWGA3uDo2zh848/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGwq6cquxmb4/pOlBKjTeV9xqyqx0mUeL78XJzmg+I6BZUxVTY
	yOjd2/axOjk39bC8vlklk6Otv7vHmOwNLYFVGmjXLLv1gV7cLWmD2zK+dwExlNIsnI02qtm7Yy3
	wqD8DQz9+QZZ59quiiu3JU1gBr5mvvqA=
X-Gm-Gg: AZuq6aITlmhJZZzGifaVtwe4PGr6RRhrjwwb4hiF8202cFmUbr6ApmOw5DP3TLVQiX/
	cNCyH9pUhvXLYow1xOChF0xnXSiI89SWFH7Mt1jCYB0NUY0gNmSpK7hSHgk3tOYA6lHXixrQ8Az
	HMzeUetMREw/LzOkMxuvDaEoj5esAcEluiZ8jrHVUYJwxgufRJELIaF7c4+YNyLyjyqII6pzZlO
	5eATGFpuutkz8Lw2VmrZNHhyQ5JeL9YuPNHQQLhKxFeJQw/mldDERYkJ2rfFnuKe48tZc0lX4rV
	tSVvzn8FQ2H7jvjOrt3nK+yGi58R4RzmZkfp8NXNCPWPzVz9nfvS72s=
X-Received: by 2002:ad4:404e:0:b0:895:829:485d with SMTP id
 6a1803df08f44-895220f3ae2mr45357786d6.10.1770252194314; Wed, 04 Feb 2026
 16:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com> <Z9x0NLY6HHsvxOFD@pollux>
 <CAAgWFh1VzRnt9QdCR9xOVhar7vEYAGPBcMHfqXGq_QHm0A6H8Q@mail.gmail.com>
 <Z-VK8eeA_7BURiBy@cassiopeiae>
 <CAAgWFh1yGZkEi+Fr9htOp+iXJjLo6Q1B+rszKKAcxgw4Y0D1RQ@mail.gmail.com>
 <Z-aCVZYcEkxJHBle@pollux>
In-Reply-To: <Z-aCVZYcEkxJHBle@pollux>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Feb 2026 10:43:03 +1000
X-Gm-Features: AZwV_QiYqwvgKCbIcsEv5BKiMdyjneUelMqhYPudieJPgw4RFOKnTMKYYmxe1Kc
Message-ID: 
 <CAPM=9txDN8NtX2UFfo8KtkaqW_rgM7oE-nLC+XyaOEAS6sj-qg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: N6PSQPSYQL64V352AEKSSOTZ5PEBYUNR
X-Message-ID-Hash: N6PSQPSYQL64V352AEKSSOTZ5PEBYUNR
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Ben Skeggs <bskeggs@nvidia.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/N6PSQPSYQL64V352AEKSSOTZ5PEBYUNR/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9txDN8NtX2UFfo8KtkaqW_rgM7oE-nLC+XyaOEAS6sj-qg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 28 Mar 2025 at 21:12, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Thu, Mar 27, 2025 at 02:26:09PM -0400, M Henning wrote:
> > On Thu, Mar 27, 2025 at 8:56=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Tue, Mar 25, 2025 at 07:40:56PM -0400, M Henning wrote:
> > > > Okay, that sounds reasonable since I don't expect this to change ve=
ry quickly.
> > > >
> > > > Since I don't fully understand, is the suggestion here to:
> > > > 1) add the interface as a function on nvkm_gr using the nvkm_gr_fun=
c
> > > > vtable and store the actual data on r535_gr
> > > > or
> > > > 2) add the interface to NVIF (which IF?) and store the actual data =
on nvkm_gr
> > > > ?
> > >
> > > I think we want both.
> > >
> > > 1) I think the suggestion was to store the data directly in nvkm_gr, =
however the
> > >    structure is indeed specific to r535, so I think, unfortunately, w=
e need the
> > >    vtable and store that data in r535_gr.
> >
> > Well, NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS is r535-specific, but we
> > need to convert it into a common structure and combine it with info
> > from NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES at some point, so
> > I think it makes sense to do that conversion+combination before
> > storing it on any structure. In that case, maybe we store the
> > structure on nvkm_gr directly during r535_gr_oneinit and then the call
> > to get the info only goes through NVIF?
>
> Sounds good to me! It means you need an intermediate structure though, we=
 should
> avoid using uAPI structures in NVKM code.

I don't think we need to go through NVIF, or at least we could do it,
but there is no gr object exposed through it now and adding a whole
load of gr code to nvif would be a nightmare, I'd rather we merged the
kill nvif patches.

I think not using the uapi struct in nvkm is all we need to maintain,
nvkm has it's structure, uapi has it's structure and we just pass
between them. nvkm_gr_units already exists as an nvif bypass so I
think it's probably fine.

Dave.
