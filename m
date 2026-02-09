Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7130EEF070B
	for <nouveau@archiver.kernel.org>; Mon,  9 Feb 2026 04:24:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 12F8010E25B;
	Mon,  9 Feb 2026 04:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kggzbqQf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F347541C6C;
	Mon,  9 Feb 2026 04:15:29 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770610529;
 b=iCNtSMc4dZ/eTZHpyiYdyCSj/ffNWWxQpPaU8n3EGj/8cdz6rWJkhScKLYu93l/YOOn0h
 /Hrw6unpb+IbDXyk+tQC8YIlCb2qWenNWNJ23XT63LIq8I56Ixj2VCibCJNk0chAgRT4mFD
 YCaNlhuq+DWM8rEvUuBSK6kCewC9eRu0TeMz+06O9gREbIhOFNtl7o/qJJ0RJ6eWsvT6ccZ
 f7gQ+fw3futZr2RPJmVZdvc8lT063SeetXnuX+ElLRiA3ng0INFs1YsY0q+EQjKKy6w/caP
 vWQUCV2fKPTevZzYZm1rUOn86OCojAxdOOxgJXbCJ3414mwYtB3p0Ywkj1Xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770610529; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+wKl7PrgbOGjbEotMGJv0HKzAAGbKBuMW3G8jeRXqGA=;
 b=MHwcNtiatcttJlGDdeufiwStgJGIgcyd8FeZkETWehayhtjYeXOdQHx0UXQbWG5OX/D7v
 CPcNAxPFXHiHjWKphg7UQjohB+hvq8r6pFPtLu3ibrMjHh/QQBddOqJqL0sbf/h5gpc+7jq
 RdyqXZDNEAALcN8bj9Tap2GmvIWcXZPKGIPmpsLgKh5p2ocp/Q0kjb9TIAFEQMcEj2jL2Dz
 G63UydtJUH9IPSCEEXC9vb5y20qacvvZ5XSWgXE9do546woaACBCZa9XsSK4vhIT4zbGSXO
 St5bbFHtn8o8WaUOfYV5D381Hpc5Ecw/OTtvRFKVhVBDrBGDATROJSpHhRqQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7FA7C404B5
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 04:15:26 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011007.outbound.protection.outlook.com
 [40.93.194.7])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 450C910E185
	for <nouveau@lists.freedesktop.org>; Mon,  9 Feb 2026 04:24:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i656aMfP16GzAQLn3MHaZ4EJHqHP9ooP1+Gh1awtst8vZ7jSOnZbcQgLIqiETEC/Wr+ea/BatgHlHS6QeC2NcPg5R8P/IDghdI0YV76pRcDnw2kq41Edwk/hjR7FlVJFmKps8GOQvz2MVC/xaRggWz3NTg5LtEtFtfEfDRzgArX2lOHg34KVp8sbpJuuXjk2hUBCoOppp2fTO5X7sQu7kBpQqkIyWIp5dwuqO7uKScC7k2zyuoagodg3Zg74HY9o+efTM4XFHn3IZ0cwOSsfJG92vJ4QzkkSDAl3n3ekUUMHEKOwvHAzGdged5NX2yQuTvjGMWo508I9zXb+avP7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wKl7PrgbOGjbEotMGJv0HKzAAGbKBuMW3G8jeRXqGA=;
 b=O6VBazRS3iOqQWHnH9qrEihGmoqAa29pxyPn6wSH1gFW7+H4GQIc2EoP06V3rk39pme0xxbLQI2qBO89hXijCl4T0cndUgKz7pptpBJjr0pI2FUZZkOr6Eb+HSMOU5OREbNGeNZMfv73ATVkLSzDQNt/fRFPRMY+LH3pT8cOx7V5k5aLXbF1nePLuFbVWlX9hm+7VuS/S6X2SrWJbgKFtASuDS1tJvOeCzmNy6xUOGiePOMcMfPEAPu/yySqquxnh6m3Cddxv30dLntRwtG3OrvhIQVfLs/nwsuoBC/F3qI+CwnAmH4uKXYZ5mkhqbsHcway89XQx6icjsHbmK3MuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wKl7PrgbOGjbEotMGJv0HKzAAGbKBuMW3G8jeRXqGA=;
 b=kggzbqQf5uTmBNDFhUdyc5USpuUFZHzNOkrrk7l/42vCyVFPyKboplgVevhvcfjQiIfmE0xXN+/bsKetjzFN8mticMXQ+mChjWqdWr7GzeCBuELwVOaoQ4qnlkgKhnBk7KK2cref6US1gVmLra9i/vUBoYvninD5AFBRrccVq7MlCvz2pDFCk+L7GRmkeGg8xNR2rMIDWgJ/9GVfUzXxPNXL/F9zwaihLl+P/zoPGxAeKFJX1TfSiy6dfP5v5XHV3kjQKjJpIuwwsygKmFOH781bwmnM5mBUkm21LkquJdzw/XDHZN3AqjlyYkSNB8a8YKmP9PIgsTnpLEaBiy25cw==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by DM4PR12MB5892.namprd12.prod.outlook.com (2603:10b6:8:68::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.15; Mon, 9 Feb 2026 04:24:47 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 04:24:47 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3 30/30] gpu: nova-core: clarify the GPU firmware boot
 steps
Thread-Topic: [PATCH v3 30/30] gpu: nova-core: clarify the GPU firmware boot
 steps
Thread-Index: AQHclyA5967UlVZCU0e15w5KEOxAJrV2ArYAgAOijQCAAAJqAIAAIh6A
Date: Mon, 9 Feb 2026 04:24:47 +0000
Message-ID: <ebae8ac043bbcdf6b341185c480d43a6d7b4d337.camel@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
	 <20260206042123.303281-31-jhubbard@nvidia.com>
	 <46121c46bb52e7f8578367232b772f234f20be86.camel@nvidia.com>
	 <bbfaf5b0-6e10-469c-8a01-9575ccfcd8dd@nvidia.com>
	 <81280b58-965f-475b-9d46-d03347617d64@nvidia.com>
In-Reply-To: <81280b58-965f-475b-9d46-d03347617d64@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|DM4PR12MB5892:EE_
x-ms-office365-filtering-correlation-id: 80830e22-8128-4adc-c694-08de679328bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UDZCVVY5UTFUVFhGWkFKZ3AvOHdOV3dwVkVtR0lZakZnR1FXZmdkMkRBdVll?=
 =?utf-8?B?aGZvOVc5Z1k0bDV4ZE1pM2VlV3hzWCtBUS9LV1pIeU5laHBwTjFmcCs4QWZR?=
 =?utf-8?B?SXRZSXJmT1hnRUFINmx1Zys0Y1RDTDhKeG1MME45VjBpeldKN0QrVVllYTRG?=
 =?utf-8?B?UHRrc3VhSHYybndqWTl2M1hjMTNoczBubENlN1VoV1A0bUR5VEdrV0Ywdm83?=
 =?utf-8?B?MHcvZTNkZzY2T29EeEVpWGxrWHMwNGlJbjl5Y2tkYngvT2xuMWxETXNwMGw0?=
 =?utf-8?B?NUNNUk50NXJ6c296Q2pXeURFSU5PWnZOdEY4SUpCVXllKzJCd3MwcGJUb3dn?=
 =?utf-8?B?eTNaMUIwbGNMYXFVdDc4bGRHaGpOTUdRd0N1cHN6L0JsbktaZ1FKVDBZU1RN?=
 =?utf-8?B?TFVKQUllOUdsV05GT0IwZlQ2aTRGQkUvS3FDSnBLeTdpaGdHM1d3QTYrUGFi?=
 =?utf-8?B?cHBsL2VxVlFjTjNqS2QzVVYrQVdOUlZ6MGdDWTMzTktkNUp5c2p0RDFwYXhN?=
 =?utf-8?B?VVVPUXF2N2FOQXp6RmFKLzF6ZUtwVWVINFRDeXpMVEdnV1VmS2ROQmRTbWpI?=
 =?utf-8?B?cmJZbjUwM1V2cHBRbGtTTyt5eitBYXdYNkIxZUtMM1JFd3VLWCs0NFI3SUp4?=
 =?utf-8?B?QThrQ2hZR0VtU0dHVysyVTdXS1RBWkN1aC9SbTdkL0EzN3l3cExkN2hPRFMw?=
 =?utf-8?B?d1BoTEsweXBhT0JxSENzZUE5V3IzNVVCb09KaVJESjFWc01DVnB6SGJHaGtL?=
 =?utf-8?B?Nlo1ZGZ3b3daMGZkWXJYTEo0UER1cFJ2N1VySll2cHJWYUdzajRLZWJNUVBQ?=
 =?utf-8?B?amhJMFVYWHBDTk5veXF4K3BsZkYzcVFIcDA3aGVRYmUrUnhENkhJMkNMSFU1?=
 =?utf-8?B?TU9lLzJ6eTlmUHNwNU9ZYi9od2dLTFpLeDlQcWZxcU9GRW8zSEJ6VmpGa2NS?=
 =?utf-8?B?MDRINFhHc3F3NC92SG9uMVY1NlhKbFBzMEF1SW1YZEpBcXh6N24zNFZWTmhz?=
 =?utf-8?B?bytFc2JyRUpwZ1FwK0QyZ04yakNJR25qUW56UjFTK1hsWGN0cHV3YzNHZDUv?=
 =?utf-8?B?alBmN3RvSHBaTC90TGRjRlBURmYwbS9oUGFQOEtyZHNBVWhqb2M2MVZpbkpy?=
 =?utf-8?B?aGFCcDNPZEJ2SDAzNGFjNlNUdThkcElWN0xDTlFCUHRmbUtxZTIzNjNQL1Vq?=
 =?utf-8?B?dDM1VElrWnpLSVM4UDRFKzJkbkxSVElHdW1lRXBSaVpGWmtkNm5ta2ozZmlu?=
 =?utf-8?B?aU1FTXRiT0NEZXdUWmplR2dhT0FNUVlxaCtIVnBXUTYxU3dSMnphZWFmdjJ5?=
 =?utf-8?B?b1lhaWxnMUgzVWZpOGRlU25xSVdnL1Ivei9QQmQ1bVBLRDhhT0NjdGFLK3BL?=
 =?utf-8?B?VDNpTkdsVDFpTHBXeEwxcDFRQy9ObENmYXdQSGJyS3RLbnQyOUk1VlE0aXNz?=
 =?utf-8?B?cE9RSDFpZjRQOWtiMlY3VlhUaWp6dWhaZXhLYlVOemJKTnRSNG56VVlLa3U1?=
 =?utf-8?B?U0draEQ1RDZGL2Z1M1dIL2J2TXNOSGF2dmlmenA4S29yemNaN3BTZkhxWVVO?=
 =?utf-8?B?ZWgza2ZjbVdyVnhtQm5SaWJYVkRzZktCc1ZqWmVTMEFpbXMrTEduYjMweldQ?=
 =?utf-8?B?OUVzQmp6SVRsTjBWQlN2dlE4SkN5c2dHWE96QU9kV253Nzgza2tOelQ2UnM1?=
 =?utf-8?B?UGkxRmpWaUN6S0ZKS1ZtTFErVlJDMDRwQ09BTVZEaWZYT3hMOTRPTXE3bFIx?=
 =?utf-8?B?ZW9RdzRmcFZjTkVjT1BLSDRvWFVoY0pYdFdWTTFlQWRpeVpiZGdEcGRjWE9M?=
 =?utf-8?B?QmMzdG9JM2RWTUdwWG9JOGRnTGhBV0dJbk83bjhYT01LUGJUTERSRFhyZ3Vt?=
 =?utf-8?B?S3JHQ1BWTEhXQTZIbElHZnBEODc5UlpVdnk2TzFEMHhnbW1ZekgrZTR6dGR2?=
 =?utf-8?B?MHlNZ1Y4QVZpMmE5U3BTMVdUK3VqQStqZGRZT3F4K1R3NHZjR2RsRGFYZVQr?=
 =?utf-8?B?Mk85OHJOUzQ5MjFwM1ViYmxwQUNYNXZQdnlBQUxPYlpzaFdyVCtZYk1iTXBa?=
 =?utf-8?B?TWNoZm0yOWQrcnFqNGpIcjFKZnh3emc3Z20zV0RKNEFDYXBudmNMV0tNYnZh?=
 =?utf-8?B?RDRrN04xVktuRGZIRGJFYWxZTzJsMkhBYkZGWC91bnB0WmtZUndKTFVoUThk?=
 =?utf-8?Q?ZHmAQrtNEYYXO6qyDPl42/0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bG5JaFJ6SldvNG5kY1I5N3dZVHhiSXZBTG5LOVNwZjA4eUZOVEJSS1puMTI3?=
 =?utf-8?B?TjdnRnhhMTFLc2xoSG5ycTd5aDZyemladTZGajFaSTQwMERZUmZXQ0xwZVUv?=
 =?utf-8?B?bWdtUXNoOE5EZXZQc2dDUDkzU2txQzBoenJNZG9rUXBQcjNtMzI5UDV5bktC?=
 =?utf-8?B?eUFCOUdEWFBnYVFkTzJmRjk1TGtxR2FKcVUya3QxS202bG44TG1FemNUWlkz?=
 =?utf-8?B?ZDBGZTMraWU4ZytMMjZJL3FKNEJ0SSszRnJ0SmpTbTlmZ0dNMDk3TjdwWlZK?=
 =?utf-8?B?M092blBGVmNwWU8zYmpwNElsdWVraGEzMXdJdmtOYXJlaGhHZXNKUEdCaS9T?=
 =?utf-8?B?bzE3UGJkRDdrVnJVV2YvbHBFNThhaGFOa3BTK2VoOXZYbkR6b241TDlWdHg4?=
 =?utf-8?B?MXpmbW53VWVaZUwwWkF6ZDNwdGJHMUtNUDEvalhlT3VGV2NhZjROSnFNaVRI?=
 =?utf-8?B?eU1zazEwaVoyRnhNcEp5M2VaZnNzU1VDc0trUE1yUXUxZDk3QitpRkZlSGE1?=
 =?utf-8?B?anBqTGs1elhST2QxQUNVaSszK3RSK3I0OTE3WUsvUy9JYVpBL2VxRDRiRlhv?=
 =?utf-8?B?ZnJJU2U2a2xPaTRLY0Q5cmJtY3AybXJlT0x3Q1NLL05SRWNvcGVSY0QwL09G?=
 =?utf-8?B?TzBGOVNEaFVqQ040WHZadEtyeWJEQmwzVHNWcW5sVWFjNjVlMHpsNkhualRV?=
 =?utf-8?B?NnZpeFpIdTBKVDNpd0srY2F3dFgrTnh6ZFpsckhLZitWWUxWM283VGJOR0xn?=
 =?utf-8?B?N3FsL3ZuZGhjTEZSSnh2Y25ZTk1OV1JNU0dSMnRURXFhaE5Lc0tYVUdTNkJo?=
 =?utf-8?B?R2hIUWptSGxhckpWVERYTEd4dHRJZ21TMVBwaFZ6WWIwbTN2RWtVUTJ3d1Aw?=
 =?utf-8?B?dWFNRHJacVVPa2N4Nzl0MDF1NC9LenlFekdZSTl0YWVEWitNSFBmT3IwMzQ4?=
 =?utf-8?B?QUlXeVorS0dERFhEbk10TGtmb2daaEczY0xuUWFUcmdlcFdZb1N5YURka3R6?=
 =?utf-8?B?amZXMkdZNDc3MGxQQXFnbUFOdkh6YTNXZVBudngxQ2F2VEI5ZEtJa0hhck80?=
 =?utf-8?B?RUF1OXRXcEVWQUxIUTFRQVk2WW9wQ0xBS0MweXFxelhlLytEL2NpbFRNeFpM?=
 =?utf-8?B?UU1WK2tpN1l1U1NWUzRxM2ljb2pVeFV2SXZBQ3Z2RXRkTU1JM1hMeVY5QjRt?=
 =?utf-8?B?blI4TkVyZTlIeW15a3l4U1BWQ2I1cVYvOFZmc0tHd2h3d05ad3JiMi9maGti?=
 =?utf-8?B?S2JnTkVMUWNUTmJZZEduUnMwWjJHcVFEYnN0ZkJwbys1aVlHL0w5WDMvYksv?=
 =?utf-8?B?Szh5YSszMHVsUENQSWhzbEdCUmhkSjBFVCtLMTJ5Q09INSsxdmFrL0VjR2pz?=
 =?utf-8?B?WUl0K3hiY0Z0dnFuVE5rSzFudUtrU0RZT3FuSWpvbnM0U0Z2SWpxbC9IVnp3?=
 =?utf-8?B?UG1UblJKc3BmaEFqdm9ZcEkydWhpWUh3K0RrZjBic2V5eXo5dGJnOTdmYmZF?=
 =?utf-8?B?cTR6OEQ5WnBsQmhUNVJmTmt6VGttclowbGF5WlFLU1F5dlRzRGJwT0xKa0tv?=
 =?utf-8?B?aFJmYTFOR0lGTTBjSmQrT0t6WWVSOWdKa2gxM3FJZndxb216STRvRmE3SHNv?=
 =?utf-8?B?K1owS2p1WCtFM1ZFbE5RcysyeEo5OGd2bVFod2o5ZDkvTGYydDVrbDFUTk1S?=
 =?utf-8?B?eG0yVFpQNlZaUUdrdC9ia0w4ZTlRTnBUd0tJc2JKYTBwVTh3cWJUYlhVMjcr?=
 =?utf-8?B?aVA5SEFCd2Y4ZnBQWEo3WUtqZktybnEyanRDcVFSOTI0VDV3dXRuaUs2QVF0?=
 =?utf-8?B?bW8vdEk1M0xMbXdoYklaODBkd0dQWUtyTXhyWWYvckpqbVQ1ZkpONWdUZmwz?=
 =?utf-8?B?Q3VtVUdSa3hrNE9WUElCa1RqcHMxSEMwc3Q2WHhJdzNXYzRKb3JoemRmSy8v?=
 =?utf-8?B?Y1k3Vm5MWnJlM0UzMmpQYkNHSUdrM3YwcW4yQ2JmbWZVNlVHUVN0NE02Y1NR?=
 =?utf-8?B?V2hONVBHRXZtWE9RNEtlS3dXLzVVa1JoUGpvWmJsenlIY3hSYm4zaUFudUU3?=
 =?utf-8?B?L25zdlh6bTBPaGd6RlBPNS9wQlA0VGNWNE9LaWlzNU1QYlNKS2prNzlESjls?=
 =?utf-8?B?TkppcTVnUGR2TmRFMVd3YzRwTGdYcVQzV2FWREFXa3JjVmpaNkI5R1JPTEtj?=
 =?utf-8?B?bXZsM3IrRTVPV3g0bTdBRURiWTdJOFAyOStGOXQvWmlvTnpSdzlrSWhZYndo?=
 =?utf-8?B?b1N1QnhjL0N6L3Nid3Uwbm0rd0lIWm5SU2M0cWluUTF3QkRocTA2MlIva0Z0?=
 =?utf-8?B?dHg4OUFZbFh1dmdJSTVQR3NRNXNCazNWSmxZQUNOLzNhMHBsZ0wyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <010620A8290C824B9B0668D9241001AF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 80830e22-8128-4adc-c694-08de679328bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 04:24:47.4575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 01oKuO805fa38Ih0GQyFLSr5x+fS+mINJ0/CpECQi0dbeB9bh5kjTBewHyWtYv5khTaFLZ8nRMn2/FwUuTfgXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5892
Message-ID-Hash: EEEANADKPN7CMZAJO3IMHZFL5R6BOAPG
X-Message-ID-Hash: EEEANADKPN7CMZAJO3IMHZFL5R6BOAPG
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EEEANADKPN7CMZAJO3IMHZFL5R6BOAPG/>
Archived-At: 
 <https://lore.freedesktop.org/ebae8ac043bbcdf6b341185c480d43a6d7b4d337.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gU3VuLCAyMDI2LTAyLTA4IGF0IDE4OjIyIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gPiBMb29rcyBsaWtlIHlvdSBhY2NpZGVudGFsbHkgZGVsZXRlZCB0aGUgImlmIG1ib3gwICE9
IDAiIHRlc3QuDQo+ID4gPiANCj4gPiANCj4gPiBPSywgSSd2ZSBhZGRlZCBpdCBiYWNrIGluIGZv
ciB0aGUgbmV4dCB2ZXJzaW9uOg0KPiA+IC4uLg0KPiANCj4gYWgsICpjb3JyZWN0aW9uKiwgSSBz
cG9rZSB0b28gcXVpY2tseS4gVGhlIHJlYXNvbiBJIHJlbW92ZWQgYW55DQo+IHN1Y2ggY2hlY2tz
IGF0IHNvbWUgcG9pbnQgaXMgdGhhdCB0aGV5IGFyZSB3cm9uZy4gVGhpcyBtYWlsYm94DQo+IGNv
bnRhaW5zIHRoZSBsaWJvcyBhZGRyZXNzIGFmdGVyIGJvb3QsIG5vdCBhbiBlcnJvciBjb2RlLg0K
PiANCj4gT3BlbiBSTSBhbHNvIGRvZXMgbm90IGNoZWNrLg0KDQpIbW1tLi4uLiBJIGd1ZXNzIEkn
bSByZWFkaW5nIHRoZSBjb2RlIHdyb25nLCBidXQgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGlm
IG1ib3gwIHN0aWxsDQpjb250YWlucyB0aGUgbGlib3MgYWRkcmVzcywgdGhlbiBpdCBtZWFucyB0
aGF0IHRoZSBmaXJtd2FyZSBkaWRuJ3QgYm9vdCBhdCBhbGwuDQoNCkkgd2lsbCBkb3VibGUtY2hl
Y2suDQo=
