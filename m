From: Aaryaman Vasishta <jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/2] nv110/exa: update sched codes
Date: Thu, 31 Aug 2017 21:59:34 +0900
Message-ID: <CABVHfRtLxsQydt786L0Y1=9ViuZhW0-jVGb58e1icSo=WbhF9Q@mail.gmail.com>
References: <20170701153705.21372-1-jem456.vasishta@gmail.com>
 <20170701153705.21372-2-jem456.vasishta@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1245831655=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170701153705.21372-2-jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1245831655==
Content-Type: multipart/alternative; boundary="94eb2c05e90e823d7005580c3805"

--94eb2c05e90e823d7005580c3805
Content-Type: text/plain; charset="UTF-8"

Hi,

Any updates on the review of this patch?

Cheers,
Aaryaman

On Sun, Jul 2, 2017 at 12:37 AM, Aaryaman Vasishta <
jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> v5: Rebased on depbar removal patch; removed a redundant read dep-bar.
>
> This patch adds proper delays to maxwell exa shaders. rendercheck tests
> seem consistent with/without this patch. I haven't extensively tested
> them though.
>
> Trello:
> https://trello.com/c/6LPB2EIS/174-update-maxwell-shaders-
> with-proper-delays
>
> Signed-off-by: Aaryaman Vasishta <jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  src/shader/exac8nv110.fp  | 10 +++++-----
>  src/shader/exac8nv110.fpc | 18 +++++++++---------
>  src/shader/exacanv110.fp  | 10 +++++-----
>  src/shader/exacanv110.fpc | 18 +++++++++---------
>  src/shader/exacmnv110.fp  | 10 +++++-----
>  src/shader/exacmnv110.fpc | 18 +++++++++---------
>  src/shader/exas8nv110.fp  |  6 +++---
>  src/shader/exas8nv110.fpc | 12 ++++++------
>  src/shader/exasanv110.fp  | 10 +++++-----
>  src/shader/exasanv110.fpc | 18 +++++++++---------
>  src/shader/exascnv110.fp  |  4 ++--
>  src/shader/exascnv110.fpc |  8 ++++----
>  src/shader/videonv110.fp  | 12 ++++++------
>  src/shader/videonv110.fpc | 22 +++++++++++-----------
>  14 files changed, 88 insertions(+), 88 deletions(-)
>
> diff --git a/src/shader/exac8nv110.fp b/src/shader/exac8nv110.fp
> index 220d7e5..7797ef4 100644
> --- a/src/shader/exac8nv110.fp
> +++ b/src/shader/exac8nv110.fp
> @@ -25,22 +25,22 @@ NV110FP_Composite_A8[] = {
>  };
>  #else
>
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>  mufu rcp $r0 $r0
>  ipa $r3 a[0x94] $r0 0x0 0x1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x0 wt 0x1)
>  ipa $r2 a[0x90] $r0 0x0 0x1
>  tex nodep $r1 $r2 0x0 0x1 t2d 0x8
>  ipa $r3 a[0x84] $r0 0x0 0x1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0x6 wt 0x1)
>  ipa $r2 a[0x80] $r0 0x0 0x1
>  tex nodep $r0 $r2 0x0 0x0 t2d 0x8
>  fmul ftz $r3 $r0 $r1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0x1) (st 0x1) (st 0x1)
>  mov $r2 $r3 0xf
>  mov $r1 $r3 0xf
>  mov $r0 $r3 0xf
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf) (st 0x0) (st 0x0)
>  exit
>  #endif
> diff --git a/src/shader/exac8nv110.fpc b/src/shader/exac8nv110.fpc
> index d8d5517..7eb9c02 100644
> --- a/src/shader/exac8nv110.fpc
> +++ b/src/shader/exac8nv110.fpc
> @@ -1,36 +1,36 @@
> -0xfc0007e0,
> -0x001f8000,
> +0xe1a0070f,
> +0x003c3c01,
>  0xcff7ff00,
>  0xe003ff87,
>  0x00470000,
>  0x50800000,
>  0x4007ff03,
>  0xe043ff89,
> -0xfc0007e0,
> -0x001f8000,
> +0xe1e0072f,
> +0x003c3c03,
>  0x0007ff02,
>  0xe043ff89,
>  0x2ff70201,
>  0xc03a0014,
>  0x4007ff03,
>  0xe043ff88,
> -0xfc0007e0,
> -0x001f8000,
> +0xe1e0072f,
> +0x003f9803,
>  0x0007ff02,
>  0xe043ff88,
>  0x2ff70200,
>  0xc03a0004,
>  0x00170003,
>  0x5c681000,
> -0xfc0007e0,
> -0x001f8000,
> +0xfc2007e1,
> +0x001f8400,
>  0x00370002,
>  0x5c980780,
>  0x00370001,
>  0x5c980780,
>  0x00370000,
>  0x5c980780,
> -0xfc0007e0,
> +0xfc0007ef,
>  0x001f8000,
>  0x0007000f,
>  0xe3000000,
> diff --git a/src/shader/exacanv110.fp b/src/shader/exacanv110.fp
> index bad34c9..912f630 100644
> --- a/src/shader/exacanv110.fp
> +++ b/src/shader/exacanv110.fp
> @@ -25,22 +25,22 @@ NV110FP_CAComposite[] = {
>  };
>  #else
>
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>  mufu rcp $r0 $r0
>  ipa $r3 a[0x94] $r0 0x0 0x1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)
>  ipa $r2 a[0x90] $r0 0x0 0x1
>  tex nodep $r4 $r2 0x0 0x1 t2d 0xf
>  ipa $r1 a[0x84] $r0 0x0 0x1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0x1 wt 0x3)
>  ipa $r0 a[0x80] $r0 0x0 0x1
>  tex nodep $r0 $r0 0x0 0x0 t2d 0xf
>  fmul ftz $r3 $r3 $r7
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0x1) (st 0x1) (st 0x1)
>  fmul ftz $r2 $r2 $r6
>  fmul ftz $r1 $r1 $r5
>  fmul ftz $r0 $r0 $r4
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf) (st 0x0) (st 0x0)
>  exit
>  #endif
> diff --git a/src/shader/exacanv110.fpc b/src/shader/exacanv110.fpc
> index 1a151a2..4c35845 100644
> --- a/src/shader/exacanv110.fpc
> +++ b/src/shader/exacanv110.fpc
> @@ -1,36 +1,36 @@
> -0xfc0007e0,
> -0x001f8000,
> +0xe1a0070f,
> +0x003c3c01,
>  0xcff7ff00,
>  0xe003ff87,
>  0x00470000,
>  0x50800000,
>  0x4007ff03,
>  0xe043ff89,
> -0xfc0007e0,
> -0x001f8000,
> +0xe1e0072f,
> +0x001cbc03,
>  0x0007ff02,
>  0xe043ff89,
>  0xaff70204,
>  0xc03a0017,
>  0x4007ff01,
>  0xe043ff88,
> -0xfc0007e0,
> -0x001f8000,
> +0xe5e0172f,
> +0x007f8402,
>  0x0007ff00,
>  0xe043ff88,
>  0xaff70000,
>  0xc03a0007,
>  0x00770303,
>  0x5c681000,
> -0xfc0007e0,
> -0x001f8000,
> +0xfc2007e1,
> +0x001f8400,
>  0x00670202,
>  0x5c681000,
>  0x00570101,
>  0x5c681000,
>  0x00470000,
>  0x5c681000,
> -0xfc0007e0,
> +0xfc0007ef,
>  0x001f8000,
>  0x0007000f,
>  0xe3000000,
> diff --git a/src/shader/exacmnv110.fp b/src/shader/exacmnv110.fp
> index c1eb38e..02a0835 100644
> --- a/src/shader/exacmnv110.fp
> +++ b/src/shader/exacmnv110.fp
> @@ -25,22 +25,22 @@ NV110FP_Composite[] = {
>  };
>  #else
>
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>  mufu rcp $r0 $r0
>  ipa $r3 a[0x94] $r0 0x0 0x1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)
>  ipa $r2 a[0x90] $r0 0x0 0x1
>  tex nodep $r4 $r2 0x0 0x1 t2d 0x8
>  ipa $r1 a[0x84] $r0 0x0 0x1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0x1 wt 0x3)
>  ipa $r0 a[0x80] $r0 0x0 0x1
>  tex nodep $r0 $r0 0x0 0x0 t2d 0xf
>  fmul ftz $r3 $r3 $r4
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0x1) (st 0x1) (st 0x1)
>  fmul ftz $r2 $r2 $r4
>  fmul ftz $r1 $r1 $r4
>  fmul ftz $r0 $r0 $r4
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf) (st 0x0) (st 0x0)
>  exit
>  #endif
> diff --git a/src/shader/exacmnv110.fpc b/src/shader/exacmnv110.fpc
> index 0b21a0a..56e4e18 100644
> --- a/src/shader/exacmnv110.fpc
> +++ b/src/shader/exacmnv110.fpc
> @@ -1,36 +1,36 @@
> -0xfc0007e0,
> -0x001f8000,
> +0xe1a0070f,
> +0x003c3c01,
>  0xcff7ff00,
>  0xe003ff87,
>  0x00470000,
>  0x50800000,
>  0x4007ff03,
>  0xe043ff89,
> -0xfc0007e0,
> -0x001f8000,
> +0xe1e0072f,
> +0x001cbc03,
>  0x0007ff02,
>  0xe043ff89,
>  0x2ff70204,
>  0xc03a0014,
>  0x4007ff01,
>  0xe043ff88,
> -0xfc0007e0,
> -0x001f8000,
> +0xe5e0172f,
> +0x007f8402,
>  0x0007ff00,
>  0xe043ff88,
>  0xaff70000,
>  0xc03a0007,
>  0x00470303,
>  0x5c681000,
> -0xfc0007e0,
> -0x001f8000,
> +0xfc2007e1,
> +0x001f8400,
>  0x00470202,
>  0x5c681000,
>  0x00470101,
>  0x5c681000,
>  0x00470000,
>  0x5c681000,
> -0xfc0007e0,
> +0xfc0007ef,
>  0x001f8000,
>  0x0007000f,
>  0xe3000000,
> diff --git a/src/shader/exas8nv110.fp b/src/shader/exas8nv110.fp
> index c5349d9..847cc6a 100644
> --- a/src/shader/exas8nv110.fp
> +++ b/src/shader/exas8nv110.fp
> @@ -25,15 +25,15 @@ NV110FP_Source_A8[] = {
>  };
>  #else
>
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>  mufu rcp $r0 $r0
>  ipa $r1 a[0x84] $r0 0x0 0x1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0x1 wt 0x1)
>  ipa $r0 a[0x80] $r0 0x0 0x1
>  tex nodep $r0 $r0 0x0 0x0 t2d 0x8
>  mov $r3 $r0 0xf
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0x1) (st 0x1) (st 0xf)
>  mov $r2 $r0 0xf
>  mov $r1 $r0 0xf
>  exit
> diff --git a/src/shader/exas8nv110.fpc b/src/shader/exas8nv110.fpc
> index fabf980..5671a12 100644
> --- a/src/shader/exas8nv110.fpc
> +++ b/src/shader/exas8nv110.fpc
> @@ -1,21 +1,21 @@
> -0xfc0007e0,
> -0x001f8000,
> +0xe1a0070f,
> +0x003c3c01,
>  0xcff7ff00,
>  0xe003ff87,
>  0x00470000,
>  0x50800000,
>  0x4007ff01,
>  0xe043ff88,
> -0xfc0007e0,
> -0x001f8000,
> +0xe1e0072f,
> +0x003f8403,
>  0x0007ff00,
>  0xe043ff88,
>  0x2ff70000,
>  0xc03a0004,
>  0x00070003,
>  0x5c980780,
> -0xfc0007e0,
> -0x001f8000,
> +0xfc2007e1,
> +0x001fbc00,
>  0x00070002,
>  0x5c980780,
>  0x00070001,
> diff --git a/src/shader/exasanv110.fp b/src/shader/exasanv110.fp
> index 4392c1f..a3d372e 100644
> --- a/src/shader/exasanv110.fp
> +++ b/src/shader/exasanv110.fp
> @@ -25,22 +25,22 @@ NV110FP_CACompositeSrcAlpha[] = {
>  };
>  #else
>
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>  mufu rcp $r0 $r0
>  ipa $r3 a[0x84] $r0 0x0 0x1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)
>  ipa $r2 a[0x80] $r0 0x0 0x1
>  tex nodep $r4 $r2 0x0 0x0 t2d 0x8
>  ipa $r1 a[0x94] $r0 0x0 0x1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0x1 wt 0x3)
>  ipa $r0 a[0x90] $r0 0x0 0x1
>  tex nodep $r0 $r0 0x0 0x1 t2d 0xf
>  fmul ftz $r3 $r3 $r4
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0x1) (st 0x1) (st 0x1)
>  fmul ftz $r2 $r2 $r4
>  fmul ftz $r1 $r1 $r4
>  fmul ftz $r0 $r0 $r4
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf) (st 0x0) (st 0x0)
>  exit
>  #endif
> diff --git a/src/shader/exasanv110.fpc b/src/shader/exasanv110.fpc
> index 80a2731..b61e396 100644
> --- a/src/shader/exasanv110.fpc
> +++ b/src/shader/exasanv110.fpc
> @@ -1,36 +1,36 @@
> -0xfc0007e0,
> -0x001f8000,
> +0xe1a0070f,
> +0x003c3c01,
>  0xcff7ff00,
>  0xe003ff87,
>  0x00470000,
>  0x50800000,
>  0x4007ff03,
>  0xe043ff88,
> -0xfc0007e0,
> -0x001f8000,
> +0xe1e0072f,
> +0x001cbc03,
>  0x0007ff02,
>  0xe043ff88,
>  0x2ff70204,
>  0xc03a0004,
>  0x4007ff01,
>  0xe043ff89,
> -0xfc0007e0,
> -0x001f8000,
> +0xe5e0172f,
> +0x007f8402,
>  0x0007ff00,
>  0xe043ff89,
>  0xaff70000,
>  0xc03a0017,
>  0x00470303,
>  0x5c681000,
> -0xfc0007e0,
> -0x001f8000,
> +0xfc2007e1,
> +0x001f8400,
>  0x00470202,
>  0x5c681000,
>  0x00470101,
>  0x5c681000,
>  0x00470000,
>  0x5c681000,
> -0xfc0007e0,
> +0xfc0007ef,
>  0x001f8000,
>  0x0007000f,
>  0xe3000000,
> diff --git a/src/shader/exascnv110.fp b/src/shader/exascnv110.fp
> index 83a089a..91702d2 100644
> --- a/src/shader/exascnv110.fp
> +++ b/src/shader/exascnv110.fp
> @@ -25,11 +25,11 @@ NV110FP_Source[] = {
>  };
>  #else
>
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>  mufu rcp $r0 $r0
>  ipa $r1 a[0x84] $r0 0x0 0x1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x1) (st 0xf wt 0x3) (st 0xf)
>  ipa $r0 a[0x80] $r0 0x0 0x1
>  tex nodep $r0 $r0 0x0 0x0 t2d 0xf
>  exit
> diff --git a/src/shader/exascnv110.fpc b/src/shader/exascnv110.fpc
> index 3dd3f89..790a797 100644
> --- a/src/shader/exascnv110.fpc
> +++ b/src/shader/exascnv110.fpc
> @@ -1,13 +1,13 @@
> -0xfc0007e0,
> -0x001f8000,
> +0xe1a0070f,
> +0x003c3c01,
>  0xcff7ff00,
>  0xe003ff87,
>  0x00470000,
>  0x50800000,
>  0x4007ff01,
>  0xe043ff88,
> -0xfc0007e0,
> -0x001f8000,
> +0xfde0072f,
> +0x001fbc03,
>  0x0007ff00,
>  0xe043ff88,
>  0xaff70000,
> diff --git a/src/shader/videonv110.fp b/src/shader/videonv110.fp
> index b171e51..ce6769d 100644
> --- a/src/shader/videonv110.fp
> +++ b/src/shader/videonv110.fp
> @@ -25,27 +25,27 @@ NV110FP_NV12[] = {
>  };
>  #else
>
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>  ipa pass $r2 a[0x7c] 0x0 0x0 0x1
>  mufu rcp $r2 $r2
>  ipa $r0 a[0x80] $r2 0x0 0x1
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x0 wt 0x1)
>  ipa $r1 a[0x84] $r2 0x0 0x1
>  tex nodep $r4 $r0 0x0 0x0 t2d 0x8
>  tex nodep $r0 $r0 0x0 0x1 t2d 0xc
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0x6) (st 0x1) (st 0x6)
>  fmul ftz $r5 $r4 c0[0x0]
>  fadd ftz $r3 $r5 c0[0x4]
>  fadd ftz $r4 $r5 c0[0x8]
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0x6) (st 0x6 wt 0x1) (st 0x1)
>  fadd ftz $r5 $r5 c0[0xc]
>  ffma ftz $r3 $r0 c0[0x10] $r3
>  ffma ftz $r4 $r0 c0[0x14] $r4
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0x1) (st 0x1) (st 0x1)
>  ffma ftz $r5 $r0 c0[0x18] $r5
>  ffma ftz $r0 $r1 c0[0x1c] $r3
>  ffma ftz $r2 $r1 c0[0x24] $r5
> -sched (st 0x0) (st 0x0) (st 0x0)
> +sched (st 0x6) (st 0xf) (st 0x0)
>  ffma ftz $r1 $r1 c0[0x20] $r4
>  exit
>  #endif
> diff --git a/src/shader/videonv110.fpc b/src/shader/videonv110.fpc
> index 850163a..7560311 100644
> --- a/src/shader/videonv110.fpc
> +++ b/src/shader/videonv110.fpc
> @@ -1,44 +1,44 @@
> -0xfc0007e0,
> -0x001f8000,
> +0xe1a0070f,
> +0x003c3c01,
>  0xcff7ff02,
>  0xe003ff87,
>  0x00470202,
>  0x50800000,
>  0x0027ff00,
>  0xe043ff88,
> -0xfc0007e0,
> -0x001f8000,
> +0xe1e0072f,
> +0x003c3c03,
>  0x4027ff01,
>  0xe043ff88,
>  0x2ff70004,
>  0xc03a0004,
>  0x2ff70000,
>  0xc03a0016,
> -0xfc0007e0,
> -0x001f8000,
> +0xfc2007e6,
> +0x001f9800,
>  0x00070405,
>  0x4c681000,
>  0x00170503,
>  0x4c581000,
>  0x00270504,
>  0x4c581000,
> -0xfc0007e0,
> -0x001f8000,
> +0xfcc007e6,
> +0x001f8401,
>  0x00370505,
>  0x4c581000,
>  0x00470003,
>  0x49a00180,
>  0x00570004,
>  0x49a00200,
> -0xfc0007e0,
> -0x001f8000,
> +0xfc2007e1,
> +0x001f8400,
>  0x00670005,
>  0x49a00280,
>  0x00770100,
>  0x49a00180,
>  0x00970102,
>  0x49a00280,
> -0xfc0007e0,
> +0xfde007e6,
>  0x001f8000,
>  0x00870101,
>  0x49a00200,
> --
> 2.11.0
>
>

--94eb2c05e90e823d7005580c3805
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Any updates on the review of this p=
atch?</div><div><br></div><div>Cheers,</div><div>Aaryaman</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Jul 2, 2017 at =
12:37 AM, Aaryaman Vasishta <span dir=3D"ltr">&lt;<a href=3D"mailto:jem456.=
vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">v5: Rebased on depbar removal =
patch; removed a redundant read dep-bar.<br>
<br>
This patch adds proper delays to maxwell exa shaders. rendercheck tests<br>
seem consistent with/without this patch. I haven&#39;t extensively tested<b=
r>
them though.<br>
<span class=3D""><br>
Trello:<br>
<a href=3D"https://trello.com/c/6LPB2EIS/174-update-maxwell-shaders-with-pr=
oper-delays" rel=3D"noreferrer" target=3D"_blank">https://trello.com/c/6LPB=
2EIS/<wbr>174-update-maxwell-shaders-<wbr>with-proper-delays</a><br>
<br>
Signed-off-by: Aaryaman Vasishta &lt;<a href=3D"mailto:jem456.vasishta@gmai=
l.com">jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
---<br>
=C2=A0src/shader/exac8nv110.fp=C2=A0 | 10 +++++-----<br>
=C2=A0src/shader/exac8nv110.fpc | 18 +++++++++---------<br>
=C2=A0src/shader/exacanv110.fp=C2=A0 | 10 +++++-----<br>
=C2=A0src/shader/exacanv110.fpc | 18 +++++++++---------<br>
=C2=A0src/shader/exacmnv110.fp=C2=A0 | 10 +++++-----<br>
=C2=A0src/shader/exacmnv110.fpc | 18 +++++++++---------<br>
=C2=A0src/shader/exas8nv110.fp=C2=A0 |=C2=A0 6 +++---<br>
=C2=A0src/shader/exas8nv110.fpc | 12 ++++++------<br>
=C2=A0src/shader/exasanv110.fp=C2=A0 | 10 +++++-----<br>
=C2=A0src/shader/exasanv110.fpc | 18 +++++++++---------<br>
</span>=C2=A0src/shader/exascnv110.fp=C2=A0 |=C2=A0 4 ++--<br>
=C2=A0src/shader/exascnv110.fpc |=C2=A0 8 ++++----<br>
=C2=A0src/shader/videonv110.fp=C2=A0 | 12 ++++++------<br>
=C2=A0src/shader/videonv110.fpc | 22 +++++++++++-----------<br>
=C2=A014 files changed, 88 insertions(+), 88 deletions(-)<br>
<br>
diff --git a/src/shader/exac8nv110.fp b/src/shader/exac8nv110.fp<br>
index 220d7e5..7797ef4 100644<br>
--- a/src/shader/exac8nv110.fp<br>
+++ b/src/shader/exac8nv110.fp<br>
@@ -25,22 +25,22 @@ NV110FP_Composite_A8[] =3D {<br>
<span class=3D"">=C2=A0};<br>
=C2=A0#else<br>
<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0mufu rcp $r0 $r0<br>
=C2=A0ipa $r3 a[0x94] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span><span class=3D"">+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0=
xf wr 0x0 wt 0x1)<br>
</span><span class=3D"">=C2=A0ipa $r2 a[0x90] $r0 0x0 0x1<br>
=C2=A0tex nodep $r1 $r2 0x0 0x1 t2d 0x8<br>
=C2=A0ipa $r3 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0x6 wt 0x1)<br>
<span class=3D"">=C2=A0ipa $r2 a[0x80] $r0 0x0 0x1<br>
</span><span class=3D"">=C2=A0tex nodep $r0 $r2 0x0 0x0 t2d 0x8<br>
</span><span class=3D"">=C2=A0fmul ftz $r3 $r0 $r1<br>
</span><span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0x1) (st 0x1) (st 0x1)<br>
<span class=3D"">=C2=A0mov $r2 $r3 0xf<br>
=C2=A0mov $r1 $r3 0xf<br>
</span>=C2=A0mov $r0 $r3 0xf<br>
<span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span><span class=3D"">+sched (st 0xf) (st 0x0) (st 0x0)<br>
=C2=A0exit<br>
=C2=A0#endif<br>
</span>diff --git a/src/shader/exac8nv110.fpc b/src/shader/exac8nv110.fpc<b=
r>
index d8d5517..7eb9c02 100644<br>
<span class=3D"">--- a/src/shader/exac8nv110.fpc<br>
+++ b/src/shader/exac8nv110.fpc<br>
@@ -1,36 +1,36 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A00xcff7ff00,<br>
=C2=A00xe003ff87,<br>
=C2=A00x00470000,<br>
=C2=A00x50800000,<br>
=C2=A00x4007ff03,<br>
=C2=A00xe043ff89,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
</span>+0xe1e0072f,<br>
+0x003c3c03,<br>
<span class=3D"">=C2=A00x0007ff02,<br>
=C2=A00xe043ff89,<br>
=C2=A00x2ff70201,<br>
=C2=A00xc03a0014,<br>
=C2=A00x4007ff03,<br>
=C2=A00xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
</span>+0xe1e0072f,<br>
+0x003f9803,<br>
=C2=A00x0007ff02,<br>
=C2=A00xe043ff88,<br>
=C2=A00x2ff70200,<br>
=C2=A00xc03a0004,<br>
=C2=A00x00170003,<br>
=C2=A00x5c681000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc2007e1,<br>
+0x001f8400,<br>
=C2=A00x00370002,<br>
=C2=A00x5c980780,<br>
=C2=A00x00370001,<br>
=C2=A00x5c980780,<br>
=C2=A00x00370000,<br>
=C2=A00x5c980780,<br>
<span class=3D"">-0xfc0007e0,<br>
+0xfc0007ef,<br>
=C2=A00x001f8000,<br>
=C2=A00x0007000f,<br>
=C2=A00xe3000000,<br>
</span>diff --git a/src/shader/exacanv110.fp b/src/shader/exacanv110.fp<br>
index bad34c9..912f630 100644<br>
--- a/src/shader/exacanv110.fp<br>
+++ b/src/shader/exacanv110.fp<br>
@@ -25,22 +25,22 @@ NV110FP_CAComposite[] =3D {<br>
<span class=3D"">=C2=A0};<br>
=C2=A0#else<br>
<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0mufu rcp $r0 $r0<br>
=C2=A0ipa $r3 a[0x94] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)<br>
=C2=A0ipa $r2 a[0x90] $r0 0x0 0x1<br>
=C2=A0tex nodep $r4 $r2 0x0 0x1 t2d 0xf<br>
=C2=A0ipa $r1 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0x1 wt 0x3)=
<br>
<span class=3D"">=C2=A0ipa $r0 a[0x80] $r0 0x0 0x1<br>
=C2=A0tex nodep $r0 $r0 0x0 0x0 t2d 0xf<br>
</span><span class=3D"">=C2=A0fmul ftz $r3 $r3 $r7<br>
</span><span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0x1) (st 0x1) (st 0x1)<br>
<span class=3D"">=C2=A0fmul ftz $r2 $r2 $r6<br>
=C2=A0fmul ftz $r1 $r1 $r5<br>
</span><span class=3D"">=C2=A0fmul ftz $r0 $r0 $r4<br>
</span><span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf) (st 0x0) (st 0x0)<br>
=C2=A0exit<br>
=C2=A0#endif<br>
</span>diff --git a/src/shader/exacanv110.fpc b/src/shader/exacanv110.fpc<b=
r>
index 1a151a2..4c35845 100644<br>
<div><div class=3D"h5">--- a/src/shader/exacanv110.fpc<br>
+++ b/src/shader/exacanv110.fpc<br>
@@ -1,36 +1,36 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A00xcff7ff00,<br>
=C2=A00xe003ff87,<br>
=C2=A00x00470000,<br>
=C2=A00x50800000,<br>
=C2=A00x4007ff03,<br>
=C2=A00xe043ff89,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1e0072f,<br>
+0x001cbc03,<br>
=C2=A00x0007ff02,<br>
=C2=A00xe043ff89,<br>
=C2=A00xaff70204,<br>
=C2=A00xc03a0017,<br>
=C2=A00x4007ff01,<br>
=C2=A00xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe5e0172f,<br>
</div></div>+0x007f8402,<br>
=C2=A00x0007ff00,<br>
=C2=A00xe043ff88,<br>
=C2=A00xaff70000,<br>
=C2=A00xc03a0007,<br>
=C2=A00x00770303,<br>
=C2=A00x5c681000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc2007e1,<br>
+0x001f8400,<br>
=C2=A00x00670202,<br>
=C2=A00x5c681000,<br>
=C2=A00x00570101,<br>
=C2=A00x5c681000,<br>
=C2=A00x00470000,<br>
=C2=A00x5c681000,<br>
<span class=3D"">-0xfc0007e0,<br>
+0xfc0007ef,<br>
=C2=A00x001f8000,<br>
=C2=A00x0007000f,<br>
=C2=A00xe3000000,<br>
</span>diff --git a/src/shader/exacmnv110.fp b/src/shader/exacmnv110.fp<br>
index c1eb38e..02a0835 100644<br>
--- a/src/shader/exacmnv110.fp<br>
+++ b/src/shader/exacmnv110.fp<br>
@@ -25,22 +25,22 @@ NV110FP_Composite[] =3D {<br>
<span class=3D"">=C2=A0};<br>
=C2=A0#else<br>
<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0mufu rcp $r0 $r0<br>
=C2=A0ipa $r3 a[0x94] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)<br>
=C2=A0ipa $r2 a[0x90] $r0 0x0 0x1<br>
=C2=A0tex nodep $r4 $r2 0x0 0x1 t2d 0x8<br>
=C2=A0ipa $r1 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0x1 wt 0x3)=
<br>
<span class=3D"">=C2=A0ipa $r0 a[0x80] $r0 0x0 0x1<br>
=C2=A0tex nodep $r0 $r0 0x0 0x0 t2d 0xf<br>
</span><span class=3D"">=C2=A0fmul ftz $r3 $r3 $r4<br>
</span><span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0x1) (st 0x1) (st 0x1)<br>
<span class=3D"">=C2=A0fmul ftz $r2 $r2 $r4<br>
=C2=A0fmul ftz $r1 $r1 $r4<br>
</span><span class=3D"">=C2=A0fmul ftz $r0 $r0 $r4<br>
</span><span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf) (st 0x0) (st 0x0)<br>
=C2=A0exit<br>
=C2=A0#endif<br>
</span>diff --git a/src/shader/exacmnv110.fpc b/src/shader/exacmnv110.fpc<b=
r>
index 0b21a0a..56e4e18 100644<br>
<div><div class=3D"h5">--- a/src/shader/exacmnv110.fpc<br>
+++ b/src/shader/exacmnv110.fpc<br>
@@ -1,36 +1,36 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A00xcff7ff00,<br>
=C2=A00xe003ff87,<br>
=C2=A00x00470000,<br>
=C2=A00x50800000,<br>
=C2=A00x4007ff03,<br>
=C2=A00xe043ff89,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1e0072f,<br>
+0x001cbc03,<br>
=C2=A00x0007ff02,<br>
=C2=A00xe043ff89,<br>
=C2=A00x2ff70204,<br>
=C2=A00xc03a0014,<br>
=C2=A00x4007ff01,<br>
=C2=A00xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe5e0172f,<br>
</div></div>+0x007f8402,<br>
=C2=A00x0007ff00,<br>
=C2=A00xe043ff88,<br>
=C2=A00xaff70000,<br>
=C2=A00xc03a0007,<br>
=C2=A00x00470303,<br>
=C2=A00x5c681000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc2007e1,<br>
+0x001f8400,<br>
=C2=A00x00470202,<br>
=C2=A00x5c681000,<br>
=C2=A00x00470101,<br>
=C2=A00x5c681000,<br>
=C2=A00x00470000,<br>
=C2=A00x5c681000,<br>
<span class=3D"">-0xfc0007e0,<br>
+0xfc0007ef,<br>
=C2=A00x001f8000,<br>
=C2=A00x0007000f,<br>
=C2=A00xe3000000,<br>
</span>diff --git a/src/shader/exas8nv110.fp b/src/shader/exas8nv110.fp<br>
index c5349d9..847cc6a 100644<br>
<span class=3D"">--- a/src/shader/exas8nv110.fp<br>
+++ b/src/shader/exas8nv110.fp<br>
@@ -25,15 +25,15 @@ NV110FP_Source_A8[] =3D {<br>
=C2=A0};<br>
=C2=A0#else<br>
<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0mufu rcp $r0 $r0<br>
=C2=A0ipa $r1 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0x1 wt 0x1)<br>
<span class=3D"">=C2=A0ipa $r0 a[0x80] $r0 0x0 0x1<br>
=C2=A0tex nodep $r0 $r0 0x0 0x0 t2d 0x8<br>
</span>=C2=A0mov $r3 $r0 0xf<br>
<span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0x1) (st 0x1) (st 0xf)<br>
<span class=3D"">=C2=A0mov $r2 $r0 0xf<br>
=C2=A0mov $r1 $r0 0xf<br>
</span>=C2=A0exit<br>
diff --git a/src/shader/exas8nv110.fpc b/src/shader/exas8nv110.fpc<br>
index fabf980..5671a12 100644<br>
<span class=3D"">--- a/src/shader/exas8nv110.fpc<br>
+++ b/src/shader/exas8nv110.fpc<br>
@@ -1,21 +1,21 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A00xcff7ff00,<br>
=C2=A00xe003ff87,<br>
=C2=A00x00470000,<br>
=C2=A00x50800000,<br>
=C2=A00x4007ff01,<br>
=C2=A00xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1e0072f,<br>
</span>+0x003f8403,<br>
=C2=A00x0007ff00,<br>
=C2=A00xe043ff88,<br>
=C2=A00x2ff70000,<br>
=C2=A00xc03a0004,<br>
=C2=A00x00070003,<br>
=C2=A00x5c980780,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc2007e1,<br>
+0x001fbc00,<br>
=C2=A00x00070002,<br>
=C2=A00x5c980780,<br>
=C2=A00x00070001,<br>
diff --git a/src/shader/exasanv110.fp b/src/shader/exasanv110.fp<br>
index 4392c1f..a3d372e 100644<br>
--- a/src/shader/exasanv110.fp<br>
+++ b/src/shader/exasanv110.fp<br>
@@ -25,22 +25,22 @@ NV110FP_CACompositeSrcAlpha[] =3D {<br>
<span class=3D"">=C2=A0};<br>
=C2=A0#else<br>
<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0mufu rcp $r0 $r0<br>
=C2=A0ipa $r3 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)<br>
=C2=A0ipa $r2 a[0x80] $r0 0x0 0x1<br>
=C2=A0tex nodep $r4 $r2 0x0 0x0 t2d 0x8<br>
=C2=A0ipa $r1 a[0x94] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0x1 wt 0x3)=
<br>
<span class=3D"">=C2=A0ipa $r0 a[0x90] $r0 0x0 0x1<br>
=C2=A0tex nodep $r0 $r0 0x0 0x1 t2d 0xf<br>
</span><span class=3D"">=C2=A0fmul ftz $r3 $r3 $r4<br>
</span><span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0x1) (st 0x1) (st 0x1)<br>
<span class=3D"">=C2=A0fmul ftz $r2 $r2 $r4<br>
=C2=A0fmul ftz $r1 $r1 $r4<br>
</span><span class=3D"">=C2=A0fmul ftz $r0 $r0 $r4<br>
</span><span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf) (st 0x0) (st 0x0)<br>
=C2=A0exit<br>
=C2=A0#endif<br>
</span>diff --git a/src/shader/exasanv110.fpc b/src/shader/exasanv110.fpc<b=
r>
index 80a2731..b61e396 100644<br>
<div><div class=3D"h5">--- a/src/shader/exasanv110.fpc<br>
+++ b/src/shader/exasanv110.fpc<br>
@@ -1,36 +1,36 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A00xcff7ff00,<br>
=C2=A00xe003ff87,<br>
=C2=A00x00470000,<br>
=C2=A00x50800000,<br>
=C2=A00x4007ff03,<br>
=C2=A00xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1e0072f,<br>
+0x001cbc03,<br>
=C2=A00x0007ff02,<br>
=C2=A00xe043ff88,<br>
=C2=A00x2ff70204,<br>
=C2=A00xc03a0004,<br>
=C2=A00x4007ff01,<br>
=C2=A00xe043ff89,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe5e0172f,<br>
</div></div>+0x007f8402,<br>
=C2=A00x0007ff00,<br>
=C2=A00xe043ff89,<br>
=C2=A00xaff70000,<br>
=C2=A00xc03a0017,<br>
=C2=A00x00470303,<br>
=C2=A00x5c681000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc2007e1,<br>
+0x001f8400,<br>
=C2=A00x00470202,<br>
=C2=A00x5c681000,<br>
=C2=A00x00470101,<br>
=C2=A00x5c681000,<br>
=C2=A00x00470000,<br>
=C2=A00x5c681000,<br>
<span class=3D"">-0xfc0007e0,<br>
+0xfc0007ef,<br>
=C2=A00x001f8000,<br>
=C2=A00x0007000f,<br>
=C2=A00xe3000000,<br>
</span>diff --git a/src/shader/exascnv110.fp b/src/shader/exascnv110.fp<br>
index 83a089a..91702d2 100644<br>
--- a/src/shader/exascnv110.fp<br>
+++ b/src/shader/exascnv110.fp<br>
@@ -25,11 +25,11 @@ NV110FP_Source[] =3D {<br>
<span class=3D"">=C2=A0};<br>
=C2=A0#else<br>
<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0mufu rcp $r0 $r0<br>
=C2=A0ipa $r1 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wt 0x3) (st 0xf)<br>
=C2=A0ipa $r0 a[0x80] $r0 0x0 0x1<br>
=C2=A0tex nodep $r0 $r0 0x0 0x0 t2d 0xf<br>
</span>=C2=A0exit<br>
diff --git a/src/shader/exascnv110.fpc b/src/shader/exascnv110.fpc<br>
index 3dd3f89..790a797 100644<br>
--- a/src/shader/exascnv110.fpc<br>
+++ b/src/shader/exascnv110.fpc<br>
@@ -1,13 +1,13 @@<br>
<span class=3D"">-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A00xcff7ff00,<br>
=C2=A00xe003ff87,<br>
=C2=A00x00470000,<br>
=C2=A00x50800000,<br>
=C2=A00x4007ff01,<br>
=C2=A00xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfde0072f,<br>
+0x001fbc03,<br>
=C2=A00x0007ff00,<br>
=C2=A00xe043ff88,<br>
=C2=A00xaff70000,<br>
</span>diff --git a/src/shader/videonv110.fp b/src/shader/videonv110.fp<br>
index b171e51..ce6769d 100644<br>
--- a/src/shader/videonv110.fp<br>
+++ b/src/shader/videonv110.fp<br>
@@ -25,27 +25,27 @@ NV110FP_NV12[] =3D {<br>
<span class=3D"">=C2=A0};<br>
=C2=A0#else<br>
<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0ipa pass $r2 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0mufu rcp $r2 $r2<br>
=C2=A0ipa $r0 a[0x80] $r2 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0ipa $r1 a[0x84] $r2 0x0 0x1<br>
=C2=A0tex nodep $r4 $r0 0x0 0x0 t2d 0x8<br>
=C2=A0tex nodep $r0 $r0 0x0 0x1 t2d 0xc<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0x6) (st 0x1) (st 0x6)<br>
<span class=3D"">=C2=A0fmul ftz $r5 $r4 c0[0x0]<br>
=C2=A0fadd ftz $r3 $r5 c0[0x4]<br>
</span><span class=3D"">=C2=A0fadd ftz $r4 $r5 c0[0x8]<br>
</span><span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0x6) (st 0x6 wt 0x1) (st 0x1)<br>
<span class=3D"">=C2=A0fadd ftz $r5 $r5 c0[0xc]<br>
</span><span class=3D"">=C2=A0ffma ftz $r3 $r0 c0[0x10] $r3<br>
=C2=A0ffma ftz $r4 $r0 c0[0x14] $r4<br>
</span><span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0x1) (st 0x1) (st 0x1)<br>
<span class=3D"">=C2=A0ffma ftz $r5 $r0 c0[0x18] $r5<br>
</span><span class=3D"">=C2=A0ffma ftz $r0 $r1 c0[0x1c] $r3<br>
=C2=A0ffma ftz $r2 $r1 c0[0x24] $r5<br>
</span><span class=3D"">-sched (st 0x0) (st 0x0) (st 0x0)<br>
</span>+sched (st 0x6) (st 0xf) (st 0x0)<br>
<span class=3D"">=C2=A0ffma ftz $r1 $r1 c0[0x20] $r4<br>
</span><span class=3D"">=C2=A0exit<br>
=C2=A0#endif<br>
diff --git a/src/shader/videonv110.fpc b/src/shader/videonv110.fpc<br>
</span>index 850163a..7560311 100644<br>
--- a/src/shader/videonv110.fpc<br>
+++ b/src/shader/videonv110.fpc<br>
@@ -1,44 +1,44 @@<br>
<span class=3D"">-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A00xcff7ff02,<br>
=C2=A00xe003ff87,<br>
=C2=A00x00470202,<br>
=C2=A00x50800000,<br>
=C2=A00x0027ff00,<br>
=C2=A00xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1e0072f,<br>
+0x003c3c03,<br>
=C2=A00x4027ff01,<br>
=C2=A00xe043ff88,<br>
=C2=A00x2ff70004,<br>
=C2=A00xc03a0004,<br>
=C2=A00x2ff70000,<br>
=C2=A00xc03a0016,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
</span>+0xfc2007e6,<br>
+0x001f9800,<br>
=C2=A00x00070405,<br>
=C2=A00x4c681000,<br>
=C2=A00x00170503,<br>
=C2=A00x4c581000,<br>
=C2=A00x00270504,<br>
=C2=A00x4c581000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfcc007e6,<br>
+0x001f8401,<br>
=C2=A00x00370505,<br>
=C2=A00x4c581000,<br>
=C2=A00x00470003,<br>
=C2=A00x49a00180,<br>
=C2=A00x00570004,<br>
=C2=A00x49a00200,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc2007e1,<br>
+0x001f8400,<br>
=C2=A00x00670005,<br>
=C2=A00x49a00280,<br>
=C2=A00x00770100,<br>
=C2=A00x49a00180,<br>
=C2=A00x00970102,<br>
=C2=A00x49a00280,<br>
-0xfc0007e0,<br>
+0xfde007e6,<br>
=C2=A00x001f8000,<br>
=C2=A00x00870101,<br>
=C2=A00x49a00200,<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c05e90e823d7005580c3805--

--===============1245831655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1245831655==--
