Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D708B606A31E
	for <nouveau@archiver.kernel.org>; Mon, 26 Oct 2026 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PkUFjQUd
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 099E010E3CB;
	Mon, 26 Oct 2026 21:14:32 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C538248BC0;
	Mon, 26 Oct 2026 20:55:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793048127;
 b=PT7Z7FuYE2yAl715CZq5MXFRALWsOOBQbHE2+V43eWzqE5MeWuPGb5Y8QKUaArGpF5+ag
 CxThxKm/LVKFAydfSxHkiRgcHrjZLm7IPEtTHvx/zarEWBjMUiOYLC7QILCjU0n/ZqnXNwS
 MI0maQVrlWFPI0UdlfAYWmTLEr5S1UEAv4sRaHglK+Ke+Sz2ac4QVLala2UpoWruJ3Ygdc/
 ji9tK9qnLxxIFOaW3KNd+quQuF8MG1PKwI5RwrYGrvmS9mEjfksCS42j4w+F80ueDg44xN1
 3K5+j7i7sJOJZtQbysYFeJ/bWe9aNGzr9x7iiELo6WssSXcw6yvKzNFon6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793048127; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
 b=ugIHrZu+/KIdNj64Dq/JFslSZkJPkOHBQQTiB1UtBKb4bLzS1IEpSwAEFm1pQKj+2dFff
 XKvva90AfP8Ano90ybQprHaKToLf1jKfbohR3mnHMcxjF377m8JdMKZHJVWub47ElFLNGUb
 vHjEgRa8WK8a+SGJKbjPHZY50y/USYnTP+ewS31zLV1EPS643ccaD7R4DiAnOx7DQVbjpg1
 f4HGtET6l28cGPEi78EAihHEqS/wz/5NI3tqWbhEPteMTo253jqIczPIuQ9QqIjeF72yHMR
 7H1hTpxQqbltIFCVI0Qmo4weuRzkCEFwqCrvT16+Mlv8Mg9a4456i1UxMWzw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7695C48BA3
	for <nouveau@lists.freedesktop.org>; Mon, 26 Oct 2026 20:55:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 785CE10E39B
	for <nouveau@lists.freedesktop.org>; Mon, 26 Oct 2026 21:14:24 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4956869750eso23322835e9.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 26 Oct 2026 14:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793049263; x=1793654063;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
        b=PkUFjQUdHIFTkXa9Ys27N2aEYpL+fuGLRzali4pVGn2Qq02iXTNEo9wc4DOHQBHjGb
         qxPoGqNzStWtiSAAZOoRS1Xjo5Gy0P0ZNAmFV4KLG2Ls5MrcuAIxBoen/WjYHjxLzY6D
         NA1AHN/cN0dGdu7d9iRiihot7K8Xglg/HHLIQpkI+mitwCKSmGvW38XR/pBqKsE7rw+3
         44/jCb/f3OVfpxTanJ3Pg4R76XJ/M9ZsjibxjyqMNMjlYqNV534SbAbag0u30l0Is9tH
         eWzEFZcgjaepYtVeeNUdyFSPcqOvDUlnUG5qtpuSbP8stKyACkFKD4U6+QsFLu7QJh6Z
         z+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049263; x=1793654063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rszKDmeyYp+Dq9ttmtnC0+XaYnbTJ3v9qyyrMyWHQC8=;
        b=JnFsoT3+oEqZdHD1Z0pdeZ7Imu0yTRtFWcm2t4neuT68xfDlF/D8Um2ZnmAAcY1KT9
         mZYCOIusZdgnEw4QQt1lQRJj4CiIFYnJ64/RUH7bO92/hzAdFh9LBVQEz4PsMTRKZBp3
         ap3++oEO8RYxS/m/l3e3KpJ9rl6KKKGIomDbvJxRPAy99OQ/C5AnDXaDiCB9hYq7ZEsx
         CUCaEG0afVq8Q73EF1RUZ7TyRWOrlLMDPLZtux1z068UOz3HdGNn7T6UAYweSr/t8PCQ
         0MUx28VqetjlAt2VTrEdParxYcdp++GcScEYIxM03UyUMVZdCK+X4xHz/QjJ4CrZwmAz
         Azuw==
X-Forwarded-Encrypted: i=1;
 AKwUvBydEnm3Rk1OoYQ/vZmSN+x78tHkw6RDn+OPUjx8Pr+E4H4uVl0ZLQ4qxDJ+1thDW3sKgasOJc76@lists.freedesktop.org
X-Gm-Message-State: AFq9FYI+T7e6u8Jzi93DCViRuk5fPkYJqL4Lmx8MlBosIUhv/2bHhoqj
	GyHCAG0WBm4qjMSD6lg72iUGmATlz3J1QSs2esB+iQdAbbx8SPzaDH7r
X-Gm-Gg: AYBFou3CWnjZRJacjvxEvCfSC+McopCIgCF0XBEaV3W3428vkFCWhgjb8pKD5A2aINg
	uPTnhEV73OigwFe76+VAiUGWMUgM9wWvsNHAYPZq1IH6L9yQbV9aV85tn3x/CSnAH2+y+Rw/4Mc
	q6slKY/K27iBgLOZAqC9m4Y3nYfPl2O6DzRyjyOuyS9R7LZ3Q4AbofbmBEfLsObAXGvJKOKKXqo
	9SP4L8sVxmwUP+xooBKSVPMwslibB0KpxmHR/3sj2MTTJzc1678Z7t7IQMY3NcO+Rx7srPWntUC
	G1jAtnR26PsmM5WHGBna8V9qzXJ+ZL2FKAy+BFev6VwRsDmsbBaqoNZugpUh/I2NE66Y76umYO2
	pVdQOHhlIwAb67mXmyfsXApxVwa5Nu836AbseDWgB1YMUR96qVCVVFvuAZ9rgP33IdjrGma+0FK
	KsXyq56geKRQ2VhK9pCUbFFCiRCz4JhLRcb6W81wFLDLCvV3O3W0ZYEMvhJwjD7YhMF49jdj6Yq
	ZxtR8d/zWhQIVkZh2gQGyZRHwyfTN+CswCGmYhAnWtQKSB4W+b9XS4fZDCPNBspfk3Y
X-Received: by 2002:a05:600c:34d5:b0:4a0:2391:6540 with SMTP id
 5b1f17b1804b1-4a35aca2b53mr133051625e9.25.1793049262694;
        Mon, 26 Oct 2026 14:14:22 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.244.30])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a08dcbfsm145886715e9.2.2026.10.26.14.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:14:20 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/clk: don't ignore RAM clock programming
 errors in nvkm_pstate_prog
Date: Mon, 26 Oct 2026 22:14:18 +0100
Message-ID: <20261026211418.351923-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260727152821.128432-1-postadelmaga@gmail.com>
References: <20260727152821.128432-1-postadelmaga@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PXO7LCC33W72AWYH6CLQ7EVL36RTDITF
X-Message-ID-Hash: PXO7LCC33W72AWYH6CLQ7EVL36RTDITF
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PXO7LCC33W72AWYH6CLQ7EVL36RTDITF/>
Archived-At: 
 <https://lore.freedesktop.org/20261026211418.351923-1-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lyude,

Gentle ping on these two.  The v3 of the cursor series is in v7.3 now,
thanks for picking it up - but these two don't show up in mainline or in
drm-misc-next, so I suspect they got lost after your review.

Both still apply on current mainline (one line of offset).  On
drm-misc-next 2/2 needs the v3 series to be there first, since its
context comes from "drm/nouveau/clk: don't use the pstate cursor after
the loop" - so either after the next backmerge, or I can rebase and
resend, whichever is less work for you.

Thanks,
Francesco
