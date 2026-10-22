Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADA60A261A
	for <nouveau@archiver.kernel.org>; Thu, 22 Oct 2026 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ihMAOnRr
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B059C112683;
	Thu, 22 Oct 2026 14:07:46 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E5D794713D;
	Thu, 22 Oct 2026 13:48:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792676931;
 b=TmmxpzJCej6VbacNdbnwI7wY10FYIFvJLtc1+p6SEQwlBZwpbOnaFWcV8+ZMKi9BI+OR1
 a6e+K8LAjD5nNCs8TQemoFdaqflUSRdGWbSjoUzOfbv08joKE2k/7Dzjo51BaKZ0cRDJNc1
 /i+z16/JmOWbrmWsmR+DjVTV/gYY3TO9e8gdaHVkzCgYJr3wfSTqybZzjxb8XPL59DG4L2Z
 KWgb/fA3um1ogLoNFUDu4UZ/kseaN74T/2x80IpLcxZYvxquwsbbcNe9zK8W+/seeomPUHm
 xGWQp1grsg1o7MGSNqfAqL4Zx7HPXIPoNOGddDleeKNnzSB+sDWPXihJXYzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792676931; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OytvGbAQXj56ApS+d/QdMB+7PoNYrL1A5PTPS2RUpWM=;
 b=MFtNPg6NZHwPUW4/J3NGJc/K5tmiuPI4ooVZ7+R7GloMhB8j70XCEqFTlzWWT1UH9GWYt
 qcr5wfHQ6Br5xqOQr4pIQG/xRLSoXPGXV79REQD/HVL1roUIqmD+UKAtn3+HiAATjD0GXVQ
 5zMwc7KGmQwr5Dhp1pkSu+YK8YB0C7Nc1OdatvH5/SouujPtxBHYW5ylqX1nn3hVdaf6HQY
 Cfsomedvk9GXIzckw43EPKLO2xPo3zfUu16LeR0QEhbAqDiLvlvwIFsAf1UV5FdvXtQIpHg
 rpKJkMOZ7XavHm/WamqGDYriT61PsF9lh4pKksBzKQ8C1v/bhtRKu+2QW8rA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 448D841398
	for <nouveau@lists.freedesktop.org>; Thu, 22 Oct 2026 13:23:58 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com
 [74.125.224.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BCAFC112638
	for <nouveau@lists.freedesktop.org>; Thu, 22 Oct 2026 13:42:47 +0000 (UTC)
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-677bc4704cbso1764849d50.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 22 Oct 2026 06:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792676566; cv=none;
        d=google.com; s=arc-20260327;
        b=IfQ9LBIteEZivlakwPbNd4Q3rcxznvyNd7HrKWEu6VjdTtPONAa6jXyCW6bs8ko4pe
         Vb/LsZrvoyT8Go89rjha8fOWQOy/D7VCFNP8kRgQ7z+QhIsHNBfdNV4XLADzEm/sHDkE
         aezchv5utwU+8kM7RyjdOhwU8CdhZQ2cmkDfdxkmlBqzvisDPzN/UoqvkSkkvXrZ64t8
         UOd0V+TxjCy0/pnlIx50SdOGaO3xr6iI5+CPaxCza2Ayau+0pE4m2bukweAzXNEshFaF
         EmddvELVSFAn2IAGU0GwQTsxKHdWtxhIgxGws1E+44Fesf2nTX3ZjknYJDukT4bBGg/e
         BcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OytvGbAQXj56ApS+d/QdMB+7PoNYrL1A5PTPS2RUpWM=;
        fh=/2nKax65ejZ6Rmg7lOdGnBj26tjN8HGWw81xQ63hbi4=;
        b=XAoDWWbYhFqz/OxqDhdfWETLL+O+u4K5UPreYDCF+f0H4fcxHpiEUpE2RO7+eEo02h
         +h+tlaHyZOAPbiOXGAqiRrKHbAxZ/uWGj9m+dospODAeFk+TLcwve7W/kF2NQJJeM1Rk
         LxbGma5rvBTN4vCN//ibYhBwoP4KYmSVK5ISIMxKzpIP7Lk6AeRAJb2SX/dSh3p3vG0k
         pD3WunS0v2NahYralwAnPnpfsMD/KrKG+x5U8JkM5LlrHl2FLTBW0cNLtAu2o4giVeiK
         MHDqQoosRMg39jLVBQijxAFiPJcp9WTkK63LrKXh/CHpka2PaslsUjfMudqMRiqtwwgC
         dm+Q==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792676566; x=1793281366;
 darn=lists.freedesktop.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OytvGbAQXj56ApS+d/QdMB+7PoNYrL1A5PTPS2RUpWM=;
        b=ihMAOnRrGtCM9t01/+98aSQdXfMwoWyOl7Dux+9z/oRxTvSF3DeD5xvmLpnfD6LPZ7
         MB7X2Qqm3+6s3hRhJsnhSmTY785ndfrDfuehSIyRIECRbLg5c4a4BJ0BLdoCvbgkgtHF
         V3Crtv/iJ4zBiZWBQVMHEqo9/DEyf93tmCQUM+46mDM6M43dqWnRkiP/xA3WZR8M83BV
         8Rgwh9/10YWA3SScAin8pwRGVdGxisZ8hRMcv5GXpgZ7jEboPsBaFa7qCXV/6rHarOLn
         oG4rsS6lkuuvFtLqKiLPI4sk82ZU/mZOihn8lcGvmqlR4ujP7Uu1uSOfa98pVnGVW4SJ
         fMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676566; x=1793281366;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OytvGbAQXj56ApS+d/QdMB+7PoNYrL1A5PTPS2RUpWM=;
        b=wzeEgl8sgaW550YtT0+lbDI/6pprfsCf5OHc4uMjgcVUdq+DBV4Yd9/MtuexaS0fKt
         7bTl+ftBPKcANfREWDu2E9HPedhhQUI2bD0sdVQ/p1ao11dCTdmprpgkAl7qNssbt3YJ
         5CBrH9BqokIF6MbFEX22UjgbbEyffu/77PZDt7EVjC97FW0q2DH0VgWuEw/tF2vtXnC+
         M1mfDuvii8alWDUKlSR68yTNuT1OY4gcNtnoH49UIDjU8GBd6Snjo1hLtSAffLAHBzji
         WVraDx8/2SAXeH3KObFtXtw9n6jEoGEdt7XICUgxw/KAJA7irUoJCVFLdSDTDbFtbWXl
         fshQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByO/M1IwLwNXRxQz8r9v7ZZc+tPTloWHKR1iETS7YzVMOqH6Kk8AK7uiS0pH1kdc8ZZNt1/VpnK@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKJYjUf6fuQ1hPltgUoIk3lqJDmoeHN6fZe2HoEQ95TsX0xo6vr
	UwiLGHip/kRaGrZfL0wsb+Tv+T2wwfpxioy9kmCE1obyAMtujsrcxSK2I/uc4cW3oF0GcWpclr6
	9MZM3QkFkemrZFf3Wa3HHeJoZ7FKCtJ4=
X-Gm-Gg: AYBFou0UcJWZvOtmgb2beKCF+OgY3snh5/zNlFOIScNly7HvdQeRMGV5aXrxgswz6+m
	G+eyqnt0wlMpBfuqWURZOeC2UnonQgWLivjpwmNUFFvR4sSJ4F9lm7c8fcr5Z27vpe8wOkQoPaZ
	aD4QbRYVXd79He4Tor0W8Xvg0esyu391JbIhTeaLeB3eYkPZ4dW8vbqUeaSAaY1vXL5FUAAYk9L
	GukR3KW6ifPQlXbRXGi+duwYcyUVzQFvDO/Vipgpi9EWm7++0NZMC+16aVcSMyOOhQ6TCqZy7pU
	Ly2XOJKU6Wlz6VKkhO4o0hpK6e/ziCMSzlbW1AMtRmKX5ZZzLfjsOJJJPd1wfMVaTMsxtnmS7HS
	rscG2wNgwPeZUNQK7cJkQMGH8rXvK0RifhI4EyF8kBNAmfXoufI2f2+NNEwdg7p2egbNjCxlM8o
	4IKNUcqlidDvEmkvcO3fo=
X-Received: by 2002:a05:690e:118b:b0:672:99e0:ec0b with SMTP id
 956f58d0204a3-67a0e5d222bmr1910792d50.163.1792676566223; Thu, 22 Oct 2026
 06:42:46 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Eddi_Andre=C3=A9_Salazar_Matos?= <eddi.salazar.dev@gmail.com>
Date: Thu, 22 Oct 2026 08:41:58 -0500
X-Gm-Features: AclHuK_6zdQaDbe-2rHgvnOlDi8A-w4ZVGn6D1v1OeRVnkh0sJIayNex6TtUg_A
Message-ID: 
 <CADGWsUZnFuoc2YZx87zoFpsvRHWA2sRuTUZPhdpwSJyT1WmOnQ@mail.gmail.com>
Subject: GA106 booter error 0x15: root cause found from bare metal (no Linux)
To: nova-gpu@lists.linux.dev, nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000ed5e44065e6e0960"
X-MailFrom: eddi.salazar.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 5MGONSKLV2OMX2K7EYHFLA3SN25CNMJW
X-Message-ID-Hash: 5MGONSKLV2OMX2K7EYHFLA3SN25CNMJW
X-Mailman-Approved-At: Thu, 22 Oct 2026 13:48:49 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5MGONSKLV2OMX2K7EYHFLA3SN25CNMJW/>
Archived-At: 
 <https://lore.freedesktop.org/CADGWsUZnFuoc2YZx87zoFpsvRHWA2sRuTUZPhdpwSJyT1WmOnQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000ed5e44065e6e0960
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I=E2=80=99m developing a bare-metal x86-64 OS in Rust (BMO-X) that drives a=
n RTX
3060 (GA106) from scratch: GSP-RM 570.144, with the same flow as
nova-core/nouveau.

The booter returned 0x15 on 9 boots (6 in a row from cold). I instrumented
every boot, good and bad, and isolated the cause: my own IOMMU self-test
used the GSP falcon=E2=80=99s DMA (one transfer deliberately aborted by the=
 IOMMU)
right before the booter took over that falcon. Removing it made every cold
boot succeed.

Three observations I haven=E2=80=99t seen documented:

   1. 0x15 arrives with WPR2 already extended, so it is a mid-booter
   failure, not a load failure.
   2. The GSP mailboxes read 0xBADF1002 at the stop on bad boots, versus 0
   on good ones.
   3. The GspFwWprMeta copy in sysmem is not modified by the booter, even
   on success

  Full case file and the per-boot CSV:

https://github.com/AndreeSalazar/BMO-X-x86-64

Hope it=E2=80=99s useful.
Eddi Salazar

--000000000000ed5e44065e6e0960
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"ltr">Hi,</p>
<p dir=3D"ltr">I=E2=80=99m developing a bare-metal x86-64 OS in Rust (BMO-X=
) that drives an RTX 3060 (GA106) from scratch: GSP-RM 570.144, with the sa=
me flow as nova-core/nouveau.</p>
<p dir=3D"ltr">The booter returned 0x15 on 9 boots (6 in a row from cold). =
I instrumented every boot, good and bad, and isolated the cause: my own IOM=
MU self-test used the GSP falcon=E2=80=99s DMA (one transfer deliberately a=
borted by the IOMMU) right before the booter took over that falcon. Removin=
g it made every cold boot succeed.</p>
<p dir=3D"ltr">Three observations I haven=E2=80=99t seen documented:</p>
<ol dir=3D"ltr">
<li>0x15 arrives with WPR2 already extended, so it is a mid-booter failure,=
 not a load failure.</li>
<li>The GSP mailboxes read 0xBADF1002 at the stop on bad boots, versus 0 on=
 good ones.</li>
<li>The GspFwWprMeta copy in sysmem is not modified by the booter, even on =
success</li>
</ol><div>=C2=A0 Full case file and the per-boot CSV:<br></div><div><br></d=
iv><div><a href=3D"https://github.com/AndreeSalazar/BMO-X-x86-64">https://g=
ithub.com/AndreeSalazar/BMO-X-x86-64</a></div><div><span style=3D"backgroun=
d-color:transparent"><br></span></div><div><span style=3D"background-color:=
transparent">Hope it=E2=80=99s useful.</span></div><div>
Eddi Salazar=C2=A0=C2=A0</div>
<p dir=3D"ltr"></p></div>

--000000000000ed5e44065e6e0960--
