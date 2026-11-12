Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01CF606A33D
	for <nouveau@archiver.kernel.org>; Thu, 12 Nov 2026 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Ez6XqCrV;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Ez6XqCrV
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C6C3810FF96;
	Thu, 12 Nov 2026 09:45:21 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2E78F49295;
	Thu, 12 Nov 2026 09:25:41 +0000 (UTC)
ARC-Seal: i=3; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794475541;
 b=NDnmHlJ9eRhvjDFfLkUxLQN8QOd6lm7le4ZFBG1FJowueS2eHlZ6ZTKYXOgq1CKXP+ISn
 CC9L6oUY/zuWTKY2oVYPZ14I3lc06DodeprC/ipkppmD3i2c2qHJs1hpE9uBR4NkJrQdav9
 U+UuEl5V9ltBi4PtrMrcxJTpwzRLsRxs1i+oedeW6R0MI/ReKUS/R+bk8K90E+kGUfdPqZ/
 btSW8vaHwM1GfvEMvUr0jozTgOJo0wPwcFhkmWvbuiMepRoDy3uzslCrcKKGw8m+RMExp5S
 Wuzn4OE2aer44zihVIJM7ZbRHE/Q3V0sN+LY4ybjEeXKuuiYnwC5vzGFZcVg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794475541; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jZE7IhtX1NmUiFMMT6bvC9A/apAk2w/Gp6I00CiyWq0=;
 b=XqzsJ+tpCnhSWRy2WrnDKbEXakkHGVJotqVNZRNCh2NVd9Kn/DjIxbrV7K8jVoNOoFm1S
 DyDr7PwgxJfwpPy5EPlVF+VU1k60vcW52i1Caw/t2qU71IXFVO2H9qEhCWbQD4nD9v2vB/T
 rgYWHu83OrgYlqrsUVsRv+3XlNN4TueHzC90mB03UWVcYDmfWzc+Ab0TwD7QvGPrYeoVg/d
 p24jLzgGp22ZwnzQRp+MiPg8+8i42JXEYypQHPzbk7TNd3Mz2J7vPj8QtJdupXDT7MTOSmK
 umWh1n80WLuq0FSVWc2WZnpGBdhx4SPhudWzAk35Pfyw/tmsWis+4zImwYuw==
ARC-Authentication-Results: i=3; mail.freedesktop.org;
 dkim=pass header.d=arm.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=arm.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=arm.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=arm.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D2D6C4920E
	for <nouveau@lists.freedesktop.org>; Thu, 12 Nov 2026 09:25:38 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011055.outbound.protection.outlook.com
 [40.107.130.55])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0384810FF81
	for <nouveau@lists.freedesktop.org>; Thu, 12 Nov 2026 09:45:09 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QCv6WBsyeHVjUpwiNdNvYNdnp9TEQuYjP4yKNsfc5jIXn2/+qdOAWBLKM53HMLRws/YG2d1AnZjcedSIiefySmKuMpUUiLDNIoZWuqhCdPLyOBqxYfuKACYRBxC8w0BcVluTLeFf42vgpJkx77N6pWc4q7DZkAThhxKhRkw57t3r3rOMa0kUn8j243xvosncdXih+88NvxQt/PmuMkqYo5R2vdj3TKMG4JAqI093SwQ+OfS3WAPA2s0xu+/Zj23aqvVjtDOa86bQayMvvwYAuFPw6Ob2uIqRyhx22Z+C3b0i9jGgOrrx28NNm6R2lJr95bdM6MiMVntuR9JHgV1KIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZE7IhtX1NmUiFMMT6bvC9A/apAk2w/Gp6I00CiyWq0=;
 b=KN7asBlqH+TT6O6161yE0/Kn2kiBbQTmF+4kxwOzVmNtuoDy+mwy7taTCyoGwls/WFaSBnMrTTO2va8jlsje5mHy44NfaE9So6plXHYIuf/C66tESV3RbYoyRK5q6z2bQWk+JMticEdtVsx6oa3n3PTzT8I9oXzHrHmCBgk5GdtY+/WZ7eyiDsrju/SCyK/bK/bG5Qy3UpA9AJWRgsyv2+I+zzqKIcozjRb/k1iW1PlbIYhcu/EIsDGtx4FQgpsvZEQ7q5RXdZkO8sTgIRomrqK1JIx0OKT7QnDj94Ns3PG1YYH1uMYRv8G1UN2xby/8YCygvtACMLyY+0yA2lqNwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZE7IhtX1NmUiFMMT6bvC9A/apAk2w/Gp6I00CiyWq0=;
 b=Ez6XqCrVkAIrs3uf/Pvphnn80ty437AGFP0mArLZLa7WvoiPlPadRJ3yvQc100KNfCA4UljxBVKbMNLDOJdNNfNJUnI/3afHQC4vNImwu0AHKLqocTTRx2l8IdkZKPObdJv0cne3NMQMOciePvzh+hJyIhuQfKGZY6Y1bmn9awo=
Received: from AS4P191CA0053.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::29)
 by MI9PR08MB692857.eurprd08.prod.outlook.com (2603:10a6:290:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 09:45:01 +0000
Received: from AMS0EPF00000568.eurprd02.prod.outlook.com
 (2603:10a6:20b:657:cafe::4) by AS4P191CA0053.outlook.office365.com
 (2603:10a6:20b:657::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 12 Nov 2026 09:45:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000568.mail.protection.outlook.com (10.167.242.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 12 Nov 2026 09:45:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAMNLFUf51JW1Pr8evq98Jpt/X0t5lmajKOVqo77sabRBdepWj7409IvXxLc2RSXBN8lC0PS1s57yFzU0p0RJv/QgvDTdWKPk63VfFeEk+Q6/vK0wGj27EiUlRw6TEJWITnvalmx3bVcVqML/EgxfGg6DyY56UiaFjOWq2zcEl1FhkOXQbMiei4xf8Cj0AEIN+nKEZ57Aj5dZcsD6ROp2Ah86771vNeouYtqZUYIOWEjZPCSAXPOhVQjpTEm/n1pMetL/zV5v2OU5/OcaHgnWzrC5wcgW8Q5ochAL5biTBQiWl2k6BuAfmcNIk5yT+NiJSTtRYrBZJ2eO1SgZKppvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZE7IhtX1NmUiFMMT6bvC9A/apAk2w/Gp6I00CiyWq0=;
 b=eRGA+XXe7aCNm4fArp6lYrQ7QxjQW2DwT31Vw7pXkV2UoxI+OzuEhy7MsNblIaCKT3k+HodTy0n0vRWWecOaxDKVHXVesOxMFGpkdN+6VzvrenOiFCmN8f5TEAgMhyia/JjFji0y2pZp1TVnWq9zYeZHBxZVAVpi5zlNLvy8g7YbJC31R6IuRPhtxWR2EAItD7lBsLhDUJLdqhZxOL9ldS4exMARA3qiPPAwTDGjbQx7lZyQGFVyIHmxm+MjP2Q9r1KL8FIWLK32A8YwPwxNAKl+mKRnyKlQ8jmcSuBXaYzCwmngv9xxNOGSULKRYwBTq4T6I4mS3CNVk8Mc81G7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZE7IhtX1NmUiFMMT6bvC9A/apAk2w/Gp6I00CiyWq0=;
 b=Ez6XqCrVkAIrs3uf/Pvphnn80ty437AGFP0mArLZLa7WvoiPlPadRJ3yvQc100KNfCA4UljxBVKbMNLDOJdNNfNJUnI/3afHQC4vNImwu0AHKLqocTTRx2l8IdkZKPObdJv0cne3NMQMOciePvzh+hJyIhuQfKGZY6Y1bmn9awo=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB10291.eurprd08.prod.outlook.com
 (2603:10a6:20b:629::15) by GV1PR08MB10402.eurprd08.prod.outlook.com
 (2603:10a6:150:15d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 12 Nov
 2026 09:30:16 +0000
Received: from AS8PR08MB10291.eurprd08.prod.outlook.com
 ([fe80::9f01:508:17aa:279c]) by AS8PR08MB10291.eurprd08.prod.outlook.com
 ([fe80::9f01:508:17aa:279c%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 09:30:15 +0000
From: Bence Csokas <bence.csokas@arm.com>
Date: Thu, 12 Nov 2026 10:29:33 +0100
Subject: [PATCH v2 1/2] stddef: Add offsetofend() variant of
 struct_offset()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-offsetof-v2-1-276ede839967@arm.com>
References: <20261112-offsetof-v2-0-276ede839967@arm.com>
In-Reply-To: <20261112-offsetof-v2-0-276ede839967@arm.com>
To: Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Chengchang Tang <tangchengchang@huawei.com>,
 Junxian Huang <huangjunxian6@hisilicon.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Nilesh Javali <njavali@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: PR1P264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::16) To AS8PR08MB10291.eurprd08.prod.outlook.com
 (2603:10a6:20b:629::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR08MB10291:EE_|GV1PR08MB10402:EE_|AMS0EPF00000568:EE_|MI9PR08MB692857:EE_
X-MS-Office365-Filtering-Correlation-Id: ca93fc2a-7917-4978-d327-08df40a19e9d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|921020|10067099003|11063799006|56012099006|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 LYrzVCPn8lc0cEz0ZiK1qU8q5Fm7Terg3KHUapkHS3OcyhinZhvC5qly16dLoJ6tll/GU3mQIGyHrm4UEH+G+NnA5mhS+URwDRJSWAv6yWBZJ61q8oa+w+qMWMlRgvnaP/CsipLHMBCKF38X2HBAxaAJ2EouAmgjKRMQ1PagdixempUC8NEoeZx3pmguAss3Fx6nnhp1pBUlDP58RMSQUg9L99SfNZQV1bxDfO1jyYapb7Khwif400DjsrYX+vuIVQ+QW59F8ZJCfsY9sRkNpDTh9TM3HH8ts8MpAGtA3Ch3QwnyOqb6ZjYe58G+LSowOhR/nGIYB6o+DOUwschlUKP4q92zUtRfIX7ox9v4KD/VtrYv7dcK0BZhGfMpyOyBTEcsM5jofJNJU1XrjylfhP/5ePVcWQsz86vXvXR2y565adBt6ojq4tap3FRKd2Jhbq2wKFpD5wOAXE3LV8EhnEFzhld/Fe1S+Af9AgE7zz8b+1ygmF9Ht4aZa2gnjRoA9Nd7uxifeoyVhxcGHHcSjbgqQr9kE0Mc7HNBQ6rJCkMQWT2hfqZudYe9niZ3i2hi5Ot7fpKfQBWhjmAZ8QGd7K/59ZlU7T6srPgKVP84/a6oBG8q77mA3xhHJBKh8xSYCmYIzWFxpVIspANW1UwAM3Mf9Usra0pOwq8m8GEHvPJ+uLaJlt4P5LLAB7ZU78rna8Hi7VGpZy4qWwqyIUIIzQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB10291.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(921020)(10067099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: 
 R/rlwNVpSEeJejiroqsZAyJowDGmRSfl1BEpUU8snN4aklEhgAFEWXUI+5XRZwcv6SA/hnas+52SOpCoweJJwsCpvFsyX9IlbVFcyZkJOk1AFg6QFLPJMToP/KIp8YAMkIFLg00lVKn7147Mwar3R7IPNEQXee9jEH/4GvWCguOWcK0fjHwoELkkbSWz5BJ8V2uLHkHVdTNBZFDLp/wI65B7MvdG94k5bbaRoSDGdevz4gQBKe9E7hXN/PTwQubn1OlphMDwljo9UW/arA5vxMKHVvTdA59Q+hpk1d2pTDJ4QIILbs94/NkZKgrrlHmWa5jKiLZwmTIG1BMPYZGHeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10402
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000568.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3cf24f41-17f3-434b-b2c1-08df409f8f06
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|14060799003|1800799024|35042699022|376014|7416014|23010399003|82310400026|921020|10067099003|11063799006|56012099006|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	kHRXFlgkcrfaU/J27E48kn67XSgL43FeTxDVRMUPtPtWg9i/Gb5cXu/QBd7wCfeWJbhXxlNBFnz0L0iIFlPOCGCUQuO/QpaaDq88FMQIK4y6o/FuFpGIUQKGeUOztl8YUuZ7EMsBOphOzfkTtkXvGDWMsW5exD2IMWHx4CJVsQ4KQnQITMn+YARRd8xma69SQ8Qmjj7cGOcmENUlCe6HTltJgwt/tRZqfQFLYTxKTWwCVs9dLU9HOSmyNmcW33TIO3TwELxFL9h/r1WD8Po9i+jPnqfKhtL8iLaTK2iUXC8/1pKB+Df0RyYgXGVG757bIfUJahREk0sT1mihaPXN48k6lV8RH1HsZAp0S2G6fmGzZ26fimW3TxWurdU8HCLO1yNDVctijOq0ADarUXsLCELlObYkD9rVfLi6wEUp6mkJMABLcZVa69M7KpmLYE97oGZR9qq85rUEU780fxodao6bldYiqcL2pmJiA3E3Py/rwNM3DYhN7p1CzACWrDNh1GNsde+IkXc/4TiCSoDr4lQddAGQLIRvsCpR4P4Kmvqz7dxgivQWR6b9rh9SYdl/PsXCVw6kWEhZaedniYSVvYEJVQDMeAT48bZuOxOjD3WPc9Epm7vB0iCQMIKb+noJfIm3A7MSF8jYy8o6C0/RwGEVXBWKYkKuJStetB5+FUJmm40cdFzZgulST6fmUd9hRv49o9fLR/hx8PtV5nCurhARqDTd/B/1DU85Ocs6B5cjVcPG+YTyZvZeO+XCaWEb
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(1800799024)(35042699022)(376014)(7416014)(23010399003)(82310400026)(921020)(10067099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VAX69evljBm8TzCIi/GbAM1z5e/RkP4d1J+isuKCanQofsfl2E9GO/iA7Yd1zIc0uWNB8gd528VeoMDAwnRUXXs2mbfrFNGZvlKyxDQbPE72q7csBcUPT85mxhojS6rpOXIrfhN7A7PnyP/Z+SYZO/wI4kIjocFztkru2pjGLIU+t7Lyulw2LZdvQ7nfGz1DrAWP4ywNIbqtRMC24iVosu9YKV9R7g86jlu4m7ZSNUeBzkEOlLJ9buuLdevqRL0eoztQlt8hQhOLUtvZLWbKZmRiokOw9cUUND8ULkbLezQD6p5tPNkyeq+el48MpWAPtmdj4vODiMvA5lDsnyKFtP5qCuIUWpQgDlWswjccvgRbd7r3hhBWeCKoNAZni8+jqP+GXQa5Obu1JsRwx6SKqPTbAH4OKmyGtFs4mZnSu1eK3KJlU3DOdRZrMmZ2Hc2O
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:45:00.4055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca93fc2a-7917-4978-d327-08df40a19e9d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000568.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR08MB692857
Message-ID-Hash: NUSGOHQ2US53DG36MQFZWI5CRYGDX5VK
X-Message-ID-Hash: NUSGOHQ2US53DG36MQFZWI5CRYGDX5VK
X-MailFrom: Bence.Csokas@arm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Bence Csokas <bence.csokas@arm.com>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-hyperv@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-scsi@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NUSGOHQ2US53DG36MQFZWI5CRYGDX5VK/>
Archived-At: 
 <https://lore.freedesktop.org/20261112-offsetof-v2-1-276ede839967@arm.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Many call sites of offsetofend() use it for the purpose of pointer
artihmetic. Thus, a common usage pattern is:

  offsetofend(typeof(*ptr), member)

Capturing this in one macro helps keep lines short and terse, while
still making the purpose clear. It also helps discourage spelling out
the type name on every callsite, leading to more maintainable code.

A similar struct_offset() macro already exists, so add an offsetof()
variant in the same spirit.

Signed-off-by: Bence Csokas <bence.csokas@arm.com>
---
 include/linux/overflow.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index d0f04436343e..060dad4b6f3e 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -464,6 +464,18 @@ static __always_inline size_t __must_check size_sub(size_t minuend, size_t subtr
  */
 #define struct_offset(p, member) (offsetof(typeof(*(p)), member))
 
+/**
+ * struct_offsetofend() - Calculate the end of a member within a struct
+ * @p: Pointer to the struct
+ * @member: Name of the member to get the end offset of
+ *
+ * Calculates the offset of the end of a particular @member of the structure
+ * pointed to by @p.
+ *
+ * Return: number of bytes to the location of @member.
+ */
+#define struct_offsetofend(p, member) (offsetofend(typeof(*(p)), member))
+
 /**
  * __DEFINE_FLEX() - helper macro for DEFINE_FLEX() family.
  * Enables caller macro to pass arbitrary trailing expressions

-- 
2.56.1

