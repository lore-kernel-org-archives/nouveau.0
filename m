Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9619FCA5FD4
	for <nouveau@archiver.kernel.org>; Fri,  2 Oct 2026 17:18:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2649810F954;
	Fri,  2 Oct 2026 17:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="BUFw3I1d";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4CB61488E1;
	Fri,  2 Oct 2026 17:00:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790960439;
 b=QfT/xdrcgkhJOVfSZ+WwngO1J7EuuyW0cC1J6wzvCCXIIxG3llNiL4TTCTwJlXptJPk/W
 zpmbkN6IApNoBr6HJObw3CxOUuXmTxJ490n2J27lr6DLZnbOysTkWuVv8bKDBKB54uswT/2
 UhCIbb8XP0heBzw/S6K87/ylYxnwvbOGELlD3HIIZhYR7c7D+j1sxCmWbSAj/5Jb+y+t0cC
 ak8CPA+mAsUx5EsUQBw3YULJrSYy2kbvl8u4bxutCHWSQwofuXkzSI4Fa7dw2MEVUv6Jaxn
 fV7T3cWHzmSt2gxykpGlXa5kST8jGsVtjHuNbqQ+mnbfHI1bkWGUccvw/l8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790960439; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/qUHNOK9yxopZORFNZ1tJgWsEmGkIZVZ/lrNPuRqIdQ=;
 b=h0vdTvBSGBE4s+ibd/vHz6o8xfwW7wZRmJb2JocooP80PQGJTOCAAJ+UsAY8p6ZC21KFY
 sLA5pX0YrHz1nC5mauuwkQa7kQ4USbIq/R1mQO5KA3N0eLqFwYSU6QPPTRjNXLd7hvpY1iA
 WMfExQwFcx1gc+bbANi/o1myEgS1Ox3t45xL8oSXSmkShUERUBMk01DRdBGW+HWFn17TmSk
 HBhzBAL2nRPS5XVEzEO+QBq0vy2C3uv/DPwsJ3YVZG0h5hBtFU390DvzZB+7KO1aBf8eR/J
 6t47y28xTFKDXjlL23K8A5be1yBAlVszBWVu/7w+/Vi4jqu/2TVYiRgqds6A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=yahoo.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=yahoo.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=yahoo.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=yahoo.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D4439488C1
	for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2026 17:00:36 +0000 (UTC)
Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com
 [34.2.64.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 65C5B10F94B
	for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2026 17:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790961526; bh=/qUHNOK9yxopZORFNZ1tJgWsEmGkIZVZ/lrNPuRqIdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=BUFw3I1dT92N6Z1iQHptdOrPPG97ArZruch3DPiUSKPIUHovGTm43vJFq6Pl60QjGj0fLZhroTYNZQonexW/CoOq2I9Te0XPG5HicLqE8UyIdlKBr6wJuLapengoy6y/IMXAJTfWfJ7SdF3Dr6hXfZ0Zu+Q7sssiCwx8hoIxNKSxjGrKjoNogCpJW5W6CK9Q37G14dQ7Le0qbu5J3VUd3J53MCWokNSCd+dBOsUnjfP8bQXz37YGALgoH6WrhlHbKIsknxkoPTI98lKOIQmUTwtjMbNj4/kFoOpWo9AQaDgueU++lbjfAf0854Pmnouc1vtsBhv7TDe3oXXcVhyWKA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790961526; bh=k9GtaYYUz5IPt/XND5UbyEfiqKqSJdppZar9gENGkeg=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=XpzNctzlJr+89I/2Wjeg+ehIzDUDPVOhRy/8YUuj0JE6Ps2uh2qHl9AU+7JIM8ay1cc6ocMSPjkcm4qVmLsvstEYOn4Ma2Io+ZeejieWutb72zQDAg8sWrGn2rWcYLJ60g4RPfbaBeGaeFOXSfuwJKlO1jxXwGiVDPd1Honj7Po/bRbPtfXYxRcq3+k5PgZQAAvbvmSvLBgB/vc2y2PSwusUgtxmcPx8qviZfb8CuhWx6MJOfgpwCzvNzhC3UJ6RnSTmEn0ST0u/NZnxt8rlOAcr1Qu2WsTTKGrbcP47NrKq9m12MMow34ZYeWOACMmwcNtxZ03AixpG8TE7expVBw==
X-YMail-OSG: c6M07hMVM1kOhXWn_S6kgVZqw4qxpUefO7jh3Oy.GVQSI_BkFt7UGrxeAXCpGJR
 h7xgPA6r1A_MQiVevb7xX4Zojo8DDPJirbvPq5gEM3Xzu7R4S__f1ftYkkx4X0w7iqGGBkZM5u7e
 U4yr9I2YF_4yfG74krqviIYDMeoMXxkT6FjnXB7.YNaXznjJmNrCez6MwF98S5yERk6J3WdLuZfs
 n23p27xYBmovl4_q_GyCi_Px8aLg0ZKJ0dyfa6TOwMvkIG7noaLooXFXXMCYSTwow8D4rx5HmXOh
 OD0Y5qpIzTfGF5NJzocXFFL86q8.gJ4EwQ_WHy_LZsxU.1xOCGzilxKK4QGqH5VaSd0qEe29ZA.4
 aUt04u7K0JKzde4XXgWISZksQPqhzqgWMNmw8wngWK04of3r5DjYrgf4uudHM2ciz6iYm1YHnC5e
 ASrfdpIWmodBl.Z7nDa881dT_gmhvvZy3.sE3BlNUnSdRXzoHHtmGVw5iaSHYn7mA7VMni3HRpP1
 Wz7De6G_ZtObnKQXifZLgy4bFFZBjcPB82r0o7IVQ0Ic66EGc8AHUPHX21uN1bgaSC79E88lxykl
 ID0NUQ6auHfCulEoQ9TH7AqC4bqroa01YVx.xYN2Ta_RiqpOqH8PvSp555iwL11KdhSo8I0e5TUk
 uzn0SZfvOgIUjr6QDzrTrEJq.0v6uahlY898CM9shbWd8eLJegzE_JqKOgJm1UsKfTFKRrb1_iv3
 5u5X5X6utj609ETNDV_KX6IzEGVL2YcPuJ4Szw2x_4H7ZcZAnpYdMmh6nvx6mrMSq9SB.1di5cEz
 iKyIVjjtgyCp.U1obFGUAibNBvRYasHa4Q3hAd5eH8EgVT2zWOMwI9jBpZi4tPGyNr53oCp64YTg
 qzcUf63pe1dCADnbKgevJ7QN_rHRSHrbDjeQa8Ho0I7TsPIaUdNdqma58vISusvM_nmsDFbPQSbe
 bcRxm_wsQMXH1wF741jDOQwj3H9rM93xA4f78DkJT37TwqzXiFxEt9aKCAy3h8guufzbJAL.CRkc
 mG21H4G8srXPcmNsoiL0WTxO9UtJKY0zWJkygg7gi_v0vsMha9I1.b44.00ABJJp8PkgUfRWieud
 pfO6FKxD92hShOIUu2y6H41uo0aFEujeS8BnK7sP5QOlNtuDpiCI0r6EqO3w93NVq8YNfi7HhdwA
 .vfZjzvxsIU5SlANaxnz3SY_q8PZTTeQK_79.dRlnQS6MEyUYTH87f.mre5cSSNmvZs9Nh4.QKtU
 AtpPEAwAQI3URzkAn3XZWWpJKDi65pp0afnXJfkIW9nplvx4GMWxDQ7uym0JFHAU7yqY3FUvbFeF
 KH__j_b_sEI5tJYcDfpCIM36f1U1dg1bnfZXJT_1YicQdPIkJBXU5l7LtmmvoKXolqVBw.BuqPbI
 pVX88Y1.damYoKP9VVnxdLubXXZLlqSMR9BEd_DF_URh5UpBlF9xD90H4l_F3s6MYYNWkGw5ubGY
 RQAE7yjgZeKS.Roxo.xtK4LUZraF0xOqMV7QhWLOXZbparjkzvp.hp5HxoYDJ1KeOWOCEN0j1tB4
 C7DXiBz.t0eAWp5Z999hmmT8VxiTyttS52XdMOqBw34ZcHbFn328C8cxkzvMhtB1DQGv50BM7oM4
 ybWGoA0wTNO.iwIRg4qRyeeWYprQ2HO5AUCIrOjUBGPNiriZKLXjqNn8vQC37XI2XyHOW7gnI9hW
 mTySX.xbX5mh5VVkiNmL.zKnId4nbshHXyF9LN3yBy3LIQ5CiaYKB4.SBUriv5dmmYwMgBWKzK0u
 tQVlvKXLrFS2F6PBgKGWfsfSGSwUIhE2A5QE3C8OUB1dDlhjNKFaMbQSLSl5D49TH6lHEf7B.GIK
 NqL1ZBZOij8L7F32bE13MCoRj9VCOU3F6btSe74X97uz.qDrQqq72DAcnkXsqZo7yw35bcjI9Z6B
 KN_GYk6VlgwVsE_s8wbrjTTymL2eLx1F524.NTlyZGsTTL_8yc9L2yW2LfMipsI5rMjdOZ38qLL7
 kZGuy3j53omD.wHDC6hPNK9HjhegaEoH2x1R.
X-Sonic-MF: <Capitain_Jack@yahoo.com>
X-Sonic-ID: 44f43abe-1d8f-491e-8721-fef69cea284d
Received: from sonic.gate.mail.ne1.yahoo.com by
 mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-102 with HTTP;
 Fri, 2 Oct 2026 17:18:46 +0000
Received: from dip117.lsn.bf1.yahoo.com ([67.195.177.126])
          by hello (SMTP) with SMTP ID f4c847716543b17220b197b5028b5c41;
          Fri, 02 Oct 2026 17:18:43 +0000 (UTC)
From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
To: Zhenhao Wan <whi4ed0g@gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: prevent NULL deref of gr in
 GETPARAM_GRAPH_UNITS
Date: Fri,  2 Oct 2026 14:18:32 -0300
Message-ID: <20261002171838.282505-1-Capitain_Jack@yahoo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-2-7e057f6aeba0@gmail.com>
References: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-2-7e057f6aeba0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I22EYESI4WOPVJI2UDSU2USLMAYRS7MK
X-Message-ID-Hash: I22EYESI4WOPVJI2UDSU2USLMAYRS7MK
X-MailFrom: Capitain_Jack@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/I22EYESI4WOPVJI2UDSU2USLMAYRS7MK/>
Archived-At: 
 <https://lore.freedesktop.org/20261002171838.282505-1-Capitain_Jack@yahoo.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Zhenhao,

Tested on an RTX 3060 (GA106) under nouveau without
firmware-nvidia-gsp, kernel 7.3-rc1.
Together with Jim Cromie's GET_ZCULL_INFO fix, this removes the second
oops (nvkm_gr_units+0x9) that kills kwin_wayland when NVK starts.
KWin then composites, and NVK refuses the device cleanly.
Details in my reply to Jim's patch.

Tested-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>

Daniel
