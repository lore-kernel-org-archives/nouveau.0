Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C63EFCE4A
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 20:45:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5215E10EAC3;
	Wed,  4 Mar 2026 20:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kV6UOD5L";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7C05144E69;
	Wed,  4 Mar 2026 20:35:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772656500;
 b=I3SlPSEVdC2L1/ah2ZqvqPYYDfb1SRL9StQ2SQcPtRgpcTRueI6g5ZpRiizDnK8NmuLZX
 W+JsxCnXksLTX9XSzlnB/lXmV1JO0+iW3edrDxdvul5K9b5P+cTYYADoc2SCCPw7trSUt2y
 Bwo50X+6uFJTvq7PyDIQENDRVmvWh26rMuE+iZWkwCy5IMpeJFQHbu5f2pXOJl0vWQ0qGA/
 AZZTYis/6ovTqNcBZteDXdN6cRHjSpxr955KTsD1COfSpia3IaojsV0lFti4k8s+AIIcovs
 APhpUQiwTxLJsE1VzjtC3CvWt9YV3+EPMPi8c1TNyBdfQRmIxlN5MYqc4AhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772656500; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wRrufKol/wI70vYGE1YUZ3egJpHf7UYfsd/A/UWs3+U=;
 b=WEW+G878orMTu6ZgXpHOce1PzbhveDQ2WBeSB0u2eayU8wQK9IG+wuDXe9+QvQ7TdXSdp
 PDaMGia3AW1Xa92byhuNKlyOo3XPOom+Lh4SpYnz+fBgSPzR08DeOivxGnco9I2vv0bY22v
 zBaGVejaEPsFtVbJOxI0VyhcyXAIMQjViPQUUm/DFBaVfdVQCJTGAMzCga8Y2wdmEmw6Rrd
 jF3a1DHoTRYN+hIv4k7VAFkD/2Vji7++KWTOUL/kBr/Pi5mDo/9yzP5d2u2rrYtH25pXkoT
 BX/vuV7ZzbHIsWYFMdf90k2i8kae+BZODAL/LcBu/vvXU6On02z/m1UxfI8A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E675141E96
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 18:04:24 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4872D10EA90
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 18:14:45 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-38a2a59baa6so13353911fa.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Mar 2026 10:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772648083; x=1773252883;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wRrufKol/wI70vYGE1YUZ3egJpHf7UYfsd/A/UWs3+U=;
        b=kV6UOD5LIz9hOx++Zf0r0UmX/kiyK0IvLe6Hxu9Bef7/kp+fLdw51o2fSHQS9sjYB+
         RKwH5BW639HXDqDcRt7jiFxvrfBVBhQUJXWYMxJiTcJ79NUs7ETJAQKLGCIFjNAqJdCD
         9IKkbCu3Pe68975xwhjoRGyInCr6AQLbZX4uh+0uDbawG54FXhjVoF89HcXvDmcw/SOz
         fP/UADdObAptInBA30Cpk6ucvT1UxwRIu3A2++HDHxybfnviPELbHgk3iHdO4OXayTNa
         +VKt4IvYnzzTn+wvvEAK2dMQU7YIef1xOqTHz00MpEVBuho/Y/ernrBZ2jJHKNaxPebt
         I+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772648083; x=1773252883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRrufKol/wI70vYGE1YUZ3egJpHf7UYfsd/A/UWs3+U=;
        b=OsiaEZGYRZid+92mwu3i53bQeSg/sNUnPLYzfKzO5Nz6PyiLkuRYCXvw930LjzlaX6
         SRbJfqsZQe1ISuIzxLgiQPktXMenZe4SIchE5XZCnzvnFeun3y0E4w2ozcQfieCvfLOC
         kAJedoO3QhkhOyMnX3x+pupErqbXrL+858/5Yy6qlf4Atw6Ml2o/zCEK4eH3q9PlTOIh
         cC3bXaRZ/VQvEv4XO/NMNYPpAYQX0jQ8we7a7AieRpxIAms5/QZpQrFBb973+QvlhTP2
         ZS0hfCIiNh5oJRPMRON9sMXA7kaSB0WwemtAQ3JD643llvwcPPR3zXbrze/j+NT8/on/
         vPjg==
X-Gm-Message-State: AOJu0YyCNoKuSqY/44N4vJaQDNx8uMKv1PiEt+ndPiiBwUOwrO8REdcG
	5jsH9/G8hblWuuIfyUd0ku5CDn/gq1UR8Hq6oEOe/whxzBpKi9G63Mt9l9tyw7Uu
X-Gm-Gg: ATEYQzw9dlLxSbdQTqyzXFfvQvfy17nh18hKUAQmgoakA23T+f/2wOWFw3smhDWSXeW
	18U8UEm5Oi8S97adebTnmO41CNXdR4rBsCAJertLseC1tX7cDSSYjRmPH6BCZxeKFhVYAlxGamQ
	YPzSC9c2gUEjk9Brs3GGPuDb9qrNhn7wTV3u5uRTaS0KTYbNKvHDPw5J0ctpc76FyegK3cF+RoV
	d9+sUO8nCWeIgkdLgi/I7OkoFXY9iJmlYHYbiUHUWM+C4YYJiCmxHprRhQvI72Ww4MmPlkg0q+T
	/gM0GqnVNb+ufiJIJd5xhVDu7XCsRTEdmcIQMX0SMpUaKl75+akcbLGQoQhrfdLrkw4ZH10sTK5
	P8qrC62uYQLQxeo5i2RSACqSRgAO8hltS2Lk+0k+7s+MEQ68rFDwIy9BvlCJTqlp96XePXVxw7k
	0Do4vbecrnWNxVjI/H+Hz1P1v63tJAH3lKAYjfXbDEVyRG3Z8rYhS00ierXhhGdrWKO+nZOSBHX
	uNnQPhZpdEcE/GT1JBlVg==
X-Received: by 2002:a2e:964a:0:b0:38a:5e7:29d0 with SMTP id
 38308e7fff4ca-38a2c7b38a2mr21323471fa.28.1772648083079;
        Wed, 04 Mar 2026 10:14:43 -0800 (PST)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru.
 [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12357da2dsm1102043e87.45.2026.03.04.10.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:14:42 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] gpu: nova: add impl_num_enum!() macro to replace
 FromPrimitive boilerplate
Date: Wed,  4 Mar 2026 21:14:20 +0300
Message-ID: <20260304181420.5482-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: iprintercanon@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 45RJMXM7HSSX7FLARBJUGQPYDNH3M7XR
X-Message-ID-Hash: 45RJMXM7HSSX7FLARBJUGQPYDNH3M7XR
X-Mailman-Approved-At: Wed, 04 Mar 2026 20:34:58 +0000
CC: dakr@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 simona@ffwll.ch
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/45RJMXM7HSSX7FLARBJUGQPYDNH3M7XR/>
Archived-At: 
 <https://lore.freedesktop.org/20260304181420.5482-1-iprintercanon@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a declarative macro impl_num_enum!() to generate both From<Enum>
for primitive and TryFrom<primitive> for Enum implementations for
repr(primitive) enums. This addresses the TODO[FPRI] markers
throughout the driver.

The macro accepts a list of variants to map, allowing certain variants
to be excluded from the reverse mapping (e.g. dead_code variants like
FalconModSelAlgo::Aes).

Replace the manual TryFrom and impl_from_enum_to_u8!() boilerplate for:
  - FalconCoreRev
  - FalconSecurityModel
  - FalconModSelAlgo
  - DmaTrfCmdSize
  - FalconFbifTarget
  - Architecture

FalconCoreRevSubversion retains its manual TryFrom because it requires
a bitmask operation on the input value. The Chipset enum retains its
existing define_chipset!() macro which already generates TryFrom.

While at it, add the missing repr(u8) attribute to FalconFbifTarget,
which is needed for the enum-to-primitive cast to be well-defined.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/gpu/nova-core/falcon.rs | 128 ++++++--------------------------
 drivers/gpu/nova-core/gpu.rs    |  21 +-----
 drivers/gpu/nova-core/num.rs    |  34 +++++++++
 3 files changed, 57 insertions(+), 126 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..5b67cabe02f2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -23,6 +23,7 @@
     driver::Bar0,
     gpu::Chipset,
     num::{
+        impl_num_enum,
         FromSafeCast,
         IntoSafeCast, //
     },
@@ -34,17 +35,6 @@
 mod hal;
 pub(crate) mod sec2;
 
-// TODO[FPRI]: Replace with `ToPrimitive`.
-macro_rules! impl_from_enum_to_u8 {
-    ($enum_type:ty) => {
-        impl From<$enum_type> for u8 {
-            fn from(value: $enum_type) -> Self {
-                value as u8
-            }
-        }
-    };
-}
-
 /// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
 /// register.
 #[repr(u8)]
@@ -59,29 +49,7 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
-impl_from_enum_to_u8!(FalconCoreRev);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRev {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        use FalconCoreRev::*;
-
-        let rev = match value {
-            1 => Rev1,
-            2 => Rev2,
-            3 => Rev3,
-            4 => Rev4,
-            5 => Rev5,
-            6 => Rev6,
-            7 => Rev7,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(rev)
-    }
-}
+impl_num_enum!(FalconCoreRev: u8 [Rev1, Rev2, Rev3, Rev4, Rev5, Rev6, Rev7] => EINVAL);
 
 /// Revision subversion number of a falcon core, used in the
 /// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
@@ -94,24 +62,27 @@ pub(crate) enum FalconCoreRevSubversion {
     Subversion2 = 2,
     Subversion3 = 3,
 }
-impl_from_enum_to_u8!(FalconCoreRevSubversion);
 
-// TODO[FPRI]: replace with `FromPrimitive`.
+impl From<FalconCoreRevSubversion> for u8 {
+    fn from(val: FalconCoreRevSubversion) -> u8 {
+        val as u8
+    }
+}
+
+// Manual TryFrom is required here due to the bitmask operation on the input value.
 impl TryFrom<u8> for FalconCoreRevSubversion {
     type Error = Error;
 
     fn try_from(value: u8) -> Result<Self> {
         use FalconCoreRevSubversion::*;
 
-        let sub_version = match value & 0b11 {
-            0 => Subversion0,
-            1 => Subversion1,
-            2 => Subversion2,
-            3 => Subversion3,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(sub_version)
+        match value & 0b11 {
+            0 => Ok(Subversion0),
+            1 => Ok(Subversion1),
+            2 => Ok(Subversion2),
+            3 => Ok(Subversion3),
+            _ => Err(EINVAL),
+        }
     }
 }
 
@@ -138,25 +109,7 @@ pub(crate) enum FalconSecurityModel {
     /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
-impl_from_enum_to_u8!(FalconSecurityModel);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconSecurityModel {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        use FalconSecurityModel::*;
-
-        let sec_model = match value {
-            0 => None,
-            2 => Light,
-            3 => Heavy,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(sec_model)
-    }
-}
+impl_num_enum!(FalconSecurityModel: u8 [None, Light, Heavy] => EINVAL);
 
 /// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
 /// register. It is passed to the Falcon Boot ROM (BROM) as a parameter.
@@ -170,19 +123,7 @@ pub(crate) enum FalconModSelAlgo {
     #[default]
     Rsa3k = 1,
 }
-impl_from_enum_to_u8!(FalconModSelAlgo);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconModSelAlgo {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
-            1 => Ok(FalconModSelAlgo::Rsa3k),
-            _ => Err(EINVAL),
-        }
-    }
-}
+impl_num_enum!(FalconModSelAlgo: u8 [Rsa3k] => EINVAL);
 
 /// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_FALCON_DMATRFCMD`] register.
 #[repr(u8)]
@@ -192,19 +133,7 @@ pub(crate) enum DmaTrfCmdSize {
     #[default]
     Size256B = 0x6,
 }
-impl_from_enum_to_u8!(DmaTrfCmdSize);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for DmaTrfCmdSize {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
-            0x6 => Ok(Self::Size256B),
-            _ => Err(EINVAL),
-        }
-    }
-}
+impl_num_enum!(DmaTrfCmdSize: u8 [Size256B] => EINVAL);
 
 /// Currently active core on a dual falcon/riscv (Peregrine) controller.
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
@@ -247,6 +176,7 @@ pub(crate) enum FalconMem {
 /// This determines the memory type for external memory access during a DMA transfer, which is
 /// performed by the Falcon's Framebuffer DMA (FBDMA) engine. See falcon.rst for more details.
 #[derive(Debug, Clone, Default)]
+#[repr(u8)]
 pub(crate) enum FalconFbifTarget {
     /// VRAM.
     #[default]
@@ -257,23 +187,7 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
-impl_from_enum_to_u8!(FalconFbifTarget);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconFbifTarget {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        let res = match value {
-            0 => Self::LocalFb,
-            1 => Self::CoherentSysmem,
-            2 => Self::NoncoherentSysmem,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(res)
-    }
-}
+impl_num_enum!(FalconFbifTarget: u8 [LocalFb, CoherentSysmem, NoncoherentSysmem] => EINVAL);
 
 /// Type of memory addresses to use.
 #[derive(Debug, Clone, Default)]
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..045bd35f2d8f 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -19,6 +19,7 @@
     fb::SysmemFlush,
     gfw,
     gsp::Gsp,
+    num::impl_num_enum,
     regs,
 };
 
@@ -135,25 +136,7 @@ pub(crate) enum Architecture {
     Ada = 0x19,
 }
 
-impl TryFrom<u8> for Architecture {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
-            0x16 => Ok(Self::Turing),
-            0x17 => Ok(Self::Ampere),
-            0x19 => Ok(Self::Ada),
-            _ => Err(ENODEV),
-        }
-    }
-}
-
-impl From<Architecture> for u8 {
-    fn from(value: Architecture) -> Self {
-        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
-        value as u8
-    }
-}
+impl_num_enum!(Architecture: u8 [Turing, Ampere, Ada] => ENODEV);
 
 pub(crate) struct Revision {
     major: u8,
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index c952a834e662..d5db97c3de0f 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -215,3 +215,37 @@ pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
 impl_const_into!(u64 => { u8, u16, u32 });
 impl_const_into!(u32 => { u8, u16 });
 impl_const_into!(u16 => { u8 });
+
+/// Implements [`TryFrom`] and [`From`] conversions between a `#[repr(primitive)]` enum and its
+/// underlying primitive type.
+///
+/// The [`TryFrom`] conversion returns the specified error for unrecognized values. The [`From`]
+/// conversion casts the enum variant to the primitive type.
+///
+/// Only the variants listed in the macro invocation are recognized by [`TryFrom`]. This allows
+/// excluding certain variants (e.g., dead code) from the reverse mapping.
+///
+/// The enum **must** have a `#[repr($prim_type)]` attribute. Without it, the `as` cast in the
+/// generated [`From`] impl is not guaranteed to be correct.
+macro_rules! impl_num_enum {
+    ($enum_type:ty : $prim_type:ty [$($variant:ident),+ $(,)?] => $err:expr) => {
+        impl From<$enum_type> for $prim_type {
+            fn from(val: $enum_type) -> $prim_type {
+                val as $prim_type
+            }
+        }
+
+        impl TryFrom<$prim_type> for $enum_type {
+            type Error = kernel::error::Error;
+
+            fn try_from(val: $prim_type) -> core::result::Result<Self, Self::Error> {
+                $(if val == <$enum_type>::$variant as $prim_type {
+                    return Ok(<$enum_type>::$variant);
+                })*
+                Err($err)
+            }
+        }
+    };
+}
+
+pub(crate) use impl_num_enum;
-- 
2.43.0

