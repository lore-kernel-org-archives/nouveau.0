Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F14CDE00E
	for <nouveau@archiver.kernel.org>; Fri, 26 Jun 2026 06:37:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A480E10F441;
	Fri, 26 Jun 2026 06:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GY2f82LX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0B85046CFB;
	Fri, 26 Jun 2026 06:23:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782454981;
 b=afVUaOuQJ8Yo3Pf2c2h9lLAMk89VZafPyxI+2tEXericfvneMfRyjA0fLKkSXsohfShbV
 LCo5cZiBWcrLyFnR/6CthB4pWNgueqrAG+DX2zjMvpwQePL4lhblTYXGnSmAW2E3A35cZJT
 t0rkKBntqi7N03u85tSbVVfwN8ILznBM2UR2xrTyLqUQYI8/HNV7hGSraQodl+5hURBLG6V
 UksoL4/BDkE0C2ccVQrfHEqMcJ/vzS0hGg0hRh3ew2h02znzA2sgDK/yxH0UT0t59GtiYKx
 vL27oxyBnhlLHkN7nGtA0NWh9I/GR0g8a6PuHa8zwuJ57HHWbwuMP2Ejcx8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782454981; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ggr6u9216LoeQgSPX1obf+AY9QMHx3wUFWjGFRk34x0=;
 b=PLvwqjbOeClRZbhOHShqn8PZ+19VMuABq7U3/SdQUvLo+6A6xAFro9SWypr2MiIIvuTqw
 1je3XfNtZOYs2otO7hb7Nu78snVQ0UfBwGqSa1F/nLIKWHSQ8kwQE5uyTYuCjTmz1CzNfYD
 0Zx6jt5d/K6282veDtuSf6dkOdS8ITOnQk9qLGujFAFi4HJja1vTHmf8T3P+qt3tFfdETgX
 6+W1g2qAioFyjsdK1Hk9nlv8ZNi3HO1qVdKaHA8PARPnu9FUdidTkSWvXJOu3rKKfXKV9DB
 ibpYQk9Y0wJ2y2GE2QwgS6qMwU5rjuj42W4pNMpfxonS7CQv/FlSrAyhWZBQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=amd.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=amd.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=amd.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=amd.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CB89446868
	for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2026 06:22:59 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A94510F42B;
	Fri, 26 Jun 2026 06:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqmOvytKV8+B4kiSl9cE9lMXr8jcJk1I9YmgDctBzR3xtsk4Icr7VdS79lSzB+x8X51Afd357SHSlAZYlCr+GUsGXPiiCfik5ANu1PZtLtrPLroD1LBJtmFqpitmNK9Eafc9gqi9D42h/Rx+v+XTyQyJ9snuuiZLMA6wbUxRMiNIKGOSJ+Z6ia0vPPUmLmcLhcMCJoBwsup4xhc8f9U8JOcycaREklfGOjFOBCCU5ipv30YqAOe1FZpUVXbqpRL4xYX3PBiwagHBmzCi/QK1j/0Hz6N7uJcPUw+FwpQDbF4JCn1/dZ1mvXVPqTztB06nGzsSwTOoWv0VpxTdOB8vEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggr6u9216LoeQgSPX1obf+AY9QMHx3wUFWjGFRk34x0=;
 b=NtLzi7XRsdCwz/ji3J7gyt7UrPkN89BilU/NrYJPO5CzviTpNIieTy9xHZaMKKbcrqkKapKdzvYIpYEz1SNjNYaeNAqwr34Vu2aeXRFRRxGUfVkYuyK7FKIJGMqDvSICQInUkzp94wZl0vvUzjyNFOOM0t00NNdjAmUi3uV+m3Oxx3IxiBKE8iwcIdUyvrnwxupeR6joFk4KlyCM2YPGfOiMDBd3vjKTGTYqzHE+Kkuobhek2+epxPcgMj2Xq8R8d2f20/KEzSzUXqe92CYYDlEpGaQ61UGVabeewFcCIIn0vKL5bo0N3wyxoOXQXHT6PnXuofI5HfGisTapDyHlBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ursulin.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggr6u9216LoeQgSPX1obf+AY9QMHx3wUFWjGFRk34x0=;
 b=GY2f82LXiy6HJ5sfCYsWKXHnNVW//Hq6GgHl5+3bwhShHDuoSBuJ4vjUQkEOELE10gi9ZUuABLYqZ+9+hEy8jBhCsfTXFdWrfl7RBJQOafpeNkMqUl2M4JeDW5WJG/s4yQdbtkzYzwWysd6L9ROCfAtuItMh6+3FOzHnINq8hEQ=
Received: from DM6PR02CA0118.namprd02.prod.outlook.com (2603:10b6:5:1b4::20)
 by CH3PR12MB8404.namprd12.prod.outlook.com (2603:10b6:610:12d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 06:37:25 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:5:1b4:cafe::53) by DM6PR02CA0118.outlook.office365.com
 (2603:10b6:5:1b4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 06:37:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 06:37:23 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 26 Jun
 2026 01:37:20 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <tursulin@ursulin.net>,
	<dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
	<intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/ttm: add generic drvparam[] alias for
 ttm_place::fpfn/lpfn
Date: Fri, 26 Jun 2026 12:06:58 +0530
Message-ID: <20260626063658.10237-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|CH3PR12MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: a8dedce0-0046-4241-1069-08ded34d61a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|7416014|376014|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	6yxEEAyTx+NEmNUTQZ11IucteDeDICAH76SxgbGLnzXYbQfpip2pbE+yBxqPJ7j1FdBtaDRJRaNRmIagEGuC4D9wwkji4GfRwIMCP8iHsWTejPlevZucLU712Tkn0q/UsXK3rADrbO3yNeRqTmyJNfRsd8ALvKXAs+58/P57u4hGmlk6IOzX/usxSsv1WeLfU2f4iZ//F2Q75PH6LwT3sBgIu6sjs6LwoE/OgifHjtGcOdMRdfhRDZpqJ9lYpdZ65fQ5dvVgpjwyYnmOFb4Tnd1qPL3TbDgmihjMSo9nqyIgpIT320PR95yZqdtE0Q2QDzxgR/P3tOPsLqWHQGWG7R2zWVaS38eWeE/Mgg0EUDrV7NcGCMk3gYv7MmmcrUinbC4aJaX4A14PFMqbCoYHUBHa8AK32ETlyBJyheeLEm1IOcLR9ikbFPJHn+4ok3GIAcZ6G/ORROjFRVgRYGxHGKi7Zgdg52d1z+ZLn4ryxg6oQ96ui2NI/2gg1eA1iL2jURlAucFUvAqIr5fprzNp1cF8XoAJYwxO02rFj2DavlNHtqzUrrB6mEYMBsgz4jwuxiTbNe8GfKs4GS6DHh7CHKRH5m4L6LlLzxzI/pg8TDIN3y3DJDg0OHtq7yeeKi8pOkAgK+Rz5UMBHpIJ3lOflZo4fl/mSsCEiZvwfHvL6tDMrrrha2Oy9b4Sew++0w4JRclk0WDPIwSiXFjJrw/Nfg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(7416014)(376014)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	to/m/0R06wlPH/BfB7PFi85clDhhXRQ3sKmzsd/aSrm1Yr5ougMUobLeLbwNU7oog1vYUrCrcUZliMhMr6epkkM0DZ51tlX+nAazqAang4OrdhdDmn1/upu9gvWg9NJu0Ii1wFAa8sLj0rq3UDblrJASEosMCofJ+iiPKTFxwymCnmh/fu9xyx+iDPWSi7h16IZpOIYnBuS+p8wOzrmBbGcWMpMapPXRxzGtZiyPY7wFNFjp0x3+tBaRjWBdpSiM0RUPeTM3j9rQtrryPZvVVF0uu5cHnFnLpOSynx3STqQVyKued4xJwIs1JzIZuboqE313fcxEpzvrhKUT7Y5Lx8x6TYeKAmeAZ8AXnMh1QrplbAG7BnM9eA5u+XIXkKA766e35Zx+mokhJikhxqEeOUB922Gsh7l6XVaNRYntZb7V932UtGsiTBulQpy73mN+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:37:23.6531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a8dedce0-0046-4241-1069-08ded34d61a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8404
Message-ID-Hash: PIAMP36SEUYAYWIEXM3OHTMWEYMGHZYD
X-Message-ID-Hash: PIAMP36SEUYAYWIEXM3OHTMWEYMGHZYD
X-MailFrom: Arunpravin.PaneerSelvam@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PIAMP36SEUYAYWIEXM3OHTMWEYMGHZYD/>
Archived-At: 
 <https://lore.freedesktop.org/20260626063658.10237-1-Arunpravin.PaneerSelvam@amd.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The fpfn/lpfn fields in struct ttm_place are named after page frame
numbers, but they are really just placement parameters interpreted by
the backend resource manager. Wrap them in a union with a generic
drvparam[2] array so backends can access the same storage without the
PFN-specific naming.

drvparam[0]/drvparam[1] alias fpfn/lpfn, so existing users and the
VRAM range manager are unchanged. This decouples the API from
PFN/range-specific semantics so that these fields can be used more
flexibly in the future (e.g. mask-based or segment-aware placement
constraints). No functional change.

v2: Use a union exposing a generic drvparam[2] array instead of
    renaming fpfn/lpfn to param1/param2, keeping existing users
    unchanged (Tvrtko Ursulin)

Suggested-by: Christian König <christian.koenig@amd.com>
Assisted-by: Claude:claude-opus-4-8
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 include/drm/ttm/ttm_placement.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index ab2639e42c54..7db2073f3236 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -75,14 +75,22 @@
  *
  * @fpfn:	first valid page frame number to put the object
  * @lpfn:	last valid page frame number to put the object
+ * @drvparam:	generic driver/backend placement parameters; the
+ *		interpretation is defined by the backend resource manager.
+ *		drvparam[0] and drvparam[1] alias @fpfn and @lpfn.
  * @mem_type:	One of TTM_PL_* where the resource should be allocated from.
  * @flags:	memory domain and caching flags for the object
  *
  * Structure indicating a possible place to put an object.
  */
 struct ttm_place {
-	uint64_t	fpfn;
-	uint64_t	lpfn;
+	union {
+		struct {
+			uint64_t	fpfn;
+			uint64_t	lpfn;
+		};
+		uint64_t	drvparam[2];
+	};
 	uint32_t	mem_type;
 	uint32_t	flags;
 };

base-commit: cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7
-- 
2.34.1

