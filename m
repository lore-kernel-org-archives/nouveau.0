Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76336E9D827
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:56:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5440A10E1B7;
	Sun,  5 Apr 2026 23:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J75yujqh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 347B8455EC;
	Sun,  5 Apr 2026 23:45:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432720;
 b=TirnvsFjIMBlIpemFyadOIwHw3R0aA3A4Q7/Q1oOFC3UP0C/M6JBLvERWb/nFKN/wPnNL
 BuYF4kNj4SBn319iPZTsCMkuUB9yLQzyC4YeR4VRXpxQ5kbwh7UzKPml5oqK9gb7ARUJLLz
 q/VMdNon1UPV2VMjpEFxUgJpU1Um8ulFyMb6/Ztd91CdsNyV6+K+421N2sBpwUt8pndBIip
 8mA86plbiU78FHY361irzwhG4vdOJIeU1/4e1zCmv+0AjCPNgBJTiF3LIDXYQ5c4wR11kcE
 HWPMyBdC/IcMuxhgkRHJqS8/WP8onY8LnB6Ra5LHEM6i4GUU7ZiwJ9Qb+X1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432720; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IXLLkhfVPSZHe2+Oi3z/Qa4T+xmYWv87MPocWr1CpeU=;
 b=ubr5kx1Q57CBbwpoQ4ymR48FfNGj+s83LgPUC6kcoLMldr4j259mqyAa27rNw//X8+/eE
 4e3G102Wacq17xFnJmdmnCyHmJm3jSwOmFqzG0tGsxMkj9fLkPgXgO2WFBq1DAbBurBRG2E
 lw22fjgxCTCmhTMxokIF3NpCbbzRIEHAGFLx9EgwqYH9E8H0FkvdzjMt6bLKA7tY+kXdD49
 cQ0MXeKHkYEO015DNdSR069KPFPWOtJnYN9Dx0cnBvrQ9bcliw3vASAJZvy7uSNMaM+cAlM
 aJVrHkbxo9nPe38Ep0Rg3isWFH7VTWAxJyr1AH0H0/U2X7crRx5990LNkyww==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 57E9742DA9
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:45:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 395C110E1A9;
	Sun,  5 Apr 2026 23:56:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D1E3600CB;
	Sun,  5 Apr 2026 23:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B450C116C6;
	Sun,  5 Apr 2026 23:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433409;
	bh=sQUuqsYWoQQDl9yxEE9Az9YtqbQefhrhSP8rhldIqmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J75yujqhKFFuRX3GexxH2MvDnyBAcdTMIKhI0rNoTW15zw9TzUSxe27UepZvWE18X
	 sub3LugioC9w0xL+97ng102uzKndH8Ef/fjF5HpT6cFS3fEq4Egi4GCNsRUa5Zu7mF
	 ghvVrRnth7f8i1zaluS9EMfBoMQ6edcxRkjuwMamJd6VVZq13aoqCDwQFlUnwhXXER
	 Qli7u2f6YsZ6TrACIbajwtOLeo23srQOGUoscbrDvlMePGirOBgt0tq/xfktxKtt3s
	 F2UVROBeYqdnAEr10BJqZbI75EHII4oVRwiT7p2M42R6Wiky1MPlMLBmszZvTLKzsu
	 NMb1Zpm8DdMBw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 18/33] rust: rust_is_available: remove warning for
 `bindgen` 0.66.[01]
Date: Mon,  6 Apr 2026 01:52:54 +0200
Message-ID: <20260405235309.418950-19-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HWS2C3ZYVFQWPOQDCNZSIZGA2DENQTFJ
X-Message-ID-Hash: HWS2C3ZYVFQWPOQDCNZSIZGA2DENQTFJ
X-MailFrom: ojeda@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Tamir Duberstein <tamird@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HWS2C3ZYVFQWPOQDCNZSIZGA2DENQTFJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-19-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

It is not possible anymore to fall into the issue that this warning was
alerting about given the `bindgen` version bump.

Thus simplify by removing the machinery behind it, including tests.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/rust_is_available.sh             | 13 ------------
 scripts/rust_is_available_bindgen_0_66.h |  2 --
 scripts/rust_is_available_test.py        | 26 +++---------------------
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 scripts/rust_is_available_bindgen_0_66.h

diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
index d2323de0692c..77896e31dab5 100755
--- a/scripts/rust_is_available.sh
+++ b/scripts/rust_is_available.sh
@@ -163,19 +163,6 @@ if [ "$rust_bindings_generator_cversion" -lt "$rust_bindings_generator_min_cvers
 	echo >&2 "***"
 	exit 1
 fi
-if [ "$rust_bindings_generator_cversion" -eq 6600 ] ||
-	[ "$rust_bindings_generator_cversion" -eq 6601 ]; then
-	# Distributions may have patched the issue (e.g. Debian did).
-	if ! "$BINDGEN" $(dirname $0)/rust_is_available_bindgen_0_66.h >/dev/null; then
-		echo >&2 "***"
-		echo >&2 "*** Rust bindings generator '$BINDGEN' versions 0.66.0 and 0.66.1 may not"
-		echo >&2 "*** work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2567),"
-		echo >&2 "*** unless patched (like Debian's)."
-		echo >&2 "***   Your version:     $rust_bindings_generator_version"
-		echo >&2 "***"
-		warning=1
-	fi
-fi
 
 # Check that the `libclang` used by the Rust bindings generator is suitable.
 #
diff --git a/scripts/rust_is_available_bindgen_0_66.h b/scripts/rust_is_available_bindgen_0_66.h
deleted file mode 100644
index c0431293421c..000000000000
--- a/scripts/rust_is_available_bindgen_0_66.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#define A "\0"
diff --git a/scripts/rust_is_available_test.py b/scripts/rust_is_available_test.py
index 4fcc319dea84..b66fa5933844 100755
--- a/scripts/rust_is_available_test.py
+++ b/scripts/rust_is_available_test.py
@@ -54,17 +54,12 @@ else:
 """)
 
     @classmethod
-    def generate_bindgen(cls, version_stdout, libclang_stderr, version_0_66_patched=False, libclang_concat_patched=False):
+    def generate_bindgen(cls, version_stdout, libclang_stderr, libclang_concat_patched=False):
         if libclang_stderr is None:
             libclang_case = f"raise SystemExit({cls.bindgen_default_bindgen_libclang_failure_exit_code})"
         else:
             libclang_case = f"print({repr(libclang_stderr)}, file=sys.stderr)"
 
-        if version_0_66_patched:
-            version_0_66_case = "pass"
-        else:
-            version_0_66_case = "raise SystemExit(1)"
-
         if libclang_concat_patched:
             libclang_concat_case = "print('pub static mut foofoo: ::std::os::raw::c_int;')"
         else:
@@ -74,8 +69,6 @@ else:
 import sys
 if "rust_is_available_bindgen_libclang.h" in " ".join(sys.argv):
     {libclang_case}
-elif "rust_is_available_bindgen_0_66.h" in " ".join(sys.argv):
-    {version_0_66_case}
 elif "rust_is_available_bindgen_libclang_concat.h" in " ".join(sys.argv):
     {libclang_concat_case}
 else:
@@ -83,8 +76,8 @@ else:
 """)
 
     @classmethod
-    def generate_bindgen_version(cls, stdout, version_0_66_patched=False):
-        return cls.generate_bindgen(stdout, cls.bindgen_default_bindgen_libclang_stderr, version_0_66_patched)
+    def generate_bindgen_version(cls, stdout):
+        return cls.generate_bindgen(stdout, cls.bindgen_default_bindgen_libclang_stderr)
 
     @classmethod
     def generate_bindgen_libclang_failure(cls):
@@ -245,19 +238,6 @@ else:
         result = self.run_script(self.Expected.FAILURE, { "BINDGEN": bindgen })
         self.assertIn(f"Rust bindings generator '{bindgen}' is too old.", result.stderr)
 
-    def test_bindgen_bad_version_0_66_0_and_0_66_1(self):
-        for version in ("0.66.0", "0.66.1"):
-            with self.subTest(version=version):
-                bindgen = self.generate_bindgen_version(f"bindgen {version}")
-                result = self.run_script(self.Expected.SUCCESS_WITH_WARNINGS, { "BINDGEN": bindgen })
-                self.assertIn(f"Rust bindings generator '{bindgen}' versions 0.66.0 and 0.66.1 may not", result.stderr)
-
-    def test_bindgen_bad_version_0_66_0_and_0_66_1_patched(self):
-        for version in ("0.66.0", "0.66.1"):
-            with self.subTest(version=version):
-                bindgen = self.generate_bindgen_version(f"bindgen {version}", True)
-                result = self.run_script(self.Expected.SUCCESS, { "BINDGEN": bindgen })
-
     def test_bindgen_libclang_failure(self):
         bindgen = self.generate_bindgen_libclang_failure()
         result = self.run_script(self.Expected.FAILURE, { "BINDGEN": bindgen })
-- 
2.53.0

