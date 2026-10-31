Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFBB606A31A
	for <nouveau@archiver.kernel.org>; Sat, 31 Oct 2026 03:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=alum.mit.edu header.i=@alum.mit.edu header.a=rsa-sha256 header.s=selector2 header.b=GdjDjvMb
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F276410E0E6;
	Sat, 31 Oct 2026 03:02:56 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6711A48C5E;
	Sat, 31 Oct 2026 02:43:43 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793414623;
 b=L6FEwKFphvqFB83bbis7Cnc6wy+zBwaGoy6kjdeJ2cYfUudIlUJTYz+O40YVvwhe0o43N
 4Y8Ylbw31vYn0ZS6Fd1TB+pZz5f7u0wyfaxkJGK8+bpCOs30xLdAxsNMrU/Zo+zBu3LuFdi
 4TxRgRut0uvrhc7OXzXLxGKc6D1DfrsEXh7zz+BMbx2wa/X95A9/CUIbRasZ6+1Upzv+ntw
 fbSfytPdIovgeRBbAc4AtwS6GKCJqRs5F4SibSkVd2+DvWtk8NIOkZ0/IO7qapNVYKbnJeb
 2RQXMhn7FvK9gO6eeqVXIwy8SFngU9VdI2ErtIwk3zhyZD1ur+N1FzVyHJig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793414623; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+EbcYMbKKl2XMvKfm2SUjfY+/TEHCMd9dqwOxYgG7EU=;
 b=eSNRT+eb/4FzMKZi6kd2bMxq6RJoBZXEV2BXnaLhK++eJgZzj8dD0kUX5nlcjxMHT4PjL
 64zlzJA1G2V3a1uFSGDZ16RNfNDGGhiMpDzDKwOgMtJTMyRguWW6XehZzCrh49OxkSbZsP9
 wl+SWJo+9sGGdW6QG04J4j8REdvMji9JNGPf+wIQ8PuPbnbm/j8vX/mt5uNvFdEZhnIGCZQ
 tlXUceGffw+6mC0xA4ze4r1E28MQhTGHHlOvsWCsWNT0CawAiMyWQt0VkbC8Bt39/voS1pL
 tpmt82T6154dLLUYAFH9fT4tZE6Kzq9jJPgjSmFlar7S0kmdtRLauI1lNpQw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=alum.mit.edu;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=alum.mit.edu
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=alum.mit.edu;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=alum.mit.edu policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 007BA4711B
	for <nouveau@lists.freedesktop.org>; Sat, 31 Oct 2026 02:43:40 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11020131.outbound.protection.outlook.com [52.101.46.131])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 34BE010E081
	for <nouveau@lists.freedesktop.org>; Sat, 31 Oct 2026 03:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPX8uGvJbo/pzcoVSloa6jUiFINJPdBkvViDkio5JdfuGlvXxJpoiE/aoJkpIYabaqG1heTelT1vxh3tKvNwuh3nRIwkNcd0T3CaonK5vx1tu1TjitxR1gIq8eFutoZB6/40JGnG2j1kaOJQ6+k1s038Z/TqSWTbgLFh2m9TLxJP3dXoLOR4j4D3WZl3iL97pe5JnIm7r2JyNOcKbk9Cx+zR66DFlS0HUuciNQFd3zhlTZKY/pI+Cyi5hQWrh/7HxNaobn4a7bS8wzhjYt7pO2kvwOOAgg97YxXzS76h/HO1mECIYmFKa0XEDzISAFo6F4N4YcqsxAI57u7zzIS6hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EbcYMbKKl2XMvKfm2SUjfY+/TEHCMd9dqwOxYgG7EU=;
 b=bOkmSXSGmeSTeTySmGbQ/bXRJl8F3zLr95ewu0OBBlXaNDBpHL/ZeD0fi4gKBAz8YsVXRBkwi+CGpzoQMwJXZla2FA+YRQKrnSYFLMs345xZnelewSNif0XhDFOaxFwlap5rrkHH/9wgcKtnx6bPYaRt05zgi1SA6CGl13OafhG09S/xr5UZBIbm257vR7kADGVZnZZsTtPeo6/FgeQ7F8NpNGr6KdsTW5ZE0IY7usO5Sg0v3mjMufWYGziSwaES7Zo6QRgizv06CI3SjW3UrBpwaOmKB1KQTYnCNbAK1O3VPEq6CrreJTDsG6L399BzDIYh8srGOt/+AUHkUSsG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 18.7.68.33) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=alum.mit.edu; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=alum.mit.edu; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alum.mit.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EbcYMbKKl2XMvKfm2SUjfY+/TEHCMd9dqwOxYgG7EU=;
 b=GdjDjvMbBhXAJByGqKTKWt0mIcDVYYUgohDXkAt2f9sFG9dU3/zjjB7+A1K9h+33OTk5s7t1qGFlwfZWNObrS91g6BFqvG3icVmoPiJuHy7g3UREEDzrnFQIpNdm8BPzXCD0rzZ3oc3EBEZK5Qi/hGpeXUTilMDZOkK9rJI6HZo=
Received: from DS1PR06CA0010.namprd06.prod.outlook.com (2603:10b6:8:458::17)
 by BN7PPFED9549B84.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Sat, 31 Oct
 2026 03:02:46 +0000
Received: from DM3PEPF000265C3.namprd03.prod.outlook.com
 (2603:10b6:8:458:cafe::58) by DS1PR06CA0010.outlook.office365.com
 (2603:10b6:8:458::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Sat,
 31 Oct 2026 03:02:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 18.7.68.33) smtp.mailfrom=alum.mit.edu; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=alum.mit.edu;
Received-SPF: Pass (protection.outlook.com: domain of alum.mit.edu designates
 18.7.68.33 as permitted sender) receiver=protection.outlook.com;
 client-ip=18.7.68.33; helo=outgoing-alum.mit.edu; pr=C
Received: from outgoing-alum.mit.edu (18.7.68.33) by
 DM3PEPF000265C3.mail.protection.outlook.com (10.167.23.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Sat, 31 Oct 2026 03:02:45 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
	(authenticated bits=0)
        (User authenticated as imirkin@ALUM.MIT.EDU)
	by outgoing-alum.mit.edu (8.14.7/8.12.4) with ESMTP id 69V32dhB014549
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2026 23:02:41 -0400
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c4cb6834eaaso108731666b.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 30 Oct 2026 20:02:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwD8bL1+uiFfQifE4HXhW9j39TsfeGrtbou9wL5h9X1NXCdHkVQDGWHJx8St3M7TRZ/Pc8GqA+U@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKuTsfnrCdi4Hgl3Q1GQNPTklFTlSpzSV1FR1CfLhepMaQYTbC/
	UP4JuTCiJce8/iX2HRK8Jxvf6nuzLXlZqpcUzab+s1rxl7BZR9A978TYgMgpYX2bUFaNwpJzOX4
	brd1YuuvmvwOa5A36hDVNHhXH7W8m6JU=
X-Received: by 2002:a17:906:ef0b:b0:c33:923b:ad66 with SMTP id
 a640c23a62f3a-c4ca7acfb4cmr371126766b.43.1793415759590; Fri, 30 Oct 2026
 20:02:39 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028185052.54427-1-xnderv@yandex.com>
 <8abb7b92-c16a-47a9-8caf-49773845c246@free.fr>
 <CAKb7UvgJwO1C4=jR9V9mkbs=JA2wi2ptCOeJdG0-eL+gKoOdaQ@mail.gmail.com>
 <99331793361990@mail.yandex.ru>
 <CAKb7Uvg2By0noK7MCg3Dzk+=zrmuYUr2dx6jq_yQC9SMV8BV2Q@mail.gmail.com>
In-Reply-To: 
 <CAKb7Uvg2By0noK7MCg3Dzk+=zrmuYUr2dx6jq_yQC9SMV8BV2Q@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 30 Oct 2026 23:02:27 -0400
X-Gmail-Original-Message-ID: 
 <CAKb7Uvi_UAOCSSF-116ytB89L++UPpfps_JTOXwUQL+MW49AnQ@mail.gmail.com>
X-Gm-Features: AclHuK8RoMqYlLUEzyndf5B7GdYIbznNv4z3GSUaUppW8naZfoRLDK-IsDwAqq8
Message-ID: 
 <CAKb7Uvi_UAOCSSF-116ytB89L++UPpfps_JTOXwUQL+MW49AnQ@mail.gmail.com>
Subject: Re: [RFC] Fermi (GF11x) reclocking: a model of the NVIDIA driver's
 clock management, a lab nouveau module, and a call for NVIDIA 390 traces from
 GDDR5 cards
To: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCU0LXRgNC10LLRj9C90LrQvg==?=
 <xnderv@yandex.com>
Content-Type: multipart/alternative; boundary="00000000000048faea065f1a25d1"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C3:EE_|BN7PPFED9549B84:EE_
X-MS-Office365-Filtering-Correlation-Id: 0403f338-0a36-48d7-26e6-08df36fb7041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|786006|1800799024|376014|43022699015|36860700016|41320700013|23010399003|82310400026|261021123027099003|261026121527099003|261022115727099003|56012099006|261021121427099003|261022075727099003|261009223027099003|261022105027099003|10067099003|4143699003|18002099003|261026140227099003|22082099003|8096899003|13003099007|261028144727099003|15866825006;
X-Microsoft-Antispam-Message-Info: 
	Ye1DibF+sE4X8A/S8MxurWuKbW11lCGioT5I0ZJrTQ3QGM9Acm3xowr3AMW29NW6NWHOXfYTPdcXLKLomHbUSII9vpoc3B8+Ep+cQCyKxd1yZt6YocXjB6GE3jqwyfnyJ78NfPOe5eB+Np4ik7Mano2c3kuM6kvNtnBlsOrEWS3KhZi5JCuQ59+InEYI/J4m2UTrlMSI4on4SfDffsjNnA5U94fiHTHrr/swS3UAbhphiqlIZuQkUi29J44f9ACWOAR2i+FcHrkOobivF39tD+mPElziZLUTStxB1T+7bw+1DHvCzdEvDk14u1k1qdZxqaBbey8A3Lz5q61+rhVua82kXkMCYQrhXJ3CF24gA88M4l1ppG6QBu6jJS5RsBliRPXAV5GTs336JE40qDNv5184rg7jZGyljodb6oANHi4VmT+JSa/RaE7YqH/7bnFJwg11fL7Tw1Sh/cSsfzaUXaqJXy/yjdWuQtnpcJQrkTE9jzcThy8ApL+KifE/jQCqfYps5igk3fnmYXDos891z9/o6IhSR4t1H8N/ZT8MfEXBasuTnDcWdXdjwxQOoekmnbexH2LF4ZOUSFaaLZM4ahnU3xxixnZoDz0DTRE611L5McJVpZ0rII35Fx3xZJuna9ipLPgsObFGyS1Goq3Hb9Ptm4fD9uvIYKZKesr/mXqq7W6IBHK04VRuiniUQ/uL02K+cT3wCIFCWneo1lBlVw==
X-Forefront-Antispam-Report: 
	CIP:18.7.68.33;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:outgoing-alum.mit.edu;PTR:outgoing-alum.mit.edu;CAT:NONE;SFS:(13230040)(786006)(1800799024)(376014)(43022699015)(36860700016)(41320700013)(23010399003)(82310400026)(261021123027099003)(261026121527099003)(261022115727099003)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(261022105027099003)(10067099003)(4143699003)(18002099003)(261026140227099003)(22082099003)(8096899003)(13003099007)(261028144727099003)(15866825006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	O3M5qS2JvHYTHrQV2ZwmO4Acgzy2YYMju6HZfw9FE4jQ7xbaE5v0PSb7+lI10g2JvSoa1mqDhy1ZoCvf1F9EgGOPUIFYq2XDjwvjV7VJDc1SCusrarDg3SZWz1w6EEmfzvqd63EprJnPi/IqdPyIXBQkl/3Hh6tJUMksj2dfKQC3HstEPaLKaw4LdeQLmJi89ZbsugZn9K2q/sO4jWIi9EV087fWcQxc4l4KCOa+dybSIgDZSJRHy36uITmCyvkdrIwjoRPAjgPh8wV0nAh7lZwrfwwDke4nqYoaetBO9JWxMN3gjOvT7P6Zm5OtZUyy+k7yt4xCh/bI6q2nJeh0whF+DH7lLrtX7CDAQdDDT+0pXI7q/rz1n8/5E8L+6kgq4saIvTrcAuwIb/6Pcik8SO0mCRtLiiDHSJee9ynopFbAKkvFRwB9mp8wiaV/+LJ6
X-OriginatorOrg: alum.mit.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2026 03:02:45.5199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0403f338-0a36-48d7-26e6-08df36fb7041
X-MS-Exchange-CrossTenant-Id: 3326b102-c043-408b-a990-b89e477d582f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3326b102-c043-408b-a990-b89e477d582f;Ip=[18.7.68.33];Helo=[outgoing-alum.mit.edu]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM3PEPF000265C3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFED9549B84
Message-ID-Hash: F6462IBNV65NLPF6PM4CPY74JXQTCTTN
X-Message-ID-Hash: F6462IBNV65NLPF6PM4CPY74JXQTCTTN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F6462IBNV65NLPF6PM4CPY74JXQTCTTN/>
Archived-At: 
 <https://lore.freedesktop.org/CAKb7Uvi_UAOCSSF-116ytB89L++UPpfps_JTOXwUQL+MW49AnQ@mail.gmail.com/>
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

--00000000000048faea065f1a25d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://github.com/imirkin/nouveau/commits/devel-clk

This is what I have locally from ... some years back :) Like I said, it
never worked for me. But I do think it worked for Ben on some of his cards.

Cheers,

  -ilia

On Fri, Oct 30, 2026 at 11:05=E2=80=AFAM Ilia Mirkin <imirkin@alum.mit.edu>=
 wrote:

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
>> Hi Ilia,
>>
>> Yes, very much of interest, thank you.
>>
>> Whatever is easiest for you: a git bundle or a tarball of the branch, or
>> a push to any public place. If Ben's commit messages or notes say which
>> boards he tried, even better.
>>
>> Your Quadro 400 story rings a bell. On our GTX 560 Ti the same core cloc=
k
>> switch runs for hours in some boots and gets stuck in others, with the s=
ame
>> module and the same sequence of writes. We have not found yet what decid=
es
>> it. If you remember how it failed on your board (a hang at the switch,
>> memory training, corruption on screen?), that would help us compare. Als=
o,
>> if I'm not mistaken the Quadro 400 is a GT216: was that with the GT21x
>> reclocking, or did Ben's Fermi branch cover it too?
>>
>> Cheers, Alex
>>
>> ----------------
>> =D0=9A=D0=BE=D0=BC=D1=83: Martin Roukala (martin.peres@free.fr);
>> =D0=9A=D0=BE=D0=BF=D0=B8=D1=8F: nouveau@lists.freedesktop.org;
>> =D0=A2=D0=B5=D0=BC=D0=B0: [RFC] Fermi (GF11x) reclocking: a model of the=
 NVIDIA driver's
>> clock management, a lab nouveau module, and a call for NVIDIA 390 traces
>> from GDDR5 cards;
>> 29.10.2026, 18:46, "Ilia Mirkin" <imirkin@alum.mit.edu>:
>>
>> Not sure if Ben's still around on this list, but at one point he had a
>> non-working fermi reclocking branch. This stuff is complicated
>> unfortunately... it worked on (some?) of his boards, but then e.g. on my
>> identical Quadro 400 board, it didn't work (but worked on his Quadro 400=
).
>> I did some very basic searching but couldn't find it online, unfortunate=
ly
>> it looks like cgit.freedesktop.org has died, so finding this stuff is
>> much harder now. I have it locally somewhere if it's of interest.
>>
>> Cheers,
>>
>>   -ilia
>>
>> On Thu, Oct 29, 2026 at 1:24=E2=80=AFAM Martin Roukala <martin.peres@fre=
e.fr>
>> wrote:
>>
>> Hi Alex,
>>
>> On 28/10/2026 20:50, Alex wrote:
>> > Hi,
>> >
>> > this is a hobby project, not a patch series yet, but it may interest
>> people who still have Fermi cards.
>> >
>> > Since early October we have been recording the NVIDIA 390.157 driver
>> with mmiotrace on a GTX 560 Ti (GF114)
>> > and on a second card (GTS 450, GF106, recorded by its owner), plus the
>> last pre-390 drivers (270.x) on a 2011-era
>> > stand, and turning what the driver does into a written model: which
>> registers it touches in which order, which
>> > waits it makes, and which of those steps are actually necessary
>> (checked one change at a time, 60+ experiments).
>> > Everything is from our own traces, VBIOS tables and open code (nouveau=
,
>> NVIDIA's open Tegra/nvgpu code, open-gpu-doc);
>> > no decompilation of the proprietary driver is used, so the results can
>> go upstream if they are good enough.
>> >
>> > What we have so far:
>> > - Core reclocking on GF114 with nouveau's gf100 clock code plus the
>> PTHERM/FSRM "bracket" the NVIDIA driver puts
>> >    around every domain mux switch (slowdown engaged before the switch,
>> released after). Without the bracket the GPC
>> >    mux sticks occasionally on our card; with it and a dwell of ~4 us
>> after the "engaged" flag, 0 stuck in thousands of
>> >    transitions. NVIDIA 390 waits 8 us by its own timer; 270.41.06 wrap=
s
>> only the mux write. Details, numbers and the
>> >    register-level map are in the repository.
>>
>> Interesting, I don't remember ever seeing nvidia program the FSRM around
>> reclocking... but I barely looked at Fermi+ reclocking as I was more
>> concerned with the Tesla and under era.
>>
>> > - Memory reclocking (GDDR5, 135/324/2004 MHz) by replaying the PMU
>> memory scripts and host writes the NVIDIA driver ran
>> >    on the same card, through nouveau's memx. A generator that derives
>> those scripts from any board's VBIOS reproduces
>> >    88 % of the registers on the second card; the rest is chip-level
>> layout and driver-init bits.
>>
>>
>>
>> > - A VBIOS corpus of 306 Fermi images (with TechPowerUp's permission)
>> that shows what is per-family, per-chip and
>> >    per-board.
>>
>> We have a private database of a ton of vbioses + associated mmiotraces,
>> I could give you access if you are interested and the repo still exists
>> somewhere :D
>>
>> >
>> > What we are looking for: owners of Fermi cards with GDDR5
>> (GF100/GF104/GF106/GF110/GF114/GF116 - GTX 4xx/5xx,
>> > GTS 450, Quadro 2000-6000) willing to spend one evening recording the
>> NVIDIA 390 driver with our script (needs a spare
>> > disk with 390.157 and a kernel with CONFIG_MMIOTRACE) and to send the
>> trace plus their VBIOS image. In return they get a
>> > build of the lab module with their card's own sequences, and everythin=
g
>> learned is published. It is a lab module:
>> > hangs are possible, no warranty, no support promises.
>> >
>> > Repository and the call with details:
>> https://github.com/xnderv/nouveau-fix (issue #2).
>> > Comments on the approach are welcome too, especially on what would be
>> needed for an upstreamable version.
>>
>> Seems like a fun project, I wish you a lot of fun with it! If you need
>> historical context, please ping me at `martin.roukala@mupuf.org`, or on
>> IRC (in the #nouveau channel on OFTC, please ping mupuf).
>>
>> Cheers,
>> Martin
>>
>> >
>> > Thanks,
>> > Alex (xnderv on GitHub)
>>
>>
>>

--00000000000048faea065f1a25d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://github.com/imirkin/nouveau/commits/deve=
l-clk">https://github.com/imirkin/nouveau/commits/devel-clk</a><div><br></d=
iv><div>This is what I have locally from ... some years back :) Like I said=
, it never worked for me. But I do think it worked for Ben on some of his c=
ards.</div><div><br></div><div>Cheers,</div><div><br></div><div>=C2=A0 -ili=
a</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2026 at 11:05=E2=80=AFAM Ilia=
 Mirkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr">Perhaps I got the board model wrong - going from memory. It w=
as a Quadro with a GF108 (nvc1) chip - perhaps Quadro 600. I&#39;ll track i=
t down over the weekend.</div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Oct 30, 2026 at 8:07=E2=80=AFAM =D0=90=D0=
=BB=D0=B5=D0=BA=D1=81=D0=B0=D0=BD=D0=B4=D1=80 =D0=94=D0=B5=D1=80=D0=B5=D0=
=B2=D1=8F=D0=BD=D0=BA=D0=BE &lt;<a href=3D"mailto:xnderv@yandex.com" target=
=3D"_blank">xnderv@yandex.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div><div>Hi Ilia,</div><div>=C2=A0</div><div>=
Yes, very much of interest, thank you.<br><br>Whatever is easiest for you: =
a git bundle or a tarball of the branch, or a push to any public place. If =
Ben&#39;s commit messages or notes say which boards he tried, even better.<=
/div><div>=C2=A0</div><div>Your Quadro 400 story rings a bell. On our GTX 5=
60 Ti the same core clock switch runs for hours in some boots and gets stuc=
k in others, with the same module and the same sequence of writes. We have =
not found yet what decides it. If you remember how it failed on your board =
(a hang at the switch, memory training, corruption on screen?), that would =
help us compare. Also, if I&#39;m not mistaken the Quadro 400 is a GT216: w=
as that with the GT21x reclocking, or did Ben&#39;s Fermi branch cover it t=
oo?</div><div>=C2=A0</div><div>Cheers, Alex</div></div><div>=C2=A0</div><di=
v>----------------</div><div>=D0=9A=D0=BE=D0=BC=D1=83: Martin Roukala (<a h=
ref=3D"mailto:martin.peres@free.fr" target=3D"_blank">martin.peres@free.fr<=
/a>);</div><div>=D0=9A=D0=BE=D0=BF=D0=B8=D1=8F: <a href=3D"mailto:nouveau@l=
ists.freedesktop.org" target=3D"_blank">nouveau@lists.freedesktop.org</a>;<=
/div><div>=D0=A2=D0=B5=D0=BC=D0=B0: [RFC] Fermi (GF11x) reclocking: a model=
 of the NVIDIA driver&#39;s clock management, a lab nouveau module, and a c=
all for NVIDIA 390 traces from GDDR5 cards;</div><div>29.10.2026, 18:46, &q=
uot;Ilia Mirkin&quot; &lt;<a href=3D"mailto:imirkin@alum.mit.edu" target=3D=
"_blank">imirkin@alum.mit.edu</a>&gt;:</div><blockquote><div>Not sure if Be=
n&#39;s still around on this list, but at one point he had a non-working fe=
rmi reclocking branch. This stuff is complicated unfortunately... it worked=
 on (some?) of his boards, but then e.g. on my identical Quadro 400 board, =
it didn&#39;t work (but worked on his Quadro 400). I did some very basic se=
arching but couldn&#39;t find it online, unfortunately it looks like <a hre=
f=3D"http://cgit.freedesktop.org/" rel=3D"noopener noreferrer" target=3D"_b=
lank">cgit.freedesktop.org</a> has died, so finding this stuff is much hard=
er now. I have it locally somewhere if it&#39;s of interest.<div>=C2=A0</di=
v><div>Cheers,</div><div>=C2=A0</div><div>=C2=A0 -ilia</div></div>=C2=A0<di=
v><div>On Thu, Oct 29, 2026 at 1:24=E2=80=AFAM Martin Roukala &lt;<a href=
=3D"mailto:martin.peres@free.fr" rel=3D"noopener noreferrer" target=3D"_bla=
nk">martin.peres@free.fr</a>&gt; wrote:</div><blockquote style=3D"border-le=
ft:1px solid rgb(204,204,204);margin:0px 0px 0px 0.8ex;padding-left:1ex">Hi=
 Alex,<br><br>On 28/10/2026 20:50, Alex wrote:<br>&gt; Hi,<br>&gt;<br>&gt; =
this is a hobby project, not a patch series yet, but it may interest people=
 who still have Fermi cards.<br>&gt;<br>&gt; Since early October we have be=
en recording the NVIDIA 390.157 driver with mmiotrace on a GTX 560 Ti (GF11=
4)<br>&gt; and on a second card (GTS 450, GF106, recorded by its owner), pl=
us the last pre-390 drivers (270.x) on a 2011-era<br>&gt; stand, and turnin=
g what the driver does into a written model: which registers it touches in =
which order, which<br>&gt; waits it makes, and which of those steps are act=
ually necessary (checked one change at a time, 60+ experiments).<br>&gt; Ev=
erything is from our own traces, VBIOS tables and open code (nouveau, NVIDI=
A&#39;s open Tegra/nvgpu code, open-gpu-doc);<br>&gt; no decompilation of t=
he proprietary driver is used, so the results can go upstream if they are g=
ood enough.<br>&gt;<br>&gt; What we have so far:<br>&gt; - Core reclocking =
on GF114 with nouveau&#39;s gf100 clock code plus the PTHERM/FSRM &quot;bra=
cket&quot; the NVIDIA driver puts<br>&gt;=C2=A0 =C2=A0 around every domain =
mux switch (slowdown engaged before the switch, released after). Without th=
e bracket the GPC<br>&gt;=C2=A0 =C2=A0 mux sticks occasionally on our card;=
 with it and a dwell of ~4 us after the &quot;engaged&quot; flag, 0 stuck i=
n thousands of<br>&gt;=C2=A0 =C2=A0 transitions. NVIDIA 390 waits 8 us by i=
ts own timer; 270.41.06 wraps only the mux write. Details, numbers and the<=
br>&gt;=C2=A0 =C2=A0 register-level map are in the repository.<br><br>Inter=
esting, I don&#39;t remember ever seeing nvidia program the FSRM around<br>=
reclocking... but I barely looked at Fermi+ reclocking as I was more<br>con=
cerned with the Tesla and under era.<br><br>&gt; - Memory reclocking (GDDR5=
, 135/324/2004 MHz) by replaying the PMU memory scripts and host writes the=
 NVIDIA driver ran<br>&gt;=C2=A0 =C2=A0 on the same card, through nouveau&#=
39;s memx. A generator that derives those scripts from any board&#39;s VBIO=
S reproduces<br>&gt;=C2=A0 =C2=A0 88 % of the registers on the second card;=
 the rest is chip-level layout and driver-init bits.<br><br><br><br>&gt; - =
A VBIOS corpus of 306 Fermi images (with TechPowerUp&#39;s permission) that=
 shows what is per-family, per-chip and<br>&gt;=C2=A0 =C2=A0 per-board.<br>=
<br>We have a private database of a ton of vbioses + associated mmiotraces,=
<br>I could give you access if you are interested and the repo still exists=
<br>somewhere :D<br><br>&gt;<br>&gt; What we are looking for: owners of Fer=
mi cards with GDDR5 (GF100/GF104/GF106/GF110/GF114/GF116 - GTX 4xx/5xx,<br>=
&gt; GTS 450, Quadro 2000-6000) willing to spend one evening recording the =
NVIDIA 390 driver with our script (needs a spare<br>&gt; disk with 390.157 =
and a kernel with CONFIG_MMIOTRACE) and to send the trace plus their VBIOS =
image. In return they get a<br>&gt; build of the lab module with their card=
&#39;s own sequences, and everything learned is published. It is a lab modu=
le:<br>&gt; hangs are possible, no warranty, no support promises.<br>&gt;<b=
r>&gt; Repository and the call with details: <a href=3D"https://github.com/=
xnderv/nouveau-fix" rel=3D"noopener noreferrer" target=3D"_blank">https://g=
ithub.com/xnderv/nouveau-fix</a> (issue #2).<br>&gt; Comments on the approa=
ch are welcome too, especially on what would be needed for an upstreamable =
version.<br><br>Seems like a fun project, I wish you a lot of fun with it! =
If you need<br>historical context, please ping me at `<a href=3D"mailto:mar=
tin.roukala@mupuf.org" rel=3D"noopener noreferrer" target=3D"_blank">martin=
.roukala@mupuf.org</a>`, or on<br>IRC (in the #nouveau channel on OFTC, ple=
ase ping mupuf).<br><br>Cheers,<br>Martin<br><br>&gt;<br>&gt; Thanks,<br>&g=
t; Alex (xnderv on GitHub)<br>=C2=A0</blockquote></div></blockquote></block=
quote></div>
</blockquote></div>

--00000000000048faea065f1a25d1--
