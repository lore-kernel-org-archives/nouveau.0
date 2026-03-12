Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF51106ACD6
	for <nouveau@archiver.kernel.org>; Thu, 12 Mar 2026 18:45:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72C1910EA9C;
	Thu, 12 Mar 2026 18:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KDIX9vSc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0C21B450DB;
	Thu, 12 Mar 2026 18:34:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773340473;
 b=ql/cnnBlp73ANDLAWNjL9mXaSNksNFu/BR0lW/gRP8OKlpBJXBUfjab0Eucbk8e0aZasS
 Y6YHsyoC9A+FBYkZPDDJgppL8O3Wz5C/l8OC7A619Oq7BXm5+ltrEWEySgljzbMMcjgwY0d
 Ag2F22v1XsqP/kLMzo11jgCgIcWIIrJ5GyQRuTveDE3Kof1LGEO+lxM7du7kIu/a86PU/k8
 s57zl8xbT2Mo067R7E14cyHqOy9BINUrFRSqrm/njeyu7XzpQWfi3YiQKE7b3ubHAqT2SoQ
 GSDOC6YtUjhhwsCF3R5+dSOn5Ce2BJCR1Vq2U7mLF5qUBqO459gK5pNS9B7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773340473; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sFJtbHiIPHYN7z4aj/uef3SDbnRhOt2FSyOQIkrlI8Q=;
 b=hkOxWcTDd6Q03uYuYMSCe5G8wXPmmYNLEQoREvmacatRIDDwMIJa/Kvq41Km+oGMxg+wB
 pemPFSdlbkqP4OQzUaKuYMZHJVoEs7gmwRdGOsvWYSuE7757nZ5+PHOZTT7THCrEt/hARBJ
 4Gf4zHYgleHiwoAtWr3TM3wPZjEzP6lX4fSkCr4m6g7PdIkUXRjcfycc88BojxBZCq0MlWO
 EQaMTjbUkSb2H0BpckEu/+3f6k6f6DXkBw7fsvzYOLnHZ+MOAbu43qzUSJFvkIzWomHWFFA
 7e9AwREcqMn1kl5DziBF11wZkJz+fC+7YGeK1jXT1ZtYDupSiZDcg4NPG5Zw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3AB6645021
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 18:34:32 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF1910EA90
	for <nouveau@lists.freedesktop.org>; Thu, 12 Mar 2026 18:45:10 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-c70bfef17a4so881736a12.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 12 Mar 2026 11:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773341110; x=1773945910;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFJtbHiIPHYN7z4aj/uef3SDbnRhOt2FSyOQIkrlI8Q=;
        b=KDIX9vSchIKE7OgEkKgNRB1vVoCKnNQw1LAxPGDN8vJUL/FrgiWx49jvhrCA4B0e9P
         bO3ahdfMlxPiQyRwJbz+NlpJmmSielKv+vUjbLntId5raBb2Tain7m64vS1s/gQFgsCd
         QFX4zJF77pw4m2jQdjFsD+zVbTpmFsyE/sLtYIIYykVK36/jESK8dKoLT6I0631erIkN
         D7RCtF1Nng9ivjfDuJNlyYKaP0Oc1GoKi25JrlAYHkfS9Sm0lX4ECYy4il+EdC+PXJ+d
         uaNfeDF/pp6N71PFuGO84F+/U8Y8z4j9OPtUcCs4Vr3OSlpoEKNoTLHAqwi5jdNyXu8w
         hZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773341110; x=1773945910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFJtbHiIPHYN7z4aj/uef3SDbnRhOt2FSyOQIkrlI8Q=;
        b=wTn8uETqxbuS224vZWbjTipbT7Zo3qiNzlS0V5aPYNCbMJssFWqMBdk6KE6tFknRRw
         bIjpPGV3WtR4e2pXzjTmkERNrpQnKQfSVGpEFfHqNQSy4jcappeDR4cLrSXmrwuAx3Zi
         5Gm7hDo2Q2kULtMenPmI01GKBzYG6Qag03Zw9FkIFOxZGX6QtEzaro4DphU5SZ1gCpvJ
         Vkv9vHy4hMAO1izQOOUCnrU6hQUFcKd+Ba11Qq0IJSwgsJdpTzHprc/GApR1kscexN7h
         /YrQpvxSj7/Nafq4MXnhDJMtmfXmgn6u3+yo3nUZG7I9BMg1+n4DoSHIgznGpjg5D7l0
         X6Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdaC4i1DN0p9JGjjsAlKp2Ldd4gdCsWV+LMmn5RnZo2O5hYKxvXZaaBOurMvdyO5zPwqjJw9Ss@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz40AqH0hokB7qg8fQ0Ds3xAqBhFMDjDIfGwNLesy7E/EsTve0F
	ktgenb3pD8+Ef+aQKfolbYu3jqNdOp7nS0Xd+dJUv+l3aB8CnLpBWwy2
X-Gm-Gg: ATEYQzzbiRfnsZzfhcKQzsEnOsa7DGqpUjRzvnD7cxEKHeQQFMgHkE4kjY/2kW98NhR
	335vztv9N9QO3xN6SwIXIddK2TLjRnGr+tqgeRlJZ3fsZw1FffVbfUESfB8QgbHlHYIRFU5ftYZ
	ekAw+OBLzpKOMa1aYjjXqQq/MgZ25I9wS9pMMy89f62YmFQt0np3xayJEcXU/okZNle+HreNn4V
	WcldGbeoIjy1SHwK/DzlSwE3z2tfGMRWPXGA/a3fiLdPtwlr7YwYhVLfcVBRb9pEGqbSiBpIIMa
	GF48QCFsdJr7U5pMUb34EFdo3K4a0rd8UeRshiaAZ9SEFtjSI7A3/8wyLuehpcagz/3K0sbGe/g
	du+5s32D2gyr1EiXEDxKCvoXGEl4iqPlpMu47tRYRHOSp7UHtF+YyhMnyspAqkyiZoDh876F8ST
	Y4Qlz/ZwmlAv+EzaSDsuV2nm7kC0VIdhw6vAyNglKxMfPefO3sa3QiZ9Z9rDOO
X-Received: by 2002:a17:902:d58e:b0:2ae:4732:2859 with SMTP id
 d9443c01a7336-2aeca9bb13dmr4301835ad.3.1773341109758;
        Thu, 12 Mar 2026 11:45:09 -0700 (PDT)
Received: from eric-acer (36-225-72-126.dynamic-ip.hinet.net. [36.225.72.126])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aeae34cc49sm64519825ad.52.2026.03.12.11.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 11:45:09 -0700 (PDT)
Date: Fri, 13 Mar 2026 02:45:05 +0800
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] gpu: nova: rename drivers to use kebab-case convention
Message-ID: <abMJsUpvcUrITCVi@eric-acer>
References: <20260310062443.2763230-1-yphbchou0911@gmail.com>
 <99af9d88-05a0-4dcd-85f4-9d5fe9ee6744@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99af9d88-05a0-4dcd-85f4-9d5fe9ee6744@nvidia.com>
Message-ID-Hash: QCRO6I6WKD5T4RYZVGZREVPWDZYXF5HF
X-Message-ID-Hash: QCRO6I6WKD5T4RYZVGZREVPWDZYXF5HF
X-MailFrom: yphbchou0911@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Gary Guo <gary@garyguo.net>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jserv@ccns.ncku.edu.tw
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QCRO6I6WKD5T4RYZVGZREVPWDZYXF5HF/>
Archived-At: <https://lore.freedesktop.org/abMJsUpvcUrITCVi@eric-acer/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi John,

On Tue, Mar 10, 2026 at 06:34:51PM -0700, John Hubbard wrote:
> On 3/9/26 11:24 PM, Cheng-Yang Chou wrote:
> > -    name: c"nova",
> > +    name: c"nova-drm",
> >      desc: c"Nvidia Graphics",
> 
> hmm, as long as we are fooling around with names here, I see that
> this should be "NVIDIA Graphics and Compute", really.
> 
> Obviously that can be done separately, though.

Ok.

> 
> >  };
> >  
> > -const NOVA_CORE_MODULE_NAME: &CStr = c"NovaCore";
> > +const NOVA_CORE_MODULE_NAME: &CStr = c"nova-core";
> >  const AUXILIARY_NAME: &CStr = c"nova-drm";
> >  
> >  kernel::auxiliary_device_table!(
> > diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
> > index 8893e58ee0db..1fd454c7e0df 100644
> > --- a/drivers/gpu/drm/nova/nova.rs
> > +++ b/drivers/gpu/drm/nova/nova.rs
> > @@ -10,7 +10,7 @@
> >  
> >  kernel::module_auxiliary_driver! {
> >      type: NovaDriver,
> > -    name: "Nova",
> > +    name: "nova-drm",
> 
> Well, but now it is out of sync with the file name: nova.rs.
> 
> You should change both, or neither, I'm thinking.

I think renaming the file to nova_drm.rs would better reflect the
driver's identity now that the module name is nova-drm, making it easier
for readers to associate the source file with the driver.

Would that work for you?

-- 
Thanks,
Cheng-Yang
