Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7DCCD4F5B
	for <nouveau@archiver.kernel.org>; Tue, 19 May 2026 13:36:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B819610ED19;
	Tue, 19 May 2026 13:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sFcPNev5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C7A0045FD5;
	Tue, 19 May 2026 13:23:47 +0000 (UTC)
ARC-Seal: i=2; cv=fail; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779197027;
 b=rQBQK/doK4/Scg9SNwnQSZwRzNQk/26yt4R7wdXOASDO58BaorTJNnXPchABXgYyVSzUA
 zSsllfoqEZyun+NM34qz3KFcqRGRpflOQoRbYbAx5DXxO+HsZFtNZhSZmQyC3JhHG5PIsLY
 VkeRYCDCGEyXryAbPTkzeXTiwNcH1+HGVbUDVGtC1r8++JoGkY2QUBCcL43Jy2ucmNAdlP6
 DPAIUjGQtLCyDqA3uxPP5ifj0qot25NWeGyBJI9CRXZ0pASosMqsarE9ApipLMHz/YvJ3/J
 g4E3VrY/ykIUvAMkTFcOlh0yXIXCi16AzIcbWLgPS7ajyrh9NcABD9izIvbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779197027; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MTJnCikWlZQdnWYSPe2eOP/3AkP4llMKhNoBliz8Yg8=;
 b=DWQ/xO5TviVe23MXjFkr7TYiwxkp9oQj4ap3Z//Vsb2W8ozI4pKaYp9oxbXyMi4a4pQna
 x5ukJiJ3fxHPiigqVc53GEPm99P7AvtHBgTSmT7JyjFHggUA8ILENGkaI/vFpBHdFHup6En
 EcpYOsgER5/k+5oIPljYJKtbvX/BqohjrlpLBClS5RGe4N+zNr2XXTHVRY7s/ljNPwviaml
 eQo3mfcAxGuGmLgRKqbf/emHD6Rv3WUo7oxMIXA+Z8+HInqnCUK365jl6bnpxlyy/k7hD0P
 tNtxtqldMU06HyVPo7eQhOBR9g4AUAWRGh4aqwzJobvANE3BOFg/rgIuzAnA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=fail (Most recent ARC-Message-Signature did not validate);
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=fail (Most recent ARC-Message-Signature did not validate);
 dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 024934242B
	for <nouveau@lists.freedesktop.org>; Tue, 19 May 2026 13:23:45 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010004.outbound.protection.outlook.com
 [40.93.198.4])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 895CC10ECEF
	for <nouveau@lists.freedesktop.org>; Tue, 19 May 2026 13:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLOkGJ6d942dIF1+1UClMPi+zBGorkRdG86JzDHUeInlpNN7W4hyFdWg16w65e8mQ2Wgy1/m/zryB9qNW2YHwPDdwGjrOik/ldztBeYv+uXWNMdsJ8nVUz57sVpeFNfGGwV5rj9f4y2HRZI4JfGG7UjsY+myxImIr9759Xg3thQR4NuZS6yJ3FynNaahKIAS0YfvCl1dIWURa0sN5GV/dhPIjVrZElTqM+22oIoeI9NWCbuL0ysz7U3QL/PTHuNop69uIj029R+huqkY8vD50jRGYQ4EWKW8cpzEg9bBFKQcZ26Fagu6C8RdhypBsS7eieA6ulktBavpEbvr7yjtEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTJnCikWlZQdnWYSPe2eOP/3AkP4llMKhNoBliz8Yg8=;
 b=J4V5//zL2uDoYo6HciDFztnI0vCHELq22Zboe4fiZhaqXbOS127s+fJK5RNYajyyWzxPFXyIgStQkGspavs8qG69vL2osdBfgIEFMLIYfpOOgHI5xG88xeqKnNReCe6lp53dJS9BkaFeYnncGOeEs3pFM0uX8/J37e51p3PBQD2uk0qqKU2kNT4ORDCQxyVQTk6pAw+1SKCCdLjCj0oz3MN0s8BbKkUs/wLs2t9ysA0p3akhH2/MV2Yz/36p0jksxEpBypoGaOW7y/s4npIetPjnoGqt25eMdZ9gVvkNH8+q2uyYY6w3TLZUW5CVf1+nz0/oMjdTbm+ayLufG8RlNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTJnCikWlZQdnWYSPe2eOP/3AkP4llMKhNoBliz8Yg8=;
 b=sFcPNev58SeS+L097nutnbBSDLv0xkvO8VbDbp8OZpRsK3Lmq0hbPqDwhlwkT3N+SuvbIPpNk+fTF8HrvSa/WvpVKs8UXWacpGeOiWwOIR+a+ISut5t170vMgwP5NzfrU8b4iTaidrH9sVdT5khcCjzPKN7AjC5ec4Fxakp7e+xxxogkoqubJAo0O2bvdl9qTmBjJWC36dCfGakI6YZI2FBAeNyDXAheBovQvSM+qchAAM7svVOEbKDZJmkJ6I0VIM/LN5eBvAVBl6vx29aDr9Hx2p76X8IPK5gpbBeMvc4X2uioRp+5lsrAaHSUaEun6L7X4zD+n/Qcyfs114B+4Q==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 13:36:48 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 13:36:48 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: (subset) [PATCH v2 00/10] drm/nouveau: fix GA100 issues
Thread-Topic: (subset) [PATCH v2 00/10] drm/nouveau: fix GA100 issues
Thread-Index: AQHc2PIvWOnN7JF/IECGe50MwbMdi7X4OymAgB08BoA=
Date: Tue, 19 May 2026 13:36:47 +0000
Message-ID: <0079fcd18a9840c45f751d86dfb870cd1f36655e.camel@nvidia.com>
References: <20260430223838.2530778-1-ttabi@nvidia.com>
	 <20260430231025.5063-1-dakr@kernel.org>
In-Reply-To: <20260430231025.5063-1-dakr@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-9 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|BY5PR12MB4097:EE_
x-ms-office365-filtering-correlation-id: 891ea204-ac97-49cf-4ecc-08deb5abad32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|38070700021|22082099003|11063799006|18002099003|56012099003|4143699003;
x-microsoft-antispam-message-info: 
 KajM8mbMm2yw0jir7xLIE6TxnXsxpxwtAUoTZLNW3s/KGacEsmrkzrVLifteFK/24W9JtQmE2nGZ5gNXkn/Q2EsXnKhda5uEk5mTg/N8oB2twl0NgoxIXgNbgRUGKRd5i5UPWoN59K3QhIs5emmK2y3aPNJjTwWT85uZNdiLRe/Y3qBB2jzBqxMIBhmDUMPOieEoE7ivVhSsAhNEfHiQMbzywRiks/LQch8L8PcYdYm5GmYNIX8mOqPl6gp+SO+EXDE5z0bXcM/CWxh+76WYjfl/EG1dzYKwM7qYXIcTFZUa+QIMglirbCFWhyWNB81CP8ErYRrANF8C6LEXbtaOtAlNBMy2X1LzR8sM+Cpki9i5nwBw+Btl3YyqsXNEclbqi2MTuUYWU1l7J9BMkpwrdvW6TRPIEkYrUbj1U8tNv2cDpSfGumtuFwn4MXilbc/1NagGSXmrF43w+J4cCXL2Xz82MBfKM1XLYDpuJb0Ji/ECKXeYBEECZUZa8WlnL/F0QO2ZRrZgW03aIH+QpU7A09DyHVtIha6Mm73ZLCZqZDLJBZhUdFG+kV0RZLg9lnoGhSJfAEwVF//oXFBkMKKZXwpU0hibasDgFq4OqAiZ7DiSvKagUCQyO/ZtlHuZq7vFmQ8xbfcBaYkjfMzo6ZvV5vFFQD5WCLwj2cWtl3m0mT3Mc49z8/9QmxTnRECeTufF/S/n0mRVHpONxtYNiQS0zZgVLr99dRBaY8bVl5fzz14kWNHT2B2vT4XIb81UBwwO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021)(22082099003)(11063799006)(18002099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZS9GcE43VkdudGpYM2lIdUs1V1loWmNXSDJjSXdjQmVURlY0czA1T3gwY0JS?=
 =?utf-8?B?R3pMWXoyVlp1ZmxKekFsOTlIWjV2REFISlRXcFl3K09YbTU2YS9LZnRHMUNr?=
 =?utf-8?B?Rlg1KzdUS002YjI4U0swZkFFNHBFd0svbk8xOXRINEhhdDU3QlUra2FXcm1n?=
 =?utf-8?B?dGxhTGNmU2RFUWxUalNITzBoN1hpWElaeG9lNzZjRW9Beml6OEx2cXBUanZE?=
 =?utf-8?B?VFpFb0RSVW9HdFN2cytlaGd1MWQ1WEZyWDQ3azNkQloxVmx0UU9ZMG9KOUhR?=
 =?utf-8?B?b1BuL1hqc2tkdWVZRjl6TlA2NC9odXl0bkN2c3RSMXRWSWRZNFUwNWlIMDkw?=
 =?utf-8?B?ajBBLzJ3Z3d4bUNaSkZGUFZydVlBdFFxbUc5eHM1YVlnREpwRGtpeFd2RXdI?=
 =?utf-8?B?MkpvSzh3NmsyUjJ5d0lxcWtVSFR5eDE2V0h6SFdRTi9MZmN2UVF4STFIZVRK?=
 =?utf-8?B?cU9hYTRWLzFhS004cXZpemFtN2daTFB1eGx6RDhPTWlra0JpcEpRdWh1ZnhU?=
 =?utf-8?B?ZHVVZkUrY2t1T3FxN1ZXaUtPV1JDL3p0TkNZMTZsN1VVdTFCK3FrKytEU0sz?=
 =?utf-8?B?T2dGa1FzZnkvQW8xcUNNaDBWbGVLaWVXN2cweWdBTVlJSVplaW1sY3U1MjFW?=
 =?utf-8?B?NzBlWk1jNlFqajVrYXNnTFdmRE1UMVZ4M0kwMzdnWldoVDMxU0NRdVdjdlBR?=
 =?utf-8?B?YjErZDRDVmVXSXFEY1dLdzVLV3RMR2xLcnhtaGdMa1lDWUtlNC9qWEhyUmQ3?=
 =?utf-8?B?TVY2eVpVVkhOLzRhNW1XcllHMExsTGh4Q09WZC9RV2NvQ1k4aTM4ditYNDI4?=
 =?utf-8?B?anNiSjZGK1dYbzkvcWNOODlzRnBKdkVZRC8wWnpETC9lMG1kWXRxWXFCb2Nj?=
 =?utf-8?B?TC8yU2xGOVRpVERJMDllY0wwclM5OHBQSDI0NFZhemRUb2tlVGtXSmxSblJY?=
 =?utf-8?B?OGFYeWZhVUJ4cFVGb0VjUVBSVDVHL0kvTjFEZmtyWjhlZ1ZvRHlvTU5XK0xW?=
 =?utf-8?B?MG5NSXZUQmxrUnNCMHZKWlM4YkhMQmpuMWhRLytVbXppaGRTdVRzc3QwWEhw?=
 =?utf-8?B?aVZoMm52ODFEUngvckV1RXpFZzk5VjRZUlJ0Sm1OTnBMaGpDVzAzSUthTkdm?=
 =?utf-8?B?bEFkcDlkdENZK3BPU2tGTXNpVnRSckRwR1J0enp6S2tFTGRXazRPZlhRTlRR?=
 =?utf-8?B?YWNjK0JCTlUzdlQ1NWhmaWNlUUcwOWplZ0poM3hEK3BIeStPb1Z2MW5QNnFE?=
 =?utf-8?B?Nk55Z05tNHo5cUhqMHF5RVpva2lHbUVwOE5sMDVpZE9BVEJPSHc1anF3bHZy?=
 =?utf-8?B?M3h5YzduMEJSN3orTmhvcFZKa05wbTF5alN0bFdBT1h0RUhKb1BET1A5YUtP?=
 =?utf-8?B?Ujl3dXp3Yy9RR0l3VjhqVlYwRTN3R0s1b1MydlFpQmZraTgrcXlzTXUxMUlY?=
 =?utf-8?B?K0lPcGp4aGZpeVpJOC9GWi9qdzJ0WkFRekhLalZGUEYvdy9CaExZdmJQdGpu?=
 =?utf-8?B?L3FZMktyOVVTcTNjTnlrNXk5TXByUGFCblg3LytTRzlMZ0tXN3hEeTNrMlM4?=
 =?utf-8?B?SC9NK3lzM1VGQlQ5MGk4RjVFRjY5ZDhEVHBVY3ZEWm9VSFJaVHk4NUoxTzVr?=
 =?utf-8?B?MnY3QkRUMmRkQUhNV1BwcERkOHo2Yk1GbUZJUnpYNDdNMG5jeE9YZDFJTHNF?=
 =?utf-8?B?SVdDdVAxQzZsenJ0NG5IOEF6a0ZVdmJhbWFlcks4MGZGSEN2YUZnUU00NE1S?=
 =?utf-8?B?dW9sbzJ4NThPMXMvZnBmQjhsWUd0QTUzVFZZeW5CNDQ0V0Q4czIweHljZTAz?=
 =?utf-8?B?Q2lKMVk3RjVYQlR1Z2lxVktzSDZGSXkvd0hDT2JIMTN5cERmQVY0LytqLzFL?=
 =?utf-8?B?ajZFQUEzRHcvM29GZzFhdFFCcWo1cUlWa0NrNURWWGgwSHdibG53Sm5MYzhL?=
 =?utf-8?B?c01SUVppRjZ0TWVBSURabkp0RVp1Y1Z2RU5jSkJ5N0NKR2pDQ1JHUWJzaTR5?=
 =?utf-8?B?dHFPSUJ5RWJuSHNhU2dFbWFncGF0OFFUeWtGVzFnZ1lVd2gxRmZyTGFwcmRN?=
 =?utf-8?B?M2ozSEYvdUM2bnhzVkFEK2tCMVhRaDgxVTViWnVGdXlsQXhzWGc3TkJDcjBT?=
 =?utf-8?B?Q1R5ay9uaVZGZnc5YllkamxZeFIxTlJ6RE0vMHpFNkxOUkxaZDh5bzlOTTg4?=
 =?utf-8?B?UGQ3Um9YSmgrS1NMM1ZIR3REM1A2aDBBY2p6WkdmRHc0bzRYOTVZTTdXeWl6?=
 =?utf-8?B?RkVhWlN3enBWaXlqSEkzWWR1eWx4dGVHU0x1Y0hyaGduSnQ0MExHaUc2c3lQ?=
 =?utf-8?B?ZGdBWE53Ykk1cndMSVBaYytNaGZTMHV1NEJtNm8zT2YybytPeS9DLzRNS1p0?=
 =?utf-8?Q?X308Hgo9EvjBbMnSZGhOqx9f+A+XZ0BkQ4lb0bSFhnJYQ?=
x-ms-exchange-antispam-messagedata-1: J1Dy1l3iFMb/qA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAC727A5B5DED24FB02B25DF12EB6783@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 891ea204-ac97-49cf-4ecc-08deb5abad32
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 13:36:47.9311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Hc8PqypVhv5NF9PfpJuXnqdNSlTITY3MolvkzK8BCEcUZqtJTTf7CVQmXtDxTMSvXZnmKE5lJXXSY5qkOC1wvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097
Message-ID-Hash: UJ2GQLQXG4ZVD73C32ZBNKKKUNMUQDZ7
X-Message-ID-Hash: UJ2GQLQXG4ZVD73C32ZBNKKKUNMUQDZ7
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UJ2GQLQXG4ZVD73C32ZBNKKKUNMUQDZ7/>
Archived-At: 
 <https://lore.freedesktop.org/0079fcd18a9840c45f751d86dfb870cd1f36655e.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gRnJpLCAyMDI2LTA1LTAxIGF0IDAxOjEwICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBPbiBUaHUsIDMwIEFwciAyMDI2IDE3OjM4OjI4IC0wNTAwLCBUaW11ciBUYWJpIHdyb3Rl
Og0KPiA+IFtQQVRDSCB2MiAwMC8xMF0gZHJtL25vdXZlYXU6IGZpeCBHQTEwMCBpc3N1ZXMNCj4g
DQo+IEFwcGxpZWQsIHRoYW5rcyENCj4gDQo+IMKgIEJyYW5jaDogZHJtLW1pc2MtZml4ZXMNCj4g
wqAgVHJlZTrCoMKgIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbWlzYy9rZXJu
ZWwuZ2l0DQo+IA0KPiBbMS8xMF0gUmV2ZXJ0ICJkcm0vbm91dmVhdS9nc3A6IGFkZCBzdXBwb3J0
IGZvciBHQTEwMCINCj4gwqDCoMKgwqDCoCBjb21taXQ6IGM5ZTM4NzhhZTJmNQ0KPiANCj4gVGhl
IHBhdGNoIHdpbGwgYXBwZWFyIGluIHRoZSBuZXh0IGxpbnV4LW5leHQgaW50ZWdyYXRpb24gKHR5
cGljYWxseSB3aXRoaW4gMjQNCj4gaG91cnMgb24gd2Vla2RheXMpLg0KPiANCj4gVGhlIHBhdGNo
IGlzIHF1ZXVlZCB1cCBmb3IgTGludXMncyB0cmVlIGFuZCBzaG91bGQgbGFuZCBpbiB0aGUgbmV4
dCAtcmMgcmVsZWFzZS4NCg0KRGFuaWxvLA0KDQpXaGF0J3MgdGhlIHBsYW4gZm9yIHRoZSByZXN0
IG9mIHRoZSBwYXRjaCBzZXQ/DQo=
