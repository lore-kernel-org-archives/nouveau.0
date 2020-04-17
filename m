From: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH i-g-t v2 0/5] Add nouveau-crc tests
Date: Fri, 17 Apr 2020 15:52:53 -0400
Message-ID: <20200417195258.40054-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

(Just forwarding this to nouveau's ml, since I completely forgot to
before)

Nouveau has finally gotten CRC support, hooray! Well, it's under review
at least:

https://patchwork.freedesktop.org/series/74804/
(it has a cover letter, but nouveau's mailing list configuration has
blocked the email so I'm waiting for a moderator to fix that)

So, this series adds the relevant tests for it since nvidia's CRC
implementation has some rather interesting design choices that needed to
be worked around.

Lyude Paul (5):
  lib/igt_core: Fix igt_assert_fd() documentation
  lib/igt_core: Add igt_require_fd()
  lib/igt_debugfs: Add igt_debugfs_pipe_dir()
  lib/igt_kms: Hook up connector dithering prop
  tests: Add nouveau-crc tests

 lib/drmtest.c       |  10 ++
 lib/drmtest.h       |   2 +
 lib/igt_core.h      |  16 +-
 lib/igt_debugfs.c   |  29 ++++
 lib/igt_debugfs.h   |   1 +
 lib/igt_kms.c       |   6 +
 lib/igt_kms.h       |   1 +
 tests/meson.build   |   1 +
 tests/nouveau_crc.c | 396 ++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 460 insertions(+), 2 deletions(-)
 create mode 100644 tests/nouveau_crc.c

-- 
2.25.1
