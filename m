Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39B8FF8860
	for <nouveau@archiver.kernel.org>; Mon, 27 Apr 2026 17:29:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD74810E870;
	Mon, 27 Apr 2026 17:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gmTgAPEc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 318E845C7D;
	Mon, 27 Apr 2026 17:17:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777310243;
 b=A7lmN/b1YBEqab9PBo6nFTWwhMSDNUuoycqYq4dP4Y3DUs56q9A5pJcxVQ0Vyo2lbjyVm
 Yub/MC4sTyG4jyHbXTSG3YnKMTpMiHLCDrRMGpa1W4VDY+QIDjfhb2ulkjqRVEu4jAS6E05
 L912Wteud5QBhkwMy0Soh2cot1T21g+ds+RmSq7Le2aJyMWNj+jk7MFHmbzRjWLPitOURm4
 T97uz7hoI6V6xTJ/3KtcPXH5m+eEqQvTjzfDGjbJ99mYcANOt3P0Ff7nOVj2nkoySyICyed
 WpUGK815VlPUcUhcrga/Ed9rxph5wzbc8KgVnkRVPhSmrUryhzvqTdodJ3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777310243; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KF7u6ZoNxfK3+BpCCoO5erH9nqzrz/OiFIJaWAx89LM=;
 b=JG8wYFGEgD1CIq1vxA9E8+lwXIr9ytuoSXF0J5ZjVNLuJfx5ForRRkQJHI3ONHroi3oLS
 i/1SIeTCMlw7aScaReD4ynybbCD5+Y1GytyZPAB8hExuxSlfaLcsQBT3wPwtBWdVSo+ZQ90
 tlp4fOkDVbvMQT8Q4c9NqOLcom951ScA69CNAshn2TUSyTAiyWUt41KPBwJKU+QbXBz7YOF
 vP8YFxwGMfqyR3VYhVPi3XFsJY5k9ksT4KpKHmFTwKvCv/FrIZWUpEN83Gp9McXRRMUC+yv
 rs/shZ0jSsc14gSGsWMVrVb+4G08UEYRvhVxXI6Y9o4uw4ROyM1Zd2h3GOzw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7448E40F62
	for <nouveau@lists.freedesktop.org>; Mon, 27 Apr 2026 17:17:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAD810E861
	for <nouveau@lists.freedesktop.org>; Mon, 27 Apr 2026 17:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777310978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KF7u6ZoNxfK3+BpCCoO5erH9nqzrz/OiFIJaWAx89LM=;
	b=gmTgAPEcpbuCgYDJs8VxFmdPHbiS3t5mmZTww+MSTu3T6v92Dim+UMcperz8kog9w9BfcI
	2MNyCRxcBSysNPJnd/v/VyZWrAi9h74XmUMeGEEvpG35hsoTZbG2sP3HuC71XFGq6Wn3nK
	c9GbRN8kX4Mv5oDb0M34mpnqwAqw6ZM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-2jS8JyYxONaqxFeT1NXQbQ-1; Mon, 27 Apr 2026 13:29:37 -0400
X-MC-Unique: 2jS8JyYxONaqxFeT1NXQbQ-1
X-Mimecast-MFC-AGG-ID: 2jS8JyYxONaqxFeT1NXQbQ_1777310974
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50faf575af4so49671891cf.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 27 Apr 2026 10:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777310974; x=1777915774;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KF7u6ZoNxfK3+BpCCoO5erH9nqzrz/OiFIJaWAx89LM=;
        b=kO3ObeQcyi4cmAISgzmzJpP9BLJbgDIml+QpEPNW4EyuUhKByTBk4uyQrCiy6BUsDz
         WjSYEalMrWtMAZPqnKXfbRPZoOXabeB/TgoQF2Nn4roRWavR8rm27uN1qrzPKTatoRrn
         3ObwYzPr8b8h8txHfcEK1da+m2+7I7fWcK4msyxn9rthIhFJL82bbGtZ9QukTYpqJ6f4
         Kq+qf/o84UQ7BKjNVlmde4kkkPbQ8pHkCiCJGqr42464FEOvpOu83hL34NTejUF2pk9o
         ePo30GHO1XLcacwXOKC13Y2V9zxGS4jD2K/S+919NvoQpUXPVwCKeB++AN1sEffA94QY
         bkiQ==
X-Gm-Message-State: AOJu0YwEvBRowbSuYmWkJqaFlSt3EHD3op55+ToJGPXYJ2vitHEP+bTy
	u8t/sOQoJ0duLp4CJC36UrY+iVjs//KjaR1A5PaqA9keNxlfQhvd8igaeaa6IisBh4Auj1iZAwQ
	nUD7tdwAeElYC36INT16VkITN2BemkWOGu5yl5FpDhDYG1Apt8U0Im9fADLt0zk0reBM=
X-Gm-Gg: AeBDietrCEUDqR8Ff+PkY4dqmX8HYwy1twee4MHnqLMS33vSNUKetldm2+qwovVn2Jl
	QbgzvukXbF1YSJion7InSwP3aQlKGhx4vupcPdw7uUiunGEzi9zEYEdF4iSBzAiFPLsUT2aC002
	yWYV7Pk0xUGkAHFI5QybolGKW+HshZSLGIPxdLfLfcA3JJKfg3SMFcWF92gRrne6XONUyJdJI8b
	j/kjHstEbyRugKezo0X5Lm8IVl6c+rA6GRBS+nTP3qph8Z/KZEz0w8/JOUEPPKo/6/8bVNoTYSC
	r4F6DL12xtOTznuWJ5d07NOADOTCz4ImKSqmwS2bf6KJWI9ebPTtwjSDZXGeLgCGFle78DsqtJM
	NwQrqL1ug2jsJUnNRDx4yj1XdZ7iS
X-Received: by 2002:a05:622a:486:b0:509:1009:e7a6 with SMTP id
 d75a77b69052e-5100c97933emr2571131cf.43.1777310973781;
        Mon, 27 Apr 2026 10:29:33 -0700 (PDT)
X-Received: by 2002:a05:622a:486:b0:509:1009:e7a6 with SMTP id
 d75a77b69052e-5100c97933emr2570391cf.43.1777310973161;
        Mon, 27 Apr 2026 10:29:33 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b3e29932fasm285886d6.45.2026.04.27.10.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:29:32 -0700 (PDT)
Message-ID: <2f8a8b96473d99cee6f33075532a97f956ce21bc.camel@redhat.com>
Subject: Re: [PATCH v12 5/5] rust: drm: gem: Add vmap functions to shmem
 bindings
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 27 Apr 2026 13:29:31 -0400
In-Reply-To: <DI0MII8J4P2Y.309VKYVMQJNVK@nvidia.com>
References: <20260421235346.672794-1-lyude@redhat.com>
	 <20260421235346.672794-6-lyude@redhat.com>
	 <DI0MII8J4P2Y.309VKYVMQJNVK@nvidia.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3WHRFDl3re9_QXlpyntEltsOS2jq_8eGFp6G1fJ3jBE_1777310974
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NBIOWIPBXOQJMSHNGXECSAOLEJ2YHH6L
X-Message-ID-Hash: NBIOWIPBXOQJMSHNGXECSAOLEJ2YHH6L
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NBIOWIPBXOQJMSHNGXECSAOLEJ2YHH6L/>
Archived-At: 
 <https://lore.freedesktop.org/2f8a8b96473d99cee6f33075532a97f956ce21bc.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 2026-04-24 at 00:01 +0900, Alexandre Courbot wrote:
> > =C2=A0=C2=A0 dropped before obj.
>=20
> I am not sure this is enough to solve the double-free issue -
> although my GEM
> knowledge is lacking, so please take this with a grain of salt.
>=20
> Take an object where we called `sg_table`, so the SGT has been
> created.
>=20
> When the object is dropped by DRM, `free_callback` is first called.
> It
> calls `drm_gem_shmem_release`, which frees the SGT.
>=20
> Then, the `Drop` implementation of `Object` is called, and `sgt_res`
> is
> dropped... which attempts to free the SGT again.
>=20
> I haven't tested that and rely only on a quick look at the code and
> my
> partial understanding, but the correct fix appears to be to clearing
> `sgt_res` in `free_callback`.

Whoops! No you're right, and so is Deborah (she mentioned this
previously, but when reading through it I completely forgot that
free_callback() was in the picture). We can't clear SetOnce, but we can
use mem::take() which should be essentially the same thing. Will fix in
the next respin

