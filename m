Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E0BC9830B
	for <nouveau@archiver.kernel.org>; Wed, 23 Sep 2026 01:25:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 461FD10EF0F;
	Wed, 23 Sep 2026 01:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="KM/kjqE9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B1FAF4854D;
	Wed, 23 Sep 2026 01:07:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790125673;
 b=fhGmZPPL0MPEpLZtPkh82LHf8fQK7L0IR0MqUjlUKi10RxXz0loHDKvBbGEVQh9WISnc4
 PuKMVUM8ioJUKkWsaLpylJkU5lYAUyfsMa18NvKGdTpU5stP50xw5DDqzQFx9F98HQiwy7K
 zQdY/py12MZoEjYEgZvbMioqQfcOONISdseG/TjiRybGPnJxtIbBydhY8CY1zv6y1VrOy2+
 V+/dFFc9JDJmcPq9gIHdgNB7u0iHMJQWIIu0UUTByDjHlskuQlMaseAtu8arTzsSijefNtR
 otN8q0liTMIqhySgvuItYEQ1JAQLrjfUZLigFrUGRBM0i5HQKu1AUFzRoMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790125673; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WcJByba6MyvV/TMFfCQD/Jr6A3Ty5Jk0RdTpSOqmFVU=;
 b=buz3ZJU2uUcVDwPd6HBK8cp4KiUsnpgIWxk+8y48thSHVTOydH/DMmcozPQpE4NEsz2tE
 2DxDH+i2/aNq2FWaIn7cgOwcPSRrUciSwzhXfsqinRWC7EGd9l9/JfiqIrpqneWesP7KJrj
 t47s8fo5/HGCCqMJbzrZPj1s/TzSPJCMJYkxTZQB5LfiiBIRU4/rkcU2iT6IUQziWjIndSP
 8Ecwj1cot93rE6Gx5wxffEWRolKXNNxFxaycH9JC1PkzOtZnFqWIjE+aO14garwLuhXcn7A
 F7wzYz4d0m6v4oAWq4t2WrsR8M6emKzkva0RbXRrtzilRIYoMHGXcgHypD1A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CE7CB48505
	for <nouveau@lists.freedesktop.org>; Tue, 22 Sep 2026 21:49:44 +0000 (UTC)
Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com
 [34.2.64.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B57F910E17E
	for <nouveau@lists.freedesktop.org>; Tue, 22 Sep 2026 22:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790114852; bh=WcJByba6MyvV/TMFfCQD/Jr6A3Ty5Jk0RdTpSOqmFVU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=KM/kjqE9IOhoot8ZEO4Z83HeEBAYnD6qyai/Fl3KUrHgIhzuJqsNHr9MVmGVdFFk6uAV2kouTHNnwSLq83LeRybuvy9U+OFo7yPjdFC46qg/EEALJq6oosZd1OwpZsKgRrBIU359UbFFFOkp0Ry6TbH6rvgViYStpBheW9rZUAH+4EiRrl/LXL3vndX1gK2W6gQl4kUTsrj+P123UVWHC1eI5FLcbPm87QJuFSHcxesSOdUu1SfhxsWPeJ8ZFysC1TWSLFAzFcp7B3Twt05bZRxBJO3QXdlE78U1PuIXxH6qPjVtshfrcmhjzOrlTCaR+yo7Ohksnzv4cR3NTha2lA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790114852; bh=i3COsfOeBxY4kPti/yYCYAGBNXBux/ADzQHKRtYyuQC=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=hq7zXsBvUIWlWZfl3HV5gxVBEF0Sej279EEqHqkAyhomxx7XXZZ1cNjbpG8BX6DycZU9eVgPkZa5yEwlBXSjMomRAAFC7mmk/Shelx4v3GHRZdmHHsbuR1RxBcdpex5wdHGMVUIQmEHH2KdfMs/l5iHMbPqaNqxipSiabpJPRFcAvMGoBSy8lnCyil1T4ba+rBDLGYy/00W7KxWsqzVP4DPd8T43WrA/HugwbOMO/i8F5UF9YrYwS81H8iq58v8EjEYbj2d/Dfc6TMASBrJC2CCUDAID+wGVIVx4tsJ7YapDTRBTj2HmkOI1biACxm+esaW5jC7TDHnreIQ1WXQAjQ==
X-YMail-OSG: ECHyt.8VM1lfiAHC5JWaGuvxjctgNxEwdb0z2QEfQ3PQ_vHPcGi9ELaI.kT5ZoA
 jzHb7GnIkQB_6LGhFkH4o63iz.O5AQQhwOmCixYGO4m63BAEQEJx.CvxC4rSR8gYuSwPNKDgm6o8
 JHgYmoslcCSBt0EfMOKJyINYm0I2NRIm_dqI0cziw1_gNasH112UTzRwilbXBo61Pf4xCmHMJ1mf
 HsZEEA3SY2SNKOFOx.pOzwWKXqe.E.Li.guSzYeDrizc3BPLEt3KLbsOqSLbv7tYwv4itakoWuPZ
 1Y4lq1qQiPiNq5S3ijGnerzJdTc2bAOQuXZw9Jsn7_8hkWveyiwEKtKjPD_3YQR0ClVCy8JZuhX2
 XFTWIrxx6UKKO_EJ0FFE_RWFIXWr2d1aj0o5dli2_fB950zdvb3HBuCHF59nMMiytdThVJVuZzqi
 6_mi8DMflib_ZyP5owRw293SRFSHAMkRuWJX8WTNApS.ukcQHD_4ZbSb8i2_zBTV4EKf6KNqZxYu
 NFrdTrkN4gJDW3OqVw8u7Z_YgGGD9Dnv5Ia6GZiPkPtLcn0dB0F4fDEJdcbI51X4wrmLrVQmn3D3
 VAR77I1c2Al.5Prh7qjiornaNiM_HgsoymU2U1CKMASsETKpXx1D6fnQsGULhwKhUjkGvNqbMpBu
 7diXSPVxQOZthRsJK.StxMJ0gpTwWIZNThsA3sOlfHlvrax4uE86yMJ_Dv3_xv7wBAvy_ONGsQAz
 IQBjI2Lnrw7ds63_yW77pfQ.DZ3V2W.0W40ZjG60W1x._5iN0eRGbsyFBQKgbiFczVEkPcykFRpc
 4TmQh6XlUQS230sK0IycRmSE88HijIK0dWIH44.sSuLjdMyk9B8gqng2YF3c0Wa_E4R8XHHc32oW
 K5Dk0fn5zQZstQ1lZlduBGKsLVFaGnWZBL7bnh1jQHgBiHnW1tzKEcWDDNNyU0CXLfxxhV3sCL2C
 yYcjKZOcFgTL02W2KOdTFUCRRPRINryyzLBbYd1ysDtJpRqKCUrIIR_PqyIqhY5_gQTyeRXfdCCr
 hhKDqecfpQ0XVSVb9qwS8HT6QoQZlMI.wzH9EwuQW6LlXUh6AFZ9Yf.x7A8yZhp9xXiEp0ax20CL
 .tB.Fd2tPu9nq89rhC_eGVOYbcglBXxh99yjqm8zs.JCTXylzOYCOe9ubcdcjK9RIxxd_UCuwRpS
 EHIbC0T3.d9W_77YCpX0RVH9OzHfEuK3dWopTU5GmR9z_eOE6OFnN7A9oOtqWPa9Omj1Kkgw_8sd
 49w9a._n.RQrCbeQoT10ltDeoORTrlced0pZycSsokqPzat2Heubhn_dRhfYK386hFpTxkdriWR8
 eLPXJ9BWWHnoTWAHGKZcPsIC3zUs13R_wm._bsYwVaw.ewkOFWXQ7VlL8ZUlkKygkkCkww0uMBJx
 QOr6uG4O1revldpl2D7NtMcYt1gufi4Q.DZtk3aeAmHV9M6VHe8dfwRG.qjGOcNBCkcrPS_tH8TJ
 CpA.nccaJ5fmFZumJYc3PA8hcN2WeMNMBF3a4n8KQrYIZMA0YKKM.6qQbwugY5CZ5CWH9GE75D6q
 5LAujUtqYgJifBRH9LUljeUlc4ZgcoKmg0II525kH.2if5TixO2y.A_anhWwrO.1cGR9bfnjqFtq
 TnmKxdW4Q3UZtQ2_7bPls_1h0BOo3eOoClpHBVPWFkZe5ZbA0bspmoT1LUxguMKRiDnnxQBadz85
 KiSNWqsj5iZ5n86pm7Pf6ZpGl__FOFBEkPWPnl2hteEI_SQz8aBD6Hvq9KEw7cjiiW387LSlgk.g
 4L4Jes9p0YbO3czV9a7np1zLHfse5KiQiku_qwIaBU_A7JyybGOGUttVHpDx_zE6anuBtxd_suIh
 _6X9IN6EmVFCZUohITBsSyp8K_1jMa2byOV8DOCKCgNRESpbM.7yCC2zSOUNx_kw3s06YIn.DF0s
 9Oyj6dMIew.75QUbb6yz_5hzfpy8zOjMgx3YSTRYVdnoJ3CO0W.hWV0TL9VSFWobRSc6PhKit2bs
 GjTeTB9YMao2yYLFAMNjnoixt_kdj3yvx
X-Sonic-MF: <Capitain_Jack@yahoo.com>
X-Sonic-ID: d920672e-8c60-4fe1-9539-3d051986dd61
Received: from sonic.gate.mail.ne1.yahoo.com by
 mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-102 with HTTP;
 Tue, 22 Sep 2026 22:07:32 +0000
Received: from dip109.lsn.bf1.yahoo.com ([67.195.177.118])
          by hello (SMTP) with SMTP ID ea3c48c2031bb6baacfd54f3becdc753;
          Tue, 22 Sep 2026 22:07:27 +0000 (UTC)
From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/3] drm/nouveau: HDMI Deep Color link depth (30/36/48
 bpp)
Date: Tue, 22 Sep 2026 19:07:23 -0300
Message-ID: <20260922220723.649977-1-Capitain_Jack@yahoo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922192132.114546-1-Capitain_Jack@yahoo.com>
References: <20260922192132.114546-1-Capitain_Jack@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: Capitain_Jack@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: MDRPC67Q27XLDL4D7FHFRBFGF32A5GE5
X-Message-ID-Hash: MDRPC67Q27XLDL4D7FHFRBFGF32A5GE5
X-Mailman-Approved-At: Wed, 23 Sep 2026 01:07:46 +0000
CC: nouveau@lists.freedesktop.org, dakr@kernel.org,
 Daniel Campos Ramos <Capitain_Jack@yahoo.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MDRPC67Q27XLDL4D7FHFRBFGF32A5GE5/>
Archived-At: 
 <https://lore.freedesktop.org/20260922220723.649977-1-Capitain_Jack@yahoo.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

None of these compliance gaps were introduced by the series; they were already there, and the series exists to patch exactly that.
Before it, nouveau sent 8-bpc output with a depth-less GCP to sinks declaring Deep Color, and full-range RGB on CE formats without signalling it.
The SCDC gate compared the pixel clock because, without Deep Color, the pixel clock was the character rate; the series made that no longer true, so v2 gates on the character rate.
The missing 30-bpp GCP arm was v1 not yet covering the whole gap: it followed NVIDIA's own reference rule, which only declares 36 bpp. v2 encodes 30, 36 and 48 bpp per HDMI 1.4b 6.5.3, and the 10-bit path is now bench-tested on the same sink.
The HDMI-A-only attach is closed in the follow-on colour format series, which also brings limited-range RGB and YCbCr.
Our own bench logs found one more, frame packing rated at the per-eye clock, and v2 fixes that too.
The current implementation is the one breaking the HDMI specs; we're attempting to medicine that disease.

v2: https://lore.kernel.org/dri-devel/20260922215317.611388-1-Capitain_Jack@yahoo.com/
Colour format series: https://lore.kernel.org/dri-devel/20260922215336.612239-1-Capitain_Jack@yahoo.com/

AI partners were leveraged in the production of this work.

Daniel
