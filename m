Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE37606A31B
	for <nouveau@archiver.kernel.org>; Sun, 25 Oct 2026 03:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=krTo/vNI
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7D310E125;
	Sun, 25 Oct 2026 03:13:31 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B81AA48B8D;
	Sun, 25 Oct 2026 02:54:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792896870;
 b=xjLBDdxQOJm2MpxNGhwL80LDHeIO+oEC6H81bUPIVVqxUfJ9L1xZpFklMD3aq3J1oixSe
 /4LYnlb63w0kxLsdmuNqRm/GY3zfjn/DPSmRJ5LzSBWql6nvWloA+xKhgb85ZW65nx0fap1
 T5nszfhElKBswVK2uUIzcAB1N7GCGnIVlckyzMZiFVnvg6jFPio/eyNe3qtcnh5OyKQjL1k
 mbfLLe0sBda/LyvH0uyMsoCjg7e93TMIUgmAjBmAi69yipG28aOHt99MjnOqywpnpKXz95U
 G+jZms6exDcj7ZlfHdbFjM8tTGObmFEJnhfgxieHcy3G+u5rlzfdbxd63hng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792896870; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mphibqgTFFMm6n9Ocw8j+xegMNjz+2yKf+Knt+msTKc=;
 b=Ax+IpoacOL7Zq73p7Mg6mObx+/PWskMJhWEIoO8b5R3oxQHt01pMyDg6e4narE/K3Itry
 Lqk5du8D2pNNVKj0a9QY0+MaTdBREb3x1JINi3di+OJgA1OrecoNqz+5UXbVBCpe+jTN+bX
 FKvvseXSBkhhytXNXVFiVNIPhNaguglRURAdl/6SC2IOEOUqfNWrM5s73yQPKRg8WON7HZV
 DegcC/8FJAY6gHTSnGn9lOzpOf1/fsSp4TjJgl24JmZ+8i8ZoQYFlnateZ6zKAB4CPp8wjs
 MKkkHjE7WYRvxr9fIESSIo1snenyNQU2E0DvjHRxFdXXOhiaan26QdSBtgvQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 218CE48B74
	for <nouveau@lists.freedesktop.org>; Sat, 24 Oct 2026 20:38:59 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A9CB210E472
	for <nouveau@lists.freedesktop.org>; Sat, 24 Oct 2026 20:57:53 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so12034265e9.0
        for <nouveau@lists.freedesktop.org>;
 Sat, 24 Oct 2026 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875472; x=1793480272;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mphibqgTFFMm6n9Ocw8j+xegMNjz+2yKf+Knt+msTKc=;
        b=krTo/vNILbb9kNrGDJ0lmaQWuM853/C3BT80WFUxWDMFz7DZLEtOGlg2UcbkOov8S7
         RBDeuB6OXuazHPv6dwoA1rVxCICDxiTyvMDg7NiVRiLxCMKJph/ZQYiOOsxUMOCwOeyt
         pLVOOBleRCrEVCe0ngYTipVKdpj4zrqF8HwRkdm1DAqamwoN6aHKYH7A31jBI3TBYcco
         hAqZibfhfqRzvnsKfx8Of5+ma6QMukcFW1PPPts4dOHi1vJJycPr0Ws97qvOCz7I6Es9
         5GG0hlDRYWBK+mE5LPLETo6R1SGDiVF704lBUYAGrqtsvdIVwO2a8z65X1mrPU0JfaxR
         6TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875472; x=1793480272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mphibqgTFFMm6n9Ocw8j+xegMNjz+2yKf+Knt+msTKc=;
        b=myIXUk54xBcJw+SaCEvp/RLJPeD8lRMUz9D/kVBVet+vh9qQd0uiXJ8y5ON/Zlmmd8
         xYofpB5iA7G7Po7rNYOt7eAjfWFBB9TnWFAydh8g6ipawTYZFfuBEYLEDy8WlBAKvM3p
         Gx7vA3MSYwk59+Bi89mDUzx9RRkKvAhWCurYHhQNBeIgkOYaHM7iaDZis8hWRJiTjVTR
         pirbVMtWitqB7SdQk0t/qUYdhJestqSGAKfU+YC4F7CrzKlZfa7U2LhlCD+Z+gjB/LTK
         +RdBez1A08PwcN0gOjzg2EBBxWw4DoH04SmEM14GciNziKykKGpVnwlV0bID8GNuOQ9n
         tLRA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx50FIuU2gkolcqaTEW+S3U+P5WfMZkraSEFIBdD/rZyB0ElMCM0xhUyZX2BIyXfS7pfzq3v3nP@lists.freedesktop.org
X-Gm-Message-State: AFq9FYINsBRK4odggLRR9eY0tjnD4mhef2W6NRa4YZKQ60t9JQeMbDJ+
	ojDuqL5MiX+ynYv7jR3H802faE6lHnEjQqwGm7/a5A/VzoR4tW3gWxc=
X-Gm-Gg: AYBFou1OCe85r2woU4KmSjUrMHxBofV1yoqg8Z2IkFkM5T0LFXOV7qcW7pVPy64eNAo
	61yW7hSaYJmmyS7si6LZ8qYpzjjm/QJe59Xmxq8XIXFLhACtZQX4mTVTA3/b8D2wiKGXAn8g133
	L0QCeMclO5h2n5eoycLND1uQp57eUZjN5ZAMH8pExUmRsiGHkie5SMD8YEru/UQOpE4C2+HUzNg
	dtUsWW4fJbsYqFXlgEwBeFfkeKq9a1U1mxTjIkuornRNiGqUQegPXab12qpWC52a8k5u7gwqbZ7
	KU4CgIzDF0n2a2b2DyY3kwBppexn0Ivbz068r/tYWWSZHy/DcFayEdQ0bxIDaeduDDOqfNELAo5
	q77Z0U8qWghk9ZE03wDI0hPHDACnL5qmkI2Y2o9EKbXu6g+z3hM9XQrP6b0SJsw6LXqeJQ9eptT
	1Z3v68UsYTx1Q6gGVXvn6/Hlw6C/7/KOYvK16tu3XFvJ5CzfFh+cZV2hWXK7oASRvshgJEfF+F3
	wQRkJOEz256jJrP15yqPxx54jwXU56lc3n7WaQSRilDEg==
X-Received: by 2002:a05:600c:34d5:b0:4a0:2391:6540 with SMTP id
 5b1f17b1804b1-4a35aca2b53mr39027755e9.25.1792875471790;
        Sat, 24 Oct 2026 13:57:51 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a56992dsm71004965e9.6.2026.10.24.13.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:57:49 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] drm/nouveau/disp/r535: validate ACPI backlight DSM return
 type
Date: Sat, 24 Oct 2026 20:57:49 +0000
Message-ID: <20261024205749.4045480-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: tristmd@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: UVVBBW3AS3OONJQ4VPSWT27Z5QYYJLKO
X-Message-ID-Hash: UVVBBW3AS3OONJQ4VPSWT27Z5QYYJLKO
X-Mailman-Approved-At: Sun, 25 Oct 2026 02:54:28 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tristan Madani <tristan@talencesecurity.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UVVBBW3AS3OONJQ4VPSWT27Z5QYYJLKO/>
Archived-At: 
 <https://lore.freedesktop.org/20261024205749.4045480-1-tristmd@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tristan Madani <tristan@talencesecurity.com>

r535_disp_oneinit() evaluates ACPI _DSM method 0x14 for backlight data
and directly accesses obj->package.count and obj->package.elements
without first verifying that the returned ACPI object is actually a
package. If firmware returns an unexpected type (integer, string,
buffer), the union access reads unrelated fields, causing undefined
behavior.

Additionally, the loop accesses each element as integer.value without
checking that the element is actually ACPI_TYPE_INTEGER, and copies
into the fixed-size backLightData array without bounds checking, which
can overflow when firmware returns more elements than expected.

Add type validation:

1. Check obj->type == ACPI_TYPE_PACKAGE before accessing package fields.
2. Free the ACPI object when the type is unexpected.
3. Validate each element is ACPI_TYPE_INTEGER before accessing its value.
4. Check that the cumulative copy size does not exceed the destination
   array.

When a non-integer child or oversized element is encountered, the loop
breaks and the valid prefix is forwarded. This preserves the existing
behavior of reporting success for the _DSM call while preventing
out-of-bounds access.

Fixes: 9e99444490238d ("drm/nouveau/disp/r535: initial support")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index f5f22173fc2c1..267cc098ff769 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1556,15 +1556,21 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 								0x00000102, 0x14, &argv4);
 					if (!obj) {
 						acpi_handle_info(handle, "failed to evaluate _DSM\n");
-					} else {
+					} else if (obj->type == ACPI_TYPE_PACKAGE) {
 						for (int i = 0; i < obj->package.count; i++) {
 							union acpi_object *elt = &obj->package.elements[i];
 							u32 size;
 
+							if (elt->type != ACPI_TYPE_INTEGER)
+								break;
+
 							if (elt->integer.value & ~0xffffffffULL)
 								size = 8;
 							else
 								size = 4;
+							if (ctrl->backLightDataSize + size >
+							    sizeof(ctrl->backLightData))
+								break;
 
 							memcpy(&ctrl->backLightData[ctrl->backLightDataSize], &elt->integer.value, size);
 							ctrl->backLightDataSize += size;
@@ -1572,6 +1578,8 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 
 						ctrl->status = 0;
 						ACPI_FREE(obj);
+					} else {
+						ACPI_FREE(obj);
 					}
 
 					kfree(argv4.buffer.pointer);
-- 
2.47.3

