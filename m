Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD75E7C6F9
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 22:50:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3759D10E245;
	Sat, 31 Jan 2026 22:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ry.rs header.i=@ry.rs header.b="QaiGIsu/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7390340F72;
	Sat, 31 Jan 2026 22:40:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769899256;
 b=iWRurWfaI43FWduQIe+8HYg9Cy6L5M7RODEQ4Uf4KBI+4+b2QlmKICmbjwge09sV7Fm3V
 zf+I0dPAQbI1Bwd0vRu0/NaRDEQNydCe/9Zm2ds6WEJwUgTN1lYzhMBZTR2CP1S1uHNm7RQ
 YvS2n0jZK4RfVqqLajeosVAOYeHQaCLf9eJL6LtcMdEX9bZ7y6lLHAFU6Vh9zr8uiUapqiG
 G79YDZ1hG3yzSDSlvbYOVH9bZalImWhkiSGDaVW5Yi3FVcxWmNJaPrCbkuXTFEqIHrA7DuI
 xqUmOtvFsK0lrBuHQXQp2anc/rRTlcjMLrko9qqiFq5hVvYt16mKGPSLjYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769899256; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SWvtaEiT/41NAalPPWhdhfM93rTmPvj7juU4A2w+NMk=;
 b=QaVkTnHcwGZJcnuf1/uUKFuymPcPNRQ58Ps/vSLg/XV3MzL4lIkFD85cYl86gSv+DIpsf
 /ZldGZbIT1ZVTwruZ9ClXShgUhDnva/TZiwRa5wnhNXHKU85AElztOC1wiUSqbDtezxVh0o
 AP7MRoG0S58Ho7DPyHT9Muax2o2KY5KXugS5ygkuaEaJH4LiLc2Xs/BFoWkzMdi2838VuYA
 6auHnLBJjRpWNk2PfCHWI9nWjCLe7zbY9/JbzI5vGt5k9GAZvSEkSMmcoCMqAZtDg9uqh5U
 XaCvHkf5KaXMGRkWUHuxxiwUJ/StzWi4427APaDCCR/oyFByCklx/w10LRbA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ry.rs;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=ry.rs policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ry.rs;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=ry.rs policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 75A554062B
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 11:12:27 +0000 (UTC)
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Sat, 31 Jan 2026 11:21:35 UTC
Received: from mail-108-mta201.mxroute.com (mail-108-mta201.mxroute.com
 [136.175.108.201])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BE11D10E045
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 11:21:35 +0000 (UTC)
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta201.mxroute.com (ZoneMTA) with ESMTPSA id
 19c13c4d05b0009140.006
 for <nouveau@lists.freedesktop.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 31 Jan 2026 11:16:31 +0000
X-Zone-Loop: c7a4247f3020915b393cb523951b70a4bc23ddaefa5f
X-Originating-IP: [136.175.111.3]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ry.rs; s=x;
	h=Content-Transfer-Encoding:MIME-Version:Date:Subject:Cc:To:From:Sender:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
	bh=SWvtaEiT/41NAalPPWhdhfM93rTmPvj7juU4A2w+NMk=; b=QaiGIsu/AcVLE7nl7OY51sFaz9
	QMLORznRNBDfaeMa2oSyQ+2C2IIT6Lo6CSllhbJOcrGPWkXUgrwNHMmHU3RMKh86WJCm9AFVzVupT
	SMseQJW+vvvioYCDU8PKJWVh/DxTaaYHgiaZG4lxCiGbTEieH9YEgM81cyfBhCVHD2m3nTmB0yWy8
	RS3RSQcrbPis1wP2F00XpgY3e7wKBxCEXFKa18b8PiCXlvte7xkWKmwFfK7sHzGnJMlRpdQohql6O
	61L5YH61yA0rqL8jZXC3JO094DnI3Ys36aJ5TAzLdymBS6MCQN5+3XDbgNwSHCJ3/72NA39V+h+H+
	vRZ8J3pA==;
From: Zijing Zhang <zijing.zhang@ry.rs>
To: dakr@kernel.org,
	acourbot@nvidia.com
Subject: [PATCH] gpu: nova-core: vbios: harden falcon pointer parsing
Date: Sat, 31 Jan 2026 11:16:19 +0000
Message-ID: <20260131111619.1360414-1-zijing.zhang@ry.rs>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: zijing.zhang@ry.rs
X-MailFrom: zijing.zhang@ry.rs
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: E2OJFHKJFPLWYGIVZNHJLM5QWF3WBCG4
X-Message-ID-Hash: E2OJFHKJFPLWYGIVZNHJLM5QWF3WBCG4
X-Mailman-Approved-At: Sat, 31 Jan 2026 22:40:54 +0000
CC: aliceryhl@google.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zijing Zhang <zijing.zhang@ry.rs>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/E2OJFHKJFPLWYGIVZNHJLM5QWF3WBCG4/>
Archived-At: 
 <https://lore.freedesktop.org/20260131111619.1360414-1-zijing.zhang@ry.rs/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Use checked arithmetic and slice get() to avoid overflow/underflow and out-of-bounds access when parsing Falcon data pointers and FWSEC payloads.

This also clarifies the error message for pointers that still fall within the PciAt image.

Signed-off-by: Zijing Zhang <zijing.zhang@ry.rs>
---
 drivers/gpu/nova-core/vbios.rs | 95 ++++++++++++++++++++++++----------
 1 file changed, 69 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 3e3fa5b72524..45bbc8894281 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -785,22 +785,31 @@ fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
     fn falcon_data_ptr(&self) -> Result<u32> {
         let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
 
-        // Make sure we don't go out of bounds
-        if usize::from(token.data_offset) + 4 > self.base.data.len() {
-            return Err(EINVAL);
-        }
-
-        // read the 4 bytes at the offset specified in the token
         let offset = usize::from(token.data_offset);
-        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
-            dev_err!(self.base.dev, "Failed to convert data slice to array\n");
-            EINVAL
-        })?;
+        let end = offset.checked_add(4).ok_or(EINVAL)?;
+
+        // Read the 4 bytes at the offset specified in the token.
+        let bytes: [u8; 4] = self
+            .base
+            .data
+            .get(offset..end)
+            .ok_or(EINVAL)?
+            .try_into()
+            .map_err(|_| {
+                dev_err!(self.base.dev, "Failed to convert data slice to array\n");
+                EINVAL
+            })?;
 
         let data_ptr = u32::from_le_bytes(bytes);
 
-        if (usize::from_safe_cast(data_ptr)) < self.base.data.len() {
-            dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
+        // The BIT Falcon data pointer is expected to point outside the PciAt image (into a later
+        // image in the ROM chain). Reject pointers that still fall within this PciAt image, since
+        // downstream code will subtract `self.base.data.len()` from this offset.
+        if usize::from_safe_cast(data_ptr) < self.base.data.len() {
+            dev_err!(
+                self.base.dev,
+                "Falcon data pointer points inside PciAt image\n"
+            );
             return Err(EINVAL);
         }
 
@@ -921,14 +930,17 @@ fn setup_falcon_data(
         pci_at_image: &PciAtBiosImage,
         first_fwsec: &FwSecBiosBuilder,
     ) -> Result {
-        let mut offset = usize::from_safe_cast(pci_at_image.falcon_data_ptr()?);
+        let data_ptr = pci_at_image.falcon_data_ptr()?;
+        let mut offset = usize::from_safe_cast(data_ptr);
         let mut pmu_in_first_fwsec = false;
 
         // The falcon data pointer assumes that the PciAt and FWSEC images
         // are contiguous in memory. However, testing shows the EFI image sits in
         // between them. So calculate the offset from the end of the PciAt image
         // rather than the start of it. Compensate.
-        offset -= pci_at_image.base.data.len();
+        offset = offset
+            .checked_sub(pci_at_image.base.data.len())
+            .ok_or(EINVAL)?;
 
         // The offset is now from the start of the first Fwsec image, however
         // the offset points to a location in the second Fwsec image. Since
@@ -938,7 +950,9 @@ fn setup_falcon_data(
         if offset < first_fwsec.base.data.len() {
             pmu_in_first_fwsec = true;
         } else {
-            offset -= first_fwsec.base.data.len();
+            offset = offset
+                .checked_sub(first_fwsec.base.data.len())
+                .ok_or(EINVAL)?;
         }
 
         self.falcon_data_offset = Some(offset);
@@ -946,12 +960,16 @@ fn setup_falcon_data(
         if pmu_in_first_fwsec {
             self.pmu_lookup_table = Some(PmuLookupTable::new(
                 &self.base.dev,
-                &first_fwsec.base.data[offset..],
+                first_fwsec.base.data.get(offset..).ok_or(EINVAL)?,
             )?);
         } else {
+            if offset >= self.base.data.len() {
+                dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
+                return Err(EINVAL);
+            }
             self.pmu_lookup_table = Some(PmuLookupTable::new(
                 &self.base.dev,
-                &self.base.data[offset..],
+                self.base.data.get(offset..).ok_or(EINVAL)?,
             )?);
         }
 
@@ -963,12 +981,20 @@ fn setup_falcon_data(
         {
             Ok(entry) => {
                 let mut ucode_offset = usize::from_safe_cast(entry.data);
-                ucode_offset -= pci_at_image.base.data.len();
+                ucode_offset = ucode_offset
+                    .checked_sub(pci_at_image.base.data.len())
+                    .ok_or(EINVAL)?;
                 if ucode_offset < first_fwsec.base.data.len() {
                     dev_err!(self.base.dev, "Falcon Ucode offset not in second Fwsec.\n");
                     return Err(EINVAL);
                 }
-                ucode_offset -= first_fwsec.base.data.len();
+                ucode_offset = ucode_offset
+                    .checked_sub(first_fwsec.base.data.len())
+                    .ok_or(EINVAL)?;
+                if ucode_offset >= self.base.data.len() {
+                    dev_err!(self.base.dev, "Falcon Ucode offset out of bounds.\n");
+                    return Err(EINVAL);
+                }
                 self.falcon_ucode_offset = Some(ucode_offset);
             }
             Err(e) => {
@@ -1007,7 +1033,11 @@ pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
         // Read the first 4 bytes to get the version.
-        let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
+        let hdr_bytes: [u8; 4] = self
+            .base
+            .data
+            .get(falcon_ucode_offset..falcon_ucode_offset.checked_add(4).ok_or(EINVAL)?)
+            .ok_or(EINVAL)?
             .try_into()
             .map_err(|_| EINVAL)?;
         let hdr = u32::from_le_bytes(hdr_bytes);
@@ -1039,13 +1069,20 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDesc) -> Result<&[u8]> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
         // The ucode data follows the descriptor.
-        let ucode_data_offset = falcon_ucode_offset + desc.size();
-        let size = usize::from_safe_cast(desc.imem_load_size() + desc.dmem_load_size());
+        let ucode_data_offset = falcon_ucode_offset
+            .checked_add(desc.size())
+            .ok_or(ERANGE)?;
+        let size_u32 = desc
+            .imem_load_size()
+            .checked_add(desc.dmem_load_size())
+            .ok_or(ERANGE)?;
+        let size = usize::from_safe_cast(size_u32);
+        let ucode_data_end = ucode_data_offset.checked_add(size).ok_or(ERANGE)?;
 
         // Get the data slice, checking bounds in a single operation.
         self.base
             .data
-            .get(ucode_data_offset..ucode_data_offset + size)
+            .get(ucode_data_offset..ucode_data_end)
             .ok_or(ERANGE)
             .inspect_err(|_| {
                 dev_err!(
@@ -1062,12 +1099,18 @@ pub(crate) fn sigs(&self, desc: &FalconUCodeDesc) -> Result<&[Bcrt30Rsa3kSignatu
             FalconUCodeDesc::V3(_v3) => core::mem::size_of::<FalconUCodeDescV3>(),
         };
         // The signatures data follows the descriptor.
-        let sigs_data_offset = self.falcon_ucode_offset + hdr_size;
+        let sigs_data_offset = self
+            .falcon_ucode_offset
+            .checked_add(hdr_size)
+            .ok_or(ERANGE)?;
         let sigs_count = usize::from(desc.signature_count());
-        let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
+        let sigs_size = sigs_count
+            .checked_mul(core::mem::size_of::<Bcrt30Rsa3kSignature>())
+            .ok_or(ERANGE)?;
 
         // Make sure the data is within bounds.
-        if sigs_data_offset + sigs_size > self.base.data.len() {
+        let end = sigs_data_offset.checked_add(sigs_size).ok_or(ERANGE)?;
+        if end > self.base.data.len() {
             dev_err!(
                 self.base.dev,
                 "fwsec signatures data not contained within BIOS bounds\n"
-- 
2.52.0

