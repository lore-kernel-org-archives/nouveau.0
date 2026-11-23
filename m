Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7D6606A31E
	for <nouveau@archiver.kernel.org>; Tue, 24 Nov 2026 02:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=P3M2eT1f
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C029310F314;
	Tue, 24 Nov 2026 02:13:26 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8A1E0404BE;
	Tue, 24 Nov 2026 02:13:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795486394;
 b=ze5impqTg0BzGjE24gJyXsruAOM1qLsvEgJrhOB18eTCesmkTLpn2nUXPllk93ZeE+j2y
 KDehPL98ykW46qrOpgmpoSI5waC3lboHJzY2oSE8+bO63b30d1/HGJPoCik091e9tkzEGh1
 xJy8PRkOmdhM/VOJA46GwRDMXxKlDwooboDULT+ReuYjstgUBgfZNojQ9Ifl+z2rgJFiGMO
 MnfJb6gwngm2i66MYzHYi0BpNcLf7Nhw4/XFzuiSlGB2QL35WdpPMyQIqiva5iiQKiSVdhk
 OpPvtRt+wrevZnqjD3rVwHJUL7Q0Y5ByZ4iXSi511dR/pPPkMxLQv4t5ryXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795486394; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vf1TLH91M3JAl7BBpNThyu/WlxB9Lfb7fGRdpCfPCgk=;
 b=n5STjKDoW1J8sAFUJ1E8kLb89m/l9nuY0qWtk+IAa6dc5fNNnMemRi/waFA4cEWBMuEha
 HTGAshKxVpytCGtwsLWsSky1Dx85tRbj8z1v1NTaU2ABbnNJ5APmFVarKQfq4DelBOEeDFQ
 Y19xKgDWFF94kW1Nc754qQtlD2retE3ODp4b4B9bB/UJuExR8VhZt0WuxJkrQ7LNFnamqJf
 2ogLTo+VYstJOV7QdBcbQcFMK8HDa2CfmNFiZ+pPB61qrPJG8SUjmbYzJ64rFBFgwS8+14g
 3kdrSSWiYuqb2lMjtSPPjLpBXTkOq90YrHSTUCctKQQlDOrSeHdfeBFhKioA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=cirad.fr;
 arc=none;
 dmarc=pass header.from=cirad.fr policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=cirad.fr;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=cirad.fr policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 51AA8402FE
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 16:33:21 +0000 (UTC)
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 08B6710EDCF;
	Mon, 23 Nov 2026 16:33:16 +0000 (UTC)
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 80DA520DDAF9;
	Mon, 23 Nov 2026 17:33:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 5D21920E2A2F;
	Mon, 23 Nov 2026 17:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 5D21920E2A2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795451594;
	bh=vf1TLH91M3JAl7BBpNThyu/WlxB9Lfb7fGRdpCfPCgk=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=P3M2eT1f4RoGsYswGrPXcxbPEBs80wtOgAedxdawRWPeL7lj7waNjrndoRH8G6Ih+
	 3zaAVcj6X9A/xfwvWEzK8q3vfPkym2m0iQ1QK04Y/0k2btYNMI5Uam2bTe9fuVnlGN
	 j1XKyzxpltUa4XKloFy/neLn2MWXN2FPdMnetoOkiYRWCS2asrnsXnRoSJF9niEj+J
	 ULqj9W6z95xVqTjSCL7Lx9ozFruLb811miTsHdvXzdRYQvMu7MbVmXAvT1ixHcbPDj
	 3BXqNsgFoeYORs6SNVs41LC3ytqkIea++/e/8B8qJwdCVc8w7wyxVU26BrFm1XhCoq
	 x49S0nEm1V7wA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id XJ-EQxWpCIvu; Mon, 23 Nov 2026 17:33:14 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net
 [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id EEE9A20DDAF9;
	Mon, 23 Nov 2026 17:33:13 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: nouveau@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm/nouveau: fix crash when DP link training fails
Date: Mon, 23 Nov 2026 17:33:06 +0100
Message-ID: <20261123163307.637332-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123101659.600247-1-frederic.mahe@cirad.fr>
References: <20261123101659.600247-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: frederic.mahe@cirad.fr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
Message-ID-Hash: IOR7LC2NMFFSUQQYMRXBGH5Y7C2MUGK3
X-Message-ID-Hash: IOR7LC2NMFFSUQQYMRXBGH5Y7C2MUGK3
X-Mailman-Approved-At: Tue, 24 Nov 2026 02:13:11 +0000
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 "David R . Hedges" <linuxdev844@thelittleman.net>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IOR7LC2NMFFSUQQYMRXBGH5Y7C2MUGK3/>
Archived-At: 
 <https://lore.freedesktop.org/20261123163307.637332-1-frederic.mahe@cirad.fr/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

After sending this I found David Hedges' series "drm/nouveau: recover
DP links the sink drops after waking" (Cc'd). His patch 1/5 does what my
patch 2/2 does, more completely, and touches the same function, so I am
dropping 2/2 in favour of his. That also covers the points the Sashiko
review raised on 2/2 (the check only ran when mode_changed and active
were both set).

Patch 1/2 (divide by zero in nv50_disp_super_2_2_dp() when the DP link
is not trained) is not in his series and still applies: it protects nvkm
itself, whatever the DRM side does, and it is tagged for stable. I can
resend it alone if that is easier.

I tested his series on a Quadro 600 (GF108, no GSP-RM) and will reply
in his thread with the results.

Fr=C3=A9d=C3=A9ric
