Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE68E7DEF0
	for <nouveau@archiver.kernel.org>; Mon,  2 Feb 2026 14:47:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EAE4610E2C1;
	Mon,  2 Feb 2026 14:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="xye7QBvt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7A04341830;
	Mon,  2 Feb 2026 14:38:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770043085;
 b=D1PQdWTJhasIvQ7QxQCzdhDmnugizW0ZsOK2+xCrcNbTdl9qnhchnCxUmOy1/cDeN5GbG
 UT0NJ73/hgq/crf02ME47vGPShHZGayOYWElpODtOjAb9lzRtuSiMc2jZAcGfRk5h77qNCu
 iuif3TBt6qPjurv+F2iuHWnwlGsptZRnZcTJmy6zfGgOD5IyFafRFHxPIPKiVgfmbynz9Jg
 bKoRpzYdkN6BSxSn+FpPJf2thbRR7gAdg2Nr/QcP9YcLVTaBBdFZ1pEVcWEbnmg5DSavSrM
 dNycSa6QGabps8Ygtm3/RjjwbaNnHjmKWSmC3V5lcPf/z1FFHXYl8MVmny4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770043085; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PqSJ98sN50b/xbDGtXYMpNB6B3dXgQJxIoNFIadTBQ8=;
 b=mZHWIujN8EbhqXsK0INpjybWFIYjNT73HUWPP4hZULV0cPjc8zTO74MqY3n35BIlqiEoL
 pahylGEmJxc+j4EZivdRQmq3zpdGGviEWadtVtkp8F7gPrnRTaN05D+ycP//TqKTAGKODK2
 aI0XJ8VuQ/a5dHAEmIzhuCBLrTyA3SGCZSB1BXw+Un3UIJGIu3AHz8qMkcS+YridbI1eZi1
 AxENCXWVWYgykOaDcxn+ADmMkFlC4ka0WO9tC0UZ66RTwUo/jQoK3Xykg8O4NLlBNR4iUvF
 Tii4n7sTMUXBWBzpfYcUcWrHpnXD29U5A5PCp2Fn3f14MnLRMJk/dFiNWW5A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id ABBE041830
	for <nouveau@lists.freedesktop.org>; Mon,  2 Feb 2026 14:38:02 +0000 (UTC)
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021081.outbound.protection.outlook.com [52.101.95.81])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CCA5A88FF9
	for <nouveau@lists.freedesktop.org>; Mon,  2 Feb 2026 14:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhSQGoE3s4eYPo8xki6riJvbMRyXLCCD6o8hAjPloPiy1E0EI1aCumVmaf0Zb0bOw4tW26hSJ+FQw7STNs6tkd/eXfrTaaTJsOfOPj8Nd+RBMzZHKMxHtY2C4zt/a9m3Fi24tQl9buDWhv1cfq3wgSFzFaD6VIQjFKLL6/7T4Tui7Td4G3JTNY7sVHd0G18XbKeKnge+C9kgh1WCaHDrGLD990ChF2GJWPVQIE/niiwUwlcVHEQNuLFAlce/retgeXPnOcfwYAGr578gnpaTXeAD9YiZaaLA/usnuOFuBvnIfxHPhKbAwgHm1iGmeHZQuGfV6CQRoZU/ZNNAPQymoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqSJ98sN50b/xbDGtXYMpNB6B3dXgQJxIoNFIadTBQ8=;
 b=uLkzTlcL3cN+GXEJj7POHuKZBd5I2qqd+oNiEOURqG5cmnLHJ6fpU56EnygqOJAY3FUWW4oALNyN9cCwQanr34DbIbhkYHcuaao8EefMFu/Vx4ZZc0/4tY3kSbRzlPu9kZHYp/+X7htt0Tm0aLPyqZnM9/TxU87Ii1TS+5fB71poRzsC1Wavc3/cZXsOqYb8t+KcS6TmELjKF/Sor1LiCuegXdjgEnzpNqM2v+CzLT8hpRjSQUC/zqnwmYQYocIyP6yHd9MWPuEv5aktdyEpoC8g18KGiNCrrFzQIqyIRcSWjtgTSUlUbkYrPicQVI0cxsgXgdmSMs2elkqoFzpozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqSJ98sN50b/xbDGtXYMpNB6B3dXgQJxIoNFIadTBQ8=;
 b=xye7QBvt9MS/mJxfSw5bOEdYQCsHXWl+KWP89tMSKJSYgxPQ5rXFOQV/CFFIFI18/hUv1kT/RwxhOnSprCpLyDzLsRsOkXXE+glM/aJNCRtquQJMBkFu9SZ9I0hsYOrJxtWwR3H1LcCKbel6u7FSTWijC3ymKXleluRc7XnGZTI=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB5903.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 14:47:12 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 14:47:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 14:47:11 +0000
Message-Id: <DG4K3MJZUKJB.455AKPBKK1YY@garyguo.net>
Subject: Re: [PATCH v2 01/30] gpu: nova-core: print FB sizes, along with
 ranges
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260131005604.454172-1-jhubbard@nvidia.com>
 <20260131005604.454172-2-jhubbard@nvidia.com>
In-Reply-To: <20260131005604.454172-2-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0616.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1982d2-1d07-4b77-3dae-08de6269f2cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NW1kT2NnRmVFenpZSFVmL09MZUwzc2U0aHhScllDcXNqcHJZeis2QWltcVgr?=
 =?utf-8?B?ZUVQaU5DbG9wWDYvZWl4RnVkcFMzUlZvRnhIOGpZVU81a2VlV2V1T0JGZzJR?=
 =?utf-8?B?ZUpyUnYzMzJlRHdDZ2VjM0YwbFlURUtIZkN0Mmx2aFFlYWoxY3cyNTdpSEZV?=
 =?utf-8?B?MGJueSsrYitWbitpS2ZaOHVWVlBVTUJqQTltamNNVnpXMmRmT2NKMnNGTDdI?=
 =?utf-8?B?M0FFV2NjMDQzSWZSODE3T0dPVXBVS2tuK2dPbGYwQ1JnVllVWDRzeGJvZnZy?=
 =?utf-8?B?b2M2Q0xGREt4TWdteGhveGFKUkQ3UGJRU3JCQzhUZ0EzbVE0OFFZdld3L2J6?=
 =?utf-8?B?QStUdHNWcXBYMlI4Zk5mcm1wUFR2MUJWbkRWRHRaVEhWNXIzbnUwbVdoL2NS?=
 =?utf-8?B?czczMnNNQWNKMHFFQW9qVU1RdEpJTzFyZWpjVjVzZ0lKQmJTbUs4SGJvU1M5?=
 =?utf-8?B?YnZCZU85VmpTRTdraUxiSG9DQ1l1TEdVNSs5YXNwdEdyRkZmTnErL3puS3Y3?=
 =?utf-8?B?b09leUcwSm5TL21wZGlVaG5qaHY2OXRqd0NUQUxHdk9FUTBjUUd6TGVvaER4?=
 =?utf-8?B?cFBzZ1Qwa0NrZFA2SnlySmR6eUxSR3BzL2NxNHQwaCs2TjJ6QWN6aXcwaHdo?=
 =?utf-8?B?RkU4d1BRcG9lMmE1dDljbXBSL005Q2wvbXZrekpiU0twMUludXVSRDRBRXV1?=
 =?utf-8?B?K1J4bFRIUDJaalNnR0x5aVpqL3ZFbnQ1VlRBQWczT0ExdUZLQml0UTF1dFJ0?=
 =?utf-8?B?OFNCcVcwTUJKRXpiYStONjVnRXFTVUsySnJ4M1A3elBMYkRZMkJoSWZWRUxZ?=
 =?utf-8?B?S2loSGpYSUxub3V6UGVNK3A2TEJGM0xFU3BNWVFCMW03Rnp0S3JaalYzMnRk?=
 =?utf-8?B?Sy9mdW54S2JHeDQ1QnJoaHVUTFdSek51Y0FFMEc3QVZUTTF6VjVkU1Y2SFIr?=
 =?utf-8?B?TTduVXY3WXlQeHA5MlpnQ3lMb1hsQlp3Z2w1cGY5VG02Zk8rQnFZTXZBUitB?=
 =?utf-8?B?dGs0U0d1bWRIWk9YS3NnTk1yS09GVzJMY3V3cFVQZmlpdkF4enl4aUlaNVpm?=
 =?utf-8?B?QU1mRGMrZDZpNElHMjVkai9sQzJWY1Vtem5LWTRGRzJ1YU9UMGtZUUlHRlVi?=
 =?utf-8?B?VC9GWVQ0UnVjSVk1TEh4WGVXVityRm02RWtXNEw2WkpCdVJuL1ZHYm5mLzhw?=
 =?utf-8?B?UXR0NWNXdFhZUWlyVXY2cmJUWksvUUFmUENPU1hyQmN2eWNJVTQxT3lJaGcy?=
 =?utf-8?B?OWhHQW1iYm1venNBWFp6RkxhK1hNekNrV1JCNVV1Z1l6TDJtU1Q0ZVFVaC9D?=
 =?utf-8?B?MnFVVTZPaERlbzdtRWRjZGNFNzd1eDBhUU43QzVQd056MjkzNnR4ZnpKdUJa?=
 =?utf-8?B?OE9UeVdaSVUxY3E4RzlzVjNwbThHSElkR1RZS2hOOTU0SXFTYVk3dW5HL20r?=
 =?utf-8?B?S3FiTFJKTVU5YVlDTXFtWnRiS1pZRGNsWWNTTXFJMGovaFcyZWZnMWFEUWlO?=
 =?utf-8?B?L3AvUkJtdndzM0JZRUdFQUFraU0wQ1VVdzEva25jNXNhZkNHREVlMHVCdmFx?=
 =?utf-8?B?ZGJ3TXBKeVFMSWM2Z1pNbkorZ3QrbHBMQ1d0aG9HWHRmVmoweFdrS1dJNVNJ?=
 =?utf-8?B?RGF4UGRhWTF2K0VNZCs0c0JLeVdNYjR0M1B1V05BMDJMcUdUVVZka0VDczRq?=
 =?utf-8?B?NlRKVG1uZGpuM2NjUFBkN1pLRXp0aHhQS0w0UHhPSWtRY096clpCRTJrbHE4?=
 =?utf-8?B?UGYxYVBSMkNqcCtpUlArNFpNOXA4VFNXbC9MUDFyTkhIcGpSN2pRRDNYeWlp?=
 =?utf-8?B?c3ExRjZON2o5aVRaMXVUZTI5NW1SdE5OcnJXSzFVVFdwNlFsMnRoa3g0SFhG?=
 =?utf-8?B?THdlbk9VbWpyeVJsMlFRbWJYd0NpR0NDSExJdE81Z2VhbmJ5SGtXa0dvdVBO?=
 =?utf-8?B?dzFQbUV5M2l1NzBGcjI3NVFQaG5OZmxRb3RRV3FPaXFGQ2sycFBueDUxY1do?=
 =?utf-8?B?TnZkN3J2YnhIVUtsNUNYMTZSSkh1dU93amVPcklVMWkrL3VDZXVLcXZJbkQw?=
 =?utf-8?B?dWZGWVZydWhucW1wZzZJV2dNS3ZyNWdNZk9jRnd5dVB5U3Z5L0lOenBFczBQ?=
 =?utf-8?Q?nzbM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YW5XTC9jbGdRTXJKbUg0Rk1uWXpGMHpEZGNDcE9JK2RVM0kvUGQzSDdZcUIr?=
 =?utf-8?B?QTJSY2VTcExVZ2ZrRnJUYjZrelNXNVY2d1hCM0JJZVVvUlJRYlRIYkt0cFpq?=
 =?utf-8?B?b2pJVS9zTityZWhIMWFPT09qaXVBR0hlYkRmbTFPWWs2R3NpdmhseWtRUjg0?=
 =?utf-8?B?dHhUaTFodFJ5aG41YnlPZGlzL0ZRQ2VLUS96M1FTVXFnT0VDRFp4NVQwd0pq?=
 =?utf-8?B?YjlxcC9UdjZhclVtV2NsV0FkQURZSml2WUszKzZRRzdDZzhvamNVc2hSN3I2?=
 =?utf-8?B?cFRvQXFwVlpaK3ladUZVbHc1a3VwcnNvZFBhSWRHckw1T2duMG5Wbkl0bkJR?=
 =?utf-8?B?VDhDdEVyN3hib0pEVlljMGFpT3FWZGVsZ29XdjRsR2RFTlNUbmgvM3pBZnRU?=
 =?utf-8?B?aEJtVUEzQy9CVG8wcy9UcjloaWF2TUY2RzFDTDhmNnVLa3JZcXRjMEF5K1pa?=
 =?utf-8?B?aGovbXNzVitNQVBhNHpFZVhaaFNEaml2TEI1enZUemx3aUtWcytuRmhnVUpK?=
 =?utf-8?B?YzRoWkNWYU1LS3NIMDFQeVN3R05KcmdxV0RweGNxM1Zuc3I2bkpTQmFlbmZh?=
 =?utf-8?B?Rkt2U2x2eCs3TVJaTWNoaGMveTJEQjhtYUdiZ2hhdDlkUGtEcWtLdG9nZGRM?=
 =?utf-8?B?OUljazFyZEM4eGxlVEpJNVRzcXdBc1pYcnlPQVVNRnVxKzRmbE5kNkFIaWFP?=
 =?utf-8?B?aldzaFpWRTRUQzFBWXFOaUdVUUR0dHNTRHpOY2dSQ2tOSTgwdzJ4NkQ3NHJQ?=
 =?utf-8?B?Q1ZRbThQMlowNlRlVUpJcVFRZlp0a1I2Y1hrWFZ2aFl4RHVyVVN3TWFPREJJ?=
 =?utf-8?B?VFIrMDZaMFJLd1hoY0Qwb3J0VlJzMjNxbFBuSVk2aUpJQVdQZTdHUFV6TWhB?=
 =?utf-8?B?Q3dCVllYdjN1c1p0d09rWGJIUDRBKzRjM3ZKWEtBQWhlVFFzYlRNaXA5aUtw?=
 =?utf-8?B?a0JkYWlGSTBZb1pibUcxL1phQUIrTFdUTG4yZXJ6QjRvNkdhU1g2enNaakxG?=
 =?utf-8?B?K2xkZE12WnNyRGtVQ0xTMmFndU9VSEp0TzNhQ1FBSmhualZnU2NWOXd0a1Iv?=
 =?utf-8?B?aEJ6Q3FuNEFsMUEvZUlMTENDd2ZoRTc5UjBKQkZMV3AydStQdTl4cWx3N3ZG?=
 =?utf-8?B?UXl5cG5VKzM3ckpFMk16YnpWSHJkK3UwaEtsN3JPMXA0dGVMZDh1NXRnWnF6?=
 =?utf-8?B?VU5HMm41bXNLWWFvV2ltbnlyQlFYNWhBVk1MZExQZFBRNlZlakxYNDlac0h2?=
 =?utf-8?B?Q3hrZEZsYkF5V0kyTUxVTXVzVFBPUlZ0T2s2S3RmY1ZzYXBRTWNma3lweGkz?=
 =?utf-8?B?SEdKYTVSSnBISU9nbm94TnFCNHlvWitmdmNMdVRXTGMrcE5TajFYWHViWFVp?=
 =?utf-8?B?UzhZTkVkSmlnRENKQ2VqNkNkRzh1UHJJclYrWGlYNW5FRDNRY2RoRzg3Ulox?=
 =?utf-8?B?VzJRczJXSmVudS9XVmwwbU5ZazBjRUhwV2hONzJUTWoyYyt6S2lHaUdOejRB?=
 =?utf-8?B?MEJmV1FET2hWbFVVQWE3V05QZThoWng2bWFOMEJYWm9wMExHWFdBYnNjdXBZ?=
 =?utf-8?B?TTlSZlRIakUxSS9JbndOejZGVHoyMnBkR1FwTzhqS0VnSjFwelo3RTNwNURI?=
 =?utf-8?B?NDBNS0R1LzlINzlhSTZ6QmlxZFZxMjY4M3Rrai94SXpCbFJRcERSc1QxTlBB?=
 =?utf-8?B?cnR5dWRJZnk3dklwUkUzT1pWTVIxcjVqaHlMWUF4M3BhVlJ5eGxGY0xNYzlG?=
 =?utf-8?B?VTVuZE9vYzk5dm1GdHN3dGlsYmRVbzA5bmlBMlhwTHNvclpSZlMzbjlzWWc2?=
 =?utf-8?B?a01haXJPZ290bk1TbDJzTnBlRTJjRGdVc2RXb3cyOEtCZ1Rnais0b0g2amhq?=
 =?utf-8?B?MjRzOXJ4cHJOMkNnQWtYajlUcUpIbVhmNlRXL08xQUp3VW0zRjBQdmdBTGZE?=
 =?utf-8?B?NHhvOThOZ1lkYkNxcmhWUjBvMDh5VWNJb0hlWm1MWWRwUVpKTmU4M0NtOGFv?=
 =?utf-8?B?eEtKTmtna1dYaEprVTYrS012aTVqb1dzYU9oV2RxMzNacEc4UmpuRC9EeUJm?=
 =?utf-8?B?VnNISldBSkJLMzBDSWhlNFR3OFcwa1JkU0RCUXhCZU1TdnAzTEJ0WmVHUnQ1?=
 =?utf-8?B?ckNxZEh6QW1ZdG9rT0ozRXhsMzZNQUlGRjFkcnp6S0g3UFN2d2ZHRUtKYUFq?=
 =?utf-8?B?UVpYUG9HalFQSWY3RnNTelIrbWZOM1p6K2M5YWVveExiS28zdEdqYTY2ZGh0?=
 =?utf-8?B?OEtPWlVBOG9OK2JHS2FvdnM2Y0VNTjlrL1ljS2VWMzc5Mjh5NTkxSDBUWFR6?=
 =?utf-8?B?ZzZ6c3hVQ2J6Nmlhb0tmUStOdXFvaTlEYzVBTlVJbnFzT0tIOWJXQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3f1982d2-1d07-4b77-3dae-08de6269f2cb
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 14:47:11.8507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 02QqoBtnomyr1ZZTNr0ijYnJTVL/cRwuRCNNxDrI/kLp2Rm2BfNGB+GXSOiLvqhZ7aRFSH+vUZF81opv8tuWOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5903
Message-ID-Hash: 37RLX5MBTB74HI5AJUWVXZK7EJ5MHXYB
X-Message-ID-Hash: 37RLX5MBTB74HI5AJUWVXZK7EJ5MHXYB
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/37RLX5MBTB74HI5AJUWVXZK7EJ5MHXYB/>
Archived-At: 
 <https://lore.freedesktop.org/DG4K3MJZUKJB.455AKPBKK1YY@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 31, 2026 at 12:55 AM GMT, John Hubbard wrote:
> For convenience of the reader: now you can directly see the sizes of
> each range. It is surprising just how much this helps.
>=20
> Sample output (using an Ampere GA104):
>=20
> NovaCore 0000:e1:00.0: FbLayout {
>     fb: 0x0..0x3ff800000 (16376 MiB),
>     vga_workspace: 0x3ff700000..0x3ff800000 (1 MiB),
>     frts: 0x3ff600000..0x3ff700000 (1 MiB),
>     boot: 0x3ff5fa000..0x3ff600000 (24 KiB),
>     elf: 0x3fb960000..0x3ff5f9000 (60 MiB),
>     wpr2_heap: 0x3f3900000..0x3fb900000 (128 MiB),
>     wpr2: 0x3f3800000..0x3ff700000 (191 MiB),
>     heap: 0x3f3700000..0x3f3800000 (1 MiB),
>     vf_partition_count: 0x0,
>     total_reserved_size: 0x1a00000,
> }
>=20
> Cc: Gary Guo <gary@garyguo.net>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/fb.rs | 83 +++++++++++++++++++++++++++++--------
>  1 file changed, 66 insertions(+), 17 deletions(-)

