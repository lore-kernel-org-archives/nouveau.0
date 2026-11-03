Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046B5606A324
	for <nouveau@archiver.kernel.org>; Tue,  3 Nov 2026 04:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=alum.mit.edu header.i=@alum.mit.edu header.a=rsa-sha256 header.s=selector2 header.b=G2uFANa+
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A2B7A10F355;
	Tue,  3 Nov 2026 04:45:55 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5021E48CBC;
	Tue,  3 Nov 2026 04:26:35 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793679995;
 b=yKq37k1Po+uskVaRrlZRTrEaOYDD5I313ZGeuEYp2ZFRXU5KWA3eVfIiCNtg/AubQICRi
 R6x8hGIfRkrByhhyYAOVSlmTc3S4cpTyEQpDQsSQq3ZDcIplXO6cwLt4bTDAT5rGn1XNrmh
 +ttGvHZ5o/qTJp56CWl+1rOt35M7eoCjqnzWKuRAGD2o8qttaSmIBDumSiVQb0/NdtAa46h
 XIXrBpR7z9YD9J1SK1FVETbtUj8UFz/PUgmRmIVShWVwAAWpnAgnVd+SM4S8hIneU29qNNk
 HEI/XMGC2FBu+fX7cRSTN06J1dGaSoDzOiKs+mhijI9NnvF06DK3cInxkrnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793679995; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GesGQ+jV+TNAk0Q0OhISUfUaRGgmwQqevdOxSJHsYLE=;
 b=CiloPeuxvroXo6NQ5YLJzlZ4iXhbc0/vRMaRm/Q42ZZKbN5hNry+BywzYBwLc6SPYzMm2
 /IHubrARFoAmlv7D1oXJuI5hBHGb3ewC6GdXc/AVplVAq6HBVWshyTtvJ2AeBlsQqMwevwM
 QPc1TRCh0gbNv8GuBi/bnpabyajQrrCggyCZBMhXefIr6jszIywdTmfblk8FD6WcfMz62OA
 Yvotn6dnEVaUSmxanQ2OkYIvF2DPJBqWiD3YEI1L5UkYVSYOqNbTvNiazRd7n2UJqx6uUBv
 y7We0qrF3tp8aC2trmTdBW+H6IhAPa5Dl+WeNFtuC2WhuBLrf8iST50545Vg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=alum.mit.edu;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=alum.mit.edu
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=alum.mit.edu;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=alum.mit.edu policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9E28645C59
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 04:26:31 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11021105.outbound.protection.outlook.com
 [40.93.194.105])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7D10E196
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 04:45:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rc+0iA3ecte0m2mILoMB5xbWGekbiF527F9/Gx10zf8oIusUfjpDvEjLiAQPwKhUPEXmeyBGPhbwN7ymyntn4kwfGV1BNz1yKazfF7XfLgwrXbVtUZKUL1UdhdNKOegqW/kzyDwXi8L1ux/IWO1JwC2JV9z2mdH0U2F0xGl/Hwqo99c13/TVAMsCpWndZjQeigb6Nt79+Cd081EWgF3lAD6DNNQMZCtbkqfDpdh0LK5bRpQjA7qvAqStB+SjILqyRElICnTpULTWVTKvDS6FitTJRGcLWSNq/Eyocc8Egz2a4B1W8TD4Y82PVCIPE2nnBmcLTvulUY/ypg70HD7dfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GesGQ+jV+TNAk0Q0OhISUfUaRGgmwQqevdOxSJHsYLE=;
 b=i24cxASUTV3NziDaQtUx6RnI7wJCQ5/g+q4aYX+Xz8DMN8w/i+iA6NIKUFEzZh22tL8ASHpKYR8Wkp56OQGESE316ZaEWU/JxsszgLFWfJFebQogdfZpDIhOlyu7s5Ls9FDcnsdZKJPWSH8xX7uqna+T7w+EIa9UqYgKr95g/25c9gdD6DJSaCa4S0EEhPM/serZNpTFdAATdfURT93c9Cl99jBSgxvcffSaqoQE0QiWmkcdPa8J6mpPwdOK6HtHXE4XYjOoMieeoTYQEGV6MJNI0u0PX/QUYCymqrNCqujnkiOCzmfzFDlwEVmFifuNSuUqpQWG6tfeVU9MSzS9Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.7.68.33) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=alum.mit.edu; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=alum.mit.edu; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alum.mit.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GesGQ+jV+TNAk0Q0OhISUfUaRGgmwQqevdOxSJHsYLE=;
 b=G2uFANa+CGboPFsPE9iOH9X/O63wM0P8yTZEflG54L6x7ae2VAqyZdJ8RrWXY8RXjy5gd/qsPedbqutmUZdsrHF+2v+hBBqYNkVBv2LoDLCpspW42NbI4r5aIWwk0D4KKdPlcIv4raDrdFt9f4jhIeLp/XOZFNF1pKfxWILjk5o=
Received: from BY5PR04CA0002.namprd04.prod.outlook.com (2603:10b6:a03:1d0::12)
 by CH1PR12MB9598.namprd12.prod.outlook.com (2603:10b6:610:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 04:45:43 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::a2) by BY5PR04CA0002.outlook.office365.com
 (2603:10b6:a03:1d0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Tue, 3
 Nov 2026 04:45:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 18.7.68.33) smtp.mailfrom=alum.mit.edu; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=alum.mit.edu;
Received-SPF: Pass (protection.outlook.com: domain of alum.mit.edu designates
 18.7.68.33 as permitted sender) receiver=protection.outlook.com;
 client-ip=18.7.68.33; helo=outgoing-alum.mit.edu; pr=C
Received: from outgoing-alum.mit.edu (18.7.68.33) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 04:45:42 +0000
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
	(authenticated bits=0)
        (User authenticated as imirkin@ALUM.MIT.EDU)
	by outgoing-alum.mit.edu (8.14.7/8.12.4) with ESMTP id 6A34jdnl012688
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Mon, 2 Nov 2026 23:45:40 -0500
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c315869241fso526291166b.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 02 Nov 2026 20:45:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AKwUvBzsp85PUUle7Bzs81lX+dmgjLUZPvQipVlc297pX6RvHb1y4wzor1M2JqBZKlr0HXyw4pZqh6TJ@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKicXvcPHc5J61aQ8zNUbsdNEVDtTmG73gqMZr4bWlUM94Z/vGu
	guXSidCF8ByljoAiRpRhaHmIvc9XLQHeTf2AvDJ8ewEThPDmiwk0XTH4xuO4lNIi0aBCNv+0B4R
	59DSB6xdvZaV0xMBnAbL4YEKtB3jCqOM=
X-Received: by 2002:a17:907:868d:b0:c49:df8f:3c79 with SMTP id
 a640c23a62f3a-c4ca7a6ea48mr1028771466b.34.1793681139542; Mon, 02 Nov 2026
 20:45:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028185052.54427-1-xnderv@yandex.com>
 <8abb7b92-c16a-47a9-8caf-49773845c246@free.fr>
 <CAKb7UvgJwO1C4=jR9V9mkbs=JA2wi2ptCOeJdG0-eL+gKoOdaQ@mail.gmail.com>
 <99331793361990@mail.yandex.ru>
 <CAKb7Uvg2By0noK7MCg3Dzk+=zrmuYUr2dx6jq_yQC9SMV8BV2Q@mail.gmail.com>
 <CAKb7Uvi_UAOCSSF-116ytB89L++UPpfps_JTOXwUQL+MW49AnQ@mail.gmail.com>
 <24041793459236@mail.yandex.ru>
In-Reply-To: <24041793459236@mail.yandex.ru>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 2 Nov 2026 23:45:27 -0500
X-Gmail-Original-Message-ID: 
 <CAKb7UvjLNuvu6ze5+2KkDJKz0jBwxQyXGOzwMzBc2ZEV3FJU=A@mail.gmail.com>
X-Gm-Features: AclHuK9JPGBZrSMCYgv9izub1dAZUNzmUTKMqxbUHSMt_IAmnyiyuTX0h6pQEXg
Message-ID: 
 <CAKb7UvjLNuvu6ze5+2KkDJKz0jBwxQyXGOzwMzBc2ZEV3FJU=A@mail.gmail.com>
Subject: Re: [RFC] Fermi (GF11x) reclocking: a model of the NVIDIA driver's
 clock management, a lab nouveau module, and a call for NVIDIA 390 traces from
 GDDR5 cards
To: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCU0LXRgNC10LLRj9C90LrQvg==?=
 <xnderv@yandex.com>
Content-Type: multipart/alternative; boundary="00000000000029af6e065f57ef69"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|CH1PR12MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bf8b92-adb4-4518-b46f-08df3965515e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|41320700013|43022699015|1800799024|376014|23010399003|36860700016|786006|22082099003|18002099003|56012099006|261102123227099003|8096899003|13003099007|10067099003|261009223027099003|261022105027099003|261022115727099003|261021121427099003|261021123027099003|261022075727099003|4143699003|261028144727099003|261026140227099003|261026121527099003|15866825006;
X-Microsoft-Antispam-Message-Info: 
	Q7l+KmsrBfPi4RBVM0hCSfDOm295wpgDgdMkRlhSBEhLyXdNOautF22OkfluekhH0gnphW786RP0kU6EXnmBvhagq5mU9WvDxAmPYA5slbJgQTsl7ZgCfe3iGm+PWZ/uCa5xRgVYf5XdkfYRAuGeIxnKaGAefgzKzaNmT857IsX5OE2p5rMAZL52uHPcG34dQ+KbRTa6MWvhZm1+YHHUklrCja/aGhx+WSj9J+Al8amN8tmONpTPOJA6zCl6lkVkL+xJpwqXeVgfyYM9OVizHNBWzxdJ3dYjH2XqRd3QhgLOymf2+dZb9TrUOpIsrNwXtInVVDKLTBBFr5+wLj6bV1G+hxvCdvl7W8lQ29NF2iE0pk2Ep07VrViDJKBUeIe5VoZnyzcOG03hZ+wFYanoKaDS6iYg9WTvuR/RkgVbRewWy9QzNLOanYTbaSEvyHC1OTl5olnYTOBR0bWr3mT68f4qLTuIIfd+I6C67wW3FJYLQ4vP8NjsXqwHU3/bWqtJgeRBXrhdytI2f5UBBIxcVnHgnw1NzKqFz07fnyU7b70BsMBvDk96gPLqDemkZzPh7RzqiC7DOpOFBroUJbU0SV2DqqEjl0bgSZus3D89ZnJ0lCAFo+qpdNRldA6PTh7lQrVe3Its1qivtAUmjdFGm7/kkIwTLUfZMJauFf2ln6v5vReExLsQmfgPKdL9ddUMcBRuCTCp/zYDF9J1JLWf5A==
X-Forefront-Antispam-Report: 
	CIP:18.7.68.33;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:outgoing-alum.mit.edu;PTR:outgoing-alum.mit.edu;CAT:NONE;SFS:(13230040)(82310400026)(41320700013)(43022699015)(1800799024)(376014)(23010399003)(36860700016)(786006)(22082099003)(18002099003)(56012099006)(261102123227099003)(8096899003)(13003099007)(10067099003)(261009223027099003)(261022105027099003)(261022115727099003)(261021121427099003)(261021123027099003)(261022075727099003)(4143699003)(261028144727099003)(261026140227099003)(261026121527099003)(15866825006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Rfc1F33ys19Z+eNi6Ch3XxifWRVPJQimtKvRuyP8tqtQG2iorV5mmu/d7DDbC0MqmpQ0F7jufL2BMwhtIpCb7TvetBXNI/kuvS5GJK7b79wlJN62TlNKVMeVCTXi+t/EQwXbKKiuZpBARUCE4q4DDCZ1xP2w7wGXz50mtpwzZEaNBMB63CF1Y+Krqc+o+h5bE0/cTg5zmyZ7Sb+6wKv056z8XxZkcBkmbmYh9BJuZloIbLWWxsuJjtzALdTPEfrdJqkGJcSyibssR7xFdnCLufNo1NAldvDhli6FXS2dYgA/SSeXlSJgCr7/2lw+pXTW0rPRzwLEmODriarFFfCE+dZWm4O0GbXNV4JHSDtkX5NV0eCpL3NQNdcugmfPg6fuoga2AzGva2amuoCzfzzVs8lSVFQpN/PmHzmhsJNxH+G1Q9Gk4T6RP8w0voEKl878
X-OriginatorOrg: alum.mit.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 04:45:42.4153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 94bf8b92-adb4-4518-b46f-08df3965515e
X-MS-Exchange-CrossTenant-Id: 3326b102-c043-408b-a990-b89e477d582f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3326b102-c043-408b-a990-b89e477d582f;Ip=[18.7.68.33];Helo=[outgoing-alum.mit.edu]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9598
Message-ID-Hash: DZOOKFBSDZI4IFNAUO4OSK24CPUZWPGV
X-Message-ID-Hash: DZOOKFBSDZI4IFNAUO4OSK24CPUZWPGV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DZOOKFBSDZI4IFNAUO4OSK24CPUZWPGV/>
Archived-At: 
 <https://lore.freedesktop.org/CAKb7UvjLNuvu6ze5+2KkDJKz0jBwxQyXGOzwMzBc2ZEV3FJU=A@mail.gmail.com/>
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

--00000000000029af6e065f57ef69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, no traces, but here's the vbios in case it's interesting:

https://people.freedesktop.org/~imirkin/traces/gf108-quadro-600.rom

On Sat, Oct 31, 2026 at 11:08=E2=80=AFAM =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=
=B0=D0=BD=D0=B4=D1=80 =D0=94=D0=B5=D1=80=D0=B5=D0=B2=D1=8F=D0=BD=D0=BA=D0=
=BE <xnderv@yandex.com>
wrote:

> Hi Ilia,
>
> Thank you for digging it out, this is very useful.
>
> One thing in Ben's branch matches our results exactly: "bios/perf: parse
> flags attached to clock frequencies" (bit 0x8000
> =3D no PLL, bit 0x4000 =3D no divider, marked "not entirely certain"). We
> arrived at the same reading independently from the
> trace database Martin gave us access to: across 32 Fermi boards the NVIDI=
A
> driver's choice between a PLL and a divider
> followed those two bits in all 425 clock/level pairs we checked, and wher=
e
> neither bit is set it follows the frequency.
> So Ben was right.
>
> In the branch the flags only reach the memory code, though; the core
> clocks still go through the existing gf100 code.
> On our GTX 560 Ti that code has a few problems that would explain "works
> on some boards, not on others": the PLL bypass bit
> set after lock (our core ended up at ~25 MHz), the hubk06 PLL reference
> taken as 1620 MHz instead of 405, no PTHERM
> slowdown around the mux switches (the NVIDIA driver always does that), an=
d
> the switch carrying on after a mux timeout.
>
> About your Quadro 600: in the VBIOS images we have of that board
> (10de:0df8) the top level asks for 1280 MHz on hubk01
> while hubk06, whose PLL hubk01 has to share, is at 1012 MHz. The table
> cannot be met there, and we don't know what the
> NVIDIA driver does in that case. If you still have the card and ever feel
> like recording the NVIDIA 390 driver on it
> (our script does it in one evening, see issue #2 on
> github.com/xnderv/nouveau-fix), that would close exactly that gap.
> No pressure at all.
>
> We'll credit Ben's branch when any of this goes upstream.
>
> Cheers,
> Alex
>
> ----------------
> =D0=9A=D0=BE=D0=BC=D1=83: =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=
=B4=D1=80 =D0=94=D0=B5=D1=80=D0=B5=D0=B2=D1=8F=D0=BD=D0=BA=D0=BE (xnderv@ya=
ndex.com);
> =D0=9A=D0=BE=D0=BF=D0=B8=D1=8F: Martin Roukala (martin.peres@free.fr),
> nouveau@lists.freedesktop.org;
> =D0=A2=D0=B5=D0=BC=D0=B0: [RFC] Fermi (GF11x) reclocking: a model of the =
NVIDIA driver's clock
> management, a lab nouveau module, and a call for NVIDIA 390 traces from
> GDDR5 cards;
> 31.10.2026, 06:02, "Ilia Mirkin" <imirkin@alum.mit.edu>:
>
> https://github.com/imirkin/nouveau/commits/devel-clk
>
> This is what I have locally from ... some years back :) Like I said, it
> never worked for me. But I do think it worked for Ben on some of his card=
s.
>
> Cheers,
>
>   -ilia
>
> On Fri, Oct 30, 2026 at 11:05=E2=80=AFAM Ilia Mirkin <imirkin@alum.mit.ed=
u> wrote:
>
> Perhaps I got the board model wrong - going from memory. It was a Quadro
> with a GF108 (nvc1) chip - perhaps Quadro 600. I'll track it down over th=
e
> weekend.
>
> On Fri, Oct 30, 2026 at 8:07=E2=80=AFAM =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=
=B0=D0=BD=D0=B4=D1=80 =D0=94=D0=B5=D1=80=D0=B5=D0=B2=D1=8F=D0=BD=D0=BA=D0=
=BE <xnderv@yandex.com>
> wrote:
>
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

--00000000000029af6e065f57ef69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, no traces, but here&#39;s the vbios in case it&#39;=
s interesting:<div><br></div><div><a href=3D"https://people.freedesktop.org=
/~imirkin/traces/gf108-quadro-600.rom">https://people.freedesktop.org/~imir=
kin/traces/gf108-quadro-600.rom</a></div></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct =
31, 2026 at 11:08=E2=80=AFAM =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=
=B4=D1=80 =D0=94=D0=B5=D1=80=D0=B5=D0=B2=D1=8F=D0=BD=D0=BA=D0=BE &lt;<a hre=
f=3D"mailto:xnderv@yandex.com">xnderv@yandex.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div><div><div>Hi Ilia,</di=
v><div>=C2=A0</div><div>Thank you for digging it out, this is very useful.<=
/div><div>=C2=A0</div><div>One thing in Ben&#39;s branch matches our result=
s exactly: &quot;bios/perf: parse flags attached to clock frequencies&quot;=
 (bit 0x8000</div><div>=3D no PLL, bit 0x4000 =3D no divider, marked &quot;=
not entirely certain&quot;). We arrived at the same reading independently f=
rom the</div><div>trace database Martin gave us access to: across 32 Fermi =
boards the NVIDIA driver&#39;s choice between a PLL and a divider</div><div=
>followed those two bits in all 425 clock/level pairs we checked, and where=
 neither bit is set it follows the frequency.</div><div>So Ben was right.</=
div><div>=C2=A0</div><div>In the branch the flags only reach the memory cod=
e, though; the core clocks still go through the existing gf100 code.</div><=
div>On our GTX 560 Ti that code has a few problems that would explain &quot=
;works on some boards, not on others&quot;: the PLL bypass bit</div><div>se=
t after lock (our core ended up at ~25 MHz), the hubk06 PLL reference taken=
 as 1620 MHz instead of 405, no PTHERM</div><div>slowdown around the mux sw=
itches (the NVIDIA driver always does that), and the switch carrying on aft=
er a mux timeout.</div><div>=C2=A0</div><div>About your Quadro 600: in the =
VBIOS images we have of that board (10de:0df8) the top level asks for 1280 =
MHz on hubk01</div><div>while hubk06, whose PLL hubk01 has to share, is at =
1012 MHz. The table cannot be met there, and we don&#39;t know what the</di=
v><div>NVIDIA driver does in that case. If you still have the card and ever=
 feel like recording the NVIDIA 390 driver on it</div><div>(our script does=
 it in one evening, see issue #2 on <a href=3D"http://github.com/xnderv/nou=
veau-fix" target=3D"_blank">github.com/xnderv/nouveau-fix</a>), that would =
close exactly that gap.</div><div>No pressure at all.</div><div>=C2=A0</div=
><div>We&#39;ll credit Ben&#39;s branch when any of this goes upstream.</di=
v><div>=C2=A0</div><div>Cheers,</div><div>Alex</div></div></div><div>=C2=A0=
</div><div>----------------</div><div>=D0=9A=D0=BE=D0=BC=D1=83: =D0=90=D0=
=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=B4=D1=80 =D0=94=D0=B5=D1=80=D0=B5=D0=
=B2=D1=8F=D0=BD=D0=BA=D0=BE (<a href=3D"mailto:xnderv@yandex.com" target=3D=
"_blank">xnderv@yandex.com</a>);</div><div>=D0=9A=D0=BE=D0=BF=D0=B8=D1=8F: =
Martin Roukala (<a href=3D"mailto:martin.peres@free.fr" target=3D"_blank">m=
artin.peres@free.fr</a>), <a href=3D"mailto:nouveau@lists.freedesktop.org" =
target=3D"_blank">nouveau@lists.freedesktop.org</a>;</div><div>=D0=A2=D0=B5=
=D0=BC=D0=B0: [RFC] Fermi (GF11x) reclocking: a model of the NVIDIA driver&=
#39;s clock management, a lab nouveau module, and a call for NVIDIA 390 tra=
ces from GDDR5 cards;</div><div>31.10.2026, 06:02, &quot;Ilia Mirkin&quot; =
&lt;<a href=3D"mailto:imirkin@alum.mit.edu" target=3D"_blank">imirkin@alum.=
mit.edu</a>&gt;:</div><blockquote><div><a href=3D"https://github.com/imirki=
n/nouveau/commits/devel-clk" rel=3D"noopener noreferrer" target=3D"_blank">=
https://github.com/imirkin/nouveau/commits/devel-clk</a><div>=C2=A0</div><d=
iv>This is what I have locally from ... some years back :) Like I said, it =
never worked for me. But I do think it worked for Ben on some of his cards.=
</div><div>=C2=A0</div><div>Cheers,</div><div>=C2=A0</div><div>=C2=A0 -ilia=
</div></div>=C2=A0<div><div>On Fri, Oct 30, 2026 at 11:05=E2=80=AFAM Ilia M=
irkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu" rel=3D"noopener noreferre=
r" target=3D"_blank">imirkin@alum.mit.edu</a>&gt; wrote:</div><blockquote s=
tyle=3D"border-left:1px solid rgb(204,204,204);margin:0px 0px 0px 0.8ex;pad=
ding-left:1ex"><div>Perhaps I got the board model wrong - going from memory=
. It was a Quadro with a GF108 (nvc1) chip - perhaps Quadro 600. I&#39;ll t=
rack it down over the weekend.</div>=C2=A0<div><div>On Fri, Oct 30, 2026 at=
 8:07=E2=80=AFAM =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=B4=D1=80 =D0=
=94=D0=B5=D1=80=D0=B5=D0=B2=D1=8F=D0=BD=D0=BA=D0=BE &lt;<a href=3D"mailto:x=
nderv@yandex.com" rel=3D"noopener noreferrer" target=3D"_blank">xnderv@yand=
ex.com</a>&gt; wrote:</div><blockquote style=3D"border-left:1px solid rgb(2=
04,204,204);margin:0px 0px 0px 0.8ex;padding-left:1ex"><div><div>Hi Ilia,</=
div><div>=C2=A0</div><div>Yes, very much of interest, thank you.<br><br>Wha=
tever is easiest for you: a git bundle or a tarball of the branch, or a pus=
h to any public place. If Ben&#39;s commit messages or notes say which boar=
ds he tried, even better.</div><div>=C2=A0</div><div>Your Quadro 400 story =
rings a bell. On our GTX 560 Ti the same core clock switch runs for hours i=
n some boots and gets stuck in others, with the same module and the same se=
quence of writes. We have not found yet what decides it. If you remember ho=
w it failed on your board (a hang at the switch, memory training, corruptio=
n on screen?), that would help us compare. Also, if I&#39;m not mistaken th=
e Quadro 400 is a GT216: was that with the GT21x reclocking, or did Ben&#39=
;s Fermi branch cover it too?</div><div>=C2=A0</div><div>Cheers, Alex</div>=
</div><div>=C2=A0</div><div>----------------</div><div>=D0=9A=D0=BE=D0=BC=
=D1=83: Martin Roukala (<a href=3D"mailto:martin.peres@free.fr" rel=3D"noop=
ener noreferrer" target=3D"_blank">martin.peres@free.fr</a>);</div><div>=D0=
=9A=D0=BE=D0=BF=D0=B8=D1=8F: <a href=3D"mailto:nouveau@lists.freedesktop.or=
g" rel=3D"noopener noreferrer" target=3D"_blank">nouveau@lists.freedesktop.=
org</a>;</div><div>=D0=A2=D0=B5=D0=BC=D0=B0: [RFC] Fermi (GF11x) reclocking=
: a model of the NVIDIA driver&#39;s clock management, a lab nouveau module=
, and a call for NVIDIA 390 traces from GDDR5 cards;</div><div>29.10.2026, =
18:46, &quot;Ilia Mirkin&quot; &lt;<a href=3D"mailto:imirkin@alum.mit.edu" =
rel=3D"noopener noreferrer" target=3D"_blank">imirkin@alum.mit.edu</a>&gt;:=
</div><blockquote><div>Not sure if Ben&#39;s still around on this list, but=
 at one point he had a non-working fermi reclocking branch. This stuff is c=
omplicated unfortunately... it worked on (some?) of his boards, but then e.=
g. on my identical Quadro 400 board, it didn&#39;t work (but worked on his =
Quadro 400). I did some very basic searching but couldn&#39;t find it onlin=
e, unfortunately it looks like <a href=3D"http://cgit.freedesktop.org/" rel=
=3D"noopener noreferrer" target=3D"_blank">cgit.freedesktop.org</a> has die=
d, so finding this stuff is much harder now. I have it locally somewhere if=
 it&#39;s of interest.<div>=C2=A0</div><div>Cheers,</div><div>=C2=A0</div><=
div>=C2=A0 -ilia</div></div>=C2=A0<div><div>On Thu, Oct 29, 2026 at 1:24=E2=
=80=AFAM Martin Roukala &lt;<a href=3D"mailto:martin.peres@free.fr" rel=3D"=
noopener noreferrer" target=3D"_blank">martin.peres@free.fr</a>&gt; wrote:<=
/div><blockquote style=3D"border-left:1px solid rgb(204,204,204);margin:0px=
 0px 0px 0.8ex;padding-left:1ex">Hi Alex,<br><br>On 28/10/2026 20:50, Alex =
wrote:<br>&gt; Hi,<br>&gt;<br>&gt; this is a hobby project, not a patch ser=
ies yet, but it may interest people who still have Fermi cards.<br>&gt;<br>=
&gt; Since early October we have been recording the NVIDIA 390.157 driver w=
ith mmiotrace on a GTX 560 Ti (GF114)<br>&gt; and on a second card (GTS 450=
, GF106, recorded by its owner), plus the last pre-390 drivers (270.x) on a=
 2011-era<br>&gt; stand, and turning what the driver does into a written mo=
del: which registers it touches in which order, which<br>&gt; waits it make=
s, and which of those steps are actually necessary (checked one change at a=
 time, 60+ experiments).<br>&gt; Everything is from our own traces, VBIOS t=
ables and open code (nouveau, NVIDIA&#39;s open Tegra/nvgpu code, open-gpu-=
doc);<br>&gt; no decompilation of the proprietary driver is used, so the re=
sults can go upstream if they are good enough.<br>&gt;<br>&gt; What we have=
 so far:<br>&gt; - Core reclocking on GF114 with nouveau&#39;s gf100 clock =
code plus the PTHERM/FSRM &quot;bracket&quot; the NVIDIA driver puts<br>&gt=
;=C2=A0 =C2=A0 around every domain mux switch (slowdown engaged before the =
switch, released after). Without the bracket the GPC<br>&gt;=C2=A0 =C2=A0 m=
ux sticks occasionally on our card; with it and a dwell of ~4 us after the =
&quot;engaged&quot; flag, 0 stuck in thousands of<br>&gt;=C2=A0 =C2=A0 tran=
sitions. NVIDIA 390 waits 8 us by its own timer; 270.41.06 wraps only the m=
ux write. Details, numbers and the<br>&gt;=C2=A0 =C2=A0 register-level map =
are in the repository.<br><br>Interesting, I don&#39;t remember ever seeing=
 nvidia program the FSRM around<br>reclocking... but I barely looked at Fer=
mi+ reclocking as I was more<br>concerned with the Tesla and under era.<br>=
<br>&gt; - Memory reclocking (GDDR5, 135/324/2004 MHz) by replaying the PMU=
 memory scripts and host writes the NVIDIA driver ran<br>&gt;=C2=A0 =C2=A0 =
on the same card, through nouveau&#39;s memx. A generator that derives thos=
e scripts from any board&#39;s VBIOS reproduces<br>&gt;=C2=A0 =C2=A0 88 % o=
f the registers on the second card; the rest is chip-level layout and drive=
r-init bits.<br><br><br><br>&gt; - A VBIOS corpus of 306 Fermi images (with=
 TechPowerUp&#39;s permission) that shows what is per-family, per-chip and<=
br>&gt;=C2=A0 =C2=A0 per-board.<br><br>We have a private database of a ton =
of vbioses + associated mmiotraces,<br>I could give you access if you are i=
nterested and the repo still exists<br>somewhere :D<br><br>&gt;<br>&gt; Wha=
t we are looking for: owners of Fermi cards with GDDR5 (GF100/GF104/GF106/G=
F110/GF114/GF116 - GTX 4xx/5xx,<br>&gt; GTS 450, Quadro 2000-6000) willing =
to spend one evening recording the NVIDIA 390 driver with our script (needs=
 a spare<br>&gt; disk with 390.157 and a kernel with CONFIG_MMIOTRACE) and =
to send the trace plus their VBIOS image. In return they get a<br>&gt; buil=
d of the lab module with their card&#39;s own sequences, and everything lea=
rned is published. It is a lab module:<br>&gt; hangs are possible, no warra=
nty, no support promises.<br>&gt;<br>&gt; Repository and the call with deta=
ils: <a href=3D"https://github.com/xnderv/nouveau-fix" rel=3D"noopener nore=
ferrer" target=3D"_blank">https://github.com/xnderv/nouveau-fix</a> (issue =
#2).<br>&gt; Comments on the approach are welcome too, especially on what w=
ould be needed for an upstreamable version.<br><br>Seems like a fun project=
, I wish you a lot of fun with it! If you need<br>historical context, pleas=
e ping me at `<a href=3D"mailto:martin.roukala@mupuf.org" rel=3D"noopener n=
oreferrer" target=3D"_blank">martin.roukala@mupuf.org</a>`, or on<br>IRC (i=
n the #nouveau channel on OFTC, please ping mupuf).<br><br>Cheers,<br>Marti=
n<br><br>&gt;<br>&gt; Thanks,<br>&gt; Alex (xnderv on GitHub)<br>=C2=A0</bl=
ockquote></div></blockquote></blockquote></div></blockquote></div></blockqu=
ote></blockquote></div>

--00000000000029af6e065f57ef69--
