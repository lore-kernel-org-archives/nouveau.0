Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95130C4452B
	for <nouveau@archiver.kernel.org>; Tue, 21 Jul 2026 20:08:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 28C5F10EB3A;
	Tue, 21 Jul 2026 20:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="chJgMWMM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D699C472A8;
	Tue, 21 Jul 2026 19:53:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784663604;
 b=Idrn/HqCfkpg1YRdZAkfJr9G2S4gUe7zzIz6YcQg+2JQ5RIAzztcENHwC1YoVciJIus1f
 T4FMBOsd17uJfyOeN0kDSSLHbskN61Y6JqH1qO+Iw4fOVZmwRBbltDLnU2nOR3u5zp1ex1D
 66lncE2K3Nue7hkNTrRH0lw+QWl16XMulci/NTNb6J1RW3SE/znGs+nKNqc98TIwB9DH5j/
 DY7RhgoUHkxKa4zdOHSZ86s3RDKjzw7Aax/xnMt2G/ycQx1Y4E7e5wGK28XKANAkSJduyvE
 MValVnZylueA+IEMh1MtkPxSkvVf/TJLCixZTrS1SjB27ymtyzqUoS5CN7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784663604; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kAHPDe7ybewGiUFEcOR2l6oFJvAxNe2N1MZePQ+DsrM=;
 b=uIbQ53UNzpU9QiMJpLzlXiQfyKcj5bk64QAmOEMFqM9Nx1Qq5iXo+NINw7nrMv8y5MKfi
 GLt1E56ZW1ne3K065VeXNxsEilKqraWwDpaxi7rW5kgYbn7z+rADDgtu7BrE8+GCPnaUlP8
 fkS6fkLyaI27RJ8jOeXqxF3nmNkxwv0BAoo1HX0DE39L2PmQ23zyLngBcHZ7pnv+A4J0GAZ
 6cjCYFTbfuev050D3KEGCObAmYxDFafNuzKuPy/1mUoLNjt5ftn3Ndsy7PaY+fBmr9cG0nk
 p3BYjoo4FjUlNoffYb49diSn2zqx5k6v+Mx90nTSayM5ruR1aFFb8TtMvy7A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A0966466F6
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 19:53:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8649510E08B
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 20:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784664530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAHPDe7ybewGiUFEcOR2l6oFJvAxNe2N1MZePQ+DsrM=;
	b=chJgMWMMF8V8ROuZHaKIrCeDRY0fFyWRVmhU8IWqrRhzFBMObcIzhGV7cHSEenY3EctIaS
	P9gvzpUtGpS5otbsC/dGwjkjdd5WFA0oQ8sYqEVo+mBoGzPK8o+hjRzxchTmiVp0DQjd43
	+mN9eprrmEs0KSo0atq26lnMpLkiDG4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-w_98714YPfaxRpwfnV6K0w-1; Tue, 21 Jul 2026 16:08:49 -0400
X-MC-Unique: w_98714YPfaxRpwfnV6K0w-1
X-Mimecast-MFC-AGG-ID: w_98714YPfaxRpwfnV6K0w_1784664529
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8f0867a75ecso132713586d6.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 21 Jul 2026 13:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784664529; x=1785269329;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoOouUI2xFyBZQ4n8b5UEgP4pMR5eMIkpQq69XgErXE=;
        b=UhsQAsYznQloGX8ef0pjFo3BBrPqX3QN9DkmLp2E7kbYiN19ymoP0duUOZzPHJxXSP
         iCAPWknBkzqPM04usYDGnL7HNkFzdFRdjNa3/kZSwGUicmyeHGTqi3ID/6Gxt06JWfqf
         EWClxHVPSsIsxSQJLYDx9MhrkrDO/zeWJMyScWK6yHS4BGqxhJI3ySDWW/mjZ5CdGmiL
         2tYBERQZjqM7YL7V7DTfPfVCQN4jftqkaVNtV9x5bHHr84cUeAjt09pPx/dK/84GQCJB
         dcFN80IhlxBofiZIYPCkGOBy5kTFMr/3Np64LSTvGtMDlPgBfKJbZeq3ic3Kp1UhebpW
         zZvg==
X-Gm-Message-State: AOJu0Ywqxk5EnaFiBfUdctgjpGP2ZCGpRtRm3V8Zs95iVWZ21mUonQHc
	CGK/cFerTwrD9v5eomiPJWh+tfknPE6Loq6M+iEfQTwkDm//JdXym7agEGHdcSpf+p9smwM+1Sc
	HxeGRCKksDSlXdQCpIzY52anYfKfBe7jRlGY3tBM76Ca7ZstGut/isqYEbHaSxCvZSFjBhzehVB
	RjYYrSd2R1kGl0N8h38NjDCDc2IBU9Fp9uo0OZj+4vIZmBMAM=
X-Gm-Gg: AR+sD12gZLWWpoi3FKB+YC+TxTG2DlPecci8bIi30BiNGlsABCnDtDrjggHKoKbwxiE
	ZTK+fXRjSbPitUEKBl7iBFomhIwZEaqJo1NFnOoL2+6pJESGWF9zil2ae/bmlFDzSUf72S3KW6A
	5tPuZWbJXk+K26Fxa3YgL91sW/oznwMwZiIuwSsqm2HIlunIjDaAutwoDu93LWPRnvKWfoaEzgT
	siX/0M0rZ5Z4YffFD/nWJKmUib0+IJHFR7Fnt4XmPusKRu3roDW99zNFVt0whRuGTjLh2zQ0WD6
	t8X/9MhFxtZmA9KIBnyY3X5BWG3iuom8+0HR5d0ZMTN+8HYnah7+qX0d+yqU7pmQDkESKfeL
X-Received: by 2002:a05:6214:e87:b0:904:546a:1c47 with SMTP id
 6a1803df08f44-907783dbe63mr224352396d6.53.1784664528534;
        Tue, 21 Jul 2026 13:08:48 -0700 (PDT)
X-Received: by 2002:a05:6214:e87:b0:904:546a:1c47 with SMTP id
 6a1803df08f44-907783dbe63mr224351876d6.53.1784664528014;
        Tue, 21 Jul 2026 13:08:48 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-907baa27ce6sm3874066d6.45.2026.07.21.13.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:08:47 -0700 (PDT)
Message-ID: <c7176459c23a43167a63ede73d2ba9b0c805445a.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] drm/nouveau: Fix WARN_ON() from missing blend
 modes
From: lyude@redhat.com
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Date: Tue, 21 Jul 2026 16:08:46 -0400
In-Reply-To: <20260720205541.257781-1-lyude@redhat.com>
References: <20260720205541.257781-1-lyude@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mt4wpXEjX7PFguuUYAHhDQccPGnKCTP5bWZUX8Zk1io_1784664529
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NW4OSYTP2CW4NIDUWIME72SETVIPWW6B
X-Message-ID-Hash: NW4OSYTP2CW4NIDUWIME72SETVIPWW6B
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Marco Crivellari <marco.crivellari@suse.com>,
 Simona Vetter <simona@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Stone <daniels@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NW4OSYTP2CW4NIDUWIME72SETVIPWW6B/>
Archived-At: 
 <https://lore.freedesktop.org/c7176459c23a43167a63ede73d2ba9b0c805445a.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

I had thought that testing this on fbcon would be enough, but there is
still more issues with this series I found when adding these to the
kernel I dog food on my desktop. Will figure them out and send another
respin of this series asap

On Mon, 2026-07-20 at 16:43 -0400, Lyude Paul wrote:
> Recently a change went into the kernel to ensure that drivers which
> expose color formats which have alpha channels. This would cause
> nouveau
> to hit a WARN_ON when setting up cursors, since they do support
> blending
> - but we never bothered trying to hook up the controls for it to
> nouveau.
>=20
> This fixes the issue by ensuring that nouveau always exposes a blend
> mode for any planes with alpha channels, regardless of whether or not
> we
> have control of the blend mode hooked up. If someone wants to add
> control for this in the future as well, it should be fairly easy to
> hook
> up with this.
>=20
> Previous version:
> =09https://patchwork.freedesktop.org/patch/741031/
>=20
> Lyude Paul (3):
> =C2=A0 drm/nouveau/kms/nv50-: Add .blend_modes to nv50_wndw_func
> =C2=A0 drm/nouveau/kms/nv50-: Introduce nv50_wndw_default_state()
> =C2=A0 drm/nouveau/kms/nv50-: Unconditionally create blend_mode prop for
> =C2=A0=C2=A0=C2=A0 wndws
>=20
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/curs507a.c |=C2=A0 3 ++
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/disp.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 +++
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/wndw.c=C2=A0=C2=A0=C2=A0=C2=A0 | 4=
0 +++++++++++++++++--
> --
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/wndw.h=C2=A0=C2=A0=C2=A0=C2=A0 | 1=
1 ++++++
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c |=C2=A0 1 +
> =C2=A08 files changed, 55 insertions(+), 7 deletions(-)
>=20
>=20
> base-commit: b0a652436b892eb9a036a031b33099dca036faaa

