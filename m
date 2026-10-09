Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F1ACA9EBB
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 22:01:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F114A1122DD;
	Fri,  9 Oct 2026 22:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d4A6d+lp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3339F48A30;
	Fri,  9 Oct 2026 21:43:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791582193;
 b=yE3IvOuUM0gYuiaj64F0DAJDeY42TXvRwAl5zhRn2Q7pBy/V5MyZ8DdxkpvlHwwcFDf61
 6vXo6eR/TR+JyeGNSLquuqISsFEkJdeFCb1d7LEACmXx3m5ToGhpC/xHqgNUpS4ucMbzNPH
 KWRGzBj0Yn3mXd+YEqGsXFCwlbkWL9n7fLpJNYWY2uNPt28dmpb6xKik3+yTfcrsb3Zdgsy
 p6CfwAuhQ2bWeYReU2RZRMzcFDwEQLc0tNSmCvAZX7E+7sVMHWZdtqdXUFPPlsKTuCEFZBQ
 qVMCzv+8oZkFNuD87zGYBTVzBOeqqbQCN69WkkVPTCIJKunTh+wByQTUKrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791582193; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=T7imtYyWMwIHvOB2ZFxNOfZ9OLtnlcEZ/kjK2JkgTcA=;
 b=O92XXoEziIFofFaYyn3KKxImoPjQp/it1V4kLrt1gGDMDuWBCzOSrv/beCg/ugWr1W/rr
 tI2VqrZKjXDGlZ+lOFOku7iT1D+G1BE/pukaYHjEU1ZJIYRRBlc2aL2ndQaDta56hDW/UsN
 ZB5o7p2ZwcJ1J73Xd3KsOG/0tMpkhp0b21YCKMAkl+H2BLhESeDWXCzbbKFLFPO0wD5xqnx
 JA2bEp2FEplwrFDnqCX1n9l3NhQjPHkZMQpujfKjBACRgP9nsdW+hqBM7Y2E+DN6sZhq4uO
 17EtxGXXO5D3gpPmKow2mHorsPKPYgo6ewE/yhDPaJEmRpW9IgvnlkmCkIzg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A90F148A23
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:43:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 21C5D10EB6E
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 22:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791583296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T7imtYyWMwIHvOB2ZFxNOfZ9OLtnlcEZ/kjK2JkgTcA=;
	b=d4A6d+lp5Rlhq/tvyxLmOswXfNTsx9HOlaYS+c6uYPZv+nPCACP2/aq47C0D9zTiaJN5MX
	iOGiNGowSGwxXmrFLBtEUw74JCfzagIs+UuBe0P4ZhQQEh2yWNhU94Vtjo2YsQl/VOePaT
	B/CVd0zyQ+sUw8hSZzbv+/QM0hevoYg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-CLX2JUSoN6CoUMbcEu8tKQ-1; Fri, 9 Oct 2026 22:01:28 +0000
X-MC-Unique: CLX2JUSoN6CoUMbcEu8tKQ-1
X-Mimecast-MFC-AGG-ID: CLX2JUSoN6CoUMbcEu8tKQ_1791583288
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-917b76ad48cso4977186d6.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 15:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791583288; x=1792188088;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T7imtYyWMwIHvOB2ZFxNOfZ9OLtnlcEZ/kjK2JkgTcA=;
        b=0KAODr4FZxpgHgXSmTgVFR8zjOUooCbmX17thcpX+BEDe9ifIr4R9OTT/VzuGKVvk6
         5gIcaZW2vWn2KAddyAkveR8a6H698nH3KGE5nLQrkUSXtxCJ9mPchBgOsZV+NMB9uuVU
         d6Uu1gwyFqbkKmGKszzhNKtS1mvm9DStCncBd53PFIEg7OdAr3CW2WUhez1yG7LzICwr
         cLX7x1tw9BweI0g+TZiGydcK2DxH/buovWmk/jMKEzQuDhBmDQZdinPwVIVbnghkKA9Z
         M7R1m6OZfhie6xHhc+r59sFdRfQ2BA/z8oA3x5xOzM294qui1upbOiO6ZXiH4zicfATn
         RjJw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxXkgrLAj3gb4Run6Zqx5VVz2CoXsknVS5YSIeJbbGchPF0vKWI3uh5OKcYGEyEb4rT7BuOAPIb@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJ8JglLtaZCGXHxzBFMN0OFMitGBcozvtHukacKITTR+NmKq4Hj
	32dTeCf6VJLY/8QlexAJdkuWCKwcQ9DeBH7gFW4hqddekmj9C7l1aVQ03oDnnGM4Pa7UcS76Voi
	zN4IZEJ+f1GGTT0qS7YKMJ9GO+3PHicHU6tRN6Bq7jZLWTsTkI/0oLdL+q39TiuKcajg=
X-Gm-Gg: AYBFou0OQcRK0t9pBSrI7+yjnKiCGh8HnSaUHkOP9cbzrauUgfiYPE1NOcM5w9gnzpW
	BjEcMnXsXWMZy9Waj8zDX7eWIWMaqaWc2aX88lkEO39fclDGn8Thx+jMf1OtP4w5OjntvGeqIEf
	TUqw2U8Z6yYfW+paig9KoGmOiytfXk/o8MOCZhUDj61YsMKkI5YGDpDYOUUibh2PxKSYM9K0IfG
	crxOx/M956LawJGRjG/OHr9fTh1+JajqNirV+xkFxjZEVGCSL/qWOxXQZG0g47nQhrcufAn2Uk3
	rFIqCbKP6trsMRWyQAiQiEjiiAObsZY/IGl/FxLY/Udj5KLGRgh3qhqDta2vJGFJ1nRLgUk=
X-Received: by 2002:a05:622a:1a9e:b0:533:972d:ff91 with SMTP id
 d75a77b69052e-5359fae1644mr56984101cf.26.1791583287942;
        Fri, 09 Oct 2026 15:01:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9e:b0:533:972d:ff91 with SMTP id
 d75a77b69052e-5359fae1644mr56983381cf.26.1791583287345;
        Fri, 09 Oct 2026 15:01:27 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b5504de42sm29021296d6.24.2026.10.09.15.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:01:25 -0700 (PDT)
Message-ID: <77926aa23a920ed00c5b1a13d98e768e11d6446e.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] nouveau: Fix NULL dereference in
 nvkm_gsp_gcx_ready()
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, Jim Cromie via B4 Relay
	 <devnull+jim.cromie.gmail.com@kernel.org>
Date: Fri, 09 Oct 2026 18:01:25 -0400
In-Reply-To: <DM0N3VIIXERD.PZBNSZJPSEL7@kernel.org>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
	 <20261009-my-fixups-v2-3-839e2bbe514d@gmail.com>
	 <DM0N3VIIXERD.PZBNSZJPSEL7@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kTa7cBoh_JcRPZGkr1LbBDAQ-9_NjrrQ8yzSqdbXQv0_1791583288
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: W2UR7HHK74UEVLNSUUUEHJI5UCCTXWCH
X-Message-ID-Hash: W2UR7HHK74UEVLNSUUUEHJI5UCCTXWCH
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: jim.cromie@gmail.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Campos Ramos <Capitain_Jack@yahoo.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/W2UR7HHK74UEVLNSUUUEHJI5UCCTXWCH/>
Archived-At: 
 <https://lore.freedesktop.org/77926aa23a920ed00c5b1a13d98e768e11d6446e.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 2026-10-09 at 23:53 +0200, Danilo Krummrich wrote:
> On Fri Oct 9, 2026 at 7:44 PM CEST, Jim Cromie via B4 Relay wrote:
> > From: Jim Cromie <jim.cromie@gmail.com>
> >=20
> > Commit cb4c7603678c ("drm/nouveau/gsp/r570: Add support for
> > INTERNAL_GCX_ENTRY_PREREQUISITE") hooked nvif_device_gcx_ready()
> > into
> > nouveau_pmops_runtime_suspend() to consult GSP before runtime
> > suspend.
> >=20
> > On GPUs running without GSP-RM (e.g. Volta GV100, NvGspRm=3D0, or
> > missing
> > GSP firmware blobs), device->gsp is instantiated but gsp->rm
> > remains
> > NULL. nvkm_udevice_gcx_ready() checked "!gsp" instead of verifying
> > nvkm_gsp_rm(gsp), allowing non-RM instances to invoke
> > nvkm_gsp_gcx_ready(). nvkm_gsp_gcx_ready() then unconditionally
> > dereferenced gsp->rm->api, causing a kernel oops:
> >=20
> > =C2=A0 RIP: 0010:nvkm_gsp_gcx_ready+0x10/0x30 [nouveau]
> > =C2=A0 Code: ... 48 8b 87 70 0e 00 00 <48> 8b 40 18 ...
> > =C2=A0 RAX: 0000000000000000 RDI: ffff8c9555fca000
> > =C2=A0 Call Trace:
> > =C2=A0=C2=A0 nvkm_udevice_mthd+0xa5/0x150 [nouveau]
> > =C2=A0=C2=A0 nvkm_ioctl+0xcc/0x1d0 [nouveau]
> > =C2=A0=C2=A0 nvif_object_mthd+0x110/0x1e0 [nouveau]
> > =C2=A0=C2=A0 nvif_device_gcx_ready+0x36/0x60 [nouveau]
> > =C2=A0=C2=A0 nouveau_pmops_runtime_suspend+0x39/0x140 [nouveau]
> >=20
> > Instruction decode shows `mov rax, [rdi+0xe70]` loads gsp->rm
> > (0x0),
> > and `<48> 8b 40 18` (`mov rax, [rax+0x18]`) faults accessing rm-
> > >api.
> >=20
> > Fix by:
> > 0. Checking !nvkm_gsp_rm(gsp) in nvkm_udevice_gcx_ready() so non-RM
> > =C2=A0=C2=A0 devices report GC6/GcOff ready and bypass the GSP call ent=
irely.
> > 1. Guarding gsp and gsp->rm in nvkm_gsp_gcx_ready() before
> > inspecting
> > =C2=A0=C2=A0 gsp->rm->api->gsp->gcx_ready.
> >=20
> > Fixes: cb4c7603678c ("drm/nouveau/gsp/r570: Add support for
> > INTERNAL_GCX_ENTRY_PREREQUISITE")
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>=20
> Isn't this fixed in commit 4d0e27041185 ("nouveau: check gsp->rm as
> well as gsp
> pointer before gcx ready") already?

(gonna hold off on pushing all 3 of these patches, you're right - I
completely forgot that we had already pushed a commit for this)

