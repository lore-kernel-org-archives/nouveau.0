Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37155EA7967
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 04:37:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CCB8610E7B8;
	Thu,  5 Feb 2026 04:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HWCUgqYi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9314841B4A;
	Thu,  5 Feb 2026 04:28:15 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770265695;
 b=N563OwxzxBq3XQ0mJCE5krPTTgSTj8J7gw49NCAS5E14vUkn00a7FdNOQMZWVZLwGGJRK
 VNEDNrG/KWNqi3env314sr3XQ4UdkDuMHQwMnnI0wfoxjtYDQ27UkWOhwT+aChW1W3A9CTu
 uM2YdCer9p9/DB05qSV3ATA3vqOPBvUos3GrUEIiiyoZb79Qmtt3JAI2EwbTRJ06NZNNbzS
 FJRhY/XoV/kaDtiR18XLhMdFt32Xb4Ah9KoIHcUZ1aXGv3WFvpImKPPiyybVCPY6yt+lr/a
 X3yT2GXmzzG+6BV9HnCk7XTkxMx/NWeWRu3DQt15NaJqfkU24BxycRpb0d0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770265695; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Uo053AiR3s2wxdxNS+5lzt8uGB6Lo16NeV4FrfS11LA=;
 b=x0BSK6NVa+IRE7+MRl1yParEzGxVmcbi7OOQIQIDydet3kKlVDCS/mN61SK6NqZ/XPL6b
 7XX9mHWYwbJ3qjil7nFmQHYxolRR0tm78n96wraehdDR5y4vndoZsY+AiDE1egMMi32RO/h
 M98MiEhUaxJPuM454hrpwH6ny/5QOULIMNA7zXSxN7L//6i5ad6uuwHE69PX8AIF32c9b88
 yBI5BC6NYF1RIPApv5G7GtAhFduRW4/UtstnvUep/ybXSyX1UavQ20QuDAQG+4ALFER1AoO
 sarvRvYg2E47wDuX1YK3+1LxvEXk4A1HO5qwtO1XoUDy+Yj50iqt1vMCE8xg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C2A9F402CB
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 04:28:12 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A9C0A10E7C0
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 04:37:31 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4ffbea7fdf1so5489991cf.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Feb 2026 20:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770266250; cv=none;
        d=google.com; s=arc-20240605;
        b=Gh7Qe2O1vek8vkEJJvHAVTTbuboTB7Yz0sx+hU1ZpoV6Qwp3jOyerBNbi7Oo97d93m
         iCVyqMxxS6IwIpJF4Qjrnv6XEjIw8oBLd73UqlodGz+I59oD9HY2MOWMCaN7zZSGb7sc
         95d8qwBK4hOG0nSgk0i8VELGZLmHdGMuhl7P6lY1SF2c5AdAuy4l5tgCvYxUnmhHpiy2
         8o779tlQ234ZF3IxekAb6iE1bgBPtT3JKGVqcrnoeI19h7HCkbgZ0+8/4DGJe5N4hm1E
         AyI498EaiBzJThfTcc90yZc79uwNFR/mNgPVx+lHq/dE3WZZXVEsCCVPqzxbbE5X/CQh
         v5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uo053AiR3s2wxdxNS+5lzt8uGB6Lo16NeV4FrfS11LA=;
        fh=2V3c3ooDPEvTydITWjpaJ5PmDHasXXtDY8e6GBCs6Gw=;
        b=Mic7Ws0tLhcSZtNmc8VNEDNs3ohboPyH+7SnIy3Ld8Lcjq/mqigm2XJhrnMoCcS/3i
         0IbHAwROI4z+GJ9ER4WoKvm9f15+I0+tezXNANfeNIyPoV16/mRg3bab9Byj/zxSL1vq
         gKLUKLupqhhAticj09idMvVnFdT8/e14KWfccRApde2caDWqrh/OhmBwWyVDzvDjvoRc
         0GbvoAFDfbt7rPPQfMJnIdSiHzkoEObfkQUjQcXJ7yDD0nJg3N5J0+2S1qp5hegosBme
         o6SXCQHyu5YtAf5lVA2mEi2eEJM8kJDIROwSMnrkuTJvTMZvyXng6N0G9Xa6YXk3sGDA
         /nAQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770266250; x=1770871050;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uo053AiR3s2wxdxNS+5lzt8uGB6Lo16NeV4FrfS11LA=;
        b=HWCUgqYihBMHJsqIqAgyr4GVpY/76speEqiSgW9gz8cmvHRCRRlwYn50WP79vN3uv5
         hckPPapl7yOii85XXalXZCZD3PTwpXQbTtNGaErq/WgDFmf/k9Y+42YI+IUYCp1wKWmp
         RD230IGm/0t2/HaNw/s9OpRV2m0hO2cA9X+4TWiMBpmBwI6OFPtsFzymBhOsU/M4FQTw
         iLuMf5acirhpqFFIB+Iq6R37L93bmiPRGiVme9waWDXDAlA67hJQdKwD9qL1FZ58mELj
         SA7icSzG5XEubtXjn2gq16y4xJjbzJvIeKtQXTFEnogzcJuGpnJk54JX/n+YuGdgdBsm
         a+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770266250; x=1770871050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo053AiR3s2wxdxNS+5lzt8uGB6Lo16NeV4FrfS11LA=;
        b=TysKsDbQgWZLk15O9DzNK7QBWetOL9PBKfo+Uh3DmGlJkYi9AcxwmxSv9FhlQZI9jF
         YByNpqSeEv7kjem6K5pmddvhjsRhQ+eWAaYRqGSPUrzYRGQaFcl/LE2eww+qddFr4Md7
         BQJ1Ns7q240ygN4Sy6bHO1UeKjSzemRbss1smAms7l9FFsr9jY4A8xfjo2o/hX8YVtm9
         Fct70DfTmTHnIxcZMVGjxv+GwcqhLDNZYD1FCygCIdnnPK2lzudbwTUtAKnmMSMX+Jk9
         hb8IpS5ihZhysJRhNxepxl218sMMUImr84jMSJllNPQkFmjE8N5FPbkjJZUhGGA6as1o
         3d8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPGqEN/IvwCp3n9acWekJEXSyN2RCk9snbCj7928kTT4uKrk8f8ERKqbZA2hK9YYcCkXjSM5qm@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyjh0+S9chIw5Hy0d7K1S8qwwRyfNtkPPvAPemgd7a7rZel6r0/
	2B1GN6CrCg4GhhSzG34HahN8zyHifimFsgxM1pv0f6NrVPY6oiaFMS9aW4h0pQf4yP+RwQVT/+/
	z68m8HA6Z+dicy+RhmogJUAOm1TI4PFc=
X-Gm-Gg: AZuq6aLE90yCvo7h9i6JHGg+fy8iXFBvOavVG8C3AujP6w+E4fEtcNnR7YarsfAXtoQ
	jo4Z0GxpMYGvJbtUKqbKY55ZGqrPuAeeQMLRvetoh/Zgxmo5HNtzsl4lrr6FjUNzbh7ro6XnS6Z
	vQmg+B/M7l78oOQwW/aKXXhasfiS0DKa9lTfpZ/trvNmOyns+AQRd3XuVe4I0GpuP4udfsANBJ/
	4J972enehI7ymMtUvIY635xAZbLCywt9GM+YhUJtzwr57LCphNx2hG4zIBf3BQnagX+q06NXuZS
	5VY6cjXDPlWZedoXhHwiRYHHFX0xUTkEQ0XJs8lSzusQV/Kmu8tjgYE=
X-Received: by 2002:ac8:574a:0:b0:502:ba2c:b492 with SMTP id
 d75a77b69052e-5061c1d1edbmr67846641cf.77.1770266250183; Wed, 04 Feb 2026
 20:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20260203052431.2219998-1-airlied@gmail.com>
 <20260203052431.2219998-2-airlied@gmail.com>
 <d8a40e5c65e4aa51636a42fc613b223dfeb001a6.camel@nvidia.com>
 <CAPM=9twKuyo2afqR3qM7LMkyuOue_t_eCm3EcnU4CkKPOyxcRQ@mail.gmail.com>
 <4409e252-4778-4e9a-961a-647cc99b9455@nvidia.com>
In-Reply-To: <4409e252-4778-4e9a-961a-647cc99b9455@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Feb 2026 14:37:18 +1000
X-Gm-Features: AZwV_QipD-8x040Gduwk0SFHBVkKNJ-_Ajyan_mUmpzusq5cHndi7LXXckN_WY0
Message-ID: 
 <CAPM=9twGHsH=SKvfuuqCuQ=eQw3+qKhFWtQ8WFm0Ut_2WhwZxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] nouveau/gsp: use rpc sequence numbers properly.
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: ZB3OQMDB2YQ6VIZ445BN7D2NICCSCS64
X-Message-ID-Hash: ZB3OQMDB2YQ6VIZ445BN7D2NICCSCS64
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Maneet Singh <mmaneetsingh@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZB3OQMDB2YQ6VIZ445BN7D2NICCSCS64/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9twGHsH=SKvfuuqCuQ=eQw3+qKhFWtQ8WFm0Ut_2WhwZxg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 5 Feb 2026 at 13:01, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 2/4/26 1:56 PM, Dave Airlie wrote:
> > On Thu, 5 Feb 2026 at 07:36, Timur Tabi <ttabi@nvidia.com> wrote:
> ...
> >> So are you saying that some RPC commands need to have a sequence number set, and some do not?
> >
> > I'm copying the behaviour of opengpu here,
> > src/kernel/gpu/gsp/kernel_gsp.c
> > if (pSequence)
> >         vgpu_rpc_message_header_v->sequence = *pSequence = pRpc->sequence++;
> >     else
> >         vgpu_rpc_message_header_v->sequence = 0;
> >
> > src/kernel/vgpu/rpc.c:_issueRpcAsync
> > doesn't pass pSequence
> > _issueRpcAndWait does pass it.
> >
> > The SetSystemInfo and SetRegistry are the two async calls in nouveau.
> >
> > So I'm not saying some RPC commands need to have a sequence number and
> > some don't, that would be up to someone who can access GSP source
> > code, I'm saying that opengpu does this and I'm copying it :-)
> >
>
> lol I love it. If only someone here had access to the GSP code and
> the GSP team! :)
>
> OK, then, I just had a very enlightening call with one of our GSP
> RPC experts, in order to learn what the sequence number story really
> is. The notes below are sort of Nova-centric, but it should apply
> equally to Nouveau.
>
> Let me Cc Eliot, because he was also fixing up other aspects
> of GSP RPC calls on Nova, in case this overlaps.
>
> ==========================================================
> Background
> ==========
>
> Today there are some loose ends and inconsistencies even in the
> Open RM + GSP scenario, for how sequence numbers are used. And these
> are being cleaned up and fixed. In fact, I was even able to request,
> and receive some nice clean behavior, which will be implemented in
> GSP soon (we'll get it when we upgrade, likely sometime this year).
>
> Today, there are 2+ sequence number spaces, one for send-receive pairs
> (command + response) RPC calls, and another for GSP-initiated ("async")
> messages to the CPU.
>
> The "2+" is because there is an inconsistency (it will be fixed in
> GSP), leading to the first two very early RPC calls being in yet another
> unaccounted for number space. These:
>
> NovaCore 0000:01:00.0: GSP RPC: send: seq# 0, function=GSP_SET_SYSTEM_INFO, length=0x3f0
> NovaCore 0000:01:00.0: GSP RPC: send: seq# 1, function=SET_REGISTRY, length=0xc5
>
> ...are not included in the counting, by GSP.
>
> The GSP finally starts counting up when it gets the first "non-async"
> (command/response) message, here:
>
> NovaCore 0000:01:00.0: GSP RPC: send: seq# 2, function=GET_GSP_STATIC_INFO, length=0x6c8
> NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(GetGspStaticInfo), length=0x6c8
>
>
> But even here, it's not what I think we want, because we want the CPU to
> get back the same seq num that it sent, for command/response pairs. But
> that's not what actually happens (at least not directly).
>
> So for now, seq numbers on Nova and Nouveau are generally "do what
> you want, it will work ok". But actually, we will soon be able to
> use them for
>
>     a) debugging aids,
>     b) detecting missing messages, and
>     c) recovering from "CPU sent a message, timed out waiting for
>        a response" cases.
>
> ==========================================================
> Next steps for Nova (and maybe Nouveau, if not already done)
> ============================================================
>
> a) Change debug output to print the seq number numeric space,
> which is either "async message from GSP" or "command response
> from GSP".
>
> b) Put a comment in the code to indicate that GSP_SET_SYSTEM_INFO
> and SET_REGISTRY do not yet participate in the incrementing seq
> number system, but will in future GSP versions.
>
> I'll send patches for Nova soon, to do the above.

So just FYI nova gets this wrong as well.

There are two sequence numbers:

the one in GSP_MSG_QUEUE_ELEMENT and the one in rpc_message_header_v

The rules for the first seem to be just increment, the rules for the
2nd seems to be along the lines above, two msgs get 0, then start from
0.

Currently we never init the rpc message header sequence to anything but 0.

Dave.
