Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165EBCA6015
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 16:07:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFF410E96F;
	Fri,  9 Oct 2026 16:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="QRAuiJDF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 598FC489F1;
	Fri,  9 Oct 2026 15:48:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791560920;
 b=TgV/M7XwGCVyuzPBmumnGZrRG/H9OIYkcxF+p1v5Qj2bD1q6Ii73EvaSDp3qakPnzU0fG
 3iRJ2324Wr9E2AgoUrYahjFUOXSyLotfcRBdeEE4WT32MXSSbPZRrLTITY/gntvCkaYlaKM
 Kanzun3EG55evMobRkwdz+M2gv+LXLZeC/nQLqbHSe09LTHSeVE3q8aw1uWMX5R9JmVFPm+
 ttdA0phazn7ueBBKO/q2mSj9ST+HEXQqUpXhwsMBh+MwzZkqnjLGjQiSH4wzZ+cUqT56DnP
 LTngWC0g4AM/6cmT+rtGyejhqsx14HF7p6Tj8zPmRHSYQrQmvpYzmvUyZHkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791560920; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=B2M4pGowMZiEyJl8E8cgedKxn75FQRUSPovlkwJbu5w=;
 b=HDOdHbJYNRrvF4LOqZ+oSbGspkJF3wjZLAnQX2D/S8zmM6yvqXVp9eTiFqBOAWPp4949J
 WCU6hUW07b0gbgcb+U1BIfNlkOr3ilpVH36pciEqoklHNxTFijZq/PUaM60CAQdHKJW0Ils
 IZMW7zGp+fVXhYCMAN0x8oLGhx6zcOECNUV4n+zxpDtQls5rLwhPro7f2mcCyYp5Ue/u/31
 XgahaVG6QGg5CxKRjfiUf6qGtnnHlTB4kv0ZJVVZBuY3aQqdmqnAXNFjPZ3gTae06D7zy5q
 fO2nmsa/DSoxafEpsZxVKaWUHuMzuT7BzkTwLtKZFK9LWs4xTYgs6HVl1DoA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5300C48299
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 15:48:38 +0000 (UTC)
Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com
 [34.2.64.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16C8510E04F
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1791562022; bh=B2M4pGowMZiEyJl8E8cgedKxn75FQRUSPovlkwJbu5w=;
 h=From:To:Subject:Date:References:From:Subject:Reply-To;
 b=QRAuiJDFugOdGLO5fnJ6exci+SuJ8b+gp2H5i2AckQc4FszvC+n1YHNS3eas0s3/6drEiPW1gYM5PgWsRjofTikbCWhN6CGw04fUibXUdwpnIxDXlBUGkWK14l9+0/HTO1XRte2nG1GXRVG4ckh4CZQ4bZyvm/lVUQmGG2QKCMoSH6phLiJ/sTOhB3WC1EJzssE//CX/hWI8er3VOuSyZibUby1wojSp+gGBpP7nDm+/mqUBuQkbvwcZ22zIqXjrQeKI7Ab78HyWy/YKq3yAl/kEi/4jLtSmzs3h1WwlAB68P906VF7GuQ7Xd50UoB5UL1WYwRSUw242bxGsO1KIDQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1791562022; bh=gq2N8UiYg2Lf4cwxDDzCoex1lRdV68y6QSVeqjBGX4v=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=S5EaHtum/Rqf+K0oxIPESth7jjO6OVaVbKVgT0g4VJ29Kw1UKBQw8Jn5iCup5Ie5X22cK8Xn51EfbrM/cWKkO4No7SearR9csscyqMZg/UBC1VADLJ3rplfAnd25mr/x9W1PdHZcwPNsKUxc6Ke96iYSmAg9nvQ1XxJ8xnxMZCt6UtloqswFKuBljdB0WHE2yO2YeCQ4vzaqWzKOGJw0TQKeDoR2/vUb4aT8U1lgKSAFOm5+ILF7x0F5GUCo5a1xHuixKot0V5JMZDDE6C4ENi7LOr2SrcXWDycwJ+1hQFgGLp6B8BJcslBJ5YKb8G+Fpin079ICEhfUC6UnAxja6Q==
X-YMail-OSG: nEWl4m8VM1lSBUe0P.YgETElkIf0cef.lQ6VFP8_1C3ZM6KGYse0kpd_l0o4qDF
 IX1g11mLIKNftQQxYeH_BgPkyWrqdu3TJuB_ExIdvbfqj7U8yXGP66bf0g4KuQe6nG6F5qe1lLeV
 HLkzPpXaRIkMJZkSy3QBj22xQtmIfm8SBZ4dlghuPx32KqHl6za_RnQ9AzCkrbnAGKTXWzl.WZPb
 0ucynqLR1BprsUNimerA1myHPimiLKDJm_29.KmJJlbogfZx2q7St.VNMtYdN89PvaoSbimOJtiq
 1ieVaoIDg5U7PLfrwDcD3yS57SaFGWqCjVUkQ9SLo_CzOacKxRWeNFAdFPxBw6BVxFF4GwbNRTLP
 _xlyTg0I1Fuq8jo4VUo.QhK5G9mcCtpHohZKL3ohYzGCAy.uBGqYn3Z00PGXgpHsX7Dk9sj4HiUN
 D670aZvuQX4MzYpUrybvm7m_Pgmr1zE4jpSlT64HTi4dZvCSc42aKb1.IiZtDaUIvUjeurzaBqBt
 ltX9zg0swBVANWbLld63J8BBapWWn7_gqap3n1bcsle4457fEvDI6ImQG1Sqhd4ndzu9NrsgGfez
 ZDmpJE1EgyLqAW.0poN8O95FYTBcGl9BtkLbmHMeGtKqwjAm9IvOm.T5YGPIAJcRFnHFHlTcH_JZ
 MqDz5b2tK61WvaNhWZO0ewUIuQ4qCy0Rsml8cGxf52m3wqzNHktxARPf7KVlKEZmQrikFWediA4M
 nFM8MRQiIZ9aqq3l9uwQgwmUPWWIUOqCWj8ndOJ5pI40jBG8AGpkEOlJzk5sJ2X3urlLKapBoezr
 77.JZRYLVBg1VXMF0MsvX52pe5QPsNPSnLXCRRz.cQ4isnAYy1_u7mQODWnft32ltmp2hJ8ms0AH
 Js1b_qaFtOroFNNFTYEFHO29cTXYAi_5eMEIHcC.jRcXTZxvw1oiceitria55HRLfSe624SpoHJJ
 bHaMywoKlUL6M2cpqXtO8cTsGkrmbw8cBMxh3zPCpAa_0.fevDgeLmK.eS86Hp0bSRboKge5MHYW
 LkeT3Kr7x09RG4enn3ovlIH14NVJH.E__a3j6BECZSKUFYMOhnX0sLRX4m24urPBA_sx9R.3_10b
 Yi9HQifbBZQLzrQD3rYt_I8sLiUoSYnhu76jLmg.4Le6khwsvbHjz8Bf1l7nRgFkrdoEX4DgnpgB
 pJ0rXKZ12cWF9GYaBPlLUs7mOH7YSiEDBzf_ZqkQLfBxG9Izz.Jx4V7fkzWgUkiFZdH_XwAsEHht
 Ols5zo4HCVtLJ94LSyrhtgWDPQOd6W9rRmTN63sF.B0MdZizj.0FqMeN7koNtn9WVaj7GwH1.Xn1
 iG1_xigGR4gA6buLHm7rQoF2ZX0MInB9v5XKGBCixscgD.P6wIVogkR9RuvG3AN0gO8HnnGCPzuQ
 Xeuk14xM43r0N0m9yxd2LS.0rc0ZF7N.NXgF0aMr_NJMLdtUg_J.uL3_bO7t4M40x8n1.CO6oHcj
 e7LxM5Rx5yjeXAYMhlfMXZTv40Mf5KUpB7icJEUaQ1BfFirmkyZsH3MwFD8t33zEhKSx34_FwDJ0
 b1X1jc8_qgflEay6U9.KDDEUS4ZSTFjG1bCauNaNz9JwwPQpExFUYf.ArKTL9XlqCRDbAgZ.ZV5K
 jd0eJ2tGWpR802XAPa1tnW.xPpyrk8FYYaRNrqQHvr406uFkdsHUZ4uAePExKanKdB8jT3NTI.hD
 dCpX_62n2zvTtPuxbwdK4qAAp.j0ieGOguDqctOd7KpX.SFnRapGfzU.1rUs8JB9JLG7CDtMXw9U
 hydZaJUKD..M3rUmYJFK6z3H6pBU9G2JnZMxhyGeq4jg8Adoz1FUv.sVJ5NqWlmSRl15YbJCtm0W
 56BDtswiOHm.eWkCpwLud7GQ2wxbv2XVnAXDcGOCksHcYdrNWQqIzChiUGWfu1ftdS3Nvmpzp41g
 0P4fnz7GqAUfxVKnQ9vyQl9CgtRzSVEEm60x59aXisiCAjar5briAvj1nlZ0vKHF070fCuoX8ei7
 OFkKK8Zx1yOqEURtBxpqR54jtN4wRq2p6mg--
X-Sonic-MF: <capitain_jack@yahoo.com>
X-Sonic-ID: f72892e3-13ea-49cc-935e-097bed59c733
Received: from sonic.gate.mail.ne1.yahoo.com by
 mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-102 with HTTP;
 Fri, 9 Oct 2026 16:07:02 +0000
Received: from dip23.lsn.bf1.yahoo.com ([67.195.177.32])
          by hello (SMTP) with SMTP ID 04ceabd07a40120fff6bc57f50929151;
          Fri, 09 Oct 2026 16:06:57 +0000 (UTC)
From: Daniel Ramos <capitain_jack@yahoo.com>
To: nouveau@lists.freedesktop.org
Subject: On nouveau's community and LLM statement
Date: Fri, 09 Oct 2026 13:06:54 -0300
Message-ID: <179156201409.1251903.7021297050250233959@yahoo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
References: <179156201409.1251903.7021297050250233959.ref@yahoo.com>
X-Mailer: WebService/1.1.26668
 mail.core.serving.mcws.prd.acl:role.token.mcws.jsmtp.yahoo
Message-ID-Hash: LAIYVPYYPP4B26P55CHQ3W5KDVTQCHDZ
X-Message-ID-Hash: LAIYVPYYPP4B26P55CHQ3W5KDVTQCHDZ
X-MailFrom: capitain_jack@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LAIYVPYYPP4B26P55CHQ3W5KDVTQCHDZ/>
Archived-At: 
 <https://lore.freedesktop.org/179156201409.1251903.7021297050250233959@yahoo.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello,

I read the statement merged today, and I am sorry to see a community close it=
s door to people because of the tools they use.

I am an electrical engineer.
I have used CAD and calculation tools for most of my career, and they never m=
ade me less of an engineer.
My name goes on what I sign, and I answer for every calculation, whatever com=
puted it.

I also wrote websites by hand in Windows Notepad, when nothing better existed.
Writing every line without help did not make me a better developer than the p=
eople who later used IDEs, completion, hints and linters.
It only made me slower.

Judging a contribution by the tool that helped write it, instead of by its qu=
ality and by whether its author understands it and answers for it, is prejudi=
ce.
It measures a person by how they work, not by what they deliver.

You are free to run your project as you see fit, and I respect that.
Our work stays in our own tree, and we will send nothing here that your state=
ment excludes.
If nouveau ever decides not to exclude people who speak other languages and l=
everage AI to write their pull requests and to port code from other languages=
 (which, again, is translation), I will gladly come back and upstream everyth=
ing we are enhancing on our fork.
Until then, I wanted to say once, plainly, that this rule leaves good enginee=
rs outside, and that it is a loss for nouveau and for the people it could hav=
e welcomed.

Daniel Ramos

This message was written with AI assistance for grammar and clarity.
