Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A04CC6B33
	for <nouveau@archiver.kernel.org>; Thu, 15 Oct 2026 10:41:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 846181122A7;
	Thu, 15 Oct 2026 10:41:05 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8407848AB2;
	Thu, 15 Oct 2026 10:22:26 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792059746;
 b=phmydwkde/BdvY2L+4IxLfjBbvLU9njeajXBDSwfp43PLxL47ak74LOaYQhMA8g2luBRO
 REKB9E1PtT2NHH2NBrDFSvkhlVdNa8xjW1ddwg4LOMj43f8xFeHvDz+skOVbTtkc121gJen
 gjiGz94jcMgDqlbo1O14lnACYKu0TglJcqyTuEb9qLQzwN0fsbxersamtpO3EuRrhbPo6kX
 8kVtXpwyjWw8aqb2IWn3/7D5buKwsebd+tTBh2EEWtv/X05cQm0CMS3Mb2CEVCbDg1Y58Mh
 w9AZyFXhoYEe2M1/qj1Ou9koW6OvKFjR6EQ6arYtCXRFAtx3Vg0PRIkjU1hA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792059746; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GK7c7qoHtQuqEPaLuDtj2LTHMuxiL75fJf9jcPF0ouQ=;
 b=E4wFX9SvHLkz4vCG2A4LYTKLINX5obNPILzXFx14fK4Jzgs0a6sszHoM+mzBLXwbLijSr
 lSlyFI9Jw+qKOIrR0S3emr88qyOWyx1WbSNtX1CjyI8Xh+jQA3c+AViWTOhQdhQaAWe/gZV
 6+li5ykihqAQ0owfPc3+Ldiez8CEZHqiIBlO36sR9KNDAGhDAfgqdAY5pVD4CLisYZwLmS8
 NfZBM9yfNvEwx9xJPK41hVqJBf2nrS4tlod2iufqt+FW/WbtXwNPItzlcfR66bmkzdsVxvL
 OWeGEhq4zp5luQRB8/i62yB814nNi06Z6d0aEId5EeiV1MrJUEPHiAbWMg1A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5CAC348A96
	for <nouveau@lists.freedesktop.org>; Thu, 15 Oct 2026 10:22:23 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 26B9510EBC4
	for <nouveau@lists.freedesktop.org>; Thu, 15 Oct 2026 10:40:57 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-93e515769d3so432292985a.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 15 Oct 2026 03:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792060856; cv=none;
        d=google.com; s=arc-20260327;
        b=iyNj5Wu2o3y7WrXPhNPPxIo3B7zURo2ATG3OQM/JYGhiuF3vNRlOBUDQQVXt6GJAlf
         tEeo4SES9tmkSH9lzBPX8BK0Oh8z+eEHGcJT/+RDx3yhXgfYY3H0pN1xU8XiKJ/EKKFX
         Qjz8TSFIsJcu8ru8YQD93VjhKYW1gnLnfxdGZ+AWzBFDZ2WpoqY7y6JkEsPvwebtKbPf
         Hi0GK9yMRulY6PYE1jpwH35S8okmOQ3PS3hAreoio4g/r4khcSvuYtkb8mZLuEkae6mk
         Yjc7CQoJmzvw8wqiPH5faBxzSz0YnsNYgA8nkD4VI6VREYgh4vgRtZJkqUkHY1SLaIVW
         6K0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GK7c7qoHtQuqEPaLuDtj2LTHMuxiL75fJf9jcPF0ouQ=;
        fh=byTEA01EvqHFQdcaWfFDNref5PecJIX/vxG30vPa5+Y=;
        b=A4DuYJatGCGgy4GpKqBnfG7sAj+YvwW8U8sH+UKRvPKz9icqR/jDPLIIHpumguMl5F
         MgexRXK1vePOEpc3GwbuDP/WFnhIygA4oKtQlewtga57kQTztVyXBFMI5ovsjmWXvw1x
         pBfkL/hUTEzYhLR9pbsfx9fXrDLeG5BXZCmLYplM4psUruBa99AjOBCN80/xlfzvDXM2
         9jl+vsmy3yrZAqkRrtNlos/ZPEa+iFuSKxXdzfeYe6JxRcak0bg8IzdacC/GxmSkj+fj
         kyzI4MKPjV0e8zxPBAK7proztUUntaC5cTWvgMlU3gzZogTdVFK/CQuLORZ16XYDYLtm
         tTZA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792060856; x=1792665656;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GK7c7qoHtQuqEPaLuDtj2LTHMuxiL75fJf9jcPF0ouQ=;
        b=KvnzdQ0YGxZDmBcDTdZp9OGvRVfi9rdltGKidihFpfgpBXrtzAwkPvtYXkYCLiuECe
         Fn2Gzkar89CHy7AIaoGYtAO1sOKiu+niy3cTdoDiPH5/U2lklouUPCpinq8HIxcSDNXh
         SvcEnhliu6mNtUZe10mjLxb6qQQ3FQycvpv29lwQ0ewieKEm4jQHYRG5KRtBzRUI+Ihs
         TXL69fNXqnzIRhhKR3BVqfZTe6R/nh8opTWLVF7pnD6dAkx2RD6YHrhMgq/WP6PmDy6H
         HO3jfIXv67gTSS2ERbmv7CjyARmXGfRGC2zjpNtwh2pUY02UJaEU1/2leklO1MFcAOAo
         59Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060856; x=1792665656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GK7c7qoHtQuqEPaLuDtj2LTHMuxiL75fJf9jcPF0ouQ=;
        b=QZaC+94AAZYLMi6qbiglhWy5DC2w8gIVvdqA0/ReWTb9hrHC8vUk7t1hs7xWewsG4R
         AbyUhEpPcsCA+rc58/lk9EA1Xb1MKtXzmJAb3/tJoS+vhQJMyobM9oyM6Oc5SG1Bygd/
         Nq6OG5J7ERz8pDfYA0K84jr2mCEs37VE3CfrQ2vgu8vJwFxmGFmQOWLGgr2LJJsZiUC6
         he+azHkYV/SY7Wolvdcrkk0rlIalvxBwccoXhvF9OsR6dTXdvkf34lZbE/su16/rmNka
         NLTNyZcn7DbRDuLOVz3rxIk92zfjSqr8nAwoD0HydFtYRnhsPHe35Bf2nKnWpcK1wZSj
         2yEg==
X-Gm-Message-State: AFq9FYKQxcuP4khNamaMfiZRidCpENlXZfZ+y5y73wJsfhsOxPMT/Qjq
	BU2nSH6fWWa4uTCClXxu4KA9Vd81cugJtQgGXJG2bQJayWbC9vWJ/7SqmgHC5UHp1XBaGn2xcyz
	5pZiPHL16HZPxYadDOEjwv6Kf2zjTQveApM3/qBQ=
X-Gm-Gg: AYBFou20F1Vrdte41vl3v+5f8cD/YfECW64JBw6k4LrCSyjvFttu1EJbiieFelanufd
	/a/A+FDHJanRVMK0+vCfKvkHxtB/vgwcyvJcSap3+R29UtOxQ3o6FzQZCPS3aDTZJUVyOPio+FU
	SUhPcvKlEy8X7zHwz3TdcIzVJM/4Kp1ENJ/H1hriFYCB0BD8LEqWVwH0/UH+bYzblKAADE6sM/i
	aSkzI3xgmFIGAzkTH7CGclQiPbFdAfr3xtjhxwYMrcayCTZHVYma3lvFSNUICcPnzBvF0AMuj7B
	3gxPq/lYnn4da7mrwkZuh63dHPtCtcBXp+uat2/oVAU8B/GqFhgKyQEdgkc5fDLPwrlM6P5Zte3
	vXK2qHZRd42gNDjd0KYbsw9ldc/UYn/nRHFkwHIBBQZbiOw==
X-Received: by 2002:a05:620a:44c1:b0:93e:6e59:ad16 with SMTP id
 af79cd13be357-93ebd1dfd74mr3037179085a.29.1792060856144; Thu, 15 Oct 2026
 03:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260928081450.19340-1-dilddream31@gmail.com>
 <CAGC3ukQ7gX97E7pG0Oy8H0cnmQzoA1038io+VhrBogPB3y9dDQ@mail.gmail.com>
In-Reply-To: 
 <CAGC3ukQ7gX97E7pG0Oy8H0cnmQzoA1038io+VhrBogPB3y9dDQ@mail.gmail.com>
From: =?UTF-8?B?6rmA67KU7ISd?= <dilddream31@gmail.com>
Date: Thu, 15 Oct 2026 19:40:44 +0900
X-Gm-Features: AclHuK9ftaX0YjG2NCtLvWvZyiH7eh52x9bAW5dRWFx1APAiB6cYmVIL6REePPY
Message-ID: 
 <CAGC3ukSVk=N4ttd3hwnXXXppHchwroJmySPAFP65Vt+uP0COOw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Clear fence channel in no-signaling path
To: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OAOUM6OFIRBAHB3E2DFTCWTMJJFQDWSI
X-Message-ID-Hash: OAOUM6OFIRBAHB3E2DFTCWTMJJFQDWSI
X-MailFrom: dilddream31@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OAOUM6OFIRBAHB3E2DFTCWTMJJFQDWSI/>
Archived-At: 
 <https://lore.freedesktop.org/CAGC3ukSVk=N4ttd3hwnXXXppHchwroJmySPAFP65Vt+uP0COOw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gentle Ping.

There has been some related discussion here:
https://lore.kernel.org/r/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.f=
r

The patch has also been independently tested, with no reproduction of
the issue reported so far.

Apologies if you received this twice. My previous message was rejected
by the mailing list due to HTML formatting.


Thanks.


2026=EB=85=84 10=EC=9B=94 15=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:10, =
=EA=B9=80=EB=B2=94=EC=84=9D <dilddream31@gmail.com>=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:
>
> Gentle Ping.
>
> There has been some related discussion here:
> https://lore.kernel.org/r/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux=
.fr
>
> The patch has also been independently tested, with no reproduction of the=
 issue reported so far.
>
>
> Thanks.
