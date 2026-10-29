Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA8606A31D
	for <nouveau@archiver.kernel.org>; Thu, 29 Oct 2026 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=alum.mit.edu header.i=@alum.mit.edu header.a=rsa-sha256 header.s=selector2 header.b=YXQg4+vZ
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 558671123EE;
	Thu, 29 Oct 2026 15:46:44 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 02CFE48C02;
	Thu, 29 Oct 2026 15:27:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793287653;
 b=ILjno5qK5+aX28m90RupYhBjM+INDE/vGFUDRlb6gp4742I1ZyVUXcz5pH+vj8ZkWXZMW
 kym7QBzLmwm7lDYYkTWcFjQl7Lln34XTgrtcntxFt/OcjSrpeAcRfiPrTZCx7zgQLmZwvng
 QFXWQMH1HC8Du9kEayGevYPfndUn1kNp0wxcl1d89C7UieKsK4A8XIMXgqaC62z58VDiDjb
 Bbaj6sbNpTFy8zX42Pc81DYjOOW6ulrq1asusu/pcAI66ZuvDszGJ+FEXGdQqiHnuDUmjSb
 Xa8yvI7XUsrqoAAAf5nV0HzRmlb2NZ/MFD+LRrxqn4O6e4fiAhV8Wmhs9WFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793287653; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ay6n7Klbj2VbbNZvY7N3Ue8A/MMbFz94+bzWv97g4Fo=;
 b=fhAa/v4WMQaDyevS2ahFRDR+TX1PfnBP/Z5ppFM189DxpHH7MJKa7Z6AZF3Ww2OvZr7J+
 PYN3KOFKKUn/7bTR2uamSrEftLkUBjs4kJeznOmG2I74O3iXp/HxH+cdzNKLVQj5hGy8WCq
 sf7qpn5GnwDb2GMAS18Rr6DcKC4wBemQct+LZrZN7BNXw01vMTIYhsHV9tfNp1J4DbqXWUq
 D6BpNcl/NRArcwcKBEes4zZGslXVpTBzHsAz8MLtTKXbafuwbqZuVF2LnAMfCfPhoadEZfh
 KvIqo35SuAO+E6QE+bmFaagntOC146yIeCnjF3mIQuaHU7Br4mxDThjn3WQg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=alum.mit.edu;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=alum.mit.edu
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=alum.mit.edu;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=alum.mit.edu policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1BBAC46BCB
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 15:27:31 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11020116.outbound.protection.outlook.com [52.101.46.116])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4D010E3A8
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 15:46:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5qKRRN6lYZKxgNUVY5twmYm3BFHM7qUUlU+xiGBqa+4E6stC62ZZ89820D4rVEHEDR9w+h8ZuPZWUsYQxJ10ZGns6iTGctBT3L3Bjoca0SxrsdobkzdYnprouG56ITdWcn9I2R1ffvXoC7tJKDXEcVON6ygSbqn4Wf5eCrLwOA+7n/EXrGmQ7s5p0+R3KvRReeXtCRoBGhpAPm4xtls9lXXdK2pElkqdcri7LcNUgNIzAvnGOvy5r5TvEWaf6Q6G6OC32yLgMKh9NZ/+Z1/R4b2CfdODpZVfguF9FjdYd0YmuwQGqA3PzUBfpSrC1JodaHb/eVZTS+v8OTcllTWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay6n7Klbj2VbbNZvY7N3Ue8A/MMbFz94+bzWv97g4Fo=;
 b=SlvE9kklqp9DUSh+RYXVBAwyWqRgRhG6evWwb4nMmOWeYC0jNlK/iqRkU4i54okRGWaU/alNjrwo3edL5oRESL/1au6tLf/dyRwQ52ZXjt9CXe/NutlFaBYesYFiQI5D8ZL+aeCROhuaElHNWdvSAFDT8Ys4Xb2tACJKFeaFILJF2D+SE/rB7vS1U1XqXI6JGKP6GJ2dyU6FQ+x/rC+Lz27udKd881ebsgPZ3iaptBoUuNGUw/okTThNFO9BBQ+qwPYxgITtkDWMcjlC+2hAqjciKBIbhd3nNTHQ4pEoWx5GU30+nNBkRphZlbwTaF7Ud1oqrY4a0YHGMLoh/jqGSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.7.68.33) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=alum.mit.edu; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=alum.mit.edu; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alum.mit.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay6n7Klbj2VbbNZvY7N3Ue8A/MMbFz94+bzWv97g4Fo=;
 b=YXQg4+vZ2PxqAyDG/XnYr1tGkSsEvAqvweFiLWSgrWPCLnKVR6uIZIs7AJuQ1NXYeoNKKUZNZmxwsBw5HVck52w2SnQqTqBwYJAtea3G3BInYmcxH5iM9pRo1n6m0d8BcUhQ0HLxP5xGYiHFhBGCYBW5FuuLEv/OGP1Rp00DdTU=
Received: from SA0PR11CA0158.namprd11.prod.outlook.com (2603:10b6:806:1bb::13)
 by SA0PR12MB7073.namprd12.prod.outlook.com (2603:10b6:806:2d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 15:46:33 +0000
Received: from BN7PEPF00000096.namprd03.prod.outlook.com
 (2603:10b6:806:1bb:cafe::a1) by SA0PR11CA0158.outlook.office365.com
 (2603:10b6:806:1bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Thu, 29
 Oct 2026 15:46:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 18.7.68.33) smtp.mailfrom=alum.mit.edu; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=alum.mit.edu;
Received-SPF: Pass (protection.outlook.com: domain of alum.mit.edu designates
 18.7.68.33 as permitted sender) receiver=protection.outlook.com;
 client-ip=18.7.68.33; helo=outgoing-alum.mit.edu; pr=C
Received: from outgoing-alum.mit.edu (18.7.68.33) by
 BN7PEPF00000096.mail.protection.outlook.com (10.167.245.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 15:46:32 +0000
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
	(authenticated bits=0)
        (User authenticated as imirkin@ALUM.MIT.EDU)
	by outgoing-alum.mit.edu (8.14.7/8.12.4) with ESMTP id 69TFkUpB013923
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 11:46:31 -0400
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c3fd91337baso398855966b.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 29 Oct 2026 08:46:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBx/wX8ZXurqPzXeNJViYFluRVUWoIgYBLRjlJ5puJJUnTLk1DN/2xMM8+GnPhJn4w9Q8gFrIgND@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLsnMrM2zR/NBmtlrpl/D5rnMD8q/blQ+AyMcmPI6/K52tmrT6x
	hxugUdbhVDGYdL6o6/Hz1/edJ+6XAtiQY8DDEm9hwrQZ0Yv6wqchpRGMMeAOe4mHpnJjzY1KM5l
	BsBBsbjg/BXzRx/kN3q5E1B2Xcm4WpFQ=
X-Received: by 2002:a17:906:ee8b:b0:c3e:f39b:2286 with SMTP id
 a640c23a62f3a-c49bd9d3f9fmr519577466b.0.1793288789796; Thu, 29 Oct 2026
 08:46:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028185052.54427-1-xnderv@yandex.com>
 <8abb7b92-c16a-47a9-8caf-49773845c246@free.fr>
In-Reply-To: <8abb7b92-c16a-47a9-8caf-49773845c246@free.fr>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 29 Oct 2026 11:46:17 -0400
X-Gmail-Original-Message-ID: 
 <CAKb7UvgJwO1C4=jR9V9mkbs=JA2wi2ptCOeJdG0-eL+gKoOdaQ@mail.gmail.com>
X-Gm-Features: AclHuK99tAh5O0h0WiJFsz8HmWSiaOIlv7zjZDPHMJY9_4j6kOE52Wzfhxq1rog
Message-ID: 
 <CAKb7UvgJwO1C4=jR9V9mkbs=JA2wi2ptCOeJdG0-eL+gKoOdaQ@mail.gmail.com>
Subject: Re: [RFC] Fermi (GF11x) reclocking: a model of the NVIDIA driver's
 clock management, a lab nouveau module, and a call for NVIDIA 390 traces from
 GDDR5 cards
To: Martin Roukala <martin.peres@free.fr>
Content-Type: multipart/alternative; boundary="0000000000004baef4065efc9522"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000096:EE_|SA0PR12MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5ff337-f343-4e20-a033-08df35d3ce29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|786006|376014|82310400026|36860700016|1800799024|43022699015|41320700013|23010399003|22082099003|18002099003|13003099007|8096899003|56012099006|4143699003|261026121527099003|261021123027099003|261026140227099003|261022105027099003|261022115727099003|261021121427099003|10067099003|261022075727099003|261009223027099003|261028144727099003|15866825006;
X-Microsoft-Antispam-Message-Info: 
	KsBG7pZZELqiLoIrA5qLe6sLkWzWQqxanjXwWwQqaC3rKCWVlrB6FuQtV6atAczlOCp9bN04M/PqERH3AoOsjP1VRDhLvpf3Rr7LrgHD1LyX+vY/SwUrmgtpbVUHVIRhscIn6OcnpWu50WV7eTBgB1twvOwOOD8qkkz+EHg4PVSmKfNfesevLBl3SKDOyfIckDqwERiqSORIXbXbnRXDn0V182TjiNj6frD9uhUqfsn1WQzapxtImVVWGMQKFmIH3OZcXiPdizI4CP+H3pl8qNQQrrP9T565wOsAxk6HlaIbhNgKj5v9sN+iAusbj6tx2LZc+WGi9TpPd3MNYhD+fCVj0VaT0Ye4n9zNGfib6Ep7o2DWSos+yrxMnl/RCH98PWhUxWM3hfWJOZs7Ykua+LNVAei6RxYRascl/br9LSnWx+VmXpdFt+KigKvXOC48dAdj69Ijg0vK/mMnAWy1QNtCc8YJoRnpXLA49S9PkAJVP0XytFlhe8sIjbO2BCSbBjgfIqsYpEHvkyffOdFl0R8EYOAC8Hh660wUo8fd3yuyxvzDxCQxUzYYdI/YaLprBw9TsDWJo1KUmB6Tlnq0IPy1NSRmPqiC0dQOPyRz3P00n3lxWfagiUQhGXXlKR4uFmcv0OuPpAoMOieCTEzm3bg74wEV4TGnl9RGKeNosqvD2jlIb83qAhvanlODUZewwpU3vo2i+hHWpjzWVSFh2g==
X-Forefront-Antispam-Report: 
	CIP:18.7.68.33;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:outgoing-alum.mit.edu;PTR:outgoing-alum.mit.edu;CAT:NONE;SFS:(13230040)(786006)(376014)(82310400026)(36860700016)(1800799024)(43022699015)(41320700013)(23010399003)(22082099003)(18002099003)(13003099007)(8096899003)(56012099006)(4143699003)(261026121527099003)(261021123027099003)(261026140227099003)(261022105027099003)(261022115727099003)(261021121427099003)(10067099003)(261022075727099003)(261009223027099003)(261028144727099003)(15866825006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rBcvasCtH+6iVpVzgVFhZYpSRbSIOKjNfIA9aOX7U8C/epWsX9q+dlcDMpthqw9h9luOrUNBfM79dtzshBKk5Qyu2c6Mbq3ekwNawUt8yBNOTTeMcqreLJSwvaMDJYOXwtMpP10Ke0g06lSbNWU3qH98NhSnFomJhw38J4bh1ZruSwjktcsMogT7txfBoNNzGjxDj2SnSwaNwGFgJED7p/XiRlCmrXsKMF6IfOdbvDora+4y6Unb+oOfA8GNFrzxe93lp3twcpjzkGE5LkdqM49A0d78npCV1kbhNCgZaqbyB9eM0hMi+FwTe/NuN6kz4oemP/MxNsJib0hB47u5tjDeIPQPR+csdqJCmzuAKjrZ1+nhreSx+hy8REY6/RI7S5DAUxFB74c5YCl0aeIG3HoATphm4u/6MlyUQPfJ4dZ0LIax/ToUyY8AiwuYNmB8
X-OriginatorOrg: alum.mit.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 15:46:32.1471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6b5ff337-f343-4e20-a033-08df35d3ce29
X-MS-Exchange-CrossTenant-Id: 3326b102-c043-408b-a990-b89e477d582f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3326b102-c043-408b-a990-b89e477d582f;Ip=[18.7.68.33];Helo=[outgoing-alum.mit.edu]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN7PEPF00000096.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7073
Message-ID-Hash: SQECWZR7TOC73GU3PGA6ESUWHIJSTWFC
X-Message-ID-Hash: SQECWZR7TOC73GU3PGA6ESUWHIJSTWFC
X-MailFrom: imirkin@alum.mit.edu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alex <xnderv@yandex.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SQECWZR7TOC73GU3PGA6ESUWHIJSTWFC/>
Archived-At: 
 <https://lore.freedesktop.org/CAKb7UvgJwO1C4=jR9V9mkbs=JA2wi2ptCOeJdG0-eL+gKoOdaQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--0000000000004baef4065efc9522
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not sure if Ben's still around on this list, but at one point he had a
non-working fermi reclocking branch. This stuff is complicated
unfortunately... it worked on (some?) of his boards, but then e.g. on my
identical Quadro 400 board, it didn't work (but worked on his Quadro 400).
I did some very basic searching but couldn't find it online, unfortunately
it looks like cgit.freedesktop.org has died, so finding this stuff is much
harder now. I have it locally somewhere if it's of interest.

Cheers,

  -ilia

On Thu, Oct 29, 2026 at 1:24=E2=80=AFAM Martin Roukala <martin.peres@free.f=
r> wrote:

> Hi Alex,
>
> On 28/10/2026 20:50, Alex wrote:
> > Hi,
> >
> > this is a hobby project, not a patch series yet, but it may interest
> people who still have Fermi cards.
> >
> > Since early October we have been recording the NVIDIA 390.157 driver
> with mmiotrace on a GTX 560 Ti (GF114)
> > and on a second card (GTS 450, GF106, recorded by its owner), plus the
> last pre-390 drivers (270.x) on a 2011-era
> > stand, and turning what the driver does into a written model: which
> registers it touches in which order, which
> > waits it makes, and which of those steps are actually necessary (checke=
d
> one change at a time, 60+ experiments).
> > Everything is from our own traces, VBIOS tables and open code (nouveau,
> NVIDIA's open Tegra/nvgpu code, open-gpu-doc);
> > no decompilation of the proprietary driver is used, so the results can
> go upstream if they are good enough.
> >
> > What we have so far:
> > - Core reclocking on GF114 with nouveau's gf100 clock code plus the
> PTHERM/FSRM "bracket" the NVIDIA driver puts
> >    around every domain mux switch (slowdown engaged before the switch,
> released after). Without the bracket the GPC
> >    mux sticks occasionally on our card; with it and a dwell of ~4 us
> after the "engaged" flag, 0 stuck in thousands of
> >    transitions. NVIDIA 390 waits 8 us by its own timer; 270.41.06 wraps
> only the mux write. Details, numbers and the
> >    register-level map are in the repository.
>
> Interesting, I don't remember ever seeing nvidia program the FSRM around
> reclocking... but I barely looked at Fermi+ reclocking as I was more
> concerned with the Tesla and under era.
>
> > - Memory reclocking (GDDR5, 135/324/2004 MHz) by replaying the PMU
> memory scripts and host writes the NVIDIA driver ran
> >    on the same card, through nouveau's memx. A generator that derives
> those scripts from any board's VBIOS reproduces
> >    88 % of the registers on the second card; the rest is chip-level
> layout and driver-init bits.
>
>
>
> > - A VBIOS corpus of 306 Fermi images (with TechPowerUp's permission)
> that shows what is per-family, per-chip and
> >    per-board.
>
> We have a private database of a ton of vbioses + associated mmiotraces,
> I could give you access if you are interested and the repo still exists
> somewhere :D
>
> >
> > What we are looking for: owners of Fermi cards with GDDR5
> (GF100/GF104/GF106/GF110/GF114/GF116 - GTX 4xx/5xx,
> > GTS 450, Quadro 2000-6000) willing to spend one evening recording the
> NVIDIA 390 driver with our script (needs a spare
> > disk with 390.157 and a kernel with CONFIG_MMIOTRACE) and to send the
> trace plus their VBIOS image. In return they get a
> > build of the lab module with their card's own sequences, and everything
> learned is published. It is a lab module:
> > hangs are possible, no warranty, no support promises.
> >
> > Repository and the call with details:
> https://github.com/xnderv/nouveau-fix (issue #2).
> > Comments on the approach are welcome too, especially on what would be
> needed for an upstreamable version.
>
> Seems like a fun project, I wish you a lot of fun with it! If you need
> historical context, please ping me at `martin.roukala@mupuf.org`, or on
> IRC (in the #nouveau channel on OFTC, please ping mupuf).
>
> Cheers,
> Martin
>
> >
> > Thanks,
> > Alex (xnderv on GitHub)
>
>

--0000000000004baef4065efc9522
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not sure if Ben&#39;s still around on this list, but at on=
e point he had a non-working fermi reclocking branch. This stuff is complic=
ated unfortunately... it worked on (some?) of his boards, but then e.g. on =
my identical Quadro 400 board, it didn&#39;t work (but worked on his Quadro=
 400). I did some very basic searching but couldn&#39;t find it online, unf=
ortunately it looks like <a href=3D"http://cgit.freedesktop.org">cgit.freed=
esktop.org</a> has died, so finding this stuff is much harder now. I have i=
t locally somewhere if it&#39;s of interest.<div><br></div><div>Cheers,</di=
v><div><br></div><div>=C2=A0 -ilia</div></div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 2=
9, 2026 at 1:24=E2=80=AFAM Martin Roukala &lt;<a href=3D"mailto:martin.pere=
s@free.fr">martin.peres@free.fr</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Alex,<br>
<br>
On 28/10/2026 20:50, Alex wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; this is a hobby project, not a patch series yet, but it may interest p=
eople who still have Fermi cards.<br>
&gt; <br>
&gt; Since early October we have been recording the NVIDIA 390.157 driver w=
ith mmiotrace on a GTX 560 Ti (GF114)<br>
&gt; and on a second card (GTS 450, GF106, recorded by its owner), plus the=
 last pre-390 drivers (270.x) on a 2011-era<br>
&gt; stand, and turning what the driver does into a written model: which re=
gisters it touches in which order, which<br>
&gt; waits it makes, and which of those steps are actually necessary (check=
ed one change at a time, 60+ experiments).<br>
&gt; Everything is from our own traces, VBIOS tables and open code (nouveau=
, NVIDIA&#39;s open Tegra/nvgpu code, open-gpu-doc);<br>
&gt; no decompilation of the proprietary driver is used, so the results can=
 go upstream if they are good enough.<br>
&gt; <br>
&gt; What we have so far:<br>
&gt; - Core reclocking on GF114 with nouveau&#39;s gf100 clock code plus th=
e PTHERM/FSRM &quot;bracket&quot; the NVIDIA driver puts<br>
&gt;=C2=A0 =C2=A0 around every domain mux switch (slowdown engaged before t=
he switch, released after). Without the bracket the GPC<br>
&gt;=C2=A0 =C2=A0 mux sticks occasionally on our card; with it and a dwell =
of ~4 us after the &quot;engaged&quot; flag, 0 stuck in thousands of<br>
&gt;=C2=A0 =C2=A0 transitions. NVIDIA 390 waits 8 us by its own timer; 270.=
41.06 wraps only the mux write. Details, numbers and the<br>
&gt;=C2=A0 =C2=A0 register-level map are in the repository.<br>
<br>
Interesting, I don&#39;t remember ever seeing nvidia program the FSRM aroun=
d <br>
reclocking... but I barely looked at Fermi+ reclocking as I was more <br>
concerned with the Tesla and under era.<br>
<br>
&gt; - Memory reclocking (GDDR5, 135/324/2004 MHz) by replaying the PMU mem=
ory scripts and host writes the NVIDIA driver ran<br>
&gt;=C2=A0 =C2=A0 on the same card, through nouveau&#39;s memx. A generator=
 that derives those scripts from any board&#39;s VBIOS reproduces<br>
&gt;=C2=A0 =C2=A0 88 % of the registers on the second card; the rest is chi=
p-level layout and driver-init bits.<br>
<br>
<br>
<br>
&gt; - A VBIOS corpus of 306 Fermi images (with TechPowerUp&#39;s permissio=
n) that shows what is per-family, per-chip and<br>
&gt;=C2=A0 =C2=A0 per-board.<br>
<br>
We have a private database of a ton of vbioses + associated mmiotraces, <br=
>
I could give you access if you are interested and the repo still exists <br=
>
somewhere :D<br>
<br>
&gt; <br>
&gt; What we are looking for: owners of Fermi cards with GDDR5 (GF100/GF104=
/GF106/GF110/GF114/GF116 - GTX 4xx/5xx,<br>
&gt; GTS 450, Quadro 2000-6000) willing to spend one evening recording the =
NVIDIA 390 driver with our script (needs a spare<br>
&gt; disk with 390.157 and a kernel with CONFIG_MMIOTRACE) and to send the =
trace plus their VBIOS image. In return they get a<br>
&gt; build of the lab module with their card&#39;s own sequences, and every=
thing learned is published. It is a lab module:<br>
&gt; hangs are possible, no warranty, no support promises.<br>
&gt; <br>
&gt; Repository and the call with details: <a href=3D"https://github.com/xn=
derv/nouveau-fix" rel=3D"noreferrer" target=3D"_blank">https://github.com/x=
nderv/nouveau-fix</a> (issue #2).<br>
&gt; Comments on the approach are welcome too, especially on what would be =
needed for an upstreamable version.<br>
<br>
Seems like a fun project, I wish you a lot of fun with it! If you need <br>
historical context, please ping me at `<a href=3D"mailto:martin.roukala@mup=
uf.org" target=3D"_blank">martin.roukala@mupuf.org</a>`, or on <br>
IRC (in the #nouveau channel on OFTC, please ping mupuf).<br>
<br>
Cheers,<br>
Martin<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Alex (xnderv on GitHub)<br>
<br>
</blockquote></div>

--0000000000004baef4065efc9522--
