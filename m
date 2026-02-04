Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D628E8B393
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 03:06:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4898B10E34F;
	Wed,  4 Feb 2026 03:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IyruQVzJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 72B0541B48;
	Wed,  4 Feb 2026 02:57:20 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770173840;
 b=qUY1uKrMDhB+Q/g++yo7nMmwR0rMr11d5gLWC68ttNPFOlJ9c2e6lEdJomZOpuUy+QoyK
 KS1aN4yOpJXaj+HvXDHRTDbRjvg4IKlvlvdsT1l9E4HaCyq0Y8c8KnYg7aoi1pRBEi4e54Y
 LcTdEirIJa9HX0jQwO88+Nc9DUGYxCDsK5c47BE/S28qbEXrNOPiMHsQxEJGf4NQDw9i7hY
 xl3SMtbKaTCm3uNYiDQwyMWD+feMHhJaPNLwWCqWvObywABGl80Gi7+6a90FqC+rZVsDtFD
 krmfjYp0vQPbfgMDL61rAQLWQukHz/n1QLe7+ZoOLKpl1+HSe0LP1XN6X7ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770173840; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=A8N9MT4yu1DypaanJBIAJZRniFiCYHpEjQ1NX9sA9us=;
 b=rQH7vPsi9f2PXZgElRkTDKDabOuPVaW9CvsDzvppo/kyjbmW8Y9Voqn4RaPTVYLI58/iH
 lySzxsjct1goIeSuXFXg+TrNtdA2+XeJlENI/3UwwsprQgVuUTbSUKWrEuhtfoGpAPEvz1L
 PnsEFZZxJ9/ARkyxr5+eS+jX8fkCQnpZpwvjvJRKvsI+Vv2jweKC6mVbrjMbnJAp6si24s9
 zNhwvTtf+T/e7Lrt4CAdjqS6MdwleiutqZ29gxin66Rv79OF8jcii0KwAbUU6TWf1k+cFQM
 v9MSbhr+Z2xpDMY06f8T8jqr1igiMVl3bzREoWQE+dV5y/2KTOAHLGuizDiA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 33E5840382
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 02:57:17 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF17D10E33F
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 03:06:33 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-89461ccc46eso113594696d6.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Feb 2026 19:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770174392; cv=none;
        d=google.com; s=arc-20240605;
        b=LiicFtDulNZFbWGUX+eYKKsldKvQEfiHxdGNH+OdfMt/1RMrYoRqanXaw/mx79DiVL
         v4cuAszjqAJVzCxI+Cv4qRCOnJQzvSfuz2cpKRGQU/sPISrgNM8cRWgsJIVMy/H+xx+6
         DgDI/l8dGqKoKlAiYBe5nsuznp1cxTUQ/hYjznGC5MCc0L/xRKqdKgMiwBPesa2uNhlS
         vbIZTBxTFj8L6ADg+A61C/5P9twxcdlRKO7n0GiKdYs6VY1XkkIcIpRZMu5diSrhotY/
         ShchLtVCi8SnaKf9GvDGZbdJaN+TPHTDr5Osm+cVzP/8YaBSeTve4VnPWemlEUjcH0FF
         0i/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A8N9MT4yu1DypaanJBIAJZRniFiCYHpEjQ1NX9sA9us=;
        fh=wYL/cT4R5BJaATfDmQyrgerFjN2IntmY+4JeCMyg9cg=;
        b=QYdYj+lkJlIA7whH2Y5nLZxvqAaw3pN3UjStpgB2ja0Kvbu5ngGDXR7QeBqiyUt0O7
         VgP8BeiGwsSLWQG9tYx7XaJvOMGuesNbI5d1YfBHjVHPiHcYuMk20VAPD7lcRXdEKZWt
         SZc8KpPe0dQQtcGAtyT33TOosSyGvC8ctM8P+G6E0ElrweV4eD6QVR+KYqJLPw5agqEz
         yrtN3P2NIuwmXmbRs4vWiwowzx7yGEMfZz36EVniJG71WXPaRxY4Qp0FFcjmDyz59nh/
         wLGhEs9AntUrX7yHROAH480gCaIDsb/rtDbyxeYfOiNGQvpQQZKlISCLE/e9fqDZ54t8
         sw0A==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770174392; x=1770779192;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A8N9MT4yu1DypaanJBIAJZRniFiCYHpEjQ1NX9sA9us=;
        b=IyruQVzJ5hUHgSMYBPvZ2WCz58nvkpFwMO4M+aj4/2TrRrtRT6Dqq2Bo3Oi8WWrVc9
         UHqbRF1O0VAtBdHjoM8H4VEVW2zL6oU37TJdZD8JIjn1E75JiWoeqGO3tkWbtWb2cC6p
         RdAwClMoXPyLLVd26tk0A5jKHXUVo0jeacqdxwiBSTu/zHmTtX1lapUY30af3JEeLlGT
         eySB2bSjiog4tryIZgYnBi7zVIiRGl5BzD6RuCSBKzE++O+xPt9eW/MQGlCCKSbIVa8b
         5ntqdKf9uxqLT5iCDWt3/k3mPOODsQPGNLPuM8L2u06hK20NHDPBmAAVn9oGAclKHfS1
         a92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770174392; x=1770779192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8N9MT4yu1DypaanJBIAJZRniFiCYHpEjQ1NX9sA9us=;
        b=A0kSbxta2BbCwBrCvQuql+4a70uiV1ZK0Fju+Mi1GKTTwNaPgnDCiav1SIhN1JqO+b
         XAfqiqQsnaN8Di3yTqnHeWjxZQzpvzTQ28Vq3ankvFOr7oWmSXR0+9vmbIfriLC8i7GB
         k4pa38BulxPYhUf7f0BkhpaHCr6m6WHos57+lQso5k5QVTHTZPrOSYddVE/54zgy6INm
         YPj0WdI+Rmh3iF9WiLAjbI5MfJYW7BM9Bain/hblqzeZl1kuw18l245x8LhOaA7UM54b
         I3uFJoAZBgixpUM9838n70DaCphwTdclwsr/WrBG/dHkRIWkYH5HJ8kuXtWSDSxee24D
         9Y4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYW5P++Pqsc2MxG34ENS/tH4M+rAnYCWlClkKJV3EBeIYRzbHMyoHRoX7dWlj5tjWLK48Btz+I@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9iF0G4Yu8owYFbvQvZaZPdE/BbloA2u5IivatrD3n4LQVf3Xc
	vslUIKT2+JodX5cfBXMK3acll4PiWrB0dln8xKZe3SQiCy8dASISN8ZuQuyFJlim/e2xyS0IN4j
	jFbj1aV0xZmMGQmle0v4pl6TL+6iojtg=
X-Gm-Gg: AZuq6aLJT/82/tW2+oueuWTd6YntvrCd1sXhg+Te76tNHb3JixY+lCkVmiUiyuZ8n+/
	zHFtwKhp3bE7agYUI9cJ/HLbKn0L1FJcb4y65Rv146sU+ii9c4bTkMVBNL6bf7f5kuweZkHd1NZ
	Y9MI0UJPtNnggqrFRqmBqJxsTSjwk/NGA8Mx4QJ9tpPvJsmUk5bhCCpBgvL3JmpfONsjBsBUFPu
	ddHQNzqoU3kWXkQFyvO48F2pMRXZBKcVcv7KWNOW2bUPgviPTBHScZl0+vsXAfvPR69ws+SBFW6
	sMlgL43qf9UeW9d5E1SR371AgQboKoaI2h3ad4lgxsuHnhFKF5l6+Ke/N6fglmMRuQ==
X-Received: by 2002:a05:6214:20cc:b0:894:6c2d:533a with SMTP id
 6a1803df08f44-895221c7e17mr25625656d6.37.1770174392620; Tue, 03 Feb 2026
 19:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20260203052431.2219998-1-airlied@gmail.com>
 <b805ed6d234c0c154b8f824c4c900e1c41736f7b.camel@redhat.com>
In-Reply-To: <b805ed6d234c0c154b8f824c4c900e1c41736f7b.camel@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Feb 2026 13:06:21 +1000
X-Gm-Features: AZwV_QjfBR7fOGcbhHcV8VzV_YWqVX90mEH07zepS-v0OE-MnLCfx9UcQIBBl_g
Message-ID: 
 <CAPM=9tzqHn8GzFd9H6+=1C8KcHOQgig3tMsq32vMcQR9Hhg=bg@mail.gmail.com>
Subject: Re: nouveau : fix r570 suspend/resume regression
To: lyude@redhat.com, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: FXQY46QORW6PHAX2QHTVHBOYA7DU22F3
X-Message-ID-Hash: FXQY46QORW6PHAX2QHTVHBOYA7DU22F3
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FXQY46QORW6PHAX2QHTVHBOYA7DU22F3/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tzqHn8GzFd9H6+=1C8KcHOQgig3tMsq32vMcQR9Hhg=bg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is now pushed to drm-misc-fixes.

Dave.

On Wed, 4 Feb 2026 at 06:08, <lyude@redhat.com> wrote:
>
> For the whole series:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Tested-by: Lyude Paul <lyude@redhat.com>
>
> My power bill thanks you :)
>
> On Tue, 2026-02-03 at 15:21 +1000, Dave Airlie wrote:
> > Since R570 firmware got enabled, a number of GPUs have not being
> > successfully suspend/resuming. Lyude showed it on RTX6000, which
> > I reproduced and wasted a lot of time down various rabbit holes.
> >
> > There are two required fixes, the first one adds proper sequence
> > numbers to the rpc messages, which fixes a bunch of NOCAT asserts.
> >
> > Then we have to pass the runtime vs non-runtime state down to the
> > GSP fbsr code. This however requires replacing a bool with an enum
> > which refactors quite a bunch of interfaces unfortunately, but it
> > was the cleanest way to do it.
> >
> > The final patch hooks up the interface so normal suspend doesn't
> > set the GCOFF flags.
> >
> > Dave.
>
