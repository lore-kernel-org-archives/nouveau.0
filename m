Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAE2C9830E
	for <nouveau@archiver.kernel.org>; Wed, 23 Sep 2026 16:33:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 027E010EEB0;
	Wed, 23 Sep 2026 16:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="le1Yn91Q";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0626148621;
	Wed, 23 Sep 2026 16:16:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790180165;
 b=t4ni7/234Ybo7sF9HGkaUMTK3p5Qkg1AwZAnbcPPgsRXPaOBXtb0oKkUNfEpkW7+dFiZW
 IlDYma73ng4A5Ix6BOftMd3xr2dy6+oRlLh5a3jOJ5UhrAYDTVG9UUZCwRL5LLnMNbjoHRj
 TuaMM+ZCavXPCNpz+M2dMxoTpJ8/JC9quLYg755/DWGeqH2xFMO0RymYa+spGnTLdo6zPDj
 e07ettCzjgYuJb8n/zKYg9nzjAtywnySe3nsiK66YJF+wBAs2XY2UyBKqpJLq7y/1rgSQii
 eISzqdpuJ+2gbFg0efJxFR+U4NKiTNt1+78d5JML2rylhzzVZabyCr4pHlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790180165; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+FSMRQ9+qsd9BrO56CdEgWKaDM/Vi623/uic2JPjslw=;
 b=TN8bxW1380Ix5S+5aKpKxKBUCFzH624nDDEznJrSZO/QMkc/SGYlTCjqRZesv+bQOsfVX
 w+PGwWtCFRwcH7nDehSS3KuF4o2P+mH2xjz/xvUkAUoJMw4nc5qjON8GJ/muyzsXR4e2If5
 ugtdHk14+dNyywyHqPZY58YmfW2u4U0c4k24KkIe6cDRudKOB88mSci2pD+mKAWYPzXUAUF
 ZQgvt8MTCgxIYNIHUw4VJ0hcpDbUgMoyPwsEZwo/mX2meSLsD9Bz9S/P0Kd23ji8Pa6M+7P
 yKieUfu6F2F1NCmarqis9x1IemJgQu4CqS9oP68MpBE3pIpH1uzqDPkB5F1g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C45D0485C4
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 16:16:02 +0000 (UTC)
Received: from sonic.asd.mail.yahoo.com (sonic-usea1-0019.asd.mail.yahoo.com
 [34.2.64.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 652BF10E945
	for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2026 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790181232; bh=+FSMRQ9+qsd9BrO56CdEgWKaDM/Vi623/uic2JPjslw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=le1Yn91QaYcQ3lRqzZYl6I56UNatbl2bkp475TPNxnER6KyKINlydiymP8GpYFZU15b1ODzSbWAURAzSxpkLcG1+s+arNdN7+2pnDeQyynboDs8UvKDxpyQijVeUHqZ9tXxbJokPO8TjJIXOJValHXgKvWieeNgcbAoLMb9t25LxeNmgYRxpmvTX7TPBftowTrsCQxTpvVYS4A3stXaJX8SFzR7FRsSjPjB5pC3LbjiQBcBkqR2pfW8XgkGJiDVYEIrhzAlAqVV6RsMkMIwNrEl1yNPN9bj4fJcR9A7m6YNCGewORwjHgpBVvTU2tmFwILKoDUXRIssTfdmLE6gn0A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1790181232; bh=kT9g3iSmrNDN7npL71bCjyREZ0IK7Yq4fuSxPM4gg1x=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=WqOeWmabgPHl7dqNDmyUdd+UgtmSh6vgdg1YU3uPrnmuvQjunPFSFIIl0QrOTsL5XfTsH7tR+lEMEcCdJG2Rd8EPsWivUu+on3yz7h2DkTqz3xsAntkBL0ZqWGMKCPDqoc222PfSbcFebGtQ5Z4NAqF+CkSo3LQ9DexZKHVBGmt+dlLenFC2uDYYn/1gE1m4rXM4RG9nh2C2+nQFDrOYqyTfynI7S5G1xhJvtvCdLAdhyU2Q2esPesJytuKP4zzq1PDDZWz1Iw6k0qUKq2QOUHkyWkff6c8U4TAUBl+ASuepB2zFMoOcxPIJPUwpdzee+W4IZjI6KqZC5GFXz+DkjQ==
X-YMail-OSG: PMo4IYIVM1kH5veZ4NgGlslxEG.F6h_c0GBkmlZ1qDwq2gh8t0GBVH01mqLkjc.
 qNaFk2GyE5_Hqk_50sAcDVQkPSSRhOIN6wwrzc0z9lymQ5G0PIPlQE78L3LeAWEVy7uOA3jgiaaW
 lLedaGY0cL43OZxbs8KdIxow.5kcV4YtnnGxnKdOyJQNxIalAksx84K12ybTHQfdLe4r6etg65.6
 iIMRdhXKM1KFEvVFRBUAbGbnx41315gn3YWddJcKGtbsbc2SlT35jXDDqwxwB54u4MECgbZEEPhK
 GBESJm3SD5ohD.b_9Tml7BFjX8WPkIJXyWffdbTrn0Ye9CB30w3E0tbcWo6zPKRx_nCIQIYiCVPc
 gNPXoTTHF41yLn.OteWlGijeIBA2GV5_7i_vbMljGxpXDKV56yLp_DbJx0X8W6nPi2AhGimVKibi
 jjYt22IUiHtDGxXMp5nPBux9s2bOkYZHKKupIySU77hTrY.uFpmtvmbNg0E6yeElptGUXUzgj6C1
 XGtX9xHae8h26XizpimssWzUO2Opi4l.ow3uUAZW0XQF6iO.PcIJhqNggkhtqyuS4ZiyjQzvZ16v
 hfQ2DB1tgtprUVdgrXP41X_Eq2N538_up8KbIWH2.Er2SXwZbXlxR.nYmlvaH6fsRGAtflIZSauS
 o9fyzC6hrOPwins7g0jRd9OEmKTKR5MXcLEJUoaLXghw9uSWo1ipwOZTorKNtclX2YbLkDE4.jI0
 mhF3VqqKZxPCk.XRkNTsBVjqyWaQywynmvXNYaUE4zqdLXrYKYUIx1tpvr7D7QgGzcqhE0R_U80R
 OEFUKY8yCaNXEOEJ1tKuvl2uO0HqJYuD4UjfKcprSM.Qpk7Bg8WQN2BMCuzET6GIhbpd2NF9jH4L
 kxetmhD6d.z34jqAU5E9v7UlEXHxC3Gst7GixJ0xBwBtwWUWBPscNdLixiRmIvUzQ5.fjrTvfH5F
 gg4ZO129qv1dQTemZNNz3Fvy5iQyi.rBevnv_IHG2X4pbD5LVbdLsYvft3TlfVbM75nltmLmZf_0
 DOQ4TEooZJAq3LiKtVfRMRjiKG6oXWG5qKODd8N_KXWgcRNbgzEuzMUNH.MIyP_Sd0Ri6PYAnZ2b
 l1mJe3ntZTOlaKWuMuqiXliT1tsr5HnXO8s2pbrD_4AlltoTLzGiB4RVamBKV7K_eNJvPXScNZ6k
 L8taJM6LsGmHR9DrZNFt5uM4sWStPnn_wx5jnNHeNCBIfmX07euJ3H7U1c3IKX0cGpeqaM0yTfcy
 KGNxI.3nKUCjZERcNtP7Rl6tpkepNqcXMyTDQi0oCSvzOIhRRac9Sqe6JBo82lmPANEYNLhN77UJ
 fh.t0VKZlCj3rmAhxMn9AM8oVRsL.ySNqHRVmvHR1KAg39Kq.kyRhQnlulpeSvsROT7D38.s0cm_
 fQAdKlvtGFNaUwj9H0mCobloMcjDddewBHPEJg3iY1_9zzSqKUI0jyc5MbAmGxBF4VT8zRB5Uwrj
 fyWpLsxPNNZZt.Mg1.7jL0K1nubQRrPG_hJ3WWCIkScmZr6A_S_T0elUiYFPp.anmBo99fa7Uzyi
 fpadffHC9Zct0qYuRf7ZHRrFum5Jx3Od883oDqowAhRAlqb72fokw58Ns2MTVwvU2o0R9tdlNBzC
 lnf6BJaRtOxYluzhSyCnpRgZd9iqF4DjpotFk0ixV8ulmVrBZpU6GIq5a_ZZ.ZCP2QfvHzkza528
 FaH_V2lzeqKSlc_lKs1OOHFn9X5UlF2.PPmwEskcRfWYTspdSzolfK9jUa1UmMhnASQdkEcsy9Gx
 5sjdBmwZ5KrvW42fizRqmdJEsSOWBX0uAnqeYPjAWGYGr4RAiRxfnIG45q3PC5XuFoOu2luY9Awy
 Gb_qY2ZEZLeLhI771bKjx0LU7Ssj.Ww0oPMvd1y3QpUCuY0j.sApDITIGCpP3_mKcEaDbLz3WYBM
 zHukb0NAWfdGdbt0VaFwosuvFUgl2hqx_FqFb1XHqksAMh_G4awkxIdMH_G1LFqA38M26x.tI1x8
 sYkgoZcvmQ_46cBt6KKo8rcY7IXZ.byCD.vGvxK7f
X-Sonic-MF: <Capitain_Jack@yahoo.com>
X-Sonic-ID: 458d5149-1094-41b8-bd81-9e9a6259ad01
Received: from sonic.gate.mail.ne1.yahoo.com by
 mail-asdoutdeli-p-cin-usea1-prod-sonicconsumer-svc-102 with HTTP;
 Wed, 23 Sep 2026 16:33:52 +0000
Received: from dip33.lsn.bf1.yahoo.com ([67.195.177.42])
          by hello (SMTP) with SMTP ID 9326c4e7848959148398e157036154db;
          Wed, 23 Sep 2026 16:33:50 +0000 (UTC)
From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
To: lyude@redhat.com,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/3] drm/nouveau: HDMI Deep Color link depth (30/36/48
 bpp)
Date: Wed, 23 Sep 2026 13:33:47 -0300
Message-ID: <20260923163347.1066029-1-Capitain_Jack@yahoo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2493dc57eb887650642ddb7858c7c2f4def67877.camel@redhat.com>
References: <20260922192132.114546-1-Capitain_Jack@yahoo.com>
 <2493dc57eb887650642ddb7858c7c2f4def67877.camel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YHCYINTJEI6GHB7D5JXB7I353T5TJGKZ
X-Message-ID-Hash: YHCYINTJEI6GHB7D5JXB7I353T5TJGKZ
X-MailFrom: Capitain_Jack@yahoo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YHCYINTJEI6GHB7D5JXB7I353T5TJGKZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260923163347.1066029-1-Capitain_Jack@yahoo.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 2026-09-23, lyude@redhat.com wrote:
> Can you please clarify how LLM tooling was used in the production of
> this work? If you actually generated code with it that is part of this
> submission, then you need to append a Assisted-by: tag to each commit
> indicating that it was generated by an LLM.

Yes, the code was generated with AI partners under my direction, so every patch needs the tag.
I answered in detail on the colour format thread: https://lore.kernel.org/all/20260923162348.1037898-1-Capitain_Jack@yahoo.com/
The next version of this series (v2 is already on the list) will carry Assisted-by: on each patch.

Daniel
