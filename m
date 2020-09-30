From: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH i-g-t v5 0/5] Add nouveau-crc tests
Date: Wed, 30 Sep 2020 14:33:20 -0400
Message-ID: <20200930183320.GB518504@xps13>
References: <20200930173150.431995-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200930173150.431995-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: igt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Sep 30, 2020 at 01:31:45PM -0400, Lyude wrote:
> From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> Nouveau has finally gotten CRC support, and at this point that support
> has made its way upstream. Hooray!
> 
> So, let's start adding some relevant tests for it since nvidia's CRC
> implementation has some rather interesting design choices that needed to
> be worked around.
> 
> Lyude Paul (5):
>   lib/igt_core: Fix igt_assert_fd() documentation
>   lib/igt_core: Add igt_require_fd()
>   lib/igt_debugfs: Add igt_debugfs_pipe_dir()
>   lib/igt_kms: Hook up connector dithering prop
>   tests: Add nouveau-crc tests
> 
>  .gitlab-ci.yml      |   2 +-
>  lib/drmtest.c       |  10 ++
>  lib/drmtest.h       |   2 +
>  lib/igt_core.h      |  16 +-
>  lib/igt_debugfs.c   |  21 +++
>  lib/igt_debugfs.h   |   1 +
>  lib/igt_kms.c       |   5 +
>  lib/igt_kms.h       |   1 +
>  tests/meson.build   |   1 +
>  tests/nouveau_crc.c | 414 ++++++++++++++++++++++++++++++++++++++++++++
>  10 files changed, 470 insertions(+), 3 deletions(-)
>  create mode 100644 tests/nouveau_crc.c
> 
> -- 
> 2.26.2
> 

Looks good, all the tests pass now that I've removed the serial cable.
For the series:

Reviewed-by: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
