Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50023C43458
	for <nouveau@archiver.kernel.org>; Thu,  2 Jul 2026 00:30:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3661A10F124;
	Thu,  2 Jul 2026 00:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NMMXVho7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D7F0346E32;
	Thu,  2 Jul 2026 00:15:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782951351;
 b=lhIHDI9uG/yk/zI4Iq2soNMi8oyTf0jNCOtjoHZnoBgmOnDsFJgx8uUhrkg+jkmU7aQ4F
 1C+EC0D2jcBrC+wqgAKo1XPbfTM2RLwJtVoewSeoZ/jh5ry5EbQKtAbr7W9co6vai77LOXl
 R8KHdfvN8LUCasBhJ6CCsOHGgB9bLaISBYTXkBg0au+nrM5xP6hBlkMS/ejRJ0wx23kQ90b
 8o95NKwnKCVIF/yuZSKDUKnTdxrpL583EUA3zHXEqHS2FfTBFoq8MFdB7VfWrIg4g0HTuPg
 Gf2qtGeq4Aqq0bsNgt4bmMZQgDtuinzMXgpctK4x5X/XSvNptvGNB8Vtu7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782951351; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uE2Z0sUsxkHX3B7YJ/WYKbzZMFygNnjUDTM1KHzHSbg=;
 b=dAlz/5Lol6+YRe/rQIID3hmduGoeaZWpByUvv6qJV2qwbTY3HuzL63bmZVh4X9V4bY0c0
 kHc1q18qJviuCXATRN3CtlIuoPvaKuPIUKQAh+BuUavEjOtaaZ90/PYk0IVV4h4igFZ+shA
 GIxkZfc/GMfyD4Y+BbYe6P4v5roCe0rSujrPI0+A1uiUn7Z3ZiMQei+6eDKbX3pO/hABaYV
 P6BwjisKAuHjfLRw2paqjRrEICm8Im9LY/Fh2rtbzn2Ovi/l1fNk0/QpDMH7ilqsDsb+dyL
 GT1pMpHy9QEiflin9coPxIevYXyvuHlVh3CfaPcz+Lb/tr6fNROHcop7u4RQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 74DFB46B17
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 00:15:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 62AFD10F12C
	for <nouveau@lists.freedesktop.org>; Thu,  2 Jul 2026 00:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782952232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uE2Z0sUsxkHX3B7YJ/WYKbzZMFygNnjUDTM1KHzHSbg=;
	b=NMMXVho79QdNxss59SE8jo1HKEohYC0cedXO0bZDFo+5StgmkD0grA46h8rooYQq2+CEC+
	3/JXyKaBqXLvh/Wn1rzGVAugfOAnweCrfCZvggGUe8Ix3SdXLxP4lP7B2XqfcN5cK+/pGa
	HuUeyXnUZzIRKN9mUdyAFTWZkZnDtFw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-EE2doD9wNv-_2j9jUHdgVA-1; Wed, 01 Jul 2026 20:30:30 -0400
X-MC-Unique: EE2doD9wNv-_2j9jUHdgVA-1
X-Mimecast-MFC-AGG-ID: EE2doD9wNv-_2j9jUHdgVA_1782952230
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c889d1eebafso2045226a12.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 01 Jul 2026 17:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782952230; x=1783557030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uE2Z0sUsxkHX3B7YJ/WYKbzZMFygNnjUDTM1KHzHSbg=;
        b=UPJZx8Jd1OwFmNliYM98Uj2egIY+xjgwi8SLWc19crQFmxb1e1O82mTzoc0WL3TMO7
         AovNhlwWZ7Q8md6A5l3snv8F9baebsCm5tAaWgnlni4ll9lCyR6zaVKa97HxPdCam2va
         ZF+AbLuC2N+3yMhEWd2keMmlNJB9Ubedmus62FRI8ArYUJR6cmEqJcq80465PLtR5tE7
         79+ica0xOiEDI/H5hGFSuLCV1KqhpKobgYBlw0a+XtgeKYyPe2ld8/ZnCg69fYeBa6eL
         h+OSf0qEbnpIms8yLC584PeOO0o5KNHT/symqWwJn+MjQMV3ITFBk+vTTG5yFicUQJbj
         BCIQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+4Xzw7UFe/8q96lniCKVx0dc3+W5QMwvqRBOWJnuI5vgqHJMDJ8UOb6jBWDmjjod5I99Ok0WhB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysEY2si65ytzbi87LmhjLo9pdnbYM3pcehACxLs9M+Y8M6Pmup
	sLcZ8GePW348HBG28KbNzGvUV25QnApuGjU3K1hj/2TfV0+/49QdASGCQ0/oQ5Rqi32EZunXhFk
	HdJV4SUMDSzSjhJbXqc3jE7IYG//KqhtbmCveRJUaB++oY6clLzDWAwgTUhRRHhPOGu/XBE/wpO
	8JDC0gLtBBFsGwNShlRhcJZROSE5aEokyrw9pv/TPAVg==
X-Gm-Gg: AfdE7cl+Zba62B8ShS0+AAK66QAH+0eHl29Whbd4cbFhpZ4YdYBs6ucDkif1J6F+vjn
	Oo1jKICF/A0pEZqXT0EhSbFtuX1SmnfceOZafZJKpXpvanyTLypgj3colG8cfAGkhSCBxT/a73F
	G4NzNOVrK8MgXOf5g26wxCBZixCZUnXw4WglIJL3ojaJmku8Vc6swvA6QcHb44NfvSa74rFVgkJ
	KP3opWicf0tcYQ60+9eTBOah0s=
X-Received: by 2002:a05:6a20:9188:b0:3bf:6237:b1b3 with SMTP id
 adf61e73a8af0-3bff428abb9mr3232512637.42.1782952229727;
        Wed, 01 Jul 2026 17:30:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:9188:b0:3bf:6237:b1b3 with SMTP id
 adf61e73a8af0-3bff428abb9mr3232455637.42.1782952229092; Wed, 01 Jul 2026
 17:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260701182857.190713-1-lyude@redhat.com>
 <20260701182857.190713-3-lyude@redhat.com>
 <DJNNQVO96RR1.141CE7TKF6MZP@kernel.org>
In-Reply-To: <DJNNQVO96RR1.141CE7TKF6MZP@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Thu, 2 Jul 2026 10:30:17 +1000
X-Gm-Features: AVVi8CcxrtJSClXEO5FKdmTHOwuAtmkEnH-VE9hidyytnYNh0i2fFS2pSdVPCWA
Message-ID: 
 <CAMwc25qA6GFb1Q=VHTa8BcM85B2dr22RrgdJcHTz70P5Xjj_bA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/nouveau/gsp/r570: Never enter Gcoff state
To: Danilo Krummrich <dakr@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wfFXNCKQsb3HQ-BS9PkkVSLHpvB49fHo0oXoh-LFvU0_1782952230
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IPUHP4DMG6CJLDOBGY6C4TCLPVHB6QPU
X-Message-ID-Hash: IPUHP4DMG6CJLDOBGY6C4TCLPVHB6QPU
X-MailFrom: airlied@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IPUHP4DMG6CJLDOBGY6C4TCLPVHB6QPU/>
Archived-At: 
 <https://lore.freedesktop.org/CAMwc25qA6GFb1Q=VHTa8BcM85B2dr22RrgdJcHTz70P5Xjj_bA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Jul 2, 2026 at 10:27=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> (Cc: John)
>
> On Wed Jul 1, 2026 at 8:17 PM CEST, Lyude Paul wrote:
> > It turns out that the only reason our previous fixes looked like they
> > worked for this was because we would occasionally set the Gcoff state t=
o 0
> > in the normal S3 path, which fixed suspend/resume on desktops - but not=
 on
> > machines using runtime suspend.
> >
> > The proper fix is to just never set this flag. Our current guess for th=
e
> > reasoning behind this is that Gcoff likely coincides with GC6, and not
> > literally power off.
>
> I don't think GcOff coincides with GC6, it should actually be a power off=
.
>
> From a quick glance in OpenRM, it seems that with bEnteringGcoffState =3D=
 1 it
> also saves off buffers flagged as MEMDESC_FLAGS_LOST_ON_SUSPEND.
>
> My guess would be that with bEnteringGcoffState =3D 1, GSP's resume path =
expects
> certain kernel-driver-allocated buffers to still be in place that nouveau=
 didn't
> save off, or rather never had in the first place.
>
> John, do you have some details about this?
>

In nouveau we have the INST_SR_LOST target, for buffers that aren't
preserved, I wonder did something change between 535 and 570 around
what needs to be kept around.

Dave.

