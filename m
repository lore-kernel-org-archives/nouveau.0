Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB84C982D0
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 20:51:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3711910EB91;
	Thu, 17 Sep 2026 20:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UQYIDZ6i";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1C0F848235;
	Thu, 17 Sep 2026 20:33:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789677228;
 b=gp8dAbFiYSLuO2O6oE1P5F5FoQgctmSANlZsf6cOj7iEyRuJ0BvfQQXyWDDUIBTIEdjLo
 Ald9S0rQjm8ENX/ed632EqFXhoGXYLU8Mu6dNBDYS60r1OmRbsVeLoyxx3mldDB2KYKLFAt
 ybzJzhgz/GGLc92I9SVCL8qsr8YBs3x9ZDILUwHKFyyyVw1N52qa7Vrua/TM1QNSolxnRUX
 t01sqO5fFErSNyGcNTWsa3UpNu65YxHgOe5D4iVin+Uld0+4COR5fxEE4tyIt36hXGINuM/
 u+ZV41ls1NfOA8quhevYpBXZY3GDIt63D12f7FAVMLcT7Giq4kpW8fZQTZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789677228; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mG07znBCfGZDJK2bgsmEc49ovAbR3moQOMqXGtLushw=;
 b=e2KlaYRTyBszWuyf3OeVh6rV4HG0FrTFuACcCqjvUzaeTJPSwyO0wTcfpwbswRG/Mm185
 p2SuC1wcFvorUKi+zr79KVaAVwmYZZdAZqibCLwV9KK+2W857oyLe7mVwehQ+rkkooFCXFT
 RPMq07FcVid4cAX85a0OIJTrae34DeYC2IJEV2oUdRR2Bncs45NgLdjMQoxH50nzCA30Jnq
 PdvB9BQoqoeP4Csblh3w/Fbz4ztw3stuG7xPClz8FIN+MPFZniYi0DiIzq4RAgg0HQ7Er5/
 4Liml6AXo/vln/q1ecPYWQQPGkhOljqwmRuOaVVEL99qPiqxa7lWBZcpDIYA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B2E5E481F4
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:33:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66D9F10E615
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789678282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mG07znBCfGZDJK2bgsmEc49ovAbR3moQOMqXGtLushw=;
	b=UQYIDZ6igFJHrP18aRSm3AprR8e3O46BjA3IbPG74sKgGcsO93ZRtAs911uYJ0ep8uO87P
	UObFlKJIURi3skIvcL8la7XMLf7CoGp012MypGERc41FRLChC3qdHptZyfvew8R8IagEMP
	VGc/IQu9ef2l7oZyI99ZUSI+LNs0CUw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-GDCNZLbWMdadW4jEqzvN9A-1; Thu, 17 Sep 2026 16:51:21 -0400
X-MC-Unique: GDCNZLbWMdadW4jEqzvN9A-1
X-Mimecast-MFC-AGG-ID: GDCNZLbWMdadW4jEqzvN9A_1789678280
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-912351b220bso28827126d6.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 13:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678280; x=1790283080;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mG07znBCfGZDJK2bgsmEc49ovAbR3moQOMqXGtLushw=;
        b=1gkXjQq1PUkKtZ3Sy6of9YFLPeSi3glN0J3fUhWXQpZtXvZiI591LeUcHhQlzMNBRM
         SUTTITuGHU6gFKAftfPKADH8yKNTNrsX0cmdackDM2z5RMT12g/JCZfCIm0Z5QRlSiVA
         rhGvJG+C3eKDRdvhSQjmf5W+Jc0b5xYGYHFafMOcfiO4r0uLlJ3JUN4wG+nQUQBpRCZM
         NEEFi2pkoa9BFjaSwvZFILaGlHNu/GezWwNV3BiMQqPvBdUqKu14mNLFtKa1Z7fLJyT4
         OuVYLJP8md7MJbNgwg3AYyeXAx6kScmjSBz1Wm+9UFq1V4YVJZrUfYowcFntZRUi/p+m
         ovpw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSzFtjpJvBBnlxIoabjPxp/H4rPN7Y1wT+lz6dfUBCamBJeNbBhtiDOUaiDFSs+xEkudAnQhKh@lists.freedesktop.org
X-Gm-Message-State: AFuF++kXOWpvR5saf8PFRHU/zccI/O8dj04PBCurHK+bskzBNP3LjU92
	jKxJuO3nvYNiISnibPodIZquFiQijneow76yJe7n47uNIJl2eRQ5zyeOipmhKisGYO9f9neZRgD
	UvL0hcESdSJtoE/JRazQc0LizmMC3Mjck+L7bxepF3Uc5+cNKxgQ/dOsTPKrUETGHdK9KoTcM4x
	A=
X-Gm-Gg: AYBFou1kTRX3N78Sw4mgEfVcHBeaD9Jgwn9TnrJcRDq1+nJC9PAqQ+JoCZhkJXD/mTN
	Z8qsjTZHsKrOoBIPw0rpfFKloj8/d3krza45beTHm+6VcYPMYwuZgKtk66jYMXhv/cQ6sU6y4QC
	B214eqkVhmbzVzXgNC95RInh8h0d0JF6DTiTk7G8PeWYeshINdGSY0K0BRosCCiFH/CrzdemNTS
	2ZauEW/r5sSWRV8JmwLa9DZdEaW0OoAs/LZBiLopLJ44hjrdjlMdxcfj/c/zqT0nSfCFQWdlgoD
	c6d5tvyE97Acm6l1Fp0jrsOY0NwrKps0IgYw+FZqDCdgn6dGB5WjcrTElYb1/q7t+EpoSXAi
X-Received: by 2002:ad4:576d:0:b0:912:35b7:8a9a with SMTP id
 6a1803df08f44-912483188bamr72768496d6.20.1789678280330;
        Thu, 17 Sep 2026 13:51:20 -0700 (PDT)
X-Received: by 2002:ad4:576d:0:b0:912:35b7:8a9a with SMTP id
 6a1803df08f44-912483188bamr72768046d6.20.1789678279742;
        Thu, 17 Sep 2026 13:51:19 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91252c9377esm6673096d6.24.2026.09.17.13.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:51:19 -0700 (PDT)
Message-ID: <27293a63217c3261c42d011cef8cf31e3d43fefd.camel@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau/clk: fix RAM error handling and pstate
 desync in nvkm_pstate_prog
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Date: Thu, 17 Sep 2026 16:51:18 -0400
In-Reply-To: <20260727152821.128432-1-postadelmaga@gmail.com>
References: <20260727152821.128432-1-postadelmaga@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: amcp4EC7YXNWwdb7sXtRHfGmxVzl2HeUvhRXZR8tgwg_1789678280
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3OCTK4HMQ3VCVGVIJMY24TPPYE4V3EMR
X-Message-ID-Hash: 3OCTK4HMQ3VCVGVIJMY24TPPYE4V3EMR
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3OCTK4HMQ3VCVGVIJMY24TPPYE4V3EMR/>
Archived-At: 
 <https://lore.freedesktop.org/27293a63217c3261c42d011cef8cf31e3d43fefd.camel@redhat.com/>
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

Will push to drm-misc-fixes in just a moment

On Mon, 2026-07-27 at 17:28 +0200, Francesco Magazzu wrote:
> Follow-up to "[PATCH v2 0/4] drm/nouveau: fix list cursor use after
> loop
> in the clk pstate paths"
> (20260712123616.1180830-1-postadelmaga@gmail.com).
> Sashiko AI review flagged three pre-existing issues while reviewing
> patch
> 2/4 of that series; the third (clk->func->prog()'s error being
> clobbered
> by nvkm_volt_set_id() in nvkm_cstate_prog()) is already fixed by
> patch 4/4
> of that series. These two patches address the other two:
>=20
> =C2=A0 1. nvkm_pstate_prog() drops the RAM reclock error and falls throug=
h
> to
> =C2=A0=C2=A0=C2=A0=C2=A0 core clock programming anyway.
> =C2=A0 2. nvkm_pstate_prog() commits clk->pstate to the new state before
> the
> =C2=A0=C2=A0=C2=A0=C2=A0 hardware transition has actually succeeded.
>=20
> Francesco Magazzu (2):
> =C2=A0 drm/nouveau/clk: don't ignore RAM clock programming errors in
> =C2=A0=C2=A0=C2=A0 nvkm_pstate_prog
> =C2=A0 drm/nouveau/clk: only update clk->pstate after hardware programmin=
g
> =C2=A0=C2=A0=C2=A0 succeeds
>=20
> =C2=A0nvkm/subdev/clk/base.c | 9 +++++++--
> =C2=A01 file changed, 7 insertions(+), 2 deletions(-)

