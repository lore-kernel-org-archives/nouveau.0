Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC967C982FA
	for <nouveau@archiver.kernel.org>; Wed, 23 Sep 2026 01:25:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF0F10EEE6;
	Wed, 23 Sep 2026 01:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="PZof6QkN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 093C448534;
	Wed, 23 Sep 2026 01:07:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790125654;
 b=AebsQgAbJspscje54+S56NRhudq3S9Tb+nSAhChM/xkBz/lV7KlnRqGY6tF2Ve2Dy5Xaw
 GMBRdHFPoWijSF7iS85U2KcouTCBsYYHPxbY8tAMFsYJpPYnRIxuZOhVhR3oY+Z8BEFUL8B
 rPnP8nfOc/SNwGT3UOIoobsdza1Q8HUOlBclw+PYdP913wREZvEb5EDLclDlQxQXsQ3XD7T
 DMorpmzYYDxlarotS8YnuFL5kY+I5UdZ26b/3ZM4RYt/UiTsVgpL32IWfeVoLsxKp6/Xqip
 UokI4S0TKJc/RXSpsR706DsaP7RE/CJua4vkdKVNnWC6B6EegedV8dKHndAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790125654; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+r8yPFqL5aIhm/SxqAziLA06xIGTqZPDmQKrBhgzqs4=;
 b=uWyFi+I8BwbTtGzn91mHboipe4L3cBmlUzLXvBEmETrKLzA7rTtUjo73ZAzgIoCch1hrE
 NA8PjDzh1iQ+LUvTomcu6+SbFz/DCQNV1sW6ZMjhhzf65Ha5hlJzA7dpcGCF+2Kj+JSzpz0
 8OFFz9J1spjlg7EYfiUKp0gD1SgUofqNxdXG3kzziPT1C2k/tmRZFIRuDCrJ4nBRubXc2xM
 YxxX9KOOnBR3IJgX06M9HG2/v37Z4f90nszvkDPMtvIypfStNGmUILgDnVF0k8aZHZfyQ84
 KxVOIf1i0MbZdmiI5+52WtugKFw2yrrBqFVpMw87s8ozupTJ9ocaDcP7W0vw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5CE3E48507
	for <nouveau@lists.freedesktop.org>; Tue, 22 Sep 2026 22:08:37 +0000 (UTC)
Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com
 [34.2.64.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 470DA10E775
	for <nouveau@lists.freedesktop.org>; Tue, 22 Sep 2026 22:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790115985; bh=+r8yPFqL5aIhm/SxqAziLA06xIGTqZPDmQKrBhgzqs4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=PZof6QkNixvGB0paHnh9riarLJf4S+CedYw1L8ZhSWZy5bATChMroB1cWK3ri9Ixcr/Afujqdx6XNOwcAmkyFgXaVblEV8A6fxYy/8cXjojCUuV4QwdiR0TovlbLwHsKxSYhbUee1c5quo5oUi0lXJ/MrKu2/XEGmwHMlq7UzOiSu3kDv4/3wBgfwE9RTh7bRvAJtYRn0Nxm52WzIK9nqg4tsH7KR4nLk0VY67O7YFdynCdIp4T8l9g1Tog9zJ5rrkmXtmZkXiLakJNoti3O3vSAGgUy14o8P3NFUFJGphYBHQpWLZaw4i9kR8rulOYumrKI/EqG5iEsnbbvZTOFJA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790115985; bh=Kj/JqCUSxXeX/US6vLPCl378HZ7jGUwe2C+cvJAJzmK=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=YMBduTsgzNQS8K0kygubpfJX/3DJYSjOlb5W3pGJb8eR8zbBOjimv+st5/RUiV4DHq+ZFeF4a/J01tG6JPV9qt0+Ykg4CjYGD0PyhDKTpiq1mHCmOwBUv8hTm55CR2tw1knpvN2W47nh/guqSHWyK82WIOGNklUPPCGXphJbe7QBhsW/CeqYBHWQmIcT9rqQRs3WDail78LHnNtiDyJ2841XMQFkzw8/Yqo41mQ9xSbNozXetTNjcA+2cn0ry0t7u7uQqiRXogRW3jflc3z1PsSvJa/Gd1qeVAWP0SICZhtWFS4dLQOzW8lcpHvAKDMTqyqO66Vg7d1KGj9T5Wn1xQ==
X-YMail-OSG: XYQ4_TgVM1mxt90gm0Z_zcWMtHA4LaksYibw0c3i_yt3YmbOf9XbRCJWWAAe0Yz
 i6Q9uTXX49F0s311Kq8W6ASToGnUg.wmfHFP.F_b5PpvvmsxWvjiJtMBP5j9gbyztFd3DJ8YKYrT
 GUrHUX2wMdem7Kl8fh0MdGq6epoAImiEFRMBqXpfCEDPwUBAorsDZts15zjAYzq1dRhzMyZSNJx0
 70ZokSmFYEEMQHv8B5QvFb9bKOXA0JJLxt0tNJIN6JkaqJ40P3peY2mE6eN6NU_wj1mPHMSod698
 nHCAQak2En57wSdgVWVE52Gl.y43B_qVySLg5QeaEoGkkVHmgBDIMkge0qd4Eja_mFBodWLtbkuZ
 duV37f3DH4kdbSxatWr7d3gFFtbpbU2BEIuz3PHtQsValpfIYcKH5T_u1t1S5znQQIsPK62AyVvZ
 LEz5Sl9KwJSmmufGv0dd0B36sqRgYAlvDGlLHYWqInexkmVLqDWQMgR5Dv7G0BjA1Pe330ptPuLr
 uMwRu.i.ePDdyUxzC56RcSSaB6e6fYj5S6Y4172hGuNarp2CJtUGtWUWx161sj.Dv93ENRwLN8qn
 Z3aRNVvAfe9VZJOKHoz7jCy1k.HkwDbQ_Y1Gsx6VjUeK9Xowjr_90qIm5BVT_Dlu5DjkoDQY4a70
 xAopcOkxwgql59w3woW4uhPCY6TDfrMRmr5Hf9o1DXxc5k02s8iJ6PH8LTvvDpfkCYapB1E8RHQc
 wWkoF9Yw3VBu291c.TbJ6RU2EP4WAwM4agqS10MfyXyq1XKAd7tSwwVONN.v2izbem4b8WTvAFqu
 6aRu_6X4So99UdspvZGWwXw_RdQSPxtoL1qHZkG.EfveAwbHQbhcUCn8U9yA7IvxeQgzhfs_eiaX
 O_L5WETvoG0U0LN2l0HpcKxA1puAWhO5vZVwuOB1BG5tgOvbCtw9Bmwlcvd8unVD8uj33kENlqHX
 Jx2s9hZpAgRjZVJQuomU2pDLJV45nCR2G_LP2FQkBoPr7YKqZOGScMiuElq.OKQ1uGQOQzx22Ojc
 jymZiU2VsQI3M7GsT8RtAXym.4jj1xx5VaMAjFUOizS3rFISCYI9z5r7Hdz2vC5ZIIcmQrJYx0hb
 bKuAKjwIdz08aOSaJvNAOevH7Ga4egserQ_W4R6BO3IWqYXukRYLzO2rc0no7TwcNqFHJOEiElkc
 e20I7oS3sI3eLMobtQGTZHXmoXnHyA4BW8vO5v7S2Zkfxl1DQH2Pm0bgILYQJK.YUS.ETEwFV38i
 l6UT9zO33dEgurdavUp3AkgB6Ew2iSlMEgPGHnX9ISNJR5P9KOoU0EXEEXhuv6PmHX9ZLJ7wH9ll
 Uyf3x83E_3BX6rUYecG3_VnNdsMwaOH4yqJuLJKYB..HyBRhzl882QiVSjoR5AVqiMQH6mrwaK0j
 sFmeUWS5xU1LM54XQfn5yTqPiG0O5DlKuJFth52lXsYSoup8W3CQeS57cBIF4qerwwqdiN5WJ.vZ
 riMjFnUAWka7kwYckgWYFn4P.1e4ndIudUIG5atBLh12UkgQrMMxyxDrCGuU39eGeJ4U6iAMiGq2
 cM_XlXzyclFY8b2bSC4UWfYPLNAJkzpGAVgMzonMy0ixi1_Zno7nC9iOOC2rMWKcgmpR53ulxkhv
 vLlq8RP2JbkV4ugA.to_eE.iBAtHUuZMsBRvTpb5pXGyDbciQ4NC31jN4nUGAWXHP5IhKVHA72y9
 ZR.J3xhDbJ4dj79pEUg3EBpmmz6Eivs3Ce4efaboa5t0J.DpCoX5.GV_0se0rKeRrOJmbWi58RWA
 CKHu6de2TF5HWw7KR85zL2kq4sS1nQzFYNLVTd0G1EwmXYVk08HZ7D11VfBxOcU_dv1W_v7yOoed
 .SJIng1llHnHKQFi5rZB4bU1yybHKQxB9DVtVYIxhLRhqg5OQ2TQMu.S4WqrxMmch1cRGVVuEJOz
 4It8hCR.ts4PaMEf0yeWQ7VhECtMWvibxGCEPJyIZyExsb69qGxCVKY7ifLEadNvG7v.SI0kawPc
 JA4EhTbvsQIXPZgOEBhLb98.N3sqs.Hw-
X-Sonic-MF: <Capitain_Jack@yahoo.com>
X-Sonic-ID: b0dbab7f-a6e5-49ee-9833-57582a32675a
Received: from sonic.gate.mail.ne1.yahoo.com by
 mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-102 with HTTP;
 Tue, 22 Sep 2026 22:26:25 +0000
Received: from dip84.lsn.bf1.yahoo.com ([67.195.177.93])
          by hello (SMTP) with SMTP ID 0cd2206dbccef9b797cd29a89bceac90;
          Tue, 22 Sep 2026 22:26:22 +0000 (UTC)
From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 1/3] drm/nouveau: select HDMI deep-color link depth
Date: Tue, 22 Sep 2026 19:26:18 -0300
Message-ID: <20260922222618.709711-1-Capitain_Jack@yahoo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922193903.DE3BB1F000FF@smtp.kernel.org>
References: <20260922192132.114546-1-Capitain_Jack@yahoo.com>
 <20260922192132.114546-2-Capitain_Jack@yahoo.com>
 <20260922193903.DE3BB1F000FF@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: Capitain_Jack@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: JUN26R6P3LGSBBYNJLOUMTYMQF3CLWBX
X-Message-ID-Hash: JUN26R6P3LGSBBYNJLOUMTYMQF3CLWBX
X-Mailman-Approved-At: Wed, 23 Sep 2026 01:07:32 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dakr@kernel.org, Daniel Campos Ramos <Capitain_Jack@yahoo.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JUN26R6P3LGSBBYNJLOUMTYMQF3CLWBX/>
Archived-At: 
 <https://lore.freedesktop.org/20260922222618.709711-1-Capitain_Jack@yahoo.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Thank you, this one was right, and it helped.
The SCDC gate half was already fixed in v2, but the second half was not: v2 still passes the pixel clock as khz to nvif_outp_hdmi().
On GSP boards that value is ignored, which is why our GA106 bench never showed it, and why the v2 cover letter's claim that the pixel clock is correct there only holds for GSP.
Without GSP, gm200_sor_hdmi_scdc() derives tmds.high_speed from it, and that sets the SOR scrambler, the 1/40 clock ratio and the clock divider.
So when Deep Color pushes the character rate past 340 MHz while the pixel clock stays under it, v2 would tell the sink to scramble at 1/40 while the SOR stays at 1/10.
The next revision passes the TMDS character rate there; it is ready, and will go out once the maintainers have had a chance to look at v2.
The max bpc attach on DVI connectors is handled in the colour format series, where patch 6 closes this report.

AI partners were leveraged in the production of this work.

Daniel
