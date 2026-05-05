Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977B3FF885A
	for <nouveau@archiver.kernel.org>; Tue,  5 May 2026 09:23:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBACD10EA22;
	Tue,  5 May 2026 09:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jpWvyYA0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8331045DB9;
	Tue,  5 May 2026 09:11:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777972271;
 b=sa0/otIuSTBZZ5q+usjzlXNQdQ+A5vcXPdReA1ZbnRdjxiQxBy/gGS43BAcm81jiRuPlA
 R6vgi0tOBXEpEslGGY98F2RzTlLBS2BqtvySiHcrcyWI987vV8b7/MbKJOaUxySWwdp2G12
 GAXLE2Dw/usuMa5rty9ZmGHI+UL2hq9PmqdFawLKduovD/DUOcWG15ONcqQSmlWI7P+n5Z8
 RiYNlA+sKE1h1+nTKAALleJb86PJr2Z/x0fxDrEINv8w058FbsYIsFrE+iE16H+Yh9ksW3J
 t2KCxYMj5l2Jk6lZW/VOln1/6xh6dUfVd2PKVN14+y5vRDRtSNBZK2kRDs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777972271; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jlZ2ufJz5L2JnFcoNvvhzTvzHAb9SgZI/GRNA5Zpfjs=;
 b=Hbx5ksogf+Gqs/yMZlR1o1SIiRp1JlLU/jNcLCSfhtX/YgJZzAG/eLKVO6Kg8fLlH6Zfi
 QawoP1wZG6hnyWmjotireedIrgerYZHVAsbobZS1zfwunnwUMzT4bduBgW2Ct7haHPaqsUy
 qB83wA16pept5TCQvzklQRJw4c2xdCr+w75PUAWgls47iPQ8lVp7YvfU7fwBqQpqoeuzLCl
 fDTXP31j7gjp1g4qJ3YnZTicyoOcuLE+6CqjoW8mYQWiqMqmTBGdGfaJp5YrvSEIHbQ4Hsk
 YZOFpesQSXObCIHDavYZDY7WeOu+uv35tiXAtsKHw4NbaUU5rmDq7mMgw/Nw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=collabora.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DCDC7403F0
	for <nouveau@lists.freedesktop.org>; Tue,  5 May 2026 09:11:07 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F2DE310EA0E;
	Tue,  5 May 2026 09:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777973023;
	bh=eu2FXCNHpSqRcCHwo3LBgArqDRiQ1Vg3R9/LKPa0d4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jpWvyYA09zMhzPlqdaKg+8Y685qiiqiwVf3xThFnXPA8YpwGB4gqeTZKCpBEYatS2
	 QMCivMGfAHbCfAVORssG+clYmdJshstuvlBMlCYz1YVtu20qZKuCXsfBLAbyBPQqUp
	 Ju00DwttL5IFXicHpaKZKMQpF+mujbocqjTK5BpbBpz5Ex4e8/mEGJFEPvahGoish8
	 KvaZnAyaxtae4WLxsVDBZ2+uGbxyHO2MUhZ5RsRPuuAnpp43MTAbIbaH/NfDahSyq2
	 8m3SBU6I5Mz6d+7qtMfmwx0xys6cYxdSIDMU5akBSWK2h96yJNPOUlI/BRw86I3pNp
	 c2OZqgkYRy4hw==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01D0217E1321;
	Tue,  5 May 2026 11:23:42 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	boris.brezillon@collabora.com
Subject: [PATCH v2 1/1] rust: drm: add RENDER_CAPABILITY flag for render node
 support
Date: Tue,  5 May 2026 11:23:04 +0200
Message-Id: <20260505092304.108262-2-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260505092304.108262-1-laura.nao@collabora.com>
References: <20260505092304.108262-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7OBDWHHFH7SVUE2LQGRXFU6S2VXQSLWZ
X-Message-ID-Hash: 7OBDWHHFH7SVUE2LQGRXFU6S2VXQSLWZ
X-MailFrom: laura.nao@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 kernel@collabora.com, Laura Nao <laura.nao@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7OBDWHHFH7SVUE2LQGRXFU6S2VXQSLWZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260505092304.108262-2-laura.nao@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add RENDER_CAPABILITY bool constant to the Driver trait to control
render node support. When enabled, the driver exposes /dev/dri/renderDXX
render nodes to userspace. The flag defaults to false, drivers can opt
in by setting it to true in their Driver implementation.

This is then enabled in the Tyr driver, while it's left disabled for
Nova for the time being.

Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs |  1 +
 rust/kernel/drm/device.rs     | 12 +++++++++++-
 rust/kernel/drm/driver.rs     |  5 +++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index e20a5978eed6..b7ae37ce3a1b 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -186,6 +186,7 @@ impl drm::Driver for TyrDrmDriver {
     type Object = drm::gem::shmem::Object<BoData>;
 
     const INFO: drm::DriverInfo = INFO;
+    const RENDER_CAPABILITY: bool = true;
 
     kernel::declare_drm_ioctls! {
         (PANTHOR_DEV_QUERY, drm_panthor_dev_query, ioctl::RENDER_ALLOW, TyrDrmFileData::dev_query),
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index adbafe8db54d..e121303d88f0 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -80,6 +80,16 @@ pub struct Device<T: drm::Driver> {
 }
 
 impl<T: drm::Driver> Device<T> {
+    const fn compute_features() -> u32 {
+        let mut features = drm::driver::FEAT_GEM;
+
+        if T::RENDER_CAPABILITY {
+            features |= drm::driver::FEAT_RENDER;
+        }
+
+        features
+    }
+
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
         open: Some(drm::File::<T::File>::open_callback),
@@ -105,7 +115,7 @@ impl<T: drm::Driver> Device<T> {
         name: crate::str::as_char_ptr_in_const_context(T::INFO.name).cast_mut(),
         desc: crate::str::as_char_ptr_in_const_context(T::INFO.desc).cast_mut(),
 
-        driver_features: drm::driver::FEAT_GEM,
+        driver_features: Self::compute_features(),
         ioctls: T::IOCTLS.as_ptr(),
         num_ioctls: T::IOCTLS.len() as i32,
         fops: &Self::GEM_FOPS,
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 5233bdebc9fc..92cbc26ce11f 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -16,6 +16,8 @@
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
 pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
+/// Driver supports render nodes, i.e.: /dev/dri/renderDXX devices.
+pub(crate) const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
 
 /// Information data for a DRM Driver.
 pub struct DriverInfo {
@@ -115,6 +117,9 @@ pub trait Driver {
 
     /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
     const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
+
+    /// Sets the `DRIVER_RENDER` feature for this driver.
+    const RENDER_CAPABILITY: bool = false;
 }
 
 /// The registration type of a `drm::Device`.
-- 
2.39.5

