Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE22CCD5BD5
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 19:21:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3931710F5C8;
	Thu, 28 May 2026 19:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V5m3izTx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CA94846602;
	Thu, 28 May 2026 19:08:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779995286;
 b=fk7j1elJVblDjiwCs9PUuDnSbikG9zIkfZRJbPSDWBjvKX6zdTZBH6ObIpdRKWqZpJQtT
 MXqFOWDyh4Q037VYRIPizRgJ+EYWcDOcLvi3NMzJQxr+YRGxeHXAYwFl5+bu4Z3djeeOybI
 mnwEqFj7SehF3LTWPUi/Loq4En0valjhe/NjLnxdzYnGtYaDoT8xgsiYh+0Z/2C/fJyukPb
 L7uwfVxVl5SHh3GPwZBsyl3owPSfFRSIOZKmP8215lw14moJomisgNlgNe5+xdSmNe/sTAA
 8vP017qnWi9lp4Qsr9vdsCBnxj7IQ1vJZ+NLQTh7cc6rTw7bNRAWoGHGThjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779995286; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UYcN4au38G2Xy5ZRseiMwYK5kGSwTZoITrWGoAbnKlM=;
 b=TsNjljvXXW+K/3lkE/ESYsOfygJVmz4tEY5/7xI5i+l5kpj+B0cXhxm9PljUyHcWvonB3
 sWm8dnSh+/HIFhcauZcSVZ6yX4pohgH9CAKRWR/NeW/JcZNEV3gkVOrReYdfba3R8eyUKnh
 R2bvJ3VkOngPq6PY7Aqy6numVjaFzQ03wPxVExgb7di7lufx7Nsn+fOYCkcr+Qb+2+l+JCo
 I3H2HpQ5yksIr7P+BXWyde8dXuR9MgrqFQhmQumUjZzU0wstQCuUA5Rd2N0fMM4YuPAngcR
 ex2MlKcsfF1bSl5RZ6zgoudsTeNwTlgQH+qbW6VrazW1MjzS+rfAlzWeAHRg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F00194021F
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:08:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE3810F5CC
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779996092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYcN4au38G2Xy5ZRseiMwYK5kGSwTZoITrWGoAbnKlM=;
	b=V5m3izTxAVerFRekLLMMiS10Wzwtp1UeiKf+8nTnzd4xdkE/U1Kv/R+LnIWF53xSlu3Ndf
	unFUFNaC2X9GLRqsfAOfUJtz51kCdrPMvdT/HZrtX69+QDw1QyRFEOvsZGp5kUgDhFk2Wz
	5hkUaETnJERtSDEbq41dwKgE8rs/ODY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-HYw1QIlhMK--vdQUd_3z8g-1; Thu, 28 May 2026 15:21:30 -0400
X-MC-Unique: HYw1QIlhMK--vdQUd_3z8g-1
X-Mimecast-MFC-AGG-ID: HYw1QIlhMK--vdQUd_3z8g_1779996090
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8cce1c3c26bso2416036d6.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 28 May 2026 12:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779996090; x=1780600890;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYcN4au38G2Xy5ZRseiMwYK5kGSwTZoITrWGoAbnKlM=;
        b=jx3V29ICFWWUOXB4tk2fK9TSwpy9eu4jPkmF4stbDr2pg8w9Lb6BuLz5aGaJvjnUuN
         /Bm0OQVmdQwWc+B9QOT1KxMwSNivvtDbqAYGktyCs3zJoCVqT1sNUAHNoVeYoD1/w0Q1
         csnHGQWDg1qRYCtqPNVvpFJryQRywceCQ5YRxAA0yXdzzhqsmWgAPuqrDLSPKKNUBogM
         fMrfhvMcvk0UrT84nl+w4z//Hk0e9pmDmxrO8d9fLVn+8Nf+JvAU6YqVEixtC8WXIL9m
         qEZAi411q+XAwFhOgoLdtnfh6eAWxxgXIJoaA9vXU4qWFB1GwQjDxHyHvqTqhZ+REVZC
         iTJA==
X-Forwarded-Encrypted: i=1;
 AFNElJ81oDvx4a2lL1W3O5vn9Tk5a5AZUn2J4J+TZBj5YacEirLS8O8mo1CNNOArl2mKE0HEJeeZ2wZc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT6+PfzldYam86cGn37viV9ZTY2M+ndBbdF+sIhjQTeE5N8r/w
	K0EgcMfoVRMkvVB3CBkfYGp8Q1VMd44hRRXog4SSQ/p+k+PObzcy9Q/DmHUH3rC9Evqs3i3437O
	VjBYNQThI2K4p1RDpxa6W1OFTtb/JbNZgMxopMpauH30xqB1T5iBJSmuStPEoAFU68p4=
X-Gm-Gg: Acq92OH+eeXO9hzc551i4GIE98AmpCLwcBFVxrDXPS5Q6FmpzBBZTFGqSrxdCaMYKId
	Z376Mhw6T1opafpjQZpXW+Y9hfachCWLWhg+CdSwr8iP0B7s4g9W85YB4zE19GYz8LX2gShlWnp
	BdcFKAAOtr3RPn/NraSn9181rHtlV6Di1rBiHakrHeI0tdFzIeuVSM9Y+rX5Arg3UynpC+VF8zG
	BdqisiEQbaPzFhOApu47+saRIgmyVdIfmeyRD3eWRAdaFt1Ov0/1DRkghVi7Ao5FwGGZ4gvfsRL
	k7l8shFyjFNeJEZgLaGAQejzcAPuKKJy/hRI/XgGouJqfQnWUKvL8laD3N1bz3xihGhfAu+2VMk
	6UjwK3W+0oX2AryZzLR4TVq+aUxOY
X-Received: by 2002:a05:622a:451:b0:517:282c:b894 with SMTP id
 d75a77b69052e-5172cdf83eemr1615691cf.53.1779996089870;
        Thu, 28 May 2026 12:21:29 -0700 (PDT)
X-Received: by 2002:a05:622a:451:b0:517:282c:b894 with SMTP id
 d75a77b69052e-5172cdf83eemr1615191cf.53.1779996089434;
        Thu, 28 May 2026 12:21:29 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51706b08199sm82817831cf.29.2026.05.28.12.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:21:27 -0700 (PDT)
Message-ID: <3c74f55d233e1607d2b427f758ed01b2694fb704.camel@redhat.com>
Subject: Re: [PATCH 0/5] nouveau/gsp: Cleanup IS_ERR_OR_NULL() usage
From: lyude@redhat.com
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Date: Thu, 28 May 2026 15:21:27 -0400
In-Reply-To: <6f1e4f968777c0e78b2bcd1c3ef2812b28a0ec41.camel@nvidia.com>
References: <20260528062451.54107-1-zenghongling@kylinos.cn>
				 <794dbd35fd81f03478cdd3238d3d506d0d800187.camel@redhat.com>
				 <DIUI56CABZAF.3TU7XCIKTV93R@kernel.org>
			 <ad1ab3a555ca34f37ca4d7c20af5f4cadc4558b5.camel@nvidia.com>
		 <c45c2e9096df0b407fa67ee5caee6b4641e2c8ab.camel@redhat.com>
	 <6f1e4f968777c0e78b2bcd1c3ef2812b28a0ec41.camel@nvidia.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OxCPoWtpjF2_Qcd85vtu4zjAlFbwlt8tuV7sPr0P2mo_1779996090
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: FHMZL63JRDLISJJEU7EHZDDWWPEZLBCB
X-Message-ID-Hash: FHMZL63JRDLISJJEU7EHZDDWWPEZLBCB
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "airlied@redhat.com" <airlied@redhat.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "zenghongling@kylinos.cn" <zenghongling@kylinos.cn>,
 "bskeggs@nvidia.com" <bskeggs@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhongling0719@126.com" <zhongling0719@126.com>,
 "mripard@kernel.org" <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FHMZL63JRDLISJJEU7EHZDDWWPEZLBCB/>
Archived-At: 
 <https://lore.freedesktop.org/3c74f55d233e1607d2b427f758ed01b2694fb704.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2026-05-28 at 19:19 +0000, Timur Tabi wrote:
> On Thu, 2026-05-28 at 15:09 -0400, lyude@redhat.com=C2=A0wrote:
> > You are right - I did actually sit down and try to run through all
> > of
> > the codepaths for all these functions, but there's clearly a number
> > that I missed and should have checked sashiko for.
>=20
> Even if you could narrow down the list to those functions that are
> 100% okay with IS_ERR, that's not
> future proof.=C2=A0 I wouldn't be surprised if there are some code paths
> where IS_ERR_OR_NULL is
> required, but then the NULL is converted to an ERR, and so the top-
> level caller will see only ERR.=20
> But what happens if there's a refactor or some other major code
> change?=C2=A0=20
>=20
> Like I implied earlier, the real problem is that Nouveau is
> inconsistent in how it returns failure.
> Sometimes it returns NULL, sometimes it returns ERR, sometimes it
> could be either.=C2=A0 So a proper fix
> is not replacing IS_ERR_OR_NULL with IS_ERR wherever we can get away
> with it today.=C2=A0 The proper fix
> is to revamp the entire code base to be consistent, and no one wants
> to do that work.


Yeah - that's a good point. I will go ahead and send the revert for the
whole series then, would you mind helping to review it?

