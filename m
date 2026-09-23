Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67704C9830B
	for <nouveau@archiver.kernel.org>; Wed, 23 Sep 2026 20:19:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B333610F18E;
	Wed, 23 Sep 2026 20:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="kBA+8ds1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 578334862E;
	Wed, 23 Sep 2026 20:01:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790193710;
 b=t116WUagAGz3ErzmdAu5yXOR++ri+mKpAIEHnC4kvdkBruE4lklNDSTku3dlmo8N9aMfN
 zQKj48Ry9MJRYfHW+nF+tTLaZBcbJsWWMR01ppZ3mnSjMe9ocWLYmNYH9VAaB5JmU8MIy9M
 lercoeLF7upwYR6kebNJijtE06/ruYEjmgPOfIgu5bA2m4+nNgP2wlGTVaNWE4CZKQfBBIy
 xHWBN3MtfB9RuPzJvJTbDI3Uze4fY94tQaEUH6woB+MH+iLwr+Tn9IL/cAWwlvdRuFpCZqS
 aZiasiThAshsGvFX+wvp+x9AtI+cVPi7fzTjnP7/T5t0URE6yCIHEAelYmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790193710; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=L2RU3xS9583iAHdeL73lXlBipq7PbvzV0YKCYiUDPfc=;
 b=o8lo/9bJ95VTfo/W5GcTI78KuZqBE2aDnnTtQPgsUuxjBIkwHKSpBq77Y9dFcgxq4+4/o
 qgViuDPplE3E7qcUKKyj16uPCW0/YAfG3MEClgFsqpZUOGahsWusKadoCyOHLAqb7+C1h2l
 +1NBdfi9DI/oGk7d/U37LEMP6dRjsYvd8Ig3bSPHYy8AlwFafneLxmPm7bqnYca2kWCTqpJ
 iMOM9qJ/T2MZmWwU+r3wCpqXJGQTLwtT2+9sb36hKq51K4qWqneloBSi9jdaFFQQ4fjy1wf
 H+sg/9H/G0qIy+9a2kn9hgw9H8BKodwJnn3nI3ulWabGWNOhibWbTrdzt8lg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7FBE4485C4
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 20:01:47 +0000 (UTC)
Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com
 [34.2.64.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF3610E377
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 20:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790194776; bh=L2RU3xS9583iAHdeL73lXlBipq7PbvzV0YKCYiUDPfc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=kBA+8ds145xpyoGGexuE6QGDsZ0uJRuDjQrtYCB4CR+UWE4TtYUejtJ46VHALvEu/EHqeLVQL4qZZ7Lcbb379Hm0bkg5pJEqywqx41rZwdBt535ZdI7DV5Lj1z7XsprU2mywhkxH3OPxx7m0X2ccA0fmmIcR217LLFAt7bEr6gw6po4F3O0PQQlQLMbA3yUYzeVslczxd1ROizx8Rh2FpCrYLaosogMVRm/qga+GQ0xNyg4Lp2dTWE0HdHzqEKFgX/2TnzoLObSpN2wwLqB5r+52JtMY11lbxh5bMP12EJaTHeEd+8V0StRV/JeTVkpQRbSbaYhP3eGqXta1uIUmow==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790194776; bh=0ACvrvjsmNAVms9OpLg+TbYgVCSW8nI2oaYaD6Bk7gY=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=eUbBfUiPRvuRPQ8IdwkIq/MIxDMsgKrahyF+6f4OoyH79vwZYwiA64KTSbIULv93FgNQy66Mb/lmceTOM5wqIEIKNszdgoW+6bJQhtBD08tu2WyNARCY27zVMfOdcgFG0CCYuELzsJftAMbRbXxQczCPkLEDJSHHLw28tdX+8lsjzX1WnJAjt8nUEaHbiQkjJmPZbd5CK7p0qe8vWkWHh3+XGel+5RDwXmssfq+KygmnzQ4g/yz8/qbSIsywKcUNXMnRlT+ZFyqgAW9Y7mcrMOOj2VQbnC84wdYYEByXfU3FVNaZNAblTwWri2UaBAXMRGGwBGzEknuvoZk2RZCq1g==
X-YMail-OSG: tff.UZ4VM1kXiOkuzBHr5raEYJ2yZv6obEKUv9Mzsz03A8KIPjrkjZPaKpB2Bom
 552ehXfk5KBpTuXmxI.vAI_3d_Q9AmZBf1VWjpY_ZGDqSFJklrKKpUFznGitYWBfIYpn0mfQ8QDR
 TyMf6qm59QrPmexF9ALuJz7mwvusHc5mFJ0_a5EgTbf9hh2mR9Ht58x6hzDTxgseANZ3n.ZDECmo
 .FBaF269A7t7NZdTZw9moSitH1ozoPSkXALkrFC8iy0phITI8dvkcwDw3vGK54UzXb3MYouDahTT
 RR9p57qCuNFi6leBnOJpSHayoPSCdxQ3xzWviBl3PXE1ewAk_M11iV6QSL1AEA4NoYH0Z1NrqdRy
 HBfuN6w6H.SL4DUdvY0arneUw1bKtYpHLQ63fFyfmNX050uT1LJXNMLjgEcnq4OQzwFyYqaj7AWF
 lApQBj54a1uSeSVKy_zxJYf.SzDWQ4GUczCI0N7x7nflS9KosfrANHnj_rMFf_5JXT1FlAt9mxJx
 ncinAB5HBm4ri_0vCEj7uwrDxC.Xpq7JQRVdZuEKInfwhiehyaiVsflbd_LRHErum1EiqwUzJsIA
 Lebo2bkUWUNnP41sqnXG2hf09xCtMG9eX6sPhB2JjjO4zNL9WbzRg9y03ic55U10aie7drjYxXx5
 POSOIL3Poq_4zVRmBltfYcUA8SAK0bQPbAX3c.3n9mxvMPw0Beia2veHL.xwYYqhw804YKG_51vQ
 PcN0Kjni0KcPwUa.0vk0JJdQ4tsW.Np8A8BBjx9M4tdIfE9r59Yqb53cGNnzE1W5iA2oq5LbmtVx
 r9sAhBxl_f2mvV7IonQ85aWgaah9Xh8WAoih5.P7CfHqdGC6ILsPxU7Y80XZhxExp0UBScX.IqK5
 Ge23Xik4WMDtPrdblhZw91P7XTjPmNsRpa7lZzv12MfQrxeJB1q4oJOdUMixyoDfwZd2QJA70IJ_
 D.6tSuoc4PBnHd8ljVehAUmW1pMKbsFW1EJs8qwTDiJ9.Jbkuws7Yo_Vkr1x4_2BoC4qbuhravGD
 ljfQwOmpcIjZEhlPSQsbDIiGhZF6rpsfnK.gGuLZjt4YE6aNDOwxHJxm.0dDr3cHEyMEgs3dNO2h
 iv5WrAQdYi9gm.ajrBu.eIfadOeAsa6Yc7JDvZLYPOkN2lIuA9kVWGvWK.ibLHDxcQiNEkrm1zTu
 7SfS0ivBy7yhbZcQ24aLPJYWp8yAepUHdZ9W9XPHl5OfJ8q.nw56ip8twWyjpk9C69G_Fwzt69JA
 eVYqOTrnARkU4da.DeNuRjSEj1Q2Xzqwn0dpwdxzU1zBptYKufYuMr.TQB7ioJaN6kd6MiXGGLuv
 jLwbhuB0LdRMmqSdCkMqeOgSiRk6J9Lhl71ze62H5Bktp8gRwXaUlTN3on1Ke91cYZqlRTbl8zct
 usHFZcoO08Pa8DoI.MtVlAsj1n_6Mqx59aF9u4N_wqqy4mROud.yj6zFeN6Zu72T0TUqfQXuxcwI
 XluA9KAhNHXhy8yWJsOnIqfUpv1PEp191XZUK4Pm8WuqWO03oJhfsNFH6imV35iNSLmQ8zILSNNt
 VqjHyFwgTdl90.eNNFq200kVUMS3dlqrtstF2rH6gf_LSUQ6XYGsaOWE5p3AVPyxPQu0VS3TQa5_
 n37MLx9tWCOxuts2ATZNlArlQkwPki_1hWMo4HQu95K0lzdX3bf2Yh2AUVhDDwsSVzraJ_1yOgLa
 .zG4QYyLvK93oiMmpEf9XKorP2mjwNTDueDEHdf0r00P1IDfUzEoMG_XkFjSfYBLmtmd2owHvImC
 SSRFbmDWQXACnnJ2aNym6uO4B4S2BC0Uy8NGI8Qq8Iy8cyfMJMNVwYy_p7rg.WglVqPGgh39jEUv
 c5QpBKVEVLtR0nO.L5mUc1MGpPOOO.RJdIrCQ_FGCi1tXev_mBFtiCyR_OEaB4VH5EMdN3eRzY09
 SLS1vUUkGwfXw8UQIyjalG2TUpJyJJd5PR45AcDs3zFkuuN7Vfv7.ket9rVnUrx8Q3I_Oeimhr8R
 fDIvggsa3oAc_7lwu4kFN8quBYQB3qqc3
X-Sonic-MF: <Capitain_Jack@yahoo.com>
X-Sonic-ID: 3c0791d6-263d-49d9-8d65-a1734de326e1
Received: from sonic.gate.mail.ne1.yahoo.com by
 mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-102 with HTTP;
 Wed, 23 Sep 2026 20:19:36 +0000
Received: from dip102.lsn.bf1.yahoo.com ([67.195.177.111])
          by hello (SMTP) with SMTP ID 4e5488410736865d3e577fb2ea28783b;
          Wed, 23 Sep 2026 20:19:34 +0000 (UTC)
From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
To: lyude@redhat.com,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm/nouveau: HDMI output colour format and
 quantization range
Date: Wed, 23 Sep 2026 17:19:30 -0300
Message-ID: <20260923201930.1836730-1-Capitain_Jack@yahoo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <07d66ea7e0f0c7aef313b11d0881ca9170f05c77.camel@redhat.com>
References: <20260922215336.612239-1-Capitain_Jack@yahoo.com>
 <c78df20bd86437dd3987053765a550b3bac0cc65.camel@redhat.com>
 <20260923162348.1037898-1-Capitain_Jack@yahoo.com>
 <07d66ea7e0f0c7aef313b11d0881ca9170f05c77.camel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7GBCDLAJ3UF4S3NZJHAM6OK5DMX5QV3S
X-Message-ID-Hash: 7GBCDLAJ3UF4S3NZJHAM6OK5DMX5QV3S
X-MailFrom: Capitain_Jack@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7GBCDLAJ3UF4S3NZJHAM6OK5DMX5QV3S/>
Archived-At: 
 <https://lore.freedesktop.org/20260923201930.1836730-1-Capitain_Jack@yahoo.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Thank you, Lyude, for the detailed answer; it makes sense.

The bandwidth point is fair: my sink tops out at 225 MHz, so deep colour at higher resolutions was never exercised here.
I withdraw both series, this one and the HDMI Deep Color series v2.
Please treat them as a proof of concept, in the spirit of the ray tracing work, if any of it is useful.

Where can I find the other developer's work?
I would be glad to test it on my bench and report back with a Tested-by: a GA106 driving a Sony KDL-46HX855 (HDMI 1.4, Deep Color 30/36, no VCDB), including 12-bit frame-packed 3D at 222.75 MHz and full against limited range on a sink without a VCDB.

Daniel
