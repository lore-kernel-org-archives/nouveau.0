Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1118CD4F54
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 19:49:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCD710F600;
	Thu, 28 May 2026 19:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BMSCz+Kf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CE1BF4662F;
	Thu, 28 May 2026 19:35:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779996945;
 b=bXQIM9Om22T4GlRf5BSNI6k7sGKWcRm1Yfh1cKy753GvKNDav0P6GLP0ZEBk3wAV8FZDJ
 1LnWGA8s6XQ3+nqXNlsPH3fSR0mdYnoW/fs11X9VcW7OYAKCFwpocOc+QAPi/pLX0NOxK3H
 /nnwV/N5O+tLgwV0AXXOlW0xgPd4ksywMTlrZ6OFbdU3xp+Mdvr1OKGIVd3tdZDkBC9IGWB
 QlY/q+hyAdOKDSqH356huVNsQf4xdKi3uX3b2JmgtUtQD0gJ53ANqHFizaPfbsJObpuJOhT
 LU7MWjfOQqzp4UvirHS5r5EVk0tbDKWXpCWctnA9epQbPNshfSdR1CRbvBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779996945; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PP1ZQ9R+ns+VKuNnm+AdhqEaREMNY39Y34TAWM1PVuk=;
 b=mCVROgaVjzyApxMO9kFgnL5SM/soiFEn9HVFCPceE8dRHP7uBnahGiXPWvCt4oHkKOkNS
 1f5axLKST7+3Rg5LOHv/1M+UL/ZSZ7AS8XtzxHdSkwZ726AA1Zz69Mkto1j0ZA5wCJ5aZAB
 EyxnsweCTEeiqu9eNDPe/qz/sHGlp6RwLCNU2pv6ys1uHRXvMRLDtJT/Xwv8QIHYvDCIkRr
 qY5qhkhCJ3St/Rqvg4zhVPtLEyJXi9vqgAZPMe+8Llf+z9xaJuCC8SQEb83APl67m9fUbVL
 DtoKq9oRe2Xq+eeIqsh3IGGiVJWJNIESYpSzaTxvzMyj2HN9itSGHU1aoKvQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B30FE401C5
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:35:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CDB0F10F5FF
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779997751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PP1ZQ9R+ns+VKuNnm+AdhqEaREMNY39Y34TAWM1PVuk=;
	b=BMSCz+KfwgTNNiVqnbkUfTXO462dLagvljPLTTFr65b9F27dFlOPNuBiU+ODy9d3jcTDlE
	M45COZdVzJLzvP3IZxYNvSOT2WV0ws2y7+V4hhrtWN+3RPcZKGwBfOiaG/+Dtx6TsuzzOw
	ofZMIpzk2tlgj3XOy2lKv3X2kCaKAeI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-SyNQX2CaNkKlqGIxJ1TbNQ-1; Thu, 28 May 2026 15:49:09 -0400
X-MC-Unique: SyNQX2CaNkKlqGIxJ1TbNQ-1
X-Mimecast-MFC-AGG-ID: SyNQX2CaNkKlqGIxJ1TbNQ_1779997749
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50edf01172bso187255971cf.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 28 May 2026 12:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779997749; x=1780602549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PP1ZQ9R+ns+VKuNnm+AdhqEaREMNY39Y34TAWM1PVuk=;
        b=hHYelwhvV4EhnR9hFk+14hU44VQBZkY4gpE66wbqbKl+xal/8x9yxXkTrRaFlA5lQD
         BMGgLFUtqXP9dq/Fjf64cimwSeuatJRuhF8cJG93G2udwx0AYThRAsWx7bjFKLJavSYD
         vK1WLnxm6H5dyV0BPyVRz1MS9+NPqMjrzvBPVyEIbro6mflXdik48yrS4zTVmXobrdzX
         RZvi3I3T8y/EMOFF/9atugZqW2SY7wFM7TZJ6LLgFNXS0G0KlfU05vdihrdBOGSAJQ9F
         kOejZZ0KTJzShEjCYm51fB7bs8fO3j/fBRG3QDZeWkqLxD51e5ByA7ogOHA7aaEeWEll
         lXvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9mFanKTJqEZUPsE9ai+WunzablDK8KB51z3aoQgx9ZmZM6pVLB1PGgTIu3I0z+6Rzo4R2vem+p@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf3xSPFmsj+5zq3/rPxvtXpZejIrMjUd0sN4ItV8D4TALVH+U1
	pBOkoxE/ceO3Bz6LMyb9sqKKlhOOnnHZe7HLEw2CvTnFYmCIbMMmwtnhDKz7fgICLI7y/1oMg4V
	7qqXUb/7yk3i3faBA48uaxRAr07Xt4qRa26AXMlZiVu0baejQsMvhY3I73GvwFKmCSJA=
X-Gm-Gg: Acq92OH6c8zn8lVG55u2rSrJ9wLXek3h0e7LPBFI8scxgOTi1laLgJ4scHK+L5DI6cC
	4ZDVP0hOv/YrjHOJgau2Yzqhlh4QKM+MhJ6J/9m46TkJcJwAdznNjjoxL4BONac70OQt2jXbaod
	ryw6xmZQfN6RAgHsvK2aWrpeSPPByOM5W8BPi/Bb+ZF34R858H5JPTb2C/tLNUonuwagKmpU9v6
	we1a8Sc924dUoFsA0NOl4gWtYA7GJjMHZhWst3d1obCdIEAvRHmSELTwSLi9cMQeEa+pzmHqRLa
	kfJlJcFXDG7Mw16jWEC2lidHQMbYJtsOyY/uWvhjphBS/uGrHY9atATrJ2n9q/6RNWWxCn8zPq/
	Cj4YlHnm9WUvVo5Y7TJeTGHg5iNW7
X-Received: by 2002:a05:622a:260a:b0:516:d812:c35e with SMTP id
 d75a77b69052e-5172cbb883amr4075711cf.21.1779997748756;
        Thu, 28 May 2026 12:49:08 -0700 (PDT)
X-Received: by 2002:a05:622a:260a:b0:516:d812:c35e with SMTP id
 d75a77b69052e-5172cbb883amr4075351cf.21.1779997748357;
        Thu, 28 May 2026 12:49:08 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cc80ded529sm209836006d6.16.2026.05.28.12.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:49:06 -0700 (PDT)
Message-ID: <1b4ff2734e0c15448ab5c24a0800d20c24b25e5c.camel@redhat.com>
Subject: Re: [PATCH 0/5] Revert cleanups for IS_ERR_OR_NULL() usage
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>
Date: Thu, 28 May 2026 15:49:05 -0400
In-Reply-To: <DIUKG7F2VAC7.17L4VHNNI7YL2@kernel.org>
References: <20260528192847.4077458-1-lyude@redhat.com>
	 <DIUKG7F2VAC7.17L4VHNNI7YL2@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9tgMBcNF_WAm3pGiZ521UFZ5thGPGrz1iX30ujXn_tM_1779997749
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YUXWXUN2ED7A5GEYTC4KLUTWUYUNNDG7
X-Message-ID-Hash: YUXWXUN2ED7A5GEYTC4KLUTWUYUNNDG7
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YUXWXUN2ED7A5GEYTC4KLUTWUYUNNDG7/>
Archived-At: 
 <https://lore.freedesktop.org/1b4ff2734e0c15448ab5c24a0800d20c24b25e5c.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2026-05-28 at 21:44 +0200, Danilo Krummrich wrote:
>=20
> I can pick this up later, but in case you want to pick it up Lyude,
> note that
> this now has to go into drm-misc-next-fixes.

Whatever works for you and is easier, I also didn't realize we'd hit
rc6 yet

