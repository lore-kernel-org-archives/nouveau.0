Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B0606A31A
	for <nouveau@archiver.kernel.org>; Fri, 30 Oct 2026 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=alum.mit.edu header.i=@alum.mit.edu header.a=rsa-sha256 header.s=selector2 header.b=f68PjsIE
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C9F3010E3D2;
	Fri, 30 Oct 2026 15:06:56 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4333248C19;
	Fri, 30 Oct 2026 14:47:44 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793371664;
 b=va/KNgokg/G9zP2tGPSMNRuRABfHzqssjtITqU5LB6uhrAxesze0E13BuNs7a/Zu9JNt9
 eVgGd2m3LgjXbUIj9inKthusY7w7uae8Vyv59SWiESNvwyY7TY7UIj0itL2AO7HFdm7wdoV
 Sqaz9ywvEQI++0Y8EdTD60ycSWWsG43aWPFSM8/C1PqFZh1hrzJkYIm8syFO/NRpNEq7DlW
 ymFSYFMUZkKMGetVYv7iD5OEfh9qjBvxb3hPESaONEY2BNvZPDbKRQth3u/cPMSmK4JD5GP
 zWM0YQl07IJw2yW0ECuFvAHbFTB1/bwyQF6YwcLwzx8HahLG/AKpqQMb5l9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793371664; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=O8I178rG6MVPUUJ5Lmx+wdoVdvkVKbVNg+SHvw99oek=;
 b=Byl7UHyIDk/jMSgT4Tu4rEAiuQw02yZzt53tlZ/naWtCDTq3WGpYreeuz97StdmSpfcOM
 YiJadUysfUjYhWiEu1uqpxE5T2wzpMbmsA8dVcB6dJ2kubmUoU00CYTUpjwUqpmb+DI/Ywm
 Kh540zyVNm5igXzFlZLrY8aKf72aVjKXcV4vsxn7zyy59wix3GmUjIQShC5tqsteLP7eodd
 AJZq8PlBOTA9WdVtUULu9iuQd/VI4QU8EHhy+pvcQj0U45Eegprp49E1rbENQ1FkT4PePoN
 iIePtJ6pYz+22f8hCyr9vsGkdmCMCnOie9U80AA4S+bM5FFxMu2Dp2OumEYw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=alum.mit.edu;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=alum.mit.edu
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=alum.mit.edu;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=alum.mit.edu policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EB3CC4711B
	for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2026 14:47:39 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11021128.outbound.protection.outlook.com [52.101.62.128])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E83A810E268
	for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2026 15:06:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aii8pgq/JZJLYsYKvw/PSab30QcFQhrkoE6uWqrJqSIUDencNdNCT5I+dhZktN9hAaELjjRcYr5Br8N8p5C0xedjSO8eDGnbVgk0ewS1pgIkNyylvmXTPvoclPTyLYQWcuTfY1satBrTTrBf7tqyuTdQCN7bcKW3H6HR4szJsJMKIZle9iZpFX4+gSeORUKG7Wr15hjlrJZnRV40x7gHO7XKrQ2WmoQc/y3B5G4yhM3pTv7ytPiS3YbIWfOYyMsjxUvhtO/NQ/CE+03mti3fuQ5Pbw2zaVeE0kU6Ar0XJ1fCGoN9fmfZyjdXSHgKiYJtl9DiYI/P+5XyZhRhX7gj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8I178rG6MVPUUJ5Lmx+wdoVdvkVKbVNg+SHvw99oek=;
 b=Ohw8iWaTDNIapgAycq7D+aqk9pw/crKBHpSNSyNHwuohyqsOmEqqXYIb+D5GOv9TXzWEMxZcgUr/AxQZt0mWhxG3uDPoQCZ6P82esSy73eZBod0rrBFSj/Vw8ECIzQb8NXS+3OlxvKjaFpS5mn7sSzQ7IGAzEuCqWH4UzOieR6S69U5PASt9soKO1qYqPO+y2PPEO+yoywq6lvjH2oLw9BYwq8j9xaFiieQWu1zRgwLw4g8Sb9PNquI2t2BUgmWGYbC3akZ0q0m4cuphzrllejQnhgQQCS/uuQkuKG40hHF8j81pO1nS05+Zb9CNag5jHTZca6swaYN0I3Z6wBjhtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.7.68.33) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=alum.mit.edu; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=alum.mit.edu; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alum.mit.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8I178rG6MVPUUJ5Lmx+wdoVdvkVKbVNg+SHvw99oek=;
 b=f68PjsIE0Ylx4Ts5SZPI40+PmMFpfndxHOf0lHFUb5T30y6ifD/ILgZX1+ExuDloKIZLxidjbg6xjo89ZEhNOBfdUH65xPXkg1PCO1psE1CzUq6/CYYsrWTx4cukrIyR8hwEcusxl/igOWGKodWsWLmFMy3xEmcaIasX8uL4bes=
Received: from BN9PR03CA0272.namprd03.prod.outlook.com (2603:10b6:408:f5::7)
 by PH0PR12MB8126.namprd12.prod.outlook.com (2603:10b6:510:299::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 15:06:04 +0000
Received: from BN5PEPF0004698C.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::4f) by BN9PR03CA0272.outlook.office365.com
 (2603:10b6:408:f5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 30
 Oct 2026 15:06:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 18.7.68.33) smtp.mailfrom=alum.mit.edu; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=alum.mit.edu;
Received-SPF: Pass (protection.outlook.com: domain of alum.mit.edu designates
 18.7.68.33 as permitted sender) receiver=protection.outlook.com;
 client-ip=18.7.68.33; helo=outgoing-alum.mit.edu; pr=C
Received: from outgoing-alum.mit.edu (18.7.68.33) by
 BN5PEPF0004698C.mail.protection.outlook.com (10.167.245.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Fri, 30 Oct 2026 15:06:03 +0000
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
	(authenticated bits=0)
        (User authenticated as imirkin@ALUM.MIT.EDU)
	by outgoing-alum.mit.edu (8.14.7/8.12.4) with ESMTP id 69UF6164012648
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2026 11:06:02 -0400
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c4301e334ceso66303766b.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 30 Oct 2026 08:06:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByejPOkpPNyAZL/zvc5JZFSFFXJ2qnzcf46ctjZS7zRnehnyZIHh6Ebq215BS+fJhLWwRTYjBAz@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIIpRRpNn6AtmQDy8DOnwKSgegqRm4NZF97fdpvQkXStOvlhiWk
	SXxnsDiILPxQ54OZHJS2ie+ohg/rMktjE1JFAKy7j28SEQbxxWzvwpyoE1UkrwTmMxLoB6KSik7
	EExAUBZC33B6PXhzmbpEdVx6DE1DEM1E=
X-Received: by 2002:a17:906:9f87:b0:c46:9ca9:f524 with SMTP id
 a640c23a62f3a-c4ca7a6e316mr246665966b.32.1793372761351; Fri, 30 Oct 2026
 08:06:01 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028185052.54427-1-xnderv@yandex.com>
 <8abb7b92-c16a-47a9-8caf-49773845c246@free.fr>
 <CAKb7UvgJwO1C4=jR9V9mkbs=JA2wi2ptCOeJdG0-eL+gKoOdaQ@mail.gmail.com>
 <99331793361990@mail.yandex.ru>
In-Reply-To: <99331793361990@mail.yandex.ru>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 30 Oct 2026 11:05:48 -0400
X-Gmail-Original-Message-ID: 
 <CAKb7Uvg2By0noK7MCg3Dzk+=zrmuYUr2dx6jq_yQC9SMV8BV2Q@mail.gmail.com>
X-Gm-Features: AclHuK_qdEavfPypSHrMaqNcJ-qF4Apiw3dsEHK6Fj7dx9DJs_BjZ23YJh6E_IY
Message-ID: 
 <CAKb7Uvg2By0noK7MCg3Dzk+=zrmuYUr2dx6jq_yQC9SMV8BV2Q@mail.gmail.com>
Subject: Re: [RFC] Fermi (GF11x) reclocking: a model of the NVIDIA driver's
 clock management, a lab nouveau module, and a call for NVIDIA 390 traces from
 GDDR5 cards
To: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCU0LXRgNC10LLRj9C90LrQvg==?=
 <xnderv@yandex.com>
Content-Type: multipart/alternative; boundary="00000000000063ef2b065f102255"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698C:EE_|PH0PR12MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 996e428a-dbd4-4099-f356-08df36975124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|786006|23010399003|1800799024|376014|43022699015|41320700013|36860700016|82310400026|4143699003|56012099006|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261022115727099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|10067099003|18002099003|22082099003|13003099007|8096899003|15866825006;
X-Microsoft-Antispam-Message-Info: 
	gQ305IQrv6MHaju558Hj98RMqG+u9nB9unhB0gFyOgCqPle03feHkOo3e9cmehleCrqPdAjU92rtiZ6VqrTtTOQIna3T7QwywJNcWyg0YWdusKhMWBK7Yst+seX9QtkpxoWxsN4GYhHzoIaZbbShVAnkAI1wHXTQl25V7/+mlOarvCQhM8l9haWVQcPppauBUGraZxeZV/eCOgkogMtLcSbs0EZ1ry/6NX3xmsFA90wBJCQTKhGOfVQ+PKV1HmVbFzkAc8UFxuCrDjC91YwG6bXzaR5O9LuKc0/M+TyN4P7Pd65f/QZlWOSaRBi14ln8q/M7YRfHFTFFu973YSTKlAHlAKMJ4x9zsjc5M/ph1MJXlTxENDXlvaP0TFi4rmM+WhV3Hr3bj1fOe1yRkiuF+7LH4RDtYDKtuuqRwCG5bD4jgx7XfgxUWLpN9zMwYB04z29pNDrtjRdLHuAUYUsH9jqIicnxll8VHiMpw8QO6i4pd5H+8rF2hqEnkvdtKxyQKN4ET5pddNYCh1zqm6DJ8dieh1Hf9/vm5eafgGYQACKih5u52/0dltnaj/vzRjnu68imNEV8xaWOrqL/XpM5x+3ENbC1z22MgfZgWBnRDu2MJGM8VQ8FDG406vvVjbZ8ftyHfhMV42waiOfqXXVw9+cz5aCcYrDVd2woYDPf+z+HPgCTmk5ZRVXaAZAA/zgxCfRGjC+qZPIhUYMXRTA90g==
X-Forefront-Antispam-Report: 
	CIP:18.7.68.33;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:outgoing-alum.mit.edu;PTR:outgoing-alum.mit.edu;CAT:NONE;SFS:(13230040)(786006)(23010399003)(1800799024)(376014)(43022699015)(41320700013)(36860700016)(82310400026)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022115727099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(13003099007)(8096899003)(15866825006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	T9oZIPH1FE5uOsodiP7IIQN0IgwqC/wX8iOM+xxZDd/LkCHajHaNHa98IunTmEyLciqKUqSSHB5zJHWoUaC/qTHoybEQcB98am/E6+Vq7TQBTwLTaNdkFK/CwuDVY9H1cdO0kgC1Cu7wwiz2Dmc/7YPpA3C/scxinz+APsXSZX1CnBedSfQGk6q6qaxOl/Wkv2gMqGhrOBMnb7qnSkgOt9FJ/PkdPc+nbQjKC4hQgzjSvs7aw8p33ziCB/VysNzT/dko0f33CzCZUkxB1Nw9zaEtOFFbJQlUAy4nfqM0+MN6bKpodgWnHKgRyOjcSq5qhF5/pnMEqa3dyDAfcM7BCzeageGGFbhfsNdnmDo6k+6Mn2FGf8fZulEY5l4CTgOdEGUbm3DsgMIL0eSpohOjFfn/4IF+E8e3yvEpLhiCHeZMpgg1OZg7hgDUsKDl2zbH
X-OriginatorOrg: alum.mit.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:06:03.7299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 996e428a-dbd4-4099-f356-08df36975124
X-MS-Exchange-CrossTenant-Id: 3326b102-c043-408b-a990-b89e477d582f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3326b102-c043-408b-a990-b89e477d582f;Ip=[18.7.68.33];Helo=[outgoing-alum.mit.edu]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN5PEPF0004698C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8126
Message-ID-Hash: TWQX35PK6WXTUBWIK2MIRQYSZPUNYYUG
X-Message-ID-Hash: TWQX35PK6WXTUBWIK2MIRQYSZPUNYYUG
X-MailFrom: imirkin@alum.mit.edu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TWQX35PK6WXTUBWIK2MIRQYSZPUNYYUG/>
Archived-At: 
 <https://lore.freedesktop.org/CAKb7Uvg2By0noK7MCg3Dzk+=zrmuYUr2dx6jq_yQC9SMV8BV2Q@mail.gmail.com/>
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

--00000000000063ef2b065f102255
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Perhaps I got the board model wrong - going from memory. It was a Quadro
with a GF108 (nvc1) chip - perhaps Quadro 600. I'll track it down over the
weekend.

On Fri, Oct 30, 2026 at 8:07=E2=80=AFAM =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=
=B0=D0=BD=D0=B4=D1=80 =D0=94=D0=B5=D1=80=D0=B5=D0=B2=D1=8F=D0=BD=D0=BA=D0=
=BE <xnderv@yandex.com>
wrote:

> Hi Ilia,
>
> Yes, very much of interest, thank you.
>
> Whatever is easiest for you: a git bundle or a tarball of the branch, or =
a
> push to any public place. If Ben's commit messages or notes say which
> boards he tried, even better.
>
> Your Quadro 400 story rings a bell. On our GTX 560 Ti the same core clock
> switch runs for hours in some boots and gets stuck in others, with the sa=
me
> module and the same sequence of writes. We have not found yet what decide=
s
> it. If you remember how it failed on your board (a hang at the switch,
> memory training, corruption on screen?), that would help us compare. Also=
,
> if I'm not mistaken the Quadro 400 is a GT216: was that with the GT21x
> reclocking, or did Ben's Fermi branch cover it too?
>
> Cheers, Alex
>
> ----------------
> =D0=9A=D0=BE=D0=BC=D1=83: Martin Roukala (martin.peres@free.fr);
> =D0=9A=D0=BE=D0=BF=D0=B8=D1=8F: nouveau@lists.freedesktop.org;
> =D0=A2=D0=B5=D0=BC=D0=B0: [RFC] Fermi (GF11x) reclocking: a model of the =
NVIDIA driver's clock
> management, a lab nouveau module, and a call for NVIDIA 390 traces from
> GDDR5 cards;
> 29.10.2026, 18:46, "Ilia Mirkin" <imirkin@alum.mit.edu>:
>
> Not sure if Ben's still around on this list, but at one point he had a
> non-working fermi reclocking branch. This stuff is complicated
> unfortunately... it worked on (some?) of his boards, but then e.g. on my
> identical Quadro 400 board, it didn't work (but worked on his Quadro 400)=
.
> I did some very basic searching but couldn't find it online, unfortunatel=
y
> it looks like cgit.freedesktop.org has died, so finding this stuff is
> much harder now. I have it locally somewhere if it's of interest.
>
> Cheers,
>
>   -ilia
>
> On Thu, Oct 29, 2026 at 1:24=E2=80=AFAM Martin Roukala <martin.peres@free=
.fr>
> wrote:
>
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
>

--00000000000063ef2b065f102255
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Perhaps I got the board model wrong - going from memory. I=
t was a Quadro with a GF108 (nvc1) chip - perhaps Quadro 600. I&#39;ll trac=
k it down over the weekend.</div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2026 at 8:=
07=E2=80=AFAM =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=B4=D1=80 =D0=94=
=D0=B5=D1=80=D0=B5=D0=B2=D1=8F=D0=BD=D0=BA=D0=BE &lt;<a href=3D"mailto:xnde=
rv@yandex.com">xnderv@yandex.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><div>Hi Ilia,</div><div>=C2=A0</div><=
div>Yes, very much of interest, thank you.<br><br>Whatever is easiest for y=
ou: a git bundle or a tarball of the branch, or a push to any public place.=
 If Ben&#39;s commit messages or notes say which boards he tried, even bett=
er.</div><div>=C2=A0</div><div>Your Quadro 400 story rings a bell. On our G=
TX 560 Ti the same core clock switch runs for hours in some boots and gets =
stuck in others, with the same module and the same sequence of writes. We h=
ave not found yet what decides it. If you remember how it failed on your bo=
ard (a hang at the switch, memory training, corruption on screen?), that wo=
uld help us compare. Also, if I&#39;m not mistaken the Quadro 400 is a GT21=
6: was that with the GT21x reclocking, or did Ben&#39;s Fermi branch cover =
it too?</div><div>=C2=A0</div><div>Cheers, Alex</div></div><div>=C2=A0</div=
><div>----------------</div><div>=D0=9A=D0=BE=D0=BC=D1=83: Martin Roukala (=
<a href=3D"mailto:martin.peres@free.fr" target=3D"_blank">martin.peres@free=
.fr</a>);</div><div>=D0=9A=D0=BE=D0=BF=D0=B8=D1=8F: <a href=3D"mailto:nouve=
au@lists.freedesktop.org" target=3D"_blank">nouveau@lists.freedesktop.org</=
a>;</div><div>=D0=A2=D0=B5=D0=BC=D0=B0: [RFC] Fermi (GF11x) reclocking: a m=
odel of the NVIDIA driver&#39;s clock management, a lab nouveau module, and=
 a call for NVIDIA 390 traces from GDDR5 cards;</div><div>29.10.2026, 18:46=
, &quot;Ilia Mirkin&quot; &lt;<a href=3D"mailto:imirkin@alum.mit.edu" targe=
t=3D"_blank">imirkin@alum.mit.edu</a>&gt;:</div><blockquote><div>Not sure i=
f Ben&#39;s still around on this list, but at one point he had a non-workin=
g fermi reclocking branch. This stuff is complicated unfortunately... it wo=
rked on (some?) of his boards, but then e.g. on my identical Quadro 400 boa=
rd, it didn&#39;t work (but worked on his Quadro 400). I did some very basi=
c searching but couldn&#39;t find it online, unfortunately it looks like <a=
 href=3D"http://cgit.freedesktop.org/" rel=3D"noopener noreferrer" target=
=3D"_blank">cgit.freedesktop.org</a> has died, so finding this stuff is muc=
h harder now. I have it locally somewhere if it&#39;s of interest.<div>=C2=
=A0</div><div>Cheers,</div><div>=C2=A0</div><div>=C2=A0 -ilia</div></div>=
=C2=A0<div><div>On Thu, Oct 29, 2026 at 1:24=E2=80=AFAM Martin Roukala &lt;=
<a href=3D"mailto:martin.peres@free.fr" rel=3D"noopener noreferrer" target=
=3D"_blank">martin.peres@free.fr</a>&gt; wrote:</div><blockquote style=3D"b=
order-left:1px solid rgb(204,204,204);margin:0px 0px 0px 0.8ex;padding-left=
:1ex">Hi Alex,<br><br>On 28/10/2026 20:50, Alex wrote:<br>&gt; Hi,<br>&gt;<=
br>&gt; this is a hobby project, not a patch series yet, but it may interes=
t people who still have Fermi cards.<br>&gt;<br>&gt; Since early October we=
 have been recording the NVIDIA 390.157 driver with mmiotrace on a GTX 560 =
Ti (GF114)<br>&gt; and on a second card (GTS 450, GF106, recorded by its ow=
ner), plus the last pre-390 drivers (270.x) on a 2011-era<br>&gt; stand, an=
d turning what the driver does into a written model: which registers it tou=
ches in which order, which<br>&gt; waits it makes, and which of those steps=
 are actually necessary (checked one change at a time, 60+ experiments).<br=
>&gt; Everything is from our own traces, VBIOS tables and open code (nouvea=
u, NVIDIA&#39;s open Tegra/nvgpu code, open-gpu-doc);<br>&gt; no decompilat=
ion of the proprietary driver is used, so the results can go upstream if th=
ey are good enough.<br>&gt;<br>&gt; What we have so far:<br>&gt; - Core rec=
locking on GF114 with nouveau&#39;s gf100 clock code plus the PTHERM/FSRM &=
quot;bracket&quot; the NVIDIA driver puts<br>&gt;=C2=A0 =C2=A0 around every=
 domain mux switch (slowdown engaged before the switch, released after). Wi=
thout the bracket the GPC<br>&gt;=C2=A0 =C2=A0 mux sticks occasionally on o=
ur card; with it and a dwell of ~4 us after the &quot;engaged&quot; flag, 0=
 stuck in thousands of<br>&gt;=C2=A0 =C2=A0 transitions. NVIDIA 390 waits 8=
 us by its own timer; 270.41.06 wraps only the mux write. Details, numbers =
and the<br>&gt;=C2=A0 =C2=A0 register-level map are in the repository.<br><=
br>Interesting, I don&#39;t remember ever seeing nvidia program the FSRM ar=
ound<br>reclocking... but I barely looked at Fermi+ reclocking as I was mor=
e<br>concerned with the Tesla and under era.<br><br>&gt; - Memory reclockin=
g (GDDR5, 135/324/2004 MHz) by replaying the PMU memory scripts and host wr=
ites the NVIDIA driver ran<br>&gt;=C2=A0 =C2=A0 on the same card, through n=
ouveau&#39;s memx. A generator that derives those scripts from any board&#3=
9;s VBIOS reproduces<br>&gt;=C2=A0 =C2=A0 88 % of the registers on the seco=
nd card; the rest is chip-level layout and driver-init bits.<br><br><br><br=
>&gt; - A VBIOS corpus of 306 Fermi images (with TechPowerUp&#39;s permissi=
on) that shows what is per-family, per-chip and<br>&gt;=C2=A0 =C2=A0 per-bo=
ard.<br><br>We have a private database of a ton of vbioses + associated mmi=
otraces,<br>I could give you access if you are interested and the repo stil=
l exists<br>somewhere :D<br><br>&gt;<br>&gt; What we are looking for: owner=
s of Fermi cards with GDDR5 (GF100/GF104/GF106/GF110/GF114/GF116 - GTX 4xx/=
5xx,<br>&gt; GTS 450, Quadro 2000-6000) willing to spend one evening record=
ing the NVIDIA 390 driver with our script (needs a spare<br>&gt; disk with =
390.157 and a kernel with CONFIG_MMIOTRACE) and to send the trace plus thei=
r VBIOS image. In return they get a<br>&gt; build of the lab module with th=
eir card&#39;s own sequences, and everything learned is published. It is a =
lab module:<br>&gt; hangs are possible, no warranty, no support promises.<b=
r>&gt;<br>&gt; Repository and the call with details: <a href=3D"https://git=
hub.com/xnderv/nouveau-fix" rel=3D"noopener noreferrer" target=3D"_blank">h=
ttps://github.com/xnderv/nouveau-fix</a> (issue #2).<br>&gt; Comments on th=
e approach are welcome too, especially on what would be needed for an upstr=
eamable version.<br><br>Seems like a fun project, I wish you a lot of fun w=
ith it! If you need<br>historical context, please ping me at `<a href=3D"ma=
ilto:martin.roukala@mupuf.org" rel=3D"noopener noreferrer" target=3D"_blank=
">martin.roukala@mupuf.org</a>`, or on<br>IRC (in the #nouveau channel on O=
FTC, please ping mupuf).<br><br>Cheers,<br>Martin<br><br>&gt;<br>&gt; Thank=
s,<br>&gt; Alex (xnderv on GitHub)<br>=C2=A0</blockquote></div></blockquote=
></blockquote></div>

--00000000000063ef2b065f102255--
