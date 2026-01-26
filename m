Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D701D19520
	for <nouveau@archiver.kernel.org>; Mon, 26 Jan 2026 23:01:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB0210E4BC;
	Mon, 26 Jan 2026 23:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZwMjmS2d";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7688C40ACB;
	Mon, 26 Jan 2026 22:52:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769467956;
 b=zg7tJJkV2ghcBOqtrpcs7A66XGndiAw+JRhOg8JZQ5Jerxo9FDGey3xN51TIZksWarOXn
 Dx0m0fMf/gsqPBpD2Htz940NHojpaiMMR0LEoBwc0XddHMqHUNK6fyjiDPguGjXCjJBsN62
 S23rv6Dt4ynwTN1j5BFK/k6vV92zUS0pwpJbgMJbupMm0ilCHEIUVRXaCfpl9rCcnV6rnK5
 mpvtW1GGNKEe+ZBQbVHLrVIYbHJp+3iK/Sxd1fW3IIf4W+ypRTAMvnUyEPGzcAH2YZnKwLN
 XE/BvCDtd3BSyt3ocJa64j3FYa7ku6nsdLSBTHyp3ZxZX83BVJ+855EqralQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769467956; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CMjbZ07Y1s6hUBu5ywDfEsYaOQno6MCKOLWpCwsbiKA=;
 b=D0TkW4LRMpvuB0np3e/8t1gm25mUdfELfSnRLEIiQz8vyqOZWy8oFEcWthja9NTqK4bjn
 mfyd3WZ2UmWk8l1ml6PylLH9VKUtnthpW+tv++icWDMg1ts8oJhN5Qt4cxVW/HTxUsyZII8
 pjVhDOu8Ri+dscVc62YdOBUbUxIMRnl3JV7WSoSEU+XMFUfeNb6ilBXP7vGzLFOoU6bAA61
 cP+3tzj10CJvgZg6R6v5JU3l2V5wvtg3nt/s+9bksvpIMrZjMIw0Wz+yl4Jjfy7vOFO68oA
 CpdM2LrW9J9QeV3PCnEUpYEPs0Nfz0seFDndyD/aY54A0tcmovLA1wxfQmsQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 668C640371
	for <nouveau@lists.freedesktop.org>; Mon, 26 Jan 2026 22:52:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BAB1910E1D4;
	Mon, 26 Jan 2026 23:01:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4400660051;
	Mon, 26 Jan 2026 22:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECCDC116C6;
	Mon, 26 Jan 2026 22:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769467994;
	bh=DbyBvcFlup54F2ZWHzs85SXCKgEo0Qe21z8LMojTQaU=;
	h=Date:Subject:Cc:To:From:From;
	b=ZwMjmS2dJnSHCfvWwqZtPzbjsv9N/Cdd0fd39rjAiQHJ33SmSp8h5hAq3Em31/y4r
	 +E/mvGg8SiDJNn8iAPJ2SFg/sOeypWR+ZP0Pt1oc9xsOPHaUIMeflZTxoxD2jQYmWd
	 UqgShk6KfOrFFbsE8PThARL0OaSOSIoUq5Jz1YlPkqTbe5Od4lPPXz5h4UDWNlwplo
	 NoA19apOOwCGFp8URlZVanKjgvf+DuSgL/9VxAQqPBZG/9nLlh31wzxykBhUIEADgJ
	 wwBuBf3qHN6Q1VfSQrjjHaqsPH60hBHHcYbQXJk495ujeUAO65oUVHV9ELKfLOhRnm
	 rbO+7AynzJmVw==
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 23:53:10 +0100
Message-Id: <DFYW1WV6DUCG.3K8V2DAVD1Q4A@kernel.org>
Subject: [GIT PULL] DRM Rust changes for v7.0-rc1
To: "Dave Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>
From: "Danilo Krummrich" <dakr@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
Message-ID-Hash: I6PAWEUP5DO4J2UGHNJMZNZZB2VAIWG5
X-Message-ID-Hash: I6PAWEUP5DO4J2UGHNJMZNZZB2VAIWG5
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/I6PAWEUP5DO4J2UGHNJMZNZZB2VAIWG5/>
Archived-At: 
 <https://lore.freedesktop.org/DFYW1WV6DUCG.3K8V2DAVD1Q4A@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Dave and Sima,

Please pull these DRM Rust changes.

Most changes have been in -next for a couple of rounds; there's one minor
conflict with the drm-misc tree [1] due to a Panthor/Tyr UAPI change.

In general, there are not a lot of changes this cycle, the biggest thing is=
 the
preparation work for Turing support, but even this is rather small.

Expect quite a bit more for the next cycle, e.g. GPUVM, DRM buddy, DeviceCo=
ntext
for DRM devices and Hopper/Blackwell support plus some MM stuff on the nova=
-core
side.

- Danilo

[1] https://lore.kernel.org/all/aXEF-ESjd5ouyXRq@sirena.org.uk/

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193=
:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-next-202=
6-01-26

for you to fetch changes up to cea7b66a80412e2a5b74627b89ae25f1d0110a4b:

  Documentation: nova: update pending tasks (2026-01-26 18:16:14 +0100)

----------------------------------------------------------------
DRM Rust changes for v7.0-rc1

DRM:
  - Fix documentation for Registration constructors.
  - Use pin_init::zeroed() for fops initialization.
  - Annotate DRM helpers with __rust_helper.
  - Improve safety documentation for gem::Object::new().
  - Update AlwaysRefCounted imports.

MM:
  - Prevent integer overflow in page_align().

Nova (Core):
  - Prepare for Turing support. This includes parsing and handling
    Turing-specific firmware headers and sections as well as a Turing
    Falcon HAL implementation.
  - Get rid of the Result<impl PinInit<T, E>> anti-pattern.
  - Relocate initializer-specific code into the appropriate initializer.
  - Use CStr::from_bytes_until_nul() to remove custom helpers.
  - Improve handling of unexpected firmware values.
  - Clean up redundant debug prints.
  - Replace c_str!() with native Rust C-string literals.
  - Update nova-core task list.

Nova (DRM):
  - Align GEM object size to system page size.

Tyr:
  - Use generated uAPI bindings for GpuInfo.
  - Replace manual sleeps with read_poll_timeout().
  - Replace c_str!() with native Rust C-string literals.
  - Suppress warnings for unread fields.
  - Fix incorrect register name in print statement.

----------------------------------------------------------------
Alexandre Courbot (1):
      gpu: nova-core: align LibosMemoryRegionInitArgument size to page size

Alice Ryhl (1):
      rust: drm: add __rust_helper to helpers

Atharv Dubey (1):
      rust: drm: use `pin_init::zeroed()` for file operations initializatio=
n

Brendan Shephard (2):
      rust: Return Option from page_align and ensure no usize overflow
      drm/nova: Align GEM memory allocation to system page size

Danilo Krummrich (7):
      gpu: nova-core: fw: get rid of redundant Result in GspFirmware::new()
      gpu: nova-core: fw: move appropriate code into pin initializer
      gpu: nova-core: gsp: get rid of redundant Result in Gsp::new()
      gpu: nova-core: gsp: move appropriate code into pin initializer
      Merge tag 'v6.19-rc5' into drm-rust-next
      Documentation: nova: remove completed tasks
      Documentation: nova: update pending tasks

Deborah Brouwer (3):
      drm/tyr: use generated bindings for GpuInfo
      drm/tyr: use read_poll_timeout
      drm/tyr: suppress unread field warnings

Dirk Behme (1):
      drm/tyr: fix register name in error print

Ewan Chorynski (1):
      rust: drm: Improve safety comment when using `Pin::into_inner_uncheck=
ed`

John Hubbard (4):
      gpu: nova-core: use CStr::from_bytes_until_nul() and remove util.rs
      gpu: nova-core: use CStr::from_bytes_until_nul() in elf64_section()
      gpu: nova-core: preserve error information in gpu_name()
      gpu: nova-core: don't print raw PMU table entries

Lyude Paul (1):
      rust/drm: Fix Registration::{new,new_foreign_owned}() docs

Shankari Anand (2):
      drivers: gpu: Update ARef imports from sync::aref
      rust: drm: Update AlwaysRefCounted imports to use sync::aref

Tamir Duberstein (2):
      gpu: nova: replace `kernel::c_str!` with C-Strings
      drm: tyr: replace `kernel::c_str!` with C-Strings

Timur Tabi (12):
      gpu: nova-core: check for overflow to DMATRFBASE1
      gpu: nova-core: add missing newlines to several print strings
      gpu: nova-core: rename Imem to ImemSecure
      gpu: nova-core: add ImemNonSecure section infrastructure
      gpu: nova-core: support header parsing on Turing/GA100
      gpu: nova-core: add support for Turing/GA100 fwsignature
      gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
      gpu: nova-core: move some functions into the HAL
      gpu: nova-core: Add basic Turing HAL
      gpu: nova-core: add NV_PFALCON_FALCON_ENGINE::reset_engine()
      gpu: nova-core: add Falcon HAL method load_method()
      gpu: nova-core: add FalconUCodeDescV2 support

 Documentation/gpu/nova/core/todo.rst      |  59 +++++++++-----------------=
------
 drivers/gpu/drm/nova/driver.rs            |  18 +++++++---
 drivers/gpu/drm/nova/gem.rs               |   6 ++--
 drivers/gpu/drm/tyr/driver.rs             |  55 +++++++++++++-------------=
----
 drivers/gpu/drm/tyr/gpu.rs                |  66 ++++++++++++++++++--------=
----------
 drivers/gpu/nova-core/driver.rs           |   5 ++-
 drivers/gpu/nova-core/falcon.rs           | 107 ++++++++++++++++++++++++++=
+-------------------------------
 drivers/gpu/nova-core/falcon/hal.rs       |  26 ++++++++++++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  43 ++++++++++++++++++++++--
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  77 ++++++++++++++++++++++++++=
++++++++++++++++
 drivers/gpu/nova-core/fb.rs               |   2 +-
 drivers/gpu/nova-core/firmware.rs         | 203 ++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++---
 drivers/gpu/nova-core/firmware/booter.rs  |  43 ++++++++++++++++++++----
 drivers/gpu/nova-core/firmware/fwsec.rs   |  51 +++++++++++++-------------=
--
 drivers/gpu/nova-core/firmware/gsp.rs     | 146 ++++++++++++++++++++++++++=
+++++++++++++++--------------------------------------
 drivers/gpu/nova-core/gpu.rs              |   4 +--
 drivers/gpu/nova-core/gsp.rs              |  77 ++++++++++++++++++++------=
----------------
 drivers/gpu/nova-core/gsp/boot.rs         |  18 ++++------
 drivers/gpu/nova-core/gsp/cmdq.rs         |   2 +-
 drivers/gpu/nova-core/gsp/commands.rs     |  29 ++++++++++++----
 drivers/gpu/nova-core/gsp/fw.rs           |  14 +++++++-
 drivers/gpu/nova-core/gsp/sequencer.rs    |  14 ++++----
 drivers/gpu/nova-core/nova_core.rs        |   1 -
 drivers/gpu/nova-core/regs.rs             |  42 ++++++++++++++++++++++-
 drivers/gpu/nova-core/util.rs             |  16 ---------
 drivers/gpu/nova-core/vbios.rs            |  73 ++++++++++++++++++--------=
--------------
 rust/helpers/drm.c                        |   7 ++--
 rust/kernel/drm/driver.rs                 |   6 ++--
 rust/kernel/drm/gem/mod.rs                |   8 ++---
 rust/kernel/page.rs                       |  36 ++++++++++++++++----
 30 files changed, 823 insertions(+), 431 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs
 delete mode 100644 drivers/gpu/nova-core/util.rs
