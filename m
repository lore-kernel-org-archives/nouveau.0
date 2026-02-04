Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D04AE9D40A
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 16:28:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5577E10E6B5;
	Wed,  4 Feb 2026 16:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Vldgl1hL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 367A841B48;
	Wed,  4 Feb 2026 16:19:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770221942;
 b=po5z5mE6K0JbD1SqvftFz9XY0ug0azpQj4G6j8rTrRFetRNkDsVAr6hAzGsyhVm1WOxst
 ITo4Cq7aD/gBEdVpIAqP8lIVf18L3gj8ZoT1pEXsT3RDhDZDIZIwxZ+uK0NrdA+jccgs7EU
 +08HtT+E+08EDhbIgobuRTeFfoMuyJmOZG6/YFNnapag4oZRGx5z/LRXkQHfTYppodnHY0l
 80+0wmB0yF5TPuG7JvMofSnSwOHp5FI/6UgPwjstxIlOKs8vYrVNlJTEWuU5MDGMP2dPIGy
 1mUqCEzJgjNeNH2zbTsNHXZAIXFq1QkyaG1uJaddAtsbHY0OLt94yr0rVYTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770221942; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nOiC9pvPh+VgFtURHAiWfhK9h8fXI4IYsOk6Zsqg03k=;
 b=tCgdNhM06ZEkt27r513Qj8V5eggrGdnAphEH9i+KrI++kdqjyx4Leut9SE4qz7s5ptwRm
 mB2jfBhtLNy1uD1ouZQhz+rpsyjp67w9Yvky+hOKsSIiQtBVXE7JBhpDKO2ORtTMgazuuV5
 3gXugeK4H95LFH+RMghYFqt4NPfX8c7yocAQcLBreLZLo/Cuu0oKoCDBTv9UEnPGmJnnclu
 SXcef3vjsz1746ZQhYK3M+gQvgO1QtWENDSrp546W9u6wm+Hrui6fqibXQHX3mPdMA/+lqG
 Pwu/zzUwvRS4aNqQbH2feZwZE9DTxqTIbgY8T6gnCgPLu7lRapQ6jWDqYgEQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=suse.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=suse.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=suse.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=suse.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3885B40382
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 10:25:57 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 73FE910E5B9
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 10:35:14 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-59b7c2614f7so6174262e87.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Feb 2026 02:35:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770201312; cv=none;
        d=google.com; s=arc-20240605;
        b=JUgnsJgb+gMnllD9UIjD1CTvJviqvG19kMXbUYn0LPGpy4jhWR8XQomwxDMPzQwTHU
         93AxxkNC4WFkXuMwBNLzsVe5PUxoYcs5EU+bqhTwSOs34yXDXVAs3OG5bzVNdsreioOo
         v+sT6AcDXpNK9D6t7C/10x3rvWYwGbmUfJwAZm1LU2EjaFk2IJdghZh7ppe25Lew4evb
         Q1/kW0iNVP8J4Mqot5sqNtl18ccCneti+BL9mdENjc87O3PAlXTQ9QpVbyluR8fPYEuV
         t8dHcEaA0IV/kDkxDBQg4oIptjYA+564k4f2XvRpTXrPboxArl1Kd50FQga34ob4nyr/
         XIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nOiC9pvPh+VgFtURHAiWfhK9h8fXI4IYsOk6Zsqg03k=;
        fh=BjlxaAzazh/Aw8oFhGyhNEJJej+rXrdTld9nTZtl1+A=;
        b=lVFI2mrn4fA7KsKXNRqhwXt1wEudjJ8DquraRgGPWphgJofOLqgXawCAejGlGexDHu
         o4FvNu4D6ptBUyQh2gw8fvGeMHru463E+wLtIlJDo6AlbfUMkMu2K5/C6nQ1pqk70/kG
         a25k+aaTcPHQKcWbJ/SIE+21k3IE7Abj8tChgQ8xn6igCIZQ7EAkdl+hK3D9bgp1gtX0
         xXWYHQOrM2ACB+wNBhItfNEWJoBliSWgXNK3HTTxktNsIrwuSSoM0MxnA8oFWVdtVf41
         RdSuSSwMtRoPKRLanMKBzqdnLBrICFOVJB7IdBa695edT1kdYphhmCWCLAijbntv/Cof
         j6UA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770201312; x=1770806112;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOiC9pvPh+VgFtURHAiWfhK9h8fXI4IYsOk6Zsqg03k=;
        b=Vldgl1hLlH9TbEzbWkjYIDXcQzNz0/ILbVopt3e5ZToeuJxk+erU7wGztoZRPDhKcc
         0Ywp8Fp4BDkSYO70hfeXCvFeUEG4emTFq3PRQVXEdtuPssfl9a/E7+JHdBmTWvgFgvff
         I75VefbDlDxs9LkR4t8RQP++uIxru1oQnEt3pnV8iKpwzfjYS16Gh1t7BYxDOWZ0b5OK
         2fW8qCPMTV1UOLxDYFibUoePh4ypgCziieKdW0+IbICHjAqlT65HFsM/42MTkJcG50z1
         xnILfeiq3qyd9NqpuaE5jmeallT2CFbLnubWkxPFcAFdfRaf/KvfDn7sN6URXatvdLQw
         sfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201312; x=1770806112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nOiC9pvPh+VgFtURHAiWfhK9h8fXI4IYsOk6Zsqg03k=;
        b=tUotYfCxUFRIovWHnleRf84Qftm5elQUYWX7Ho9gJeFcg69UwiHb66ivOgeV2Nm5VQ
         kmU1R12sXsEbb1FSUGbt2sOljSYkU8DtUL6Z4lUo5iRVCSXW95J+Qn8W2iGJFqZsMP20
         N9fdC7vA1iUstnHdAWmKfiUef+SEOfx8enUI99HilIthbNe+PPIw7IlRJwK+NnRHL752
         MH5/34v/zDegYCTBQm/3bFHj9QsmoTnRqiybAqoCjffPhTW5TC+d/Iqjx72sULIcS1oY
         dtUb3f+k1GlfbXyAxzsBecpa7H/eS+31Xmi+zLs6pagjpgcUeCNr58lzlTo7N234wf/V
         Q+9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfUslKlBmknEPKz1faBgivQMDEq/IiC8NWkw1wKmw9oIgwOWNI+vOK7EwRWilWr86f5ZBWA224@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhoxeYiF0PkYCEWm+Y/BEmkQrOcDaaug1IApZzldYqHSfIeJFp
	6i1KzxZcxfdEcTWQmG/E4MdRniYiYPoGV4tsYNVXGjax1KKmJJrZZjGafhY0eCfBscoif+cMKBl
	n7Xj1lb7nGmPvkE6UBFeWICmmiskM38rfpdCoy/k0hA==
X-Gm-Gg: AZuq6aLEDZdX7xJ18XIgtOoCwtrLpAvtAq8e7ed2ujOntzFW9l4fsK+ggrlVQV/QoIq
	9FOCPGFADV29r6fQ7b+RnoeQdeDBSnPL/tZO99VMN2g01P7ZxafFzfjDAdUO1d+pzdoieQ7ya7n
	VYNE3UOgFDceM0Wa8OnLeywvm1qOC3Or7ftsow51v+1i9GefChcdWUMjq/i7MuH13b7xcskPWJm
	48h9DMUHmJ9PFkDvc5dzxKM9JkKmi1pehwbhVUI2dOtPEqEPd42OseRmDALdKAg1B5KgcikBMjA
	ecFoufMn1E8IS/igT6KiNa9mT/yj
X-Received: by 2002:ac2:5687:0:b0:59e:a2d:daa1 with SMTP id
 2adb3069b0e04-59e38c03f05mr964941e87.5.1770201312534; Wed, 04 Feb 2026
 02:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20251031102020.95349-1-marco.crivellari@suse.com>
 <CAAofZF6M+87thr7KGyytcM1sqebH=U10nSNo-gmuDxeFSrkwCw@mail.gmail.com>
In-Reply-To: 
 <CAAofZF6M+87thr7KGyytcM1sqebH=U10nSNo-gmuDxeFSrkwCw@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 11:35:00 +0100
X-Gm-Features: AZwV_QhGq5526Oi3h8uHCtPNHAdKDz_sRIaZEEef097pXonwtoTLaAoklW1YP8c
Message-ID: 
 <CAAofZF74-jfGMTTOfD1MYSmoFngZRy12G4_Wv_ANHXGaor0gQA@mail.gmail.com>
Subject: Re: [PATCH 0/2] replaced old wq name,
 added WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: marco.crivellari@suse.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: Q7CTGWUUDVU5YJNGSYSCHKOR52I5XGDV
X-Message-ID-Hash: Q7CTGWUUDVU5YJNGSYSCHKOR52I5XGDV
X-Mailman-Approved-At: Wed, 04 Feb 2026 16:19:00 +0000
CC: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q7CTGWUUDVU5YJNGSYSCHKOR52I5XGDV/>
Archived-At: 
 <https://lore.freedesktop.org/CAAofZF74-jfGMTTOfD1MYSmoFngZRy12G4_Wv_ANHXGaor0gQA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi,

On Tue, Dec 2, 2025 at 2:20=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> > Marco Crivellari (2):
> >   drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
> >   drm/nouveau: WQ_PERCPU added to alloc_workqueue users
> >
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
> >  drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
> >  drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
> >  3 files changed, 4 insertions(+), 3 deletions(-)
>
> Gentle ping.

Hi,

Gentle ping. :-)

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
