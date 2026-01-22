Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAB9D6CFA6
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 22:20:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 78DED10EB0C;
	Thu, 22 Jan 2026 22:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0sbmYxOO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BD051404F1;
	Thu, 22 Jan 2026 22:11:33 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769119893;
 b=pkZiVWjq9auN9yTtMnire2jgNvcXSOYkw71ADSCRMffCk/aH1Eg+3V0wWMayyM016NFdE
 GgR0VoYFagK2iCtOzNHglvyKSgrZHd8PlezdU4POZkKINBZ7pX59IV1lKW/QYEwtrSgEb86
 r/lIaERYuJcYyJvBoLyWy4BJgYFkDFWPmPpUZiWWrEGwXwKNV049dalGHVNybN762S1orKZ
 quzzgwzKoo20X3GbzkuBieN0xvn1zFOkM/+R9JZEijFOtQVe+RoX1YHQ0P7u0pxXi2aMdle
 Ujlc/CWD0KK1ksc5s0y/7VNU0xRZtrMiyHNUxSvNPAmGPU4S80PAuCozan8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769119893; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Pt2D6O33Ey4hyzRS6eetgMJ/Hcg5n1cbhI+usjAqh7s=;
 b=Adl9fDo1KUKfhlg7b1LSZmE81u+UrEzmmgofmOQfp5Pgsnuh+RBim7nWKBdBkmptVv7tn
 mlp84yBqQ7sk63gdhjKiaHrJ0Q2tRJw26vSqvr7aAmJEna5CXy8K3qpqutLzWGSrAjSs9Fv
 aLdiYtuvn4wtWWVNpHUdphVoShmbnj6hXjLdoNG7nO//FQBcUWF5upsr1yTe1gPCSghTRsY
 0vqxG8zcJFiyN0oyKCgDwo2g0LOoz35GIAHt8Ks3giQflJ1S2hka4rcAjZpQkM+aKRNJgtw
 9XHrlAVNDXszZYlQr+cYX+4g47lcJAdhpvKT9bHIX5Ha6JaeEJ1Lj/XNcbtg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7FF7C4003B
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:11:31 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F3B2110EB0D
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 22:20:20 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8718187eb6so225596766b.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 22 Jan 2026 14:20:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769120419; cv=none;
        d=google.com; s=arc-20240605;
        b=ecxlJ3DTV77QfR+oxA+qJnUJ38AMpzNKS2dR2/hTboRYby4o2RaQxHujBXIkVHQW+9
         GvEP0gN4y4FaHeYvK01eBbRZoY+b4ubgy7V/y5AezXwMuF5fwEacLiuBwq+qP5lgYZ8w
         j85orCvwYt4+cEw4dt6NT7SJ5v2GHjOhVpoywrLZjia/KI918DUpujp8TgHxqRadz9Rh
         FqO3v5bwmmjo5p3OsFKI4uhxjwpDMGS/vG/Pz6HcuG8BrH1D0FYqYFTDWHn/RaZ/lIt7
         z5xHcf2tk120jBqIHqQWZLPwTkcf2ktoAGU58LHpUhI2/P/XXmv+PHM8GnBhQ1Qm/ihy
         KM7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pt2D6O33Ey4hyzRS6eetgMJ/Hcg5n1cbhI+usjAqh7s=;
        fh=LJCfGQZpTqMn6XCeD7G8svAWdot0FZ60wLjhHC7/rTk=;
        b=OhkOXI7Pr6nvnIKEutGFUJ5VxRaKPm0UtekLhqdvobL3UF0SoHPMNGSp5VZE6i6U5/
         lywE9QkyXX4bFImiftwNcZJn9yCmhUeV90kDdvWugGF67HYowiXNGipgB2A+rQL6F3ba
         rjM5iSu5vd6VLiGs92cROjK543ZNADAC2wqeDx/WBrJfDVo2KhjLu7nu8A4DkvzhpvLT
         vez9kO8Vn5iVIXp07jHvi7V/WwgNUW7/pCzxHDVM7e9BczUeRulA9VoQrHTOOuPL6i37
         eU36hd/HnVbsn9Tn4ZufwUsSvNXlm2xm0T5t8ooEMEabrZs7Fc7mlNB1cIDNT5Q9a0hv
         gxaw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1769120419;
 x=1769725219; darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pt2D6O33Ey4hyzRS6eetgMJ/Hcg5n1cbhI+usjAqh7s=;
        b=0sbmYxOOyeIYo65aftEHH6WUVazgzZCUgh3yK5PXFRt/AaC5t2ttYADZ+75Lz6VGfI
         FQ66rlhLEColbBlk0kJqA6YZnyYJw3BzC4ccTqiOfD1ty+H5IXQHr662aaH4Qso9KWi+
         HFFkgkDHqeed9PoVwXVIwAtw1iQjO1UlCAuPp3gPXXvtRoQZM0b3sLMgHLfEaGdWiPcf
         EHUQ8TJXJYioOlZ6ZIjYf2ZALTK7ygIVOpuJrmZ7X38ISmO6KH+J7wrNgvSrMPtgcSGz
         MYO6/9wgdlmyaBmvMI4/pK/JaOnA6tvYBpW112RFo1FAGG0uqyJbEvmojYVJZUuPzFz1
         LpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769120419; x=1769725219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pt2D6O33Ey4hyzRS6eetgMJ/Hcg5n1cbhI+usjAqh7s=;
        b=S+pTRC/C16uiMNbylF+yxs4IudI0iI0D1lXdSen77PPuU0aA4sEcCJhrqtllheB66e
         JPjZFFMNOIM4Qwc5l2HFVn2BxDeQmFZF/AgDKAlS5j+7G3ZltRMiodHIz4IlnCYnONPw
         ktVYm6qniTH6jeWrZ2Dz2HKgIoetxjp28RkT4CkXdFTOP4IGcitFXJOfyakhRbU4oo5W
         P2g03JCc4FrxdjGu/0ymKHIr3zgDbRFc3Ri0akHduFDMQ1Tv+A+QNYRL86BzbRovM06H
         +RiMjEsr/ELab5N1N+T3zPV2zvB1DlENb3XerWTkYucvFY24UmhMQmEpIO+8XzgwPt/a
         CTOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHyXKyjjE16Ll4XFoLoqWWHrlPaCbRGCRk1k17y4kEnU6x+ZFEQlO8QIoSjlBr/g0mOp8MAkTv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiCroRXs2c9Aivq+FvVH8orvdPAVr6VQxJVTM1rFWAqlX2cdfU
	5iLaOzT4g9wcs9gwPp5JOFkHsYwmqJ4YTitKDYYX8kd4MxuLZAiP9PHzKlsSvdxJRXRAAxuwjJ+
	QUlxT+yM/Mf8yfnB19dBHjhQlTMpVHDDhxNv2IPV+aA==
X-Gm-Gg: AZuq6aL27HlgzUP5w91/YVYSaiXmGHMQ7dqokWD4jEXAPMF8JDkJF64HSUxhULXj9pX
	DvFXus8m/CPHpMfgAIjMFfwOGNioM1R4p2uR6Fh4qDFtjE345D8ByaaBRYo6pjxCnGdj1YZ2vyD
	S8fPWaquUBajzj3DDhm8/dyYOraVDlEdwwx9JKmlj7zWz6SR2WlgRr0Pr/e+RLUtN7YhbCTOX6q
	lBcOmvmKe8vbSCD3XkzCqL2Ua4J/PpVVUxJWksuJEvSUEUpxqzaRYBd4v8/1bsn16I015T/vTYc
	f6zWYgc=
X-Received: by 2002:a17:907:944a:b0:b86:f194:9ee9 with SMTP id
 a640c23a62f3a-b885aceab72mr45582766b.19.1769120419161; Thu, 22 Jan 2026
 14:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20260122202834.414058-1-airlied@gmail.com>
 <CAAgWFh0WMK5Kj-nUDeRXnz-U2+wPY-zh3uw1yAi8==SekQsPmw@mail.gmail.com>
In-Reply-To: 
 <CAAgWFh0WMK5Kj-nUDeRXnz-U2+wPY-zh3uw1yAi8==SekQsPmw@mail.gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 22 Jan 2026 17:19:53 -0500
X-Gm-Features: AZwV_Qgkt3gePxjDhIM1U8PMFJ5cl6UPTvkYH2N8sWtEvEAz4GH05YxXtQ05dEQ
Message-ID: 
 <CAAgWFh3nnDgEFA4rR5=9r0ko_xUvx0xJL8UvsPNpEzSae67q7Q@mail.gmail.com>
Subject: Re: [PATCH] nouveau/vmm: start tracking if the LPT PTE is valid.
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LHJETMR75ESBDPBYFYALM6L4KAKJKUIG
X-Message-ID-Hash: LHJETMR75ESBDPBYFYALM6L4KAKJKUIG
X-MailFrom: drawoc@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LHJETMR75ESBDPBYFYALM6L4KAKJKUIG/>
Archived-At: 
 <https://lore.freedesktop.org/CAAgWFh3nnDgEFA4rR5=9r0ko_xUvx0xJL8UvsPNpEzSae67q7Q@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Jan 22, 2026 at 4:48=E2=80=AFPM M Henning <mhenning@darkrefraction.=
com> wrote:
>
> This is meant to address the MMU faults reported in https://gitlab.freede=
sktop.org/mesa/mesa/-/issues/14610 ?
>
> With this patch I still see faults when running the test script I posted =
there.

In comparison, the top two commits from
https://gitlab.freedesktop.org/marysaka/linux/-/commits/1b985166eff68681922=
6e3515534b51b66283734
do fix the issue for me.
