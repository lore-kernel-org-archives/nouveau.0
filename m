Return-Path: <SRS0=JpRB=HL=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F35C433DB
	for <nouveau@archiver.kernel.org>; Tue,  9 Feb 2021 01:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EC4764E99
	for <nouveau@archiver.kernel.org>; Tue,  9 Feb 2021 01:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EC4764E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23B46E28B;
	Tue,  9 Feb 2021 01:14:26 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FFA6E2C8;
 Tue,  9 Feb 2021 01:14:25 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6021e0c40001>; Mon, 08 Feb 2021 17:09:24 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 01:09:24 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 01:09:23 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Date: Tue, 9 Feb 2021 12:07:14 +1100
Message-ID: <20210209010722.13839-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209010722.13839-1-apopple@nvidia.com>
References: <20210209010722.13839-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612832964; bh=oZ4IzPZ4J9LSuy9imywhNP9s/LgdHZ4boj/cGLUh0kU=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=DultRc8vIMKcdwumpL2sx++22sXnXh0sI0HuZ45Lo/JxDXE5k6o+YyL/GYNTz+m64
 0QqP3bGnpUovgMWODtNvQk/Izmx8iCPIZR7ecIGqzwuXcQA+QyEQgBRUYmxy3ns5Ho
 A8qCRn6N37XpK8elbFaFAuEbob8gwqIL0x0fK+wmzTEfEcydL3w4TJ+qSPV9Clp84s
 JMx6UviPU/Np/Sb4Vn7B8D3YTl72TMvNDsMCT0oxNWMqn4O1KJaiiXDb/4uND82fQ/
 0HvciJTVMbFEXXIe2sS/THs6zm/8m6Qa6crwneJ9KwZthtQ7c2jmyHPzsZPA0trSS6
 dUawZWcQlMgjg==
Subject: [Nouveau] [PATCH 1/9] mm/migrate.c: Always allow device private
 pages to migrate
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Device private pages are used to represent device memory that is not
directly accessible from the CPU. Extra references to a device private
page are only used to ensure the struct page itself remains valid whilst
waiting for migration entries. Therefore extra references should not
prevent device private page migration as this can lead to failures to
migrate pages back to the CPU which are fatal to the user process.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 mm/migrate.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 20ca887ea769..053228559fd3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -405,8 +405,13 @@ int migrate_page_move_mapping(struct address_space *mapping,
 	int nr = thp_nr_pages(page);
 
 	if (!mapping) {
-		/* Anonymous page without mapping */
-		if (page_count(page) != expected_count)
+		/*
+		 * Anonymous page without mapping. Device private pages should
+		 * never have extra references except during migration, but it
+		 * is safe to ignore these.
+		 */
+		if (!is_device_private_page(page) &&
+			page_count(page) != expected_count)
 			return -EAGAIN;
 
 		/* No turning back from here */
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
