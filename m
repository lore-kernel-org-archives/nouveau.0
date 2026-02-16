Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CDBE8383C
	for <nouveau@archiver.kernel.org>; Mon, 16 Feb 2026 22:09:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0B1B10E3FC;
	Mon, 16 Feb 2026 22:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qpNKsgy3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6B02F40545;
	Mon, 16 Feb 2026 22:00:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771279209;
 b=jFJOs/4J0cttGxsaAZsFDSdzg4lJkd5xj09syhNeYMpv+5MTqqP7yDJz/c0pDyw14Ca7x
 oA6l+rf0w+p9s+S1y8KY20iqOqtkFMvpDUIMq7eCMdZNgOF5HHuJ8WDbkyS6Pg4T6UMKjHr
 frn5Qim6+0EzoT/C6itQ3mqapoEp/hna0oJx1J+3L1qqJe+ijq+CPx966yYbV7ByOxWP8mH
 l1548cmv21AQ0ajr/43hNhULYkr1HciedZJBkCQXJ7g+jhM4bv6ND5i/TPRcAek9nNtUFHP
 QNyQTWCrwMn9pvWsQ54YBipKck7SSIx8a3NvtcbaLAjGR/lqzoLYXUx28NaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771279209; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5vBW2kxTPG28FeBLdESnOK6gVpTWE5HhkG4Z5Th7dCc=;
 b=P0913PnM0JX5ee9MRVhLBnNA762Ny8Yo9YsiJ6RCqOBDQi5m+91oLW8lKwM0CxvdHc1LF
 e6K7jRhuaVi5SqrdykssgIJQR1bDFZ7uYuLDzEi9B2NOZ6/MtyY2cYtYwCFusJiFJpj5DS6
 NY78985rUiw+c/PC/09R9zjgoILZXzJq7G4ig7gGq+r7A3ELyZkbhsnhYz2NdPJhvEdcbHf
 oiUnltbqwEHlTMm1vpJRofIeCY+LJGKEnLnYBrUPoFRHr80uwblROIpspa9mdmT1dh/zOPb
 5S2SDiW1leCHJRSqB7rG17zTbXyOK3aDDk7dnpKxqDYi+qqRov8kI/6tUrvg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A35CA4004C
	for <nouveau@lists.freedesktop.org>; Mon, 16 Feb 2026 22:00:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB4B010E13A;
	Mon, 16 Feb 2026 22:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E4A142ACE;
	Mon, 16 Feb 2026 22:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5502C116C6;
	Mon, 16 Feb 2026 22:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771279790;
	bh=zOzp8N4OurZfP7u7Ty54SkroNFz43EvcoD2XN1P6v8k=;
	h=From:To:Cc:Subject:Date:From;
	b=qpNKsgy3KWYdCDG8dyzgHCMB/ON8MYPfSYabGQyPdWqZDwXaN+yyhRQzOgYXHEp+V
	 gSu/Cw7fZhK/URC7W+ZlUPmD0cuAf5OHoNbi24H2Xw/I3WGUsLDCKG/CsN8rfCzsid
	 TQLxEvOTLph0LDuRH9Jt5QFMec2ba/IRYm1FsYLlek1gSg2JQY5MyxIl3a+MSi1whV
	 uHqR4slP18DEW3UZvx73vT8AtqlZfm75iiDTKiUw5UgsCDLqFtJ6ZA9RZ0/tinfOvc
	 j4HIfZU55zR8scGAVxwn6iHZB7M8D9lVUHTWzLmfzAEk8TxIXZhH7nYZS/3PZ7WfDz
	 EdUVKySVv7Ehw==
From: Danilo Krummrich <dakr@kernel.org>
To: lyude@redhat.com,
	airlied@gmail.com
Subject: [PATCH] nouveau/gsp: fix memory leak in r535_gsp_acpi_dod() unwind
 paths
Date: Mon, 16 Feb 2026 23:09:42 +0100
Message-ID: <20260216220944.19633-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LYES4BBY5U6HNPK6YY5ODVNOKSLTJSGM
X-Message-ID-Hash: LYES4BBY5U6HNPK6YY5ODVNOKSLTJSGM
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LYES4BBY5U6HNPK6YY5ODVNOKSLTJSGM/>
Archived-At: 
 <https://lore.freedesktop.org/20260216220944.19633-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

acpi_evaluate_object() allocates the output buffer when called with
ACPI_ALLOCATE_BUFFER.

Subsequent unwind path do not free the ACPI object however, hence fix
it.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Fixes: a9b9b42b54b2 ("nouveau/gsp: free acpi object after use")
Cc: stable@vger.kernel.org
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index a575a8dbf727..214ce78b0645 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -863,17 +863,18 @@ r535_gsp_acpi_dod(acpi_handle handle, DOD_METHOD_DATA *dod)
 
 	if (_DOD->type != ACPI_TYPE_PACKAGE ||
 	    _DOD->package.count > ARRAY_SIZE(dod->acpiIdList))
-		return;
+		goto out_free;
 
 	for (int i = 0; i < _DOD->package.count; i++) {
 		if (WARN_ON(_DOD->package.elements[i].type != ACPI_TYPE_INTEGER))
-			return;
+			goto out_free;
 
 		dod->acpiIdList[i] = _DOD->package.elements[i].integer.value;
 		dod->acpiIdListLen += sizeof(dod->acpiIdList[0]);
 	}
 
 	dod->status = 0;
+out_free:
 	kfree(output.pointer);
 }
 #endif

base-commit: 9478c166c46934160135e197b049b5a05753f2ad
-- 
2.53.0

