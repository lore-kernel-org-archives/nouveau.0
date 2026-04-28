Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD755FF885A
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 16:18:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1DE10EC53;
	Tue, 28 Apr 2026 16:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uc1hDqJK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B83C545CAF;
	Tue, 28 Apr 2026 16:05:53 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777392353;
 b=sbTPwsOP8sBTJ2kYtyDxtbenftcVQ/pzMHbyvwjsrgMhkqtscxCJ98AZCHv6uf5jDNhob
 1MwEa5ecV8V1QgoB4XjqKrmFXSUAshTeQvTGHbXctlKbTaMkBy6MsncTVUfhIrI154r3SKQ
 9mfsjUHeYZKsS+NOF6YcvuPBaaivgx8d48og+SJihdy/sjZ69v4zHd0ppOIyAdagBaqS9Uv
 xtbnrmgQaeTCTWJTk7DmVHroxo3DBUYMXbDYDSCEbcx5/dk/91Ajzlh2XgSYdgn/FNvi4wP
 RPUnJcfIdccWNfMDQdEdH7NnWL3yY5jJRjgktkNCJ399wVbOaeVYq2Iufxfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777392353; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=s+fTua7AKoUXAgUr6ivehGt5biMZXqTiT2bhRvh7zLs=;
 b=JyqBb3E9+V8M/E+8/qrF4CLbuRgw4/tFMXr/YsT9KSAJvQmHtQySMgvFM30tbSo0WIyOa
 tsbatsOZsIhUP4mU1DQY8Zt7qppSDMVjC2WOVR78Xbq4B8MMmdGcH6IYH6UedXNsCW9fRP5
 MMLM/ZKRaFxjSbrHKZncvqOAsHf/Xcv8MJkarxt2EFaFf61iGigUIAMsT2esgUFy1T6V0wi
 yPLMxuRWxXlF6slAPsz85jcEYBT55o+VSjt0VGUSlIgTGQnho/a6CSNIINIEWMpyPqjEeNL
 NhNZPryxijCRlHfuwXHOtAUjUHKg7XmmIbE2y8jZuqK/XpgSubK88qry9aNw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5E93345CA6
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 16:05:50 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013055.outbound.protection.outlook.com
 [40.93.196.55])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A07810E33A
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 16:18:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8z632T//WdY6S4TbiVAdcge/a+ObEa89OLB2fEosrL+WelMutbAs4RQCDLh/G6bpgfw/M3yO+B/X604/aN63CRZLMzB6A5TAS/bEVDg7L7K1JVOPtMIL1CTVo6SXP+vmCVc44Y3Q5jLuSjgLtZAhVNw1KRJl7yEFNnN8KRG+cP807nkpVBlDUxKxXf4pcay21eLKyYgiU5+luyoyZ0oZIxcxYkCPsXeh12VTqGQUlhnKGJAdVnEHcZGQL6h/kN8b6tIMTuHnxM4ro5x5CgltTSXE5mBTYlRe66SsR2+x6nQKNNfPpnXF8XKNqIMe8inZUKiXXUuAtDoN2gwnSFZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+fTua7AKoUXAgUr6ivehGt5biMZXqTiT2bhRvh7zLs=;
 b=YnrKPo+0tpfyBRpsIwlg6HGPigzvr+PiiAEPihXHMR2O9E9FomyrtlAJ1Ch+wvqV+f3T3lR5fTnNddtAJ9qEDyESr/4vN9bR5sHPPvLqE8NsSRnjZn+KLmhFRUl0iGEt6bm3C7Lis6b2NS+pGZ7WIPUbcFtbIDXxVWmDCd9azjNes5xCApW4WuI6XEFx/6zQk3xE1IqeK2jg7peCIFmhtPASt12T0kuuCCPg6YvcxzEGaaGYCFov6AyN3wQBbDdYAs01zRkZxbelAArNOakUcx+eKlvU8fZTpTbbF1OEJIyzt3W3N0Ye6NG3xaGLO78NLLdcF4Auf1nc11imAtJYsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+fTua7AKoUXAgUr6ivehGt5biMZXqTiT2bhRvh7zLs=;
 b=Uc1hDqJKuiv9RC9zceW+Ye9f61tSRIr6ALYKb2zxFYJaZG36y0ARzSRgXPw/nFwvKGdY+Y1pHrvl/83ek2ceqoU/a4vmCPn6e+G3IrVZVBUUtBYdy0XywtDozDY6YiiOi6upEd0hPjnTQ4Fi5//I0ugng0dy1yQcPYfpwTKBvaHhBk/+x6s6mbkmGym3jRVCcT5XQHYpASZw8b+g136dekHK9GUIRzG1yLRkh1j+5He19S2G7sRQHW3nDcN9QodNd6BWkzGACuuUAmekATKnYRUMWnCp/mjzBk+eYLHmOAN4FvbK0Lq1/bt/eDxpd5/Ryd3ZuITVE030L5pYT0oBew==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SJ2PR12MB8649.namprd12.prod.outlook.com (2603:10b6:a03:53c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 16:18:03 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 16:18:03 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH 0/6] drm/nouveau: fix GA100 issues
Thread-Topic: [PATCH 0/6] drm/nouveau: fix GA100 issues
Thread-Index: AQHcxsPI6EREgCDQKkK12I7oJL/HMrX0s9oAgAATygA=
Date: Tue, 28 Apr 2026 16:18:02 +0000
Message-ID: <7ae097ed33e934c5cbbc0340bba136cf0d5ca804.camel@nvidia.com>
References: <20260407192122.3055293-1-ttabi@nvidia.com>
	 <DI4VR9K4MH1Z.IDI6P1QIS02O@kernel.org>
In-Reply-To: <DI4VR9K4MH1Z.IDI6P1QIS02O@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SJ2PR12MB8649:EE_
x-ms-office365-filtering-correlation-id: 96041f12-c8d5-43ea-6c40-08dea541b912
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 DtVGD2CDRjJq9NkQbJU2OLAyeQ+h5TeXsNEusJCW3KDskcHur+hwn0omy7o1ckqOW9vMoa0FJCVSESW52TUezJW683zIx9rc2aco7SfjkFh9XiPnknlOmBKpkLEa5IEXaaV7ZdQKsAjOvDgRRh7JPSfNZM3xEQFlpEGtzqzHWORGGaRNBffPrKyUQDRQKYCMeGAy1RBXKJztyOglcrX1/rUjMAtPngBsnLAnnbBQtnX+o6ktdhA1oSIJGFxrooUNWQN4VdyAP4lwtKBcdv8iohB246ZH8BllxqMerfLY/6LRHrGBeAIOs9u6kaAyW1JGfWiREPDX3QoXorz5zi+LKUOUkrZPIn4wTcNn4wi+8knf9PizyDidE+TitP1Z//4hxqlrF9YIszSEkXW2a1dC/wYIdgRAZdAfBVe1Yg8c8stiJIUCn8c5QHu51gVmaMVDMhTtKcvqPx7ndu7DiqWt/NfCJEcqlT/nzzgIHJki1f1ToIdEvDE84QUMxwfIOgthni1c67hcHEvq0DXNu9dlu2P5/wz5GUW/GAoRMaCh6zAuBq8bUerwETx2wu8CYvuzyajV6VUu2kcQjrUZxYGpoGFBjsBfHvLYoJ9jMYbxdeO5EU+eBQmIikolA9WHPC3kY0ba5uLDwZynWMZDB8l/CI1fJbWWGhoH1+yM4RF2MCJjlpb/B+hTX6mJ60Y2dhCnmHsEUyKi64d9voeVT/97PbmEw1Z0i3TfwGmK42NjBWtBmMDL3mUusb2GOf9/bIuJbHx3FSA2qWpQzEEDzKHlGjTu/ndpT0T1EMRJQCwkh+k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z1h6UWlRZ3lZcWxPQmlTeGJnM3FabWNFOHgwdDR2VFJhV3RrejdXV2V6UUJV?=
 =?utf-8?B?WGhtRnlXT3dOUHc5QkhQSTZhZDZLN0hkeERHMmV5ZUEyZjNkNHdMN0NUR29R?=
 =?utf-8?B?TGJtZWdPY1FIaEt3KzZieUloR0h3aGpKRFZLVFRTM0Vta2grS212VmcyTnpL?=
 =?utf-8?B?ZFpBK0wva3BlVjk3VjhrcThDSlZBVUhVNE1XRlFHd2JFRXFoeFlzK3Q2Uk5m?=
 =?utf-8?B?cVAveDloN1RtZCt6YVFJTjhpTW41cWcreWdySXVUTWw0OUV1VlZZQjdiU3Zt?=
 =?utf-8?B?b3BkbDdDMWo3VUJabWNDcFNxLy9palcyYWdtL0Fpb0FON0dQYldtTVZZb2Ns?=
 =?utf-8?B?TWhOZDY5dkJSZWFLdDFXcjNQbDc5eGRXbnFiSGlwN05hL2N1UmllbUc0QmdD?=
 =?utf-8?B?cWhoV2RTM2x1QUt6STk2NjZuWnYrRlhDZitoUGltVitlTnJEaEZSa29INGNn?=
 =?utf-8?B?OXdabTE5c3lMNitmSnpTRVJmKzlwMnhsWlI3aUJXMFhBU1BaRU1SZVFmeFBh?=
 =?utf-8?B?VFk2cThrRWtFeTVJREUweDFZdFpqMzVLOFI0TUVMN1c1MzVGUXdMbE1IRUhX?=
 =?utf-8?B?WnJXYU85YXV1MUV1QWdKeWwrQjUxSjB1dzdyOEl5Wnh6b3ZlZi8zbHJKMkwv?=
 =?utf-8?B?T295L3lzN1grd0tHbi9Fd1NTdnpUNnVHZVNvMUd4TU1oSk9WZXMrVGlaeEtP?=
 =?utf-8?B?N2FLcW9rS1F1cytpYkNEcEVRMzFNSmNITkU4MHFMc1lVV0ZSR0RKdFB0NXBq?=
 =?utf-8?B?OXU3alpLcDI2Vm40dTEwdGQ2NkdtbHdSRzlleFNxbmU0dTcrSi9PSFZMVFdL?=
 =?utf-8?B?Unp4UHRaLzdoVFhYQjc4TGlpbGFWRlA1MXViNDBNS25PMFZXdFpCMkdxYkJn?=
 =?utf-8?B?NE9veXNIdDBwWVhaZnJkQzZFNzFEYVd2ZmI0TVFmQUJ1cThDNXJzMkEvdk1Z?=
 =?utf-8?B?NFdHOTQzYlVZWkd2ZjBBYzZibXIvVlZrVmwrMG9yOXRvV1V6Qk5NM3BHY1lS?=
 =?utf-8?B?b0pvcDRhUE96aWhUQ1RrcmM0SldlT3RDZDdtNXE3RFdRU2syUCtEekpkazZv?=
 =?utf-8?B?aml6MUFYUWlpVWxXcEpkUWRrdFI1WkVraDF0c0p4OWhJdU1zRFIrOE9od2N3?=
 =?utf-8?B?c3N2MXpZV1Njd3FBREhJc1p1dy9oSTF5enpsRElhZWRWU1ZGYmxhZ2VIY0hT?=
 =?utf-8?B?K1d2QVlQU3JDeHF0V25XSVM1UWtKWVlFd0JFR3FKWmcwTDhmeGsyV2NYTk03?=
 =?utf-8?B?aUZYRnphTmFKRm1tZHRjMTZXMHJpTzRHUGQ4NGpzdlAyVVoxSXhSM3VMeUl4?=
 =?utf-8?B?Q053NThjaVZoUlcvNGxsOEFoaTJ6UE9HVzVLc0RhYlNMaWlCQ05LT1NXRWxH?=
 =?utf-8?B?MWY0dmxmMHoxeGorOHFuMjhiaGdwcGFxVXAvS1FocUttOEFQUjBWbmlmYTlR?=
 =?utf-8?B?RFJIV1M2N2p0MHRueDdLWjBmcEpJMk9IVXRWYUxSU2Y0TDhvTWRyaVZsd0l3?=
 =?utf-8?B?R20zOHNRS1lUaEhpaitSTU10TUdndlpiMkRSMjdLekJTbnZ0SXI4d1MzMGdM?=
 =?utf-8?B?alFzOU5yQ0N2YW1MVjNmVmhTT2hvV0VFSnlDTDV6d0ZORjNRVk1tdWxGa0Zt?=
 =?utf-8?B?WHIwbG1EV3pWdDBLc29Xa29Mb05FUU51UGRaaUZlUVJQWmJHKzNJc2hMbkRG?=
 =?utf-8?B?d3pZYjhCY085eVdyMHZaOVZMRnFGY3lxRXRLaUY5RmRXRXR4M280Ky9ON0dW?=
 =?utf-8?B?THZGYWlUZTk2MHRIcVYrYXFvQ016SGgyTlMrcmxYM09Mc0Z0MlEzamEyNXk0?=
 =?utf-8?B?SzlFSTA2TUgxQzVPUlE2MGJ2QzVGbnF1dXc0clYxVWZxSHNveHQyNjJadytG?=
 =?utf-8?B?SmVXbkxlRVA0TFd4a2RKeG9hZU5WTjlJK0pSbTRzZW5STTg2WEV3MlN1Sy93?=
 =?utf-8?B?a203UXk5V2JXSUZtVElMSzJydVBtc1dHeVM2ZW9GcWZEc3AyVWxmYXVCaXdy?=
 =?utf-8?B?N1QzdnlOVXUyeE9FL0VaemFWRVliNE9iZ0dDeE5NSmVrRXpGMEYrQ0Q1V1Mx?=
 =?utf-8?B?WmsycnVSUkJ0d1duai9qUjZ0ejZJUUFlMmwzUk1SR2x2Z25BMlVoL041VlJT?=
 =?utf-8?B?eElFREJoZzZEa3VreUdvRkYrRWhHOGh4cm1jMkFPYWdibC9ORDZRZVkya00r?=
 =?utf-8?B?dElIdzlXMFBtQ09wemZmazZJVTIzZ0luSjhtdjFhaERsUjlSNHl0ai9jeHZE?=
 =?utf-8?B?dFdxOVM0czlmRktCUXRwNUg5WnA1QzNQSnNaZW1rMjFaVkxwYlZScklNYVNl?=
 =?utf-8?B?QnZFeXQ4WGdML05pYWVRNE5kWkFvQndwVVBnMVBPblRvUVVXbWpGUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9003FD6A94DFBD4CA86528C3088E6A84@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 96041f12-c8d5-43ea-6c40-08dea541b912
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 16:18:02.9186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 T4gWVuCUfO/i0wbkvJj1N0K8EwhrfbT0/IUs7P80emRPp2BAI7eiIZm1lx03Wtj1O507VumOTTgTZF4RqqFXyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8649
Message-ID-Hash: MFJLH2UIFSSSWZBJCUEXBZVCYSVM46TY
X-Message-ID-Hash: MFJLH2UIFSSSWZBJCUEXBZVCYSVM46TY
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MFJLH2UIFSSSWZBJCUEXBZVCYSVM46TY/>
Archived-At: 
 <https://lore.freedesktop.org/7ae097ed33e934c5cbbc0340bba136cf0d5ca804.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI2LTA0LTI4IGF0IDE3OjA3ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBPbiBUdWUgQXByIDcsIDIwMjYgYXQgOToyMSBQTSBDRVNULCBUaW11ciBUYWJpIHdyb3Rl
Og0KPiA+IFRpbXVyIFRhYmkgKDYpOg0KPiA+IMKgIGRybS9ub3V2ZWF1OiBjaGVjayBmb3IgR0Ex
MDAgc3BlY2lmaWNhbGx5IHdoZW4gY2FsY3VsYXRpbmcgRlJUUyBzaXplDQo+ID4gwqAgZHJtL25v
dXZlYXUvYmlvczogc3BlY2lmeSBjb3JyZWN0IGRpc3BsYXkgZnVzZSByZWdpc3RlciBmb3IgQW1w
ZXJlIGFuZA0KPiA+IMKgwqDCoCBBZGENCj4gPiDCoCBkcm0vbm91dmVhdS9iaW9zOiBza2lwIHRo
ZSBJRlIgaGVhZGVyIGlmIHByZXNlbnQNCj4gPiDCoCBkcm0vbm91dmVhdS9nc3A6IHJlcXVpcmUg
R1NQLVJNIGZvciBHQTEwMCBzdXBwb3J0DQo+ID4gwqAgZHJtL25vdXZlYXU6IHBhcnNlIHRoZSBW
QklPUyBvbiBHQTEwMA0KPiA+IMKgIGRybS9ub3V2ZWF1L2dzcDogZW5hYmxlIEZXU0VDLVNCIG9u
IEdBMTAwDQo+IA0KPiBIbS4uLnRoaXMgaXMgZml2ZSB0aW1lcyB0aGUgc2l6ZSBvZiB0aGUgcGF0
Y2ggYWRkaW5nIEdBMTAwIHN1cHBvcnQgaW4gdGhlIGZpcnN0DQo+IHBsYWNlLCBpLmUuIGl0IGRv
ZXNuJ3QgZmVlbCBsaWtlIC1maXhlcyBtYXRlcmlhbCwgYnV0IG1vcmUgbGlrZSBkZWZlcnJlZCAt
bmV4dA0KPiBtYXRlcmlhbC4NCj4gDQo+IFRodXMsIGNhbiB5b3UgcGxlYXNlIHNlbmQgYSByZXZl
cnQgZm9yIGNvbW1pdCAyMGUwYzE5NzgwMmMgKCJkcm0vbm91dmVhdS9nc3A6DQo+IGFkZCBzdXBw
b3J0IGZvciBHQTEwMCIpIGFuZCBtYWtlIHRoaXMgYSBuZXcgY2xlYW4gc2VyaWVzIGFkZGluZyBH
QTEwMCBzdXBwb3J0DQo+IGZvciB2Ny4yPw0KDQpTdXJlLg0KDQo=
