Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEA0CA9EC1
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 23:24:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8DED9112325;
	Fri,  9 Oct 2026 23:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eNc3HzeV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9954648A14;
	Fri,  9 Oct 2026 23:05:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791587134;
 b=qQGZgZ8HO4MWqU0TWWIhMDZorDLVXn+J03RZ3e4213Kq6sY4WzJLUx/ldy7YDXMBV1PH6
 8D/URQLA4YjAVO6hQ0kcJ8Yh6ma7D2BBeGgYyolsD6UJ1sFbt3ESe3kOue9+4hfQZRH5V0C
 8VAkZ1761S5aP2tSJZUTUIZmiNhlGRWNQN3Wfk+W8n544RMY4/Pb8DBKWzX8vXE44F4HQTv
 y2b1croo085prPsg14xm1qZwfCV51YfcwfueU2dn3DgLq/znOjH3yIPt5ddmND4udTKROwf
 Ip8mSmQ6H8M6XWMbrF/G64fiBnuzW76TVyfexsfDFXF+gJNWyDEefL5oCz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791587134; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZdLXwKy4rMVRiAcn1ajTN/XCnaFe6z5Qy+Wx1ZS4ezs=;
 b=rMxw2TATCTJ9mVJYDAMnVSrICrQJCylLvFbJH7RR7qcp3awYgbcr5Sr6kU+j86NvIXdsg
 dc3a/SjulGE8zFpa4rKF+r1/BiEoyXy0PTOEUBMBgk/fIi04vJcRFDXuS/TKwbfe9QeyNSw
 LRetB6tLP8n6+qfVqrgyW8O0kbLVw/pDijuckx1KtWFxKEm2IUtmgOUleV1pvXkV4H6QLPQ
 AQg/0YQLr10ICkZOLgny94mZJ8fmSfiSC+rIMrOAfGvtuyTj4XwYnnqUAMrpgR9W8g+Qkfw
 jN9FprVS3SpvYzofo6AjpD9ukegcAnM34ldVTtz/lYs7sUQZtXBCH7bm8F6A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CA80948A14
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 23:05:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6834D112315
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 23:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791588237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdLXwKy4rMVRiAcn1ajTN/XCnaFe6z5Qy+Wx1ZS4ezs=;
	b=eNc3HzeVCFSAiM9FA1Qxy8f3DWDsuFuNvJW+/xr0HnbSled0QsMCXnpXW0m2iV5KlwbjRn
	+6KA1Kg2pImli83ARBGIUokOIQ3GLPriCO2mL7rK6KbnYLE2YPdj6M4E0Hm4kFMWea2KI+
	pKXigQQYFtrPqKllQtFWV1Aagp1r884=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-p5C2bAvFO5CdGuABb4xEwA-1; Fri, 9 Oct 2026 23:23:56 +0000
X-MC-Unique: p5C2bAvFO5CdGuABb4xEwA-1
X-Mimecast-MFC-AGG-ID: p5C2bAvFO5CdGuABb4xEwA_1791588236
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-535851217d9so5002831cf.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 16:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588236; x=1792193036;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itTUK0qBJAobOiyoWxRrJ2RE7+6HMxd85fVudqmm2Kg=;
        b=YI07/60D0wqGqWXtfkmOb1Czmo7Jq37JGvk5ZTuC3yuG3b/6YCsSOPayx9GnJ9AbOX
         zLIHQWlFqxRF3AYumKQqm+UgDMkKXhcT9bUCcKF5V93jiuZ4UFFPvPjLowVysHtVzMWP
         GYWenbsKfxZmw+IRHo+XPONWcXu9H6LTPyW2VZN4ziHa1eg9uKzBWrHmstLYliwh8IP9
         X75KsYNnXzOs0kGaJH+JX66TuCdyK49fn6q7zy4/ETH7TseutvSzXARtlVsSQCOIkBqv
         TSKNSQVm4UM9TNEw/rfRscL2x49jr6SfD4CxEPHUzVe9WtbNZLiy9ZtmVkEIoE8QFt73
         hsvQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxtfTbuQT0i+k5W3DD52Q24btfFuaHbUU9SA0fEw5SV7nHE3hP+nQyACPKTUvZZCTkCNrfuiKbe@lists.freedesktop.org
X-Gm-Message-State: AFq9FYI0mBQXuJZgGTXbgAGnnpUNJZOeNwSnteudzXTao/RCkZNQwZ2O
	UbCqSmXgrROe2DwKKQ6bwRcGtb3DsEKrUIQvi08jmRwApwSxvQC9TPpxaTyO1O4df2mDwgZrtKy
	eLODOl97NPryNSO7xuiJ5Q8tZkfPrKwIo/CMVgWxMwIivIZ1Za/2YT7ut93vpNgL7uxU=
X-Gm-Gg: AYBFou3iEPUfZC3Kc3l/KCdV1PvsCDXN2oCI75tiA+dDZ1hBowym3be2vDJG+qudo09
	y1RwPNWLuDN6FUG2JE35DJqEq1x2Di1m97vc8iUvUef/E/5AFUClGW3RmDrEDw/fb7Bjpu9tQZd
	m7/Ms0fMgtbtmgK243eval8ZIyGtkHBuN2bCcjqH5Jc6TWQQtMmID9qBZa4KNsUn8F0VjMc95uu
	3+JnXthwv61DuudZMV0JxT5T/WeaVknKz8GEPKubtbeyOyP/8CtcAk+sOQsrfdQUNYRLyGjqQwk
	4EatPGTfgdd8cpIuSG3P0+PyUQnBACVq6+lZgxJ/YiD8SjPR7Ef8j1MCvS/v1flAvGO5dhc=
X-Received: by 2002:a05:622a:4c0f:b0:535:384d:68ac with SMTP id
 d75a77b69052e-5359facfcbamr53929131cf.13.1791588235693;
        Fri, 09 Oct 2026 16:23:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0f:b0:535:384d:68ac with SMTP id
 d75a77b69052e-5359facfcbamr53928871cf.13.1791588235223;
        Fri, 09 Oct 2026 16:23:55 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5359b277938sm29237071cf.0.2026.10.09.16.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:23:53 -0700 (PDT)
Message-ID: <4200b4cefe4868fc3ca085d01957446ebfdc53e9.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/sw: prevent NULL deref of disp in
 vblank methods
From: lyude@redhat.com
To: Zhenhao Wan <whi4ed0g@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>
Date: Fri, 09 Oct 2026 19:23:52 -0400
In-Reply-To: <929077046827f363bc32f6f59e760de27a48b5ff.camel@redhat.com>
References: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com>
		 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-1-7e057f6aeba0@gmail.com>
	 <929077046827f363bc32f6f59e760de27a48b5ff.camel@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zSPIRGHIuyKvIx-clx6UNjictDrDJZ8m0leFvE8Kkqw_1791588236
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LVB7LNQXQ2XEZIQV2IOEQZVWBLQGZHUK
X-Message-ID-Hash: LVB7LNQXQ2XEZIQV2IOEQZVWBLQGZHUK
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LVB7LNQXQ2XEZIQV2IOEQZVWBLQGZHUK/>
Archived-At: 
 <https://lore.freedesktop.org/4200b4cefe4868fc3ca085d01957446ebfdc53e9.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Bah - sorry I keep doing this :), could you add a fixes tag for this
and respin it before I push it?

On Fri, 2026-10-09 at 19:22 -0400, lyude@redhat.com wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> Will push to drm-misc-next in a moment
>=20
> On Wed, 2026-08-12 at 23:00 +0800, Zhenhao Wan wrote:
> > The NV50 and GF100 software-class vblank methods
> > nv50_sw_chan_mthd()
> > and gf100_sw_chan_mthd() evaluate "data < device->disp-
> > > vblank.index_nr"
> > to validate the requested vblank head before allowing its notifier.
> >=20
> > On a headless card the display subdevice is absent:
> > nvkm_subdev_disable()
> > (strap-driven from devinit) and the -ENODEV path of the
> > NVKM_LAYOUT_ONCE
> > device constructor both leave device->disp =3D=3D NULL while the device
> > continues to probe and still registers a render node
> > (DRIVER_RENDER).
> > An
> > unprivileged client holding a /dev/dri/renderD* fd can then create
> > a
> > software channel and push method 0x0408 (NV50) / 0x040c (GF100),
> > which
> > dereferences the NULL device->disp and oopses the kernel.
> >=20
> > The channel constructors nv50_sw_chan_new() and gf100_sw_chan_new()
> > already tolerate an absent display ("for (i =3D 0; disp && ...)"), so
> > no
> > vblank notifier is ever registered on such a card and the method
> > handlers
> > are the only path that assumes disp is present. Guard the
> > dereference
> > with the same disp NULL test the constructors already use.
> >=20
> > Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> > Assisted-by: Claude:claude-opus-5
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c | 2 +-
> > =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c=C2=A0 | 2 +-
> > =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> > b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> > index 0171cdf6f639..4cf8cd120c76 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
> > @@ -72,7 +72,7 @@ gf100_sw_chan_mthd(struct nvkm_sw_chan *base, int
> > subc, u32 mthd, u32 data)
> > =C2=A0=09=09chan->vblank.value =3D data;
> > =C2=A0=09=09return true;
> > =C2=A0=09case 0x040c:
> > -=09=09if (data < device->disp->vblank.index_nr) {
> > +=09=09if (device->disp && data < device->disp-
> > > vblank.index_nr) {
> > =C2=A0=09=09=09nvkm_event_ntfy_allow(&chan-
> > > vblank.notify[data]);
> > =C2=A0=09=09=09return true;
> > =C2=A0=09=09}
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> > b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> > index 0cfb1eaae6de..b202e11238a5 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
> > @@ -69,7 +69,7 @@ nv50_sw_chan_mthd(struct nvkm_sw_chan *base, int
> > subc, u32 mthd, u32 data)
> > =C2=A0=09case 0x0400: chan->vblank.offset =3D data; return true;
> > =C2=A0=09case 0x0404: chan->vblank.value=C2=A0 =3D data; return true;
> > =C2=A0=09case 0x0408:
> > -=09=09if (data < device->disp->vblank.index_nr) {
> > +=09=09if (device->disp && data < device->disp-
> > > vblank.index_nr) {
> > =C2=A0=09=09=09nvkm_event_ntfy_allow(&chan-
> > > vblank.notify[data]);
> > =C2=A0=09=09=09return true;
> > =C2=A0=09=09}

