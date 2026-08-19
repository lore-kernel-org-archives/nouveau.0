Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C07CC5DF7D
	for <nouveau@archiver.kernel.org>; Wed, 19 Aug 2026 00:02:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F003E10ED06;
	Wed, 19 Aug 2026 00:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AYVU13Wm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 378A947956;
	Tue, 18 Aug 2026 23:45:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787096747;
 b=dZ0rQFXg4BI26qmTjc+1M87u9OurhwIekx9IoBgdxNXhzRSIpzl/b4oVy6DAlcB6FxN6u
 TKONfbo0tax4TWSaiX/7lxO6Pnon/E9L5MTA8lIaJmj2O9diTcC6wpTiWt5QVGjFZerYE7a
 eCFQjPNHN2yRLGU+x8cJTMayMGnz7+ksKzaQ7q9U02OFctrk+OVByIGIHWVdFT/4qALUV3T
 1AoJkPvpynEvKSPTKLQh5cOzAQSyQDDER+IuCMQN1Kp4XYOFs8qY5r42YfcDXe7PE39i7rG
 Pv1tASm28K0AQ4Qh6PQvGvEpsfOWC+1X4zgfqnlxBeeJ1geWy+Nq79qlzpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787096747; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gUqJG69YbmkVqa7BJeUUv+0NNdL/7u3t7EUGaMdcZdg=;
 b=f1YSFI/e3k3sEWB9eClKKfa5asTKdUMS3xicG0VPcChOKgsXZiUbfxnoumde5LYLmH/Sj
 ezVhmjxbaTR1/V40ad1pltpJWZBSLaDKsnTt8JZlQ6dkkbbHUJ0zYE3xEjzoM7epcwA60pT
 cPMawTG0CHHnJgYQ+hIYrinnIlIr3Cdteg8/zPO2VN042B4RjmkchUNsK6GgptwBxUL6BA6
 7LHtF/QNb9jJs8+6nTz8Foj1/Y3APthqAXsa2wuFKrAilpri2/ks+ML/RQpUaheM0Xw1DIH
 VRhRSNE3YiOq7c4S2FmR0ioDuYlE+QWTK865m4FaJUVWk5eRhPkiO2WamIkQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B19D1478C9
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:45:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 22A6810ECF3
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 00:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787097735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gUqJG69YbmkVqa7BJeUUv+0NNdL/7u3t7EUGaMdcZdg=;
	b=AYVU13Wmf9/esGEnvgvPj6amy4Tba9k48xsEk541EhUiGukmWTdiJM7lJyXrTgPwVH+kLt
	2y/scZkzkftrRGwjZ3wcK+itPgfP8VWsJMgekxpSEJ9DUl7kUbVhS1psuj6xCfkFF6fm90
	9vtR9bplE5qdmyKrhPufmu/8M5uUoXw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-YM2GHMqWMP-N6bgKheqnqA-1; Tue, 18 Aug 2026 20:02:11 -0400
X-MC-Unique: YM2GHMqWMP-N6bgKheqnqA-1
X-Mimecast-MFC-AGG-ID: YM2GHMqWMP-N6bgKheqnqA_1787097731
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e695a3b28so175900685a.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 18 Aug 2026 17:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787097731; x=1787702531;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUqJG69YbmkVqa7BJeUUv+0NNdL/7u3t7EUGaMdcZdg=;
        b=DYM87es9XrW+IqYyYq5KksGQ5DPujXNvxJqZ3cOKLSq8gxw/l1hCIsZ1EfFb58gwzs
         mfvmMFDuHyLgGIEZGwEUYqcLb6hIgTHv9kYy21JcQSp3N+wEOaB4zz87KLA58hxDDUpX
         9oXtYeMLT7d3tWUBSB1LAhKMbEuaBv+KINzNm07OyMlpq0R4zH6b0FxwFcWW6QgKHWSu
         OGgXI2FyoyI7AQMtK1mDbfhAKlrKsggxVu/zNC+LCW7kdRH+rVVTrqaYZVgIcOtbFqo/
         Bj2ZchmGFfcBEXcBaMZncjwdumqxyx9gclk2lKNR8E9aZRoI5DylL6ugPTgUmwV3Uzow
         xc9g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoJ9BK1EE5izg7VsRRWIzHXDonV49SpnL0M1uj30yr35bFlG3K3+xuFMy7p6l3wH9QXyy1n9TMG@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+d4T2UbBi84OxYWOpi3+qtK6TSjt4w9EouRSGraDSNHF3KbMl
	TUfbIJqa2hIA/7FjVaHAwCdmRzJU4r+eGdJO1ikpekKulLLyRaZhK883BAo38WSaAiKW6qh9KMm
	rUxXzRK3J1sofmgPMNPMy+kheZMIsQxnmeVWwfAmZlLLRtIeL+zCIubBHnpO6U32zd+M=
X-Gm-Gg: AR+sD13w/jC7IOTqYv+XAEz2ubkZxT7xJXIfMiQKczhzY1Urvwaqvx5zuYyXNrHLokM
	UMBEnpzLwjl2oTXKJx9X/pPotXl0jcIHmCQJuWNIw0XMvxqyRmFAh4ol6anNx78WqvrPtVc5nUI
	llgFSE0sXm0rCocb1ImA6FYO0V06IzCRVICaBYgjeoSXZBDvlpiOkhqBacug2auPrS9sca9EpGG
	FxpDKPaNltoxcWIO/YhAZuu/i24/DOyKR4NKQ8U+ZbWtLDCTdKLmL3TJbg4Yf859q2xotuzaQ6A
	NKX45Tp/JHD97GfGoxwOF/C/VPsuzrMZhUrvmQpNMQ4EvY7zRLpCG9vXvR/fbPjWOION+yPj
X-Received: by 2002:a05:620a:2986:b0:936:9253:897a with SMTP id
 af79cd13be357-9371e430b4cmr101027285a.9.1787097731230;
        Tue, 18 Aug 2026 17:02:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2986:b0:936:9253:897a with SMTP id
 af79cd13be357-9371e430b4cmr101019085a.9.1787097730662;
        Tue, 18 Aug 2026 17:02:10 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9372059ae63sm12749885a.46.2026.08.18.17.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 17:02:09 -0700 (PDT)
Message-ID: <6244a95cc925d8b0f3c01ac000ca56dad246305b.camel@redhat.com>
Subject: Re: [PATCH v4 0/2] drm/nouveau: NVAC (MCP79) stability: MSI rearm
 and a NULL crtc guard
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Tue, 18 Aug 2026 20:02:08 -0400
In-Reply-To: <178688574400.522643.6695278742335367229@gmail.com>
References: <178688574400.522643.6695278742335367229@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Li-9Jxky7XNAjtEKfH5XPszYnSTXK_l1PetgeHSRJdI_1787097731
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5674AJ2E2N53HC5ZYYAOMBTFL24YRKRB
X-Message-ID-Hash: 5674AJ2E2N53HC5ZYYAOMBTFL24YRKRB
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5674AJ2E2N53HC5ZYYAOMBTFL24YRKRB/>
Archived-At: 
 <https://lore.freedesktop.org/6244a95cc925d8b0f3c01ac000ca56dad246305b.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

First patch looks fine, I sent a new patch series to address the issue
pointed out by patch 2, as it was a bit of a bandaid around a larger
issue.

Will push the first patch in just a moment

On Sun, 2026-08-16 at 15:09 +0200, Marek Czernohous wrote:
> From: Marek Czernohous <marek@czernohous.de>
>=20
> This is v4 of two NVAC (MCP79) stability fixes.=C2=A0 v3 went out on 11
> June
> and has had no replies:
>=20
> =C2=A0
> https://lore.kernel.org/all/20260611124535.527275-1-mczernohous@gmail.com=
/
>=20
> Nothing in either patch changed.=C2=A0 Same diffs, same reasoning, same
> trailers.=C2=A0 The reason this is a v4 and not a ping is that 2/2 no
> longer
> applies to mainline, so a ping would have pointed at a series nobody
> can
> test.
>=20
> What moved was somebody else's context, not this code.
> Commit 5164f7e7ff8e ("drm: Rename struct drm_atomic_state to
> drm_atomic_commit") changed the callback signature, so
> nv50_sor_atomic_disable() now takes a struct drm_atomic_commit
> *state.
> 2/2 is rebased onto that by hand.=C2=A0 1/2 applies unchanged and is
> byte-identical to v3.
>=20
> Both bugs are still live in c21bb4193868.=C2=A0 dispnv50/disp.c:1568 stil=
l
> does nv50_head(nv_encoder->crtc) with no NULL check, and there is no
> guard anywhere in the function.=C2=A0 Immediately below it, :1570 takes
> nv50_outp_get_old_connector() and :1572 dereferences the result
> without
> checking it.
>=20
> 1/2 drm/nouveau/pci: use config-space MSI rearm on MCP79/MCP7A (NVAC)
>=20
> =C2=A0=C2=A0=C2=A0 NVAC re-arms MSI through the MMIO mirror of PCI config=
 space,
> which
> =C2=A0=C2=A0=C2=A0 is unreliable on this IGP.=C2=A0 A missed re-arm leave=
s the interrupt
> =C2=A0=C2=A0=C2=A0 line dead, submission times out and the GPU looks hung=
 until
> =C2=A0=C2=A0=C2=A0 reboot.=C2=A0 Give NVAC its own pci func that re-arms =
through real
> =C2=A0=C2=A0=C2=A0 config space, the way commit 5112abc6a433 ("drm/nouvea=
u/pci/g92:
> =C2=A0=C2=A0=C2=A0 Fix rearm") already did for g92.=C2=A0 Only NVAC is sw=
itched, because
> =C2=A0=C2=A0=C2=A0 that is the part this was validated on.
>=20
> 2/2 drm/nouveau/kms: guard NULL crtc in nv50_sor_atomic_disable()
>=20
> =C2=A0=C2=A0=C2=A0 Restore the NULL check that
> =C2=A0=C2=A0=C2=A0 commit f575f2bdb6c3 ("drm/nouveau/kms/nv50-: Remove
> =C2=A0=C2=A0=C2=A0 (nv_encoder->crtc) checks in ->disable callbacks") rem=
oved, as a
> =C2=A0=C2=A0=C2=A0 drm_WARN_ON_ONCE() rather than a silent return, since =
a NULL crtc
> =C2=A0=C2=A0=C2=A0 here is a state-tracking inconsistency worth seeing.=
=C2=A0 The guard
> is
> =C2=A0=C2=A0=C2=A0 hoisted above the backlight teardown so the old connec=
tor is only
> =C2=A0=C2=A0=C2=A0 used after it has been checked; without that the oops =
would just
> =C2=A0=C2=A0=C2=A0 move a few lines down.
>=20
> Testing.=C2=A0 The MSI change continues to run here on the Mac mini as a
> daily driver, and Fab Stz confirmed it independently on an iMac9,1.
> Both Tested-by tags are carried over unchanged from v3; the
> diffs they were given are the diffs sent here, apart from the
> mechanical
> rebase of 2/2.=C2=A0 For v4 I rebuilt 2/2 with
> CONFIG_DRM_NOUVEAU_BACKLIGHT
> set to y and to n, because the patch splits the #ifdef block in two
> and
> that is where a change of this shape tends to break.
>=20
> If something about the shape of the series is what is holding it up,
> I
> would rather hear that than keep rebasing it.
>=20
> Marek Czernohous (2):
> =C2=A0 drm/nouveau/pci: use config-space MSI rearm on MCP79/MCP7A (NVAC)
> =C2=A0 drm/nouveau/kms: guard NULL crtc in nv50_sor_atomic_disable()
>=20
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/disp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 30 +++++++++++++---
> =C2=A0.../gpu/drm/nouveau/include/nvkm/subdev/pci.h |=C2=A0 1 +
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/device/base.c |=C2=A0 2 +-
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/pci/Kbuild=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c=C2=A0=C2=A0 | 35
> +++++++++++++++++++
> =C2=A05 files changed, 63 insertions(+), 6 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/pci/mcp79.c
>=20
>=20
> base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86

