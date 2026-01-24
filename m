Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDB1D715DB
	for <nouveau@archiver.kernel.org>; Sat, 24 Jan 2026 11:56:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC2210E30A;
	Sat, 24 Jan 2026 11:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gWhLyA+F";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3BFC040686;
	Sat, 24 Jan 2026 11:47:41 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769255261;
 b=wbvbfsJK5jKO0DlYLForjT/v1m+bTKciTSP3UrMxWkfOFkpGUvUcL2G0CKPogB5Qndm97
 zHcj3jFgjXfaSrLm8zn0UVmdhIRsZMIaC2Wk5J2sXygDabM6fj6bE9SS1n0ONty8fxrAsm4
 PIerA2+obNSS1VCzTPG1ae+C/ht5Zeh95PUO/IcMNpOSHSMf6/FT1nwcgRrN9LR01EDT3pF
 c/2EI2gS4s93c/+cNZJRFMqlGimSFvpJJVxSzz/OLVohpekhgwxtHSO3jjDcpDKY3LCiU6+
 OEfS5dJHLnangPvdRIuf7/m63fH96AKWCEjs1hFX6ocpHSbmVkeEe+9FgvQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769255261; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vTqJ6vOJxZIFwcKiagTGaEUlwWNl/Y/GiP2dvkU8DBg=;
 b=nY3QAJ0HcLr/wn61p7tXKdhzRZYaYak0RF6Vv0eNuKmfarl1+PH1ffoUc6n/GythlCAyU
 PVAQ2VcKT5mDBIyXMVz0t9Fdc0zyrKIPmbApCTlIjP+MX9xpqfS36H/y1kZTkJnp5SHV8R8
 C6d+DrhiCVEX9L0qC3vampJRTGDz4P7CVM1hYc2k09dO7o+tUKm6VX2sVMb2dLM9NFdGWX4
 Ikp3fZiXkHRZL0OpJ0ZDVad96qKuX9q/a43Vnul0VjVipnI2WCf9T7Om7Da/s5STQSfGyA6
 HjZ3oKUfLg18HzRX0FMTzVj9yabVYSggOXdVDfRQAbEbUJ+zuLp/hZx+klZA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6555B40351
	for <nouveau@lists.freedesktop.org>; Sat, 24 Jan 2026 11:47:38 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5126810E05A
	for <nouveau@lists.freedesktop.org>; Sat, 24 Jan 2026 11:56:31 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2b71e7dab12so270457eec.1
        for <nouveau@lists.freedesktop.org>;
 Sat, 24 Jan 2026 03:56:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769255790; cv=none;
        d=google.com; s=arc-20240605;
        b=Wmi774qMZhzEkAKk4Ih+BQtRKEkK9NmsqNCOxP2ZR6f8kDiBG3oTNK1x8PDRdygR0y
         EPOpzHwFl9jVpwRx1inJhAWlfcbA8s97tVF7okyaVOI4gn8M5iXjQC22lWlL+ZAQtvvU
         cYSmfqI9f9NOFIqoM6V1tAgQOuVDGBHaloOvZto8m/AiAQ+ICv0rCd8VTB/mbPsVW14D
         5B3U9SaGHAhygTYC644f+lAfNjZLCABo/ppDAxTEfMGgIjPalffwJWoZya730zVwYUMx
         lLh6CGgJ+kBtLM/ZsZNgC8faKbQPGTfNn9taa/sLw4Sx5+TKxi4eW4xhZW37DB/UCIYC
         /WnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vTqJ6vOJxZIFwcKiagTGaEUlwWNl/Y/GiP2dvkU8DBg=;
        fh=7Vi9JU4vWwhq195DxAMU0yphI5jG0vv59jRd4AeCsqc=;
        b=UDEqxCIEF5ZXUbfnX4SW9ac7DCwExKhaw7WgE7NWzWcuWWZsUd01H9xXiWCvoMGD1s
         lPzRPaUGmrJ2tZ2DfOmkoDpA/vqzDbFQleoQTTwSUin0Nhs7IZRxVT/gHo/XLEUxLsvg
         0K05L7mmYcv8pCR1ZLWA0gxPoDmF9laFC4EqtZaW1WlaCzews+nLRHqJD0WKqAacSICo
         JQcLfSGweGay+K9YVEP+UW2d5lhmLj2Gb10E6M1c46k3+ZOGLr4pJ17PunaJA2EECr1B
         sA1COgunnY1FNb7IkLiV486ufj6YwPMfg5pEgs6hCY4OMaBZvCDwHkROMZqFL5OtNd69
         KdEg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769255790; x=1769860590;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTqJ6vOJxZIFwcKiagTGaEUlwWNl/Y/GiP2dvkU8DBg=;
        b=gWhLyA+FZaLR9u1paQAtM9UlOH18NxIRKHYUwxBDoAoJ4mA8FJfevwgZAZB6OjAtw0
         AHslXxpvsUtm1P9kI7SbhEeq02iu+Vmrvjm0vIO903UVmKGagsWjOWuUY0kBI8mAZ6WJ
         dmauPXsq3xBblDBbxsgGEPJtRUvCiZah+F75S0xLPnCmpbii18eKFcXhwiLoK4th3Lkw
         k1LezpUhp2d8VWCpKO/SINsJUwFPDScFyycOLBH3VjhE6/AZf5czE6ex3rIHxiS820bl
         czCr/G7ipSdb8JNA7ru6R/j47ru1Uu536icNyWIFKt6cTWxJiIjY5dCYKNCaq98Gsdb2
         +oJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769255790; x=1769860590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTqJ6vOJxZIFwcKiagTGaEUlwWNl/Y/GiP2dvkU8DBg=;
        b=vDJFe624ErHBwVBCeG5cQA0bmP5BzssYfw8p+JlAMBc+nO4B8WqPIHkFXvgu5aVRsS
         xh8PgDn3mkf1PALLOGjAasc5GmvBE2FSwMSaexQQmr64Jhrcwwuoyfwb/EVR3y870/kj
         zG/RP+hJ4DAdrtzR0l2Si11E7s+EA5Gr6/71BMDasZsh9xai1ekZrYDFTHsbtGQWpyOJ
         28Bn8LwQPE+YqDknL+U7PQKyqzRudvUQswwiCbamfuMEwxZuXpTpee5BGu9KY3ZnbMsR
         Jv83vqf/JeWUa1ijKVXSBdy/Jpe/mmn/yjs6cE4FQcyyLFnoEfsrcl5Nz9Vx+sKsWigd
         EsKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzdnApjzrL7YgtTxSsOdEzb4U8svAUtiluCUpWPnzAoWRSOCq/oLYeCaOM6wyYvy0R9J5mi/8G@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyQQB5d9EBLOq6qRWcT64pccd83pWBUIn+RW1IFshwp8L/OnW8
	H2kwo7A8sI76PxkW4FLsxxnJ+O+impD8dGHLVBtowtqOB5+Gg1CxhxuBMTx/Uqgt8uCTQug4dSn
	SR5BIMsJvRbTJpnYz/pWDcNf3eicBlJU=
X-Gm-Gg: AZuq6aLXdogwW5m6G3qeCxwzioHvrUUYZc36ab+mieg5bWjQtciZINGX02lMonQHZpD
	NAI31yn9uY2rGMkVT/WYoj1+J0hN0e7elVMGmkOjb+Nmhrk1JuPuSaH+Yz3IMc119ruyIhuPQbL
	aKuUhVgdvC5EycmEfyRFMkEW3m12ZjftIQNDOxcHr3PU4WHuPubWgzWSy3S6h+57YS9UWNQa0E3
	nFgiOcvJma9Rg3xoNVJF0GMeisZdmxpGGC00MLzrFcrVhFMqCEOIvBU5uPNTjnxOHZJ1DzF2+G7
	nmC2u8KrFHdHgp1/Cg2ChorDYs567AqljWxL45mgJ1aGwzXAzmRNyMqfjXwnUsBAZNAGAXWCShB
	CB13GpW/hb5A1
X-Received: by 2002:a05:7300:f10a:b0:2ae:598e:abea with SMTP id
 5a478bee46e88-2b74e8d14c3mr739336eec.5.1769255790487; Sat, 24 Jan 2026
 03:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <20260122222848.2555890-10-ttabi@nvidia.com>
 <DFWGPVUB7Q7O.XCM4MOK1SK2T@nvidia.com>
 <8dd8d8047615cadc73e0a888d5172ab15cc372a1.camel@nvidia.com>
In-Reply-To: <8dd8d8047615cadc73e0a888d5172ab15cc372a1.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Jan 2026 12:56:18 +0100
X-Gm-Features: AZwV_QgKIEDy3cfZCnl5AFB8pIE-vu8jzEFx99HFmFN95gSlAVACEbFHVXhCDog
Message-ID: 
 <CANiq72mXr1A6sdB2mo848wcmHk-obVO91NAEDpbakEmoh5Gv-g@mail.gmail.com>
Subject: Re: [PATCH v8 09/13] gpu: nova-core: add Falcon HAL method
 load_method()
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4I7VZ2TNMYBWTMMAONW3IEO2VSF5L7B5
X-Message-ID-Hash: 4I7VZ2TNMYBWTMMAONW3IEO2VSF5L7B5
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4I7VZ2TNMYBWTMMAONW3IEO2VSF5L7B5/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72mXr1A6sdB2mo848wcmHk-obVO91NAEDpbakEmoh5Gv-g@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, Jan 24, 2026 at 5:56=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Should I downgrade my compiler?  I ran everything through clippy, rustfmt=
, and checkpatch
> multiple times.

We support a range of compilers, so for complex changes / new code,
please aim to build with at least the minimum supported by the kernel
(currently 1.78, in the future 1.85) and the latest upstream stable
(currently 1.93) before submitting the patches:

  https://rust-for-linux.com/contributing#submit-checklist-addendum

There are developers and CIs using different versions, so eventually
it will be caught by someone (likely the maintainer), but it can save
time to do it early.

Thanks!

Cheers,
Miguel
