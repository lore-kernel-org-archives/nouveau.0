Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77340E6BF0A
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 18:53:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 866A510EA53;
	Fri, 30 Jan 2026 18:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GEQMVHP6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5F83440F4F;
	Fri, 30 Jan 2026 18:44:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769798691;
 b=wd4osV/TypWO8hg93SewEdf0t0QOA5hYuxtp2+YkOGPrxL9LxBq3CzzTHwbMzqjje+0dk
 nqSgZo+513/oKzm+MVqVs0c384352tu7V4jrpJ5KCLeITO7uXGQcfNFKeT8y4+XivzO4pOt
 k4FPaXkTiFgOfamkuo7BnETS03s2uga/Ut7Hn6IEcUWmdjOTaXhT5+cxr3a6Q6WIpJPot7O
 T4dj0rGnNFUa1w/eWnm5YOBPAqHXSps7fheDUAfXg+0fucrk6FGTJF/P0nanQJhdpP6khwN
 YOLOtuPLoXUK1qZwOzf1Dhv7WaL/fF0Ygj1Puzh19Gkjs4PmiLN4zajchwWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769798691; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jSu+L8g8xaed2D+c4pXWyW1GlUPsr7/Mc+TbiemV9aE=;
 b=npqsYXBYXU3UHVd6g3sOYxAE2JJKnSomkY+UG7qmboN6h3Mpgpi48NsaeWnS4mcJrlrb0
 PkhBdtvpxNs9qhrqYNQSE0+sjBWcJVTHmywIp47tpe2R3aUxDIl34ZzlgqNGndesUtB1ANf
 fNGQm9YXhATF2QeHCizuvYrWT8dlNK8KAz6s6krS31P7jYK3Y+hWkr4k9PULa6yAiifkNsZ
 Us3cKXmRplaz+VBWiUtO0hfEGztrAGeVZlMQrSZwNAerBSF6NtjXiGV46M1ovusG+bJo7dU
 u3gc7+rdGpW5vdpW+hX5dUKgQh0fuHQmwH2PcK2rFPKdAGSjNaML4uvCDztA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 352AE4015A
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 18:44:49 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011066.outbound.protection.outlook.com [52.101.62.66])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E8FF710EA50
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 18:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtdnLyxQfHSw2bF9gy76sAHb1GQvD2zv7UZj5NvhvUq9GTlg0gP8efW/ywQopS46AQHiJPMPhWoYWo0yIPxPO8usRq2ftYFEUqeMnuZXyoyJSfsj74alZddz2kdPQ8bNtpq7FpPc7B28n2Mulgi3OrSF2GLvvknycHdo2l/FUzcPTm4XMDC2MZiW0MR9xsShdIoS6K8DJGnvIflrBEpxkX/0Zd9lch21e13kI5F2VP1nLAWtFA3rE0qmAYx6fjm//Uxh30P5zTE+vPrJnvKKWMyqWyRZO02I6LyuKW5NrW+RMJ8oQW0XCXM0jDDVojdIsn9uC3BzxAa7Topfs8hj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSu+L8g8xaed2D+c4pXWyW1GlUPsr7/Mc+TbiemV9aE=;
 b=Xxci8hipt0FiTriE34pD7eBIVuXgLf2PsC9lfVvQAZ8ABoNSc2ZzftTyp+ACKVEFuWqIuMly0tPru7JDxQfM4uFVas0EOQM/TxUpTfOCMXCxnysl1p/NqDB0fukW49LE7COrOn5FodoTsRsr3Xs1/OYmjNTuA0FPf+Y6i42MlXmRSbHk3Tfqqo7bKsJN3S6lETvMNjcs2DEHDeUbsxA61R8D3dmkSgj3KcIawik5xZdeUUWPwuXxrMnn4+LC5f5GTcOB9Licbh35+vM2Y20kLNLJWj0N8wVSraun+OYl+IrXXr8ZeKn0aJuBoWD/kmYHzVSqehfN+bCnkzy+z7fnSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSu+L8g8xaed2D+c4pXWyW1GlUPsr7/Mc+TbiemV9aE=;
 b=GEQMVHP64BmgVoEJnEkNBLXAxANGQNrb/zIK2GxJ2c4cirStIgvVHV7w8DrFPx5fq61oXJiJ2PFnUo+x8NWmyZs+IeIEG0zEbMfO3DYk5jS0YWRcTy44wNmhRNB+omQxKrhilwCh2t80Kg33w7NbQSF7dFDRveF4TaCGfSxPzYAgHq99p7ktqXwXdeZIyS3xASaGdx55NFDJicP2VpGwIHsdn38q70eofg/QOKlH7WZyGmYESVIpDlbyNS1a266rZbZ6w+2BvirtCsAzf/vopGHnQVWCC8iCS3X00Sod8qGIVuhSOPONEUjErw/Jl40oR/E+pqBwkIaKyb3vYhHAWw==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SJ2PR12MB8882.namprd12.prod.outlook.com (2603:10b6:a03:537::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 18:53:51 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:53:51 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "aliceryhl@google.com" <aliceryhl@google.com>
Subject: Re: [PATCH v6 3/7] gpu: nova-core: implement BinaryWriter for
 CoherentAllocation<u8>
Thread-Topic: [PATCH v6 3/7] gpu: nova-core: implement BinaryWriter for
 CoherentAllocation<u8>
Thread-Index: AQHckMcMkEP/ZXDUdk6g+xcUNYm52rVqZBIAgACt6gA=
Date: Fri, 30 Jan 2026 18:53:50 +0000
Message-ID: <1e9cb61de568103d114288fd3591f807a34a09f7.camel@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
		 <20260129022837.4133832-4-ttabi@nvidia.com> <aXxsWuuV9mlAEtAJ@google.com>
In-Reply-To: <aXxsWuuV9mlAEtAJ@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|SJ2PR12MB8882:EE_
x-ms-office365-filtering-correlation-id: 3e167e76-7969-4540-4ed0-08de6030e895
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RGVEdm1uazJQSm93Zytrb2ZqVE1BcEdualE1eDhETXM3b3RRT09LblZPSHJ0?=
 =?utf-8?B?USttNmdodTUyRm81ZDAwZm14ZEE5d3Q0dU1vWTlkMDB2SVp5VG5maUZDSVN6?=
 =?utf-8?B?WmRyMjduL2dZbGNqa0NlT2VjRGFsOG1qYzNSSTBPcDZVcjdWMFdvUnhRNFEv?=
 =?utf-8?B?WVY0VzAra1pRTStZM05oYnVGMUFwWTZTTENhQUpwaDgrb3o4bjRsOC9YWk5r?=
 =?utf-8?B?YlQ3QnZjSnVGaUFydVBwRFVjWDBWajlqNTl4eVhVRnVZWm5SeUdmTWQ2Y1hz?=
 =?utf-8?B?T0NyZHNTVW55S1VvTm5GMnFtWjMzMHBBcU1FWEFvYkF5N3RGZFBiam9zNXFn?=
 =?utf-8?B?dHI2NlRiTy9uLytPM05zNkNrNjZiMFY4MFlqOWVsRVhMaG1qQS9QcC85S2FR?=
 =?utf-8?B?TEs3cE1BNXpGYy91UUYxd3BQSmt3b1YvdnVrWGZKekpZV2JCSW0yQUV6NGlm?=
 =?utf-8?B?S2Jkam5hMmdFdWVJL0VOY05zVFRrbTR4NUs3bTFFVGNRZHdRWituZzBORW44?=
 =?utf-8?B?WTVpVE1sR0g3NG0zanhMaCtjR2t4aGFWVDM0aU0vcVpocUhyRHhYcThDeDVD?=
 =?utf-8?B?WElzOGJKK1hPRHhZaFJFaXBmZTZVZk14SWFLbHB2dS9kRVRIN2czcjJkN2J0?=
 =?utf-8?B?allnQXFiaGQzRjBkdkVPb1hzVmVWcjI1RkJzNVlKdms5eDMwNjEzUkRKcVJU?=
 =?utf-8?B?a3UwaVVDdzZwaUpMYjFmN2Z6VW84WktaTU0xTEh6RkdXVUp5QzRUUEYvVzBY?=
 =?utf-8?B?OHZiaHR6SWpNZWVOVHN3SDVzclhRdzBMSTh1MHMrWjdLOFR1NzZhamYrN0ZJ?=
 =?utf-8?B?ZWlvU1ZRbDBnbjNrZklZbWhoWVo3RHQ5ci9EM3VEZVFVY2FOTUZsaDYxcXFn?=
 =?utf-8?B?Sk1nY2pHVFNiSWxvQlV1NXZ2ZDNwaUh1SloxdU9lRWhIK2hEN1pMUXpmZnhR?=
 =?utf-8?B?VG1uTkJjejhGV08zcVJTNC9CRy9WYmRpUjQrZTRERC9HT2h4K0JGWmxDSDFH?=
 =?utf-8?B?VDVmQXRxY3hvQnRlNVp1aVNvdGVlNms4UEZTdlF3Q3FYVzNCb2t3KzdSaW56?=
 =?utf-8?B?UjdBaTJEOEd1MmZuVzNBdUVua1YyS2FKdzArTXZOcjFaZFQxMVRLZnNMUVBn?=
 =?utf-8?B?SkNiOHRWQTl1Y3E5akE1ZkJHOHEyT1U1c0w0S09BM3NGTFU0SzlXenJmaWNx?=
 =?utf-8?B?U3Q2aFd1SVlDQVZ4dXFiQk1KWVBabVVPTVZMbHZ2SXlYZ2dmSGJzbHV0NHNV?=
 =?utf-8?B?bGdzdENsZGVYUnlYMExXZk9vUXZ2UlZKWXd2V28wdVZsMENhWWNLV0dPYlNQ?=
 =?utf-8?B?blFpVWJTenc3ejd1RGQ2RmNta29zeTlod1ZBcnIvRmZPR2VtdVVQVzNKcGVP?=
 =?utf-8?B?T2lmV3ZWdURsUGc0YVlXUlVoZ3d6aEh3VnRRT1FWMEoxS2tpdTl3MytYQUVw?=
 =?utf-8?B?d1BERFVhQjdjSEFoL2tyS0xhOHNmT0J2d3NkQnczbUdkenFBUmxKVTlZOFpU?=
 =?utf-8?B?bGlhMURSOEhOWm9VbmkvT2JweHZESXNNZDEyK0FNMDNFU3JkTXlURVY2OGMv?=
 =?utf-8?B?eTc3MDJ4dG9qQVViOUQvS0JqdThMMk1jdW1adXA4Z2E1SkFvSGlhQkNFSllU?=
 =?utf-8?B?aGZ4L1pmSVYyTlQzNFp3NGdib2twNnFUS0VoSkFPUkpsNHJRa1ovRU9US1ht?=
 =?utf-8?B?VHBKNFlkWXlQaTlWNlNXdW5zdXNkTWdQdGhDbHBzS1BlVHo1TDM5c3EzZHY2?=
 =?utf-8?B?RXc1dUdJanFiQU51Q1paTUgrMk5QSEJwM0F5WGpIYUNVRlVXd3ZqY3lJaUJy?=
 =?utf-8?B?SlFqa09KbTc4dlZHM0xvb0Rwa1BvUkh0cFhKemQ4WUk2SFdJUkRDVEJ5Nk44?=
 =?utf-8?B?aW5aTVBSZ0IxaVRBVVkrL3Rnc0YzUjBxUEd5dzI4bkNxMVZLNnBFR05FTHdC?=
 =?utf-8?B?ZlNVWjZhYjc1VHZyVlRESWpSeFBrQ29kakkzV2VtdmUyRTBHNEYraVRRWXhy?=
 =?utf-8?B?ODlZUG1ZVnFEQ1JHVnVGS21UU0ZmbXZlM0JtNXdCSHpUcjIwK2orcmMydWJp?=
 =?utf-8?B?c2VYUVM3dldXQzlhWWlQejUrZ0xPb01UbGVpeEVSdGkrTDhjMkZrR2tLUTY1?=
 =?utf-8?B?STN1RkNXTXVucW1YRGQ3blA1T2l4bUxBcktIVmpNT1B6V1ZhNWExclFqdE5V?=
 =?utf-8?Q?eXqe2snEn7dyD7k/8ZXjYKg=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U09zdXVqOEZWS0FoMzBGK2pKNVpvM3lRZTI2UU5rM1VUQjQ4Z3R6RmdnbGFp?=
 =?utf-8?B?SkQ5em9VaHJLN3cycGlRZVdkaEgvanpSQlhKWEtJbHpJQ3FmbFBPMDYzUlhM?=
 =?utf-8?B?bWZRUzkweWhrZFBRUGY2VmRKWkc0SjYyRklLOGhpa2tONG5pMldmQkE5K2Yz?=
 =?utf-8?B?cVN6RmhyZW5SRjZnWU1YcExGa05MRWtrRHdleWxyRTIvRmsrN3g5KzRVY1dl?=
 =?utf-8?B?ZDJuaFNTQzNtZUp4R1drUW1XbGN1Y29YYlc3UUYvditGbmc0bUd5ckhPNHBS?=
 =?utf-8?B?L29nSWN5SCt5WVVNcHdFcnVWRFNCTndHK3RYVUJIQ29mK1o2WWE4WlRaMjN3?=
 =?utf-8?B?UVZmT1pENkRZeGM4WUxURjlCT25QeDNqUEdtdFM2N2V3TTV6bnBJVkdVZU9H?=
 =?utf-8?B?TUUzSjFoSEpOdWduVDVPaGZwRG1ZUGsxT3JwVktTbUtBdW54MWowaHlSUTNW?=
 =?utf-8?B?YTlJV2xqRzU3U2dXMlROQWhGRmlFOExsSCtCN3ZMYVlMdjJUUmt1Z1BZdXJt?=
 =?utf-8?B?KzAwZW5NL1lGcU1aRUMrcXV2KzlGdEd3SUZuVWxZSHBDeWpFRC9YZFlFRXlT?=
 =?utf-8?B?WVVLRmNCNDhaRWxjRmVoSXhVSnlLZHcwME1yajFjNVQxcWJXTC9RT2hWVlRG?=
 =?utf-8?B?VUNUK1pHUG9kVHJHNjBTbkNmakUvQmZmUnIwVmlhVHZ0NDdta1Zib1dYTHJi?=
 =?utf-8?B?V2g4VmxrT0s0aklKMDJKVXdOU25qODRxZlBnYWRJNWpZVFhCSkhINkFXRzM4?=
 =?utf-8?B?ejhGREtmSis0V0ZaK29UN0NVeXdLTUZuZkR1eFhYanAxUGVHVk9nSnlwejly?=
 =?utf-8?B?R2pIbXY1a0dBUXFHMHY1QVg0alRQRkdJRjZhRFE4SllZeUJxUnB4V0RuL2Zy?=
 =?utf-8?B?RHFvdWUyZHZkcWhLcFZVdmJyUDN4ek5VZHRFVzFQdkM3SkpLV0FXNzg1NWVj?=
 =?utf-8?B?bURTcVNYQ2FsQU4zRnhoc0ZqNkI5UzZxZ1QyMUExOUFNbHlIZ3hCVCtCcDRK?=
 =?utf-8?B?dkFHWVVDK2ljUElIOWdUWUpnb0d0MWtMeG5QQjdBSHlFQ3pGSU1GRVlUaG1V?=
 =?utf-8?B?N0o0T1VDNG9pc202RXBIazBIOFNLbTlvcVpteWJzc0hkN2M3UGo2T2xqc2Jq?=
 =?utf-8?B?aUR1QTUyK25EaUN4UkdjcDZ2K2NBRmhHNGc5TnpLWkl6VDlRT0JVckI3d2hE?=
 =?utf-8?B?MU1tZG1zNk9IQ01RZ1VFUmhzL0pZdi95R3phOFkrb0gzbisvWlRzdnRJUlQ2?=
 =?utf-8?B?U3I3SnlWTkt4eGQyTUtFQ25Ua3dxUk5NdFptOGloRTMxNHZ2K3EyTStzWEw4?=
 =?utf-8?B?b3RidlUvaU8relJsaTZJejJic2tYNmJtWDcyY3FCSFUvV1dPWTgxTU5TVGRC?=
 =?utf-8?B?aXRFd1I3L3JtLzUxbkFNNXN4ay84VUhzclpsalVCWEpTTzFSNlVLSjdzL2J3?=
 =?utf-8?B?NlB2N25UT1U0c0ZYQ0YzdThBQ05JT2p0TXp1TDBOcjFlOTNpRjZDclpPRCtr?=
 =?utf-8?B?aHc5bURDVldIcXZ1RjgwdnNuRDcwSC9RWitXRGFzZ0xDbmFrMWhhSm1venFo?=
 =?utf-8?B?RmdUUzVoTngvekdSK2w4K1ZxeWZhZGh0YkNaS0dWcHc2WlJWS1VoWXp4em9S?=
 =?utf-8?B?NWNQa01BZ1RtNG90WlR2UGF3ZlNhWExzdGdva04rSktlODZUcHdXWUpRVVVC?=
 =?utf-8?B?OVoyQ0JyTm41V3hnY2JMc2NaZ01LZVRSRXlEeGxxOHo4djBybHprME5UeElF?=
 =?utf-8?B?eXdHSzZwbk53RGU0NVA5aG12NStDNzBueG4zOG13TmJCYk05WDZLVFhBc2NF?=
 =?utf-8?B?OGhKUG5QdGgrYmk1eDlFNGxzbG9Hd2xKUVJvd3p2dTFubFpiR215U201VzJU?=
 =?utf-8?B?a1QzSXlvRXh2emMweWlQaGdzL3JBc2NtRCswbDNrMCtEaVZOdngyN1ROdDg0?=
 =?utf-8?B?VUdsZnZ6ZW5UVm5mR3BWYXJDVmRhOHlQQWVsUjVEMDFabU1GSHBPakFQVTU5?=
 =?utf-8?B?ZjllRnBWZFgyVHNpWnUwL0hRVktlY294VUFTNThack8zTXlndmx6cVkvYmov?=
 =?utf-8?B?V1JTaVpVRjNvcGpLMDRaeC9XMGUvQ2hwUWJoS2RuaEcwdUtUR3JXL1EzaVpp?=
 =?utf-8?B?QUZrMVlxNk9CbTZHYnM3RVpVemppY2ptMUlHTGp6eFc3aWp5RXNRNytseG0r?=
 =?utf-8?B?bFE0TCtqN0cvTUF0UHcwWnh0SGR6cDZkTStkUkJUeDFXNzFzOUdnSnJ2c1N1?=
 =?utf-8?B?U1pmRFJHUjRSUkJzMWRza3JQTmMyZDRzanJ2N29lVTFXRWNNZlZZTmdrVFJV?=
 =?utf-8?B?b3lwYWRHN1pqZG8rRVNUYTVuVVlCbEQ3Nms5LzlyQUdGVXlYQVNWUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <010DACAB6BFC9A4289AC86CC472E90E4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e167e76-7969-4540-4ed0-08de6030e895
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 18:53:50.9604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 3wQQhKv8vQyfKgV+ftGy6JWJ4790ygXhVOF5lUMWkq+ZhPNMxYDg7ZkE25dNpiIzA7TvLmCTo/XRf4UzcukBRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8882
Message-ID-Hash: P5LB6QRISU6FPCHU2NJOQ4D2BKDTCDYF
X-Message-ID-Hash: P5LB6QRISU6FPCHU2NJOQ4D2BKDTCDYF
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P5LB6QRISU6FPCHU2NJOQ4D2BKDTCDYF/>
Archived-At: 
 <https://lore.freedesktop.org/1e9cb61de568103d114288fd3591f807a34a09f7.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gRnJpLCAyMDI2LTAxLTMwIGF0IDA4OjMxICswMDAwLCBBbGljZSBSeWhsIHdyb3RlOg0KPiBP
biBXZWQsIEphbiAyOCwgMjAyNiBhdCAwODoyODozM1BNIC0wNjAwLCBUaW11ciBUYWJpIHdyb3Rl
Og0KPiA+IFtQQVRDSCB2NiAzLzddIGdwdTogbm92YS1jb3JlOiBpbXBsZW1lbnQgQmluYXJ5V3Jp
dGVyIGZvciBDb2hlcmVudEFsbG9jYXRpb248dTg+DQo+IA0KPiBUaGUgY29tbWl0IHRpdGxlIHNh
eXMgJ2dwdTogbm92YS1jb3JlOicgYnV0IHRoaXMgaXMgcHJpbWFyaWx5IGEgY2hhbmdlDQo+IHRv
IHJ1c3Qva2VybmVsL2RtYS5ycywgc28gaXQgc2hvdWxkIHNheSAncnVzdDogZG1hOicgb3Igc2lt
aWxhci4NCg0KT2suDQoNCj4gDQo+ID4gKy8vIFNBRkVUWTogU2hhcmluZyBgJkNvaGVyZW50QWxs
b2NhdGlvbmAgYWNyb3NzIHRocmVhZHMgaXMgc2FmZSBpZiBgVGAgaXMgYFN5bmNgLCBiZWNhdXNl
DQo+ID4gYWxsDQo+ID4gKy8vIG1ldGhvZHMgdGhhdCBhY2Nlc3MgdGhlIGJ1ZmZlciBjb250ZW50
cyAoYGZpZWxkX3JlYWRgLCBgZmllbGRfd3JpdGVgLCBgYXNfc2xpY2VgLA0KPiA+ICsvLyBgYXNf
c2xpY2VfbXV0YCkgYXJlIGB1bnNhZmVgLCBhbmQgY2FsbGVycyBhcmUgcmVzcG9uc2libGUgZm9y
IGVuc3VyaW5nIG5vIGRhdGEgcmFjZXMNCj4gPiBvY2N1ci4NCj4gPiArLy8gVGhlIHNhZmUgbWV0
aG9kcyBvbmx5IHJldHVybiBtZXRhZGF0YSBvciByYXcgcG9pbnRlcnMgd2hvc2UgdXNlIHJlcXVp
cmVzIGB1bnNhZmVgLg0KPiA+ICt1bnNhZmUgaW1wbDxUOiBBc0J5dGVzICsgRnJvbUJ5dGVzICsg
U3luYz4gU3luYyBmb3IgQ29oZXJlbnRBbGxvY2F0aW9uPFQ+IHt9DQo+IA0KPiBUaGlzIGNoYW5n
ZSBpcyB1bnJlbGF0ZWQgdG8gaW1wbGVtZW50aW5nIEJpbmFyeVdyaXRlciBmb3INCj4gQ29oZXJl
bnRBbGxvY2F0aW9uLg0KDQpEaWQgeW91IGludGVuZCB0byByZWZlcmVuY2UgdGhpcyBkaWZmIGlu
IGdzcC5ycz8NCg0KIHVzZSBrZXJuZWw6OnsNCisgICAgZGVidWdmcywNCiAgICAgZGV2aWNlLA0K
ICAgICBkbWE6OnsNCiAgICAgICAgIENvaGVyZW50QWxsb2NhdGlvbiwNCg0KYmVjYXVzZSB0aGF0
IGRpZmYgd2FzIG1pc3Rha2VubHkgYWRkZWQgdG8gdGhpcyBjb21taXQuICBIb3dldmVyLCBJJ20g
cHJldHR5IHN1cmUgdGhlIGBTeW5jIGZvcg0KQ29oZXJlbnRBbGxvY2F0aW9uPFQ+YCBzaG91bGQg
YmUgcGFydCBvZiAnaW1wbGVtZW50IEJpbmFyeVdyaXRlciBmb3IgQ29oZXJlbnRBbGxvY2F0aW9u
PHU4PicNCmJlY2F1c2UgZGVidWdmczo6cmVhZF9iaW5hcnlfZmlsZSgpIHJlcXVpcmVzIFQ6IEJp
bmFyeVdyaXRlciArIFN5bmMuDQoNCj4gPiAraW1wbCBkZWJ1Z2ZzOjpCaW5hcnlXcml0ZXIgZm9y
IENvaGVyZW50QWxsb2NhdGlvbjx1OD4gew0KPiA+ICvCoMKgwqAgZm4gd3JpdGVfdG9fc2xpY2Uo
DQo+ID4gK8KgwqDCoMKgwqDCoMKgICZzZWxmLA0KPiA+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZXI6
ICZtdXQgVXNlclNsaWNlV3JpdGVyLA0KPiA+ICvCoMKgwqDCoMKgwqDCoCBvZmZzZXQ6ICZtdXQg
ZmlsZTo6T2Zmc2V0LA0KPiA+ICvCoMKgwqAgKSAtPiBSZXN1bHQ8dXNpemU+IHsNCj4gPiArwqDC
oMKgwqDCoMKgwqAgaWYgb2Zmc2V0LmlzX25lZ2F0aXZlKCkgew0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBFcnIoRUlOVkFMKTsNCj4gPiArwqDCoMKgwqDCoMKgwqAgfQ0KPiA+
ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IG9mZnNldF92YWw6IHVzaXplID0gKCpvZmZzZXQp
LnRyeV9pbnRvKCkubWFwX2Vycih8X3wgRUlOVkFMKT87DQo+IA0KPiBJZiB0aGUgdXNlciBzZWVr
cyB0byBhIGxhcmdlIG9mZnNldCwgdGhpcyBsZWFkcyB0byBFSU5WQUwuIEJ1dCB0aGUNCj4gY29y
cmVjdCBiZWhhdmlvciBmb3IgYSBmaWxlIGlzIHRvIHNpbXBseSByZXR1cm4gT2soMCkgaW4gc3Vj
aCBjYXNlLg0KDQpXaWxsIGZpeCBpbiA3LiAgVGhhbmtzLg0K
