From: Aaryaman Vasishta <jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] nv110/exa: update sched codes
Date: Wed, 28 Jun 2017 18:05:16 +0900
Message-ID: <CABVHfRs238NmtjpM12gzaQFjUP3MGewD0iMTkA0GcYtgjzzKxA@mail.gmail.com>
References: <20170627151603.2090-1-jem456.vasishta@gmail.com>
 <CAKb7UvgcwqEE2C6hFoSHp8n21UO6Oa2T7WaavNtw9iTTx0m_yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1340206790=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgcwqEE2C6hFoSHp8n21UO6Oa2T7WaavNtw9iTTx0m_yw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1340206790==
Content-Type: multipart/alternative; boundary="001a11482c36c0ab610553017cf9"

--001a11482c36c0ab610553017cf9
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Jun 28, 2017 at 12:53 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> BTW, you can drop those explicit "depbar" ops. I think they're only
> needed when you're doing something weird with barriers. Blob doesn't
> use them (anymore)
>
Gotcha. Should I remove them in the same patch or a different one? It seems
like the depbar removal is different than what the commit message describes
here, so maybe it could do with a separate commit. I could be wrong,
though, as it's my first time contributing to nouveau.

Cheers,
Aaryaman

> On Tue, Jun 27, 2017 at 11:16 AM, Aaryaman Vasishta
> <jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > v4: Updated the wait dependancy bars based on tex component masks.
> >
> > This patch adds proper delays to maxwell exa shaders. Tested with
> > rendercheck -f a8r8g8b8.
> >
> > I am still wondering whether the rd's are required. We could
> > still wait on the write bars instead. eg. see
> > "sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)" in
> exacmnv110.fp
> >
> > Trello:
> > https://trello.com/c/6LPB2EIS/174-update-maxwell-shaders-wit
> h-proper-delays
> >
> > Signed-off-by: Aaryaman Vasishta <jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  src/shader/exac8nv110.fp  | 10 +++++-----
> >  src/shader/exac8nv110.fpc | 18 +++++++++---------
> >  src/shader/exacanv110.fp  | 10 +++++-----
> >  src/shader/exacanv110.fpc | 18 +++++++++---------
> >  src/shader/exacmnv110.fp  | 10 +++++-----
> >  src/shader/exacmnv110.fpc | 18 +++++++++---------
> >  src/shader/exas8nv110.fp  |  6 +++---
> >  src/shader/exas8nv110.fpc | 12 ++++++------
> >  src/shader/exasanv110.fp  | 10 +++++-----
> >  src/shader/exasanv110.fpc | 18 +++++++++---------
> >  src/shader/exascnv110.fp  |  6 +++---
> >  src/shader/exascnv110.fpc | 10 +++++-----
> >  src/shader/videonv110.fp  | 14 +++++++-------
> >  src/shader/videonv110.fpc | 26 +++++++++++++-------------
> >  14 files changed, 93 insertions(+), 93 deletions(-)
> >
> > diff --git a/src/shader/exac8nv110.fp b/src/shader/exac8nv110.fp
> > index ce78036..101b67f 100644
> > --- a/src/shader/exac8nv110.fp
> > +++ b/src/shader/exac8nv110.fp
> > @@ -25,23 +25,23 @@ NV110FP_Composite_A8[] = {
> >  };
> >  #else
> >
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
> >  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
> >  mufu rcp $r0 $r0
> >  ipa $r3 a[0x94] $r0 0x0 0x1
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x1) (st 0xf wr 0x0 rd 0x1 wt 0x3) (st 0xf wr 0x1 wt
> 0x2)
> >  ipa $r2 a[0x90] $r0 0x0 0x1
> >  tex nodep $r1 $r2 0x0 0x1 t2d 0x8
> >  ipa $r3 a[0x84] $r0 0x0 0x1
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x2) (st 0xf wr 0x1 wt 0x6) (st 0xf)
> >  ipa $r2 a[0x80] $r0 0x0 0x1
> >  tex nodep $r0 $r2 0x0 0x0 t2d 0x8
> >  depbar le 0x5 0x0 0x0
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x6 wt 0x3) (st 0x1) (st 0x1)
> >  fmul ftz $r3 $r0 $r1
> >  mov $r2 $r3 0xf
> >  mov $r1 $r3 0xf
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x1) (st 0xf) (st 0x0)
> >  mov $r0 $r3 0xf
> >  exit
> >  #endif
> > diff --git a/src/shader/exac8nv110.fpc b/src/shader/exac8nv110.fpc
> > index 4aa1368..1f7d649 100644
> > --- a/src/shader/exac8nv110.fpc
> > +++ b/src/shader/exac8nv110.fpc
> > @@ -1,36 +1,36 @@
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1a0070f,
> > +0x003c3c01,
> >  0xcff7ff00,
> >  0xe003ff87,
> >  0x00470000,
> >  0x50800000,
> >  0x4007ff03,
> >  0xe043ff89,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0x21e0072f,
> > +0x005cbc03,
> >  0x0007ff02,
> >  0xe043ff89,
> >  0x2ff70201,
> >  0xc03a0014,
> >  0x4007ff03,
> >  0xe043ff88,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe5e0074f,
> > +0x001fbc06,
> >  0x0007ff02,
> >  0xe043ff88,
> >  0x2ff70200,
> >  0xc03a0004,
> >  0x34070000,
> >  0xf0f00000,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xfc201fe6,
> > +0x001f8400,
> >  0x00170003,
> >  0x5c681000,
> >  0x00370002,
> >  0x5c980780,
> >  0x00370001,
> >  0x5c980780,
> > -0xfc0007e0,
> > +0xfde007e1,
> >  0x001f8000,
> >  0x00370000,
> >  0x5c980780,
> > diff --git a/src/shader/exacanv110.fp b/src/shader/exacanv110.fp
> > index a70d5c5..fe55fcd 100644
> > --- a/src/shader/exacanv110.fp
> > +++ b/src/shader/exacanv110.fp
> > @@ -25,23 +25,23 @@ NV110FP_CAComposite[] = {
> >  };
> >  #else
> >
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
> >  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
> >  mufu rcp $r0 $r0
> >  ipa $r3 a[0x94] $r0 0x0 0x1
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)
> >  ipa $r2 a[0x90] $r0 0x0 0x1
> >  tex nodep $r4 $r2 0x0 0x1 t2d 0xf
> >  ipa $r1 a[0x84] $r0 0x0 0x1
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)
> >  ipa $r0 a[0x80] $r0 0x0 0x1
> >  tex nodep $r0 $r0 0x0 0x0 t2d 0xf
> >  depbar le 0x5 0x0 0x0
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)
> >  fmul ftz $r3 $r3 $r7
> >  fmul ftz $r2 $r2 $r6
> >  fmul ftz $r1 $r1 $r5
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x1) (st 0xf) (st 0x0)
> >  fmul ftz $r0 $r0 $r4
> >  exit
> >  #endif
> > diff --git a/src/shader/exacanv110.fpc b/src/shader/exacanv110.fpc
> > index 7c0ca5e..7c8ebbd 100644
> > --- a/src/shader/exacanv110.fpc
> > +++ b/src/shader/exacanv110.fpc
> > @@ -1,36 +1,36 @@
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1a0070f,
> > +0x003c3c01,
> >  0xcff7ff00,
> >  0xe003ff87,
> >  0x00470000,
> >  0x50800000,
> >  0x4007ff03,
> >  0xe043ff89,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1e0072f,
> > +0x001cbc03,
> >  0x0007ff02,
> >  0xe043ff89,
> >  0xaff70204,
> >  0xc03a0017,
> >  0x4007ff01,
> >  0xe043ff88,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe5e0172f,
> > +0x001fbc02,
> >  0x0007ff00,
> >  0xe043ff88,
> >  0xaff70000,
> >  0xc03a0007,
> >  0x34070000,
> >  0xf0f00000,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xfc201fe1,
> > +0x001f8400,
> >  0x00770303,
> >  0x5c681000,
> >  0x00670202,
> >  0x5c681000,
> >  0x00570101,
> >  0x5c681000,
> > -0xfc0007e0,
> > +0xfde007e1,
> >  0x001f8000,
> >  0x00470000,
> >  0x5c681000,
> > diff --git a/src/shader/exacmnv110.fp b/src/shader/exacmnv110.fp
> > index fe5c294..7113ab3 100644
> > --- a/src/shader/exacmnv110.fp
> > +++ b/src/shader/exacmnv110.fp
> > @@ -25,23 +25,23 @@ NV110FP_Composite[] = {
> >  };
> >  #else
> >
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
> >  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
> >  mufu rcp $r0 $r0
> >  ipa $r3 a[0x94] $r0 0x0 0x1
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)
> >  ipa $r2 a[0x90] $r0 0x0 0x1
> >  tex nodep $r4 $r2 0x0 0x1 t2d 0x8
> >  ipa $r1 a[0x84] $r0 0x0 0x1
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)
> >  ipa $r0 a[0x80] $r0 0x0 0x1
> >  tex nodep $r0 $r0 0x0 0x0 t2d 0xf
> >  depbar le 0x5 0x0 0x0
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)
> >  fmul ftz $r3 $r3 $r4
> >  fmul ftz $r2 $r2 $r4
> >  fmul ftz $r1 $r1 $r4
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x1) (st 0xf) (st 0x0)
> >  fmul ftz $r0 $r0 $r4
> >  exit
> >  #endif
> > diff --git a/src/shader/exacmnv110.fpc b/src/shader/exacmnv110.fpc
> > index 9d62c1a..60352a8 100644
> > --- a/src/shader/exacmnv110.fpc
> > +++ b/src/shader/exacmnv110.fpc
> > @@ -1,36 +1,36 @@
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1a0070f,
> > +0x003c3c01,
> >  0xcff7ff00,
> >  0xe003ff87,
> >  0x00470000,
> >  0x50800000,
> >  0x4007ff03,
> >  0xe043ff89,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1e0072f,
> > +0x001cbc03,
> >  0x0007ff02,
> >  0xe043ff89,
> >  0x2ff70204,
> >  0xc03a0014,
> >  0x4007ff01,
> >  0xe043ff88,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe5e0172f,
> > +0x001fbc02,
> >  0x0007ff00,
> >  0xe043ff88,
> >  0xaff70000,
> >  0xc03a0007,
> >  0x34070000,
> >  0xf0f00000,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xfc201fe1,
> > +0x001f8400,
> >  0x00470303,
> >  0x5c681000,
> >  0x00470202,
> >  0x5c681000,
> >  0x00470101,
> >  0x5c681000,
> > -0xfc0007e0,
> > +0xfde007e1,
> >  0x001f8000,
> >  0x00470000,
> >  0x5c681000,
> > diff --git a/src/shader/exas8nv110.fp b/src/shader/exas8nv110.fp
> > index 4fe2e19..a555beb 100644
> > --- a/src/shader/exas8nv110.fp
> > +++ b/src/shader/exas8nv110.fp
> > @@ -25,15 +25,15 @@ NV110FP_Source_A8[] = {
> >  };
> >  #else
> >
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
> >  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
> >  mufu rcp $r0 $r0
> >  ipa $r1 a[0x84] $r0 0x0 0x1
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf)
> >  ipa $r0 a[0x80] $r0 0x0 0x1
> >  tex nodep $r0 $r0 0x0 0x0 t2d 0x8
> >  depbar le 0x5 0x0 0x0
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x1 wt 0x1) (st 0x1) (st 0x1)
> >  mov $r3 $r0 0xf
> >  mov $r2 $r0 0xf
> >  mov $r1 $r0 0xf
> > diff --git a/src/shader/exas8nv110.fpc b/src/shader/exas8nv110.fpc
> > index 1181c41..e58d168 100644
> > --- a/src/shader/exas8nv110.fpc
> > +++ b/src/shader/exas8nv110.fpc
> > @@ -1,21 +1,21 @@
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1a0070f,
> > +0x003c3c01,
> >  0xcff7ff00,
> >  0xe003ff87,
> >  0x00470000,
> >  0x50800000,
> >  0x4007ff01,
> >  0xe043ff88,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1e0072f,
> > +0x001fbc03,
> >  0x0007ff00,
> >  0xe043ff88,
> >  0x2ff70000,
> >  0xc03a0004,
> >  0x34070000,
> >  0xf0f00000,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xfc200fe1,
> > +0x001f8400,
> >  0x00070003,
> >  0x5c980780,
> >  0x00070002,
> > diff --git a/src/shader/exasanv110.fp b/src/shader/exasanv110.fp
> > index 61374a6..ee818cd 100644
> > --- a/src/shader/exasanv110.fp
> > +++ b/src/shader/exasanv110.fp
> > @@ -25,23 +25,23 @@ NV110FP_CACompositeSrcAlpha[] = {
> >  };
> >  #else
> >
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
> >  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
> >  mufu rcp $r0 $r0
> >  ipa $r3 a[0x84] $r0 0x0 0x1
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)
> >  ipa $r2 a[0x80] $r0 0x0 0x1
> >  tex nodep $r4 $r2 0x0 0x0 t2d 0x8
> >  ipa $r1 a[0x94] $r0 0x0 0x1
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)
> >  ipa $r0 a[0x90] $r0 0x0 0x1
> >  tex nodep $r0 $r0 0x0 0x1 t2d 0xf
> >  depbar le 0x5 0x0 0x0
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)
> >  fmul ftz $r3 $r3 $r4
> >  fmul ftz $r2 $r2 $r4
> >  fmul ftz $r1 $r1 $r4
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x1) (st 0xf) (st 0x0)
> >  fmul ftz $r0 $r0 $r4
> >  exit
> >  #endif
> > diff --git a/src/shader/exasanv110.fpc b/src/shader/exasanv110.fpc
> > index 5516a03..604bf9a 100644
> > --- a/src/shader/exasanv110.fpc
> > +++ b/src/shader/exasanv110.fpc
> > @@ -1,36 +1,36 @@
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1a0070f,
> > +0x003c3c01,
> >  0xcff7ff00,
> >  0xe003ff87,
> >  0x00470000,
> >  0x50800000,
> >  0x4007ff03,
> >  0xe043ff88,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1e0072f,
> > +0x001cbc03,
> >  0x0007ff02,
> >  0xe043ff88,
> >  0x2ff70204,
> >  0xc03a0004,
> >  0x4007ff01,
> >  0xe043ff89,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe5e0172f,
> > +0x001fbc02,
> >  0x0007ff00,
> >  0xe043ff89,
> >  0xaff70000,
> >  0xc03a0017,
> >  0x34070000,
> >  0xf0f00000,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xfc201fe1,
> > +0x001f8400,
> >  0x00470303,
> >  0x5c681000,
> >  0x00470202,
> >  0x5c681000,
> >  0x00470101,
> >  0x5c681000,
> > -0xfc0007e0,
> > +0xfde007e1,
> >  0x001f8000,
> >  0x00470000,
> >  0x5c681000,
> > diff --git a/src/shader/exascnv110.fp b/src/shader/exascnv110.fp
> > index 90bbb55..86e14e8 100644
> > --- a/src/shader/exascnv110.fp
> > +++ b/src/shader/exascnv110.fp
> > @@ -25,14 +25,14 @@ NV110FP_Source[] = {
> >  };
> >  #else
> >
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
> >  ipa pass $r0 a[0x7c] 0x0 0x0 0x1
> >  mufu rcp $r0 $r0
> >  ipa $r1 a[0x84] $r0 0x0 0x1
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x1) (st 0xf wt 0x3) (st 0xf)
> >  ipa $r0 a[0x80] $r0 0x0 0x1
> >  tex nodep $r0 $r0 0x0 0x0 t2d 0xf
> >  depbar le 0x5 0x0 0x0
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf) (st 0x0) (st 0x0)
> >  exit
> >  #endif
> > diff --git a/src/shader/exascnv110.fpc b/src/shader/exascnv110.fpc
> > index 2dba15d..1fef5d2 100644
> > --- a/src/shader/exascnv110.fpc
> > +++ b/src/shader/exascnv110.fpc
> > @@ -1,20 +1,20 @@
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1a0070f,
> > +0x003c3c01,
> >  0xcff7ff00,
> >  0xe003ff87,
> >  0x00470000,
> >  0x50800000,
> >  0x4007ff01,
> >  0xe043ff88,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xfde0072f,
> > +0x001fbc03,
> >  0x0007ff00,
> >  0xe043ff88,
> >  0xaff70000,
> >  0xc03a0007,
> >  0x34070000,
> >  0xf0f00000,
> > -0xfc0007e0,
> > +0xfc0007ef,
> >  0x001f8000,
> >  0x0007000f,
> >  0xe3000000,
> > diff --git a/src/shader/videonv110.fp b/src/shader/videonv110.fp
> > index 2728311..773aad5 100644
> > --- a/src/shader/videonv110.fp
> > +++ b/src/shader/videonv110.fp
> > @@ -25,30 +25,30 @@ NV110FP_NV12[] = {
> >  };
> >  #else
> >
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
> >  ipa pass $r2 a[0x7c] 0x0 0x0 0x1
> >  mufu rcp $r2 $r2
> >  ipa $r0 a[0x80] $r2 0x0 0x1
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x0 wt 0x1)
> >  ipa $r1 a[0x84] $r2 0x0 0x1
> >  tex nodep $r4 $r0 0x0 0x0 t2d 0x8
> >  tex nodep $r0 $r0 0x0 0x1 t2d 0xc
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf) (st 0x6) (st 0x1)
> >  depbar le 0x5 0x1 0x1
> >  fmul ftz $r5 $r4 c0[0x0]
> >  fadd ftz $r3 $r5 c0[0x4]
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x6) (st 0x6) (st 0xf)
> >  fadd ftz $r4 $r5 c0[0x8]
> >  fadd ftz $r5 $r5 c0[0xc]
> >  depbar le 0x5 0x0 0x0
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x6 wt 0x1) (st 0x1) (st 0x1)
> >  ffma ftz $r3 $r0 c0[0x10] $r3
> >  ffma ftz $r4 $r0 c0[0x14] $r4
> >  ffma ftz $r5 $r0 c0[0x18] $r5
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0x1) (st 0x1) (st 0x6)
> >  ffma ftz $r0 $r1 c0[0x1c] $r3
> >  ffma ftz $r2 $r1 c0[0x24] $r5
> >  ffma ftz $r1 $r1 c0[0x20] $r4
> > -sched (st 0x0) (st 0x0) (st 0x0)
> > +sched (st 0xf) (st 0x0) (st 0x0)
> >  exit
> >  #endif
> > diff --git a/src/shader/videonv110.fpc b/src/shader/videonv110.fpc
> > index 31d745a..8e7bedf 100644
> > --- a/src/shader/videonv110.fpc
> > +++ b/src/shader/videonv110.fpc
> > @@ -1,52 +1,52 @@
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1a0070f,
> > +0x003c3c01,
> >  0xcff7ff02,
> >  0xe003ff87,
> >  0x00470202,
> >  0x50800000,
> >  0x0027ff00,
> >  0xe043ff88,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xe1e0072f,
> > +0x003c3c03,
> >  0x4027ff01,
> >  0xe043ff88,
> >  0x2ff70004,
> >  0xc03a0004,
> >  0x2ff70000,
> >  0xc03a0016,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xfcc007ef,
> > +0x001f8400,
> >  0x34170001,
> >  0xf0f00000,
> >  0x00070405,
> >  0x4c681000,
> >  0x00170503,
> >  0x4c581000,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xfcc007e6,
> > +0x001fbc00,
> >  0x00270504,
> >  0x4c581000,
> >  0x00370505,
> >  0x4c581000,
> >  0x34070000,
> >  0xf0f00000,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xfc200fe6,
> > +0x001f8400,
> >  0x00470003,
> >  0x49a00180,
> >  0x00570004,
> >  0x49a00200,
> >  0x00670005,
> >  0x49a00280,
> > -0xfc0007e0,
> > -0x001f8000,
> > +0xfc2007e1,
> > +0x001f9800,
> >  0x00770100,
> >  0x49a00180,
> >  0x00970102,
> >  0x49a00280,
> >  0x00870101,
> >  0x49a00200,
> > -0xfc0007e0,
> > +0xfc0007ef,
> >  0x001f8000,
> >  0x0007000f,
> >  0xe3000000,
> > --
> > 2.11.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a11482c36c0ab610553017cf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra">Hi,</div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Wed, Jun 28, 2017 at 12:53 PM, I=
lia Mirkin <span dir=3D"ltr">&lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" ta=
rget=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">BTW, you can drop those explicit &quot;depbar&quot; ops. =
I think they&#39;re only<br>
needed when you&#39;re doing something weird with barriers. Blob doesn&#39;=
t<br>
use them (anymore)<br></blockquote><div>Gotcha. Should I remove them in the=
 same patch or a different one? It seems like the depbar removal is differe=
nt than what the commit message describes here, so maybe it could do with a=
 separate commit. I could be wrong, though, as it&#39;s my first time contr=
ibuting to nouveau.</div><div><br></div><div>Cheers,</div><div>Aaryaman</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div><div class=3D"m_2866378526680505499h5=
">
On Tue, Jun 27, 2017 at 11:16 AM, Aaryaman Vasishta<br>
&lt;<a href=3D"mailto:jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">jem456.v=
asishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt; v4: Updated the wait dependancy bars based on tex component masks.<br>
&gt;<br>
&gt; This patch adds proper delays to maxwell exa shaders. Tested with<br>
&gt; rendercheck -f a8r8g8b8.<br>
&gt;<br>
&gt; I am still wondering whether the rd&#39;s are required. We could<br>
&gt; still wait on the write bars instead. eg. see<br>
&gt; &quot;sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)&quo=
t; in exacmnv110.fp<br>
&gt;<br>
&gt; Trello:<br>
&gt; <a href=3D"https://trello.com/c/6LPB2EIS/174-update-maxwell-shaders-wi=
th-proper-delays" rel=3D"noreferrer" target=3D"_blank">https://trello.com/c=
/6LPB2EIS/<wbr>174-update-maxwell-shaders-wit<wbr>h-proper-delays</a><br>
&gt;<br>
&gt; Signed-off-by: Aaryaman Vasishta &lt;<a href=3D"mailto:jem456.vasishta=
@gmail.com" target=3D"_blank">jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 src/shader/exac8nv110.fp=C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 src/shader/exac8nv110.fpc | 18 +++++++++---------<br>
&gt;=C2=A0 src/shader/exacanv110.fp=C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 src/shader/exacanv110.fpc | 18 +++++++++---------<br>
&gt;=C2=A0 src/shader/exacmnv110.fp=C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 src/shader/exacmnv110.fpc | 18 +++++++++---------<br>
&gt;=C2=A0 src/shader/exas8nv110.fp=C2=A0 |=C2=A0 6 +++---<br>
&gt;=C2=A0 src/shader/exas8nv110.fpc | 12 ++++++------<br>
&gt;=C2=A0 src/shader/exasanv110.fp=C2=A0 | 10 +++++-----<br>
&gt;=C2=A0 src/shader/exasanv110.fpc | 18 +++++++++---------<br>
&gt;=C2=A0 src/shader/exascnv110.fp=C2=A0 |=C2=A0 6 +++---<br>
&gt;=C2=A0 src/shader/exascnv110.fpc | 10 +++++-----<br>
&gt;=C2=A0 src/shader/videonv110.fp=C2=A0 | 14 +++++++-------<br>
&gt;=C2=A0 src/shader/videonv110.fpc | 26 +++++++++++++-------------<br>
&gt;=C2=A0 14 files changed, 93 insertions(+), 93 deletions(-)<br>
&gt;<br>
&gt; diff --git a/src/shader/exac8nv110.fp b/src/shader/exac8nv110.fp<br>
&gt; index ce78036..101b67f 100644<br>
&gt; --- a/src/shader/exac8nv110.fp<br>
&gt; +++ b/src/shader/exac8nv110.fp<br>
&gt; @@ -25,23 +25,23 @@ NV110FP_Composite_A8[] =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 #else<br>
&gt;<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<b=
r>
&gt;=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
&gt;=C2=A0 mufu rcp $r0 $r0<br>
&gt;=C2=A0 ipa $r3 a[0x94] $r0 0x0 0x1<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x1) (st 0xf wr 0x0 rd 0x1 wt 0x3) (st 0xf wr 0x1 wt=
 0x2)<br>
&gt;=C2=A0 ipa $r2 a[0x90] $r0 0x0 0x1<br>
&gt;=C2=A0 tex nodep $r1 $r2 0x0 0x1 t2d 0x8<br>
&gt;=C2=A0 ipa $r3 a[0x84] $r0 0x0 0x1<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x2) (st 0xf wr 0x1 wt 0x6) (st 0xf)<br>
&gt;=C2=A0 ipa $r2 a[0x80] $r0 0x0 0x1<br>
&gt;=C2=A0 tex nodep $r0 $r2 0x0 0x0 t2d 0x8<br>
&gt;=C2=A0 depbar le 0x5 0x0 0x0<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x6 wt 0x3) (st 0x1) (st 0x1)<br>
&gt;=C2=A0 fmul ftz $r3 $r0 $r1<br>
&gt;=C2=A0 mov $r2 $r3 0xf<br>
&gt;=C2=A0 mov $r1 $r3 0xf<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x1) (st 0xf) (st 0x0)<br>
&gt;=C2=A0 mov $r0 $r3 0xf<br>
&gt;=C2=A0 exit<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/src/shader/exac8nv110.fpc b/src/shader/exac8nv110.fpc<br>
&gt; index 4aa1368..1f7d649 100644<br>
&gt; --- a/src/shader/exac8nv110.fpc<br>
&gt; +++ b/src/shader/exac8nv110.fpc<br>
&gt; @@ -1,36 +1,36 @@<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1a0070f,<br>
&gt; +0x003c3c01,<br>
&gt;=C2=A0 0xcff7ff00,<br>
&gt;=C2=A0 0xe003ff87,<br>
&gt;=C2=A0 0x00470000,<br>
&gt;=C2=A0 0x50800000,<br>
&gt;=C2=A0 0x4007ff03,<br>
&gt;=C2=A0 0xe043ff89,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0x21e0072f,<br>
&gt; +0x005cbc03,<br>
&gt;=C2=A0 0x0007ff02,<br>
&gt;=C2=A0 0xe043ff89,<br>
&gt;=C2=A0 0x2ff70201,<br>
&gt;=C2=A0 0xc03a0014,<br>
&gt;=C2=A0 0x4007ff03,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe5e0074f,<br>
&gt; +0x001fbc06,<br>
&gt;=C2=A0 0x0007ff02,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt;=C2=A0 0x2ff70200,<br>
&gt;=C2=A0 0xc03a0004,<br>
&gt;=C2=A0 0x34070000,<br>
&gt;=C2=A0 0xf0f00000,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xfc201fe6,<br>
&gt; +0x001f8400,<br>
&gt;=C2=A0 0x00170003,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt;=C2=A0 0x00370002,<br>
&gt;=C2=A0 0x5c980780,<br>
&gt;=C2=A0 0x00370001,<br>
&gt;=C2=A0 0x5c980780,<br>
&gt; -0xfc0007e0,<br>
&gt; +0xfde007e1,<br>
&gt;=C2=A0 0x001f8000,<br>
&gt;=C2=A0 0x00370000,<br>
&gt;=C2=A0 0x5c980780,<br>
&gt; diff --git a/src/shader/exacanv110.fp b/src/shader/exacanv110.fp<br>
&gt; index a70d5c5..fe55fcd 100644<br>
&gt; --- a/src/shader/exacanv110.fp<br>
&gt; +++ b/src/shader/exacanv110.fp<br>
&gt; @@ -25,23 +25,23 @@ NV110FP_CAComposite[] =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 #else<br>
&gt;<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<b=
r>
&gt;=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
&gt;=C2=A0 mufu rcp $r0 $r0<br>
&gt;=C2=A0 ipa $r3 a[0x94] $r0 0x0 0x1<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)<br>
&gt;=C2=A0 ipa $r2 a[0x90] $r0 0x0 0x1<br>
&gt;=C2=A0 tex nodep $r4 $r2 0x0 0x1 t2d 0xf<br>
&gt;=C2=A0 ipa $r1 a[0x84] $r0 0x0 0x1<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)<br>
&gt;=C2=A0 ipa $r0 a[0x80] $r0 0x0 0x1<br>
&gt;=C2=A0 tex nodep $r0 $r0 0x0 0x0 t2d 0xf<br>
&gt;=C2=A0 depbar le 0x5 0x0 0x0<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)<br>
&gt;=C2=A0 fmul ftz $r3 $r3 $r7<br>
&gt;=C2=A0 fmul ftz $r2 $r2 $r6<br>
&gt;=C2=A0 fmul ftz $r1 $r1 $r5<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x1) (st 0xf) (st 0x0)<br>
&gt;=C2=A0 fmul ftz $r0 $r0 $r4<br>
&gt;=C2=A0 exit<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/src/shader/exacanv110.fpc b/src/shader/exacanv110.fpc<br>
&gt; index 7c0ca5e..7c8ebbd 100644<br>
&gt; --- a/src/shader/exacanv110.fpc<br>
&gt; +++ b/src/shader/exacanv110.fpc<br>
&gt; @@ -1,36 +1,36 @@<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1a0070f,<br>
&gt; +0x003c3c01,<br>
&gt;=C2=A0 0xcff7ff00,<br>
&gt;=C2=A0 0xe003ff87,<br>
&gt;=C2=A0 0x00470000,<br>
&gt;=C2=A0 0x50800000,<br>
&gt;=C2=A0 0x4007ff03,<br>
&gt;=C2=A0 0xe043ff89,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1e0072f,<br>
&gt; +0x001cbc03,<br>
&gt;=C2=A0 0x0007ff02,<br>
&gt;=C2=A0 0xe043ff89,<br>
&gt;=C2=A0 0xaff70204,<br>
&gt;=C2=A0 0xc03a0017,<br>
&gt;=C2=A0 0x4007ff01,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe5e0172f,<br>
&gt; +0x001fbc02,<br>
&gt;=C2=A0 0x0007ff00,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt;=C2=A0 0xaff70000,<br>
&gt;=C2=A0 0xc03a0007,<br>
&gt;=C2=A0 0x34070000,<br>
&gt;=C2=A0 0xf0f00000,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xfc201fe1,<br>
&gt; +0x001f8400,<br>
&gt;=C2=A0 0x00770303,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt;=C2=A0 0x00670202,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt;=C2=A0 0x00570101,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt; -0xfc0007e0,<br>
&gt; +0xfde007e1,<br>
&gt;=C2=A0 0x001f8000,<br>
&gt;=C2=A0 0x00470000,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt; diff --git a/src/shader/exacmnv110.fp b/src/shader/exacmnv110.fp<br>
&gt; index fe5c294..7113ab3 100644<br>
&gt; --- a/src/shader/exacmnv110.fp<br>
&gt; +++ b/src/shader/exacmnv110.fp<br>
&gt; @@ -25,23 +25,23 @@ NV110FP_Composite[] =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 #else<br>
&gt;<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<b=
r>
&gt;=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
&gt;=C2=A0 mufu rcp $r0 $r0<br>
&gt;=C2=A0 ipa $r3 a[0x94] $r0 0x0 0x1<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)<br>
&gt;=C2=A0 ipa $r2 a[0x90] $r0 0x0 0x1<br>
&gt;=C2=A0 tex nodep $r4 $r2 0x0 0x1 t2d 0x8<br>
&gt;=C2=A0 ipa $r1 a[0x84] $r0 0x0 0x1<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)<br>
&gt;=C2=A0 ipa $r0 a[0x80] $r0 0x0 0x1<br>
&gt;=C2=A0 tex nodep $r0 $r0 0x0 0x0 t2d 0xf<br>
&gt;=C2=A0 depbar le 0x5 0x0 0x0<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)<br>
&gt;=C2=A0 fmul ftz $r3 $r3 $r4<br>
&gt;=C2=A0 fmul ftz $r2 $r2 $r4<br>
&gt;=C2=A0 fmul ftz $r1 $r1 $r4<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x1) (st 0xf) (st 0x0)<br>
&gt;=C2=A0 fmul ftz $r0 $r0 $r4<br>
&gt;=C2=A0 exit<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/src/shader/exacmnv110.fpc b/src/shader/exacmnv110.fpc<br>
&gt; index 9d62c1a..60352a8 100644<br>
&gt; --- a/src/shader/exacmnv110.fpc<br>
&gt; +++ b/src/shader/exacmnv110.fpc<br>
&gt; @@ -1,36 +1,36 @@<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1a0070f,<br>
&gt; +0x003c3c01,<br>
&gt;=C2=A0 0xcff7ff00,<br>
&gt;=C2=A0 0xe003ff87,<br>
&gt;=C2=A0 0x00470000,<br>
&gt;=C2=A0 0x50800000,<br>
&gt;=C2=A0 0x4007ff03,<br>
&gt;=C2=A0 0xe043ff89,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1e0072f,<br>
&gt; +0x001cbc03,<br>
&gt;=C2=A0 0x0007ff02,<br>
&gt;=C2=A0 0xe043ff89,<br>
&gt;=C2=A0 0x2ff70204,<br>
&gt;=C2=A0 0xc03a0014,<br>
&gt;=C2=A0 0x4007ff01,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe5e0172f,<br>
&gt; +0x001fbc02,<br>
&gt;=C2=A0 0x0007ff00,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt;=C2=A0 0xaff70000,<br>
&gt;=C2=A0 0xc03a0007,<br>
&gt;=C2=A0 0x34070000,<br>
&gt;=C2=A0 0xf0f00000,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xfc201fe1,<br>
&gt; +0x001f8400,<br>
&gt;=C2=A0 0x00470303,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt;=C2=A0 0x00470202,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt;=C2=A0 0x00470101,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt; -0xfc0007e0,<br>
&gt; +0xfde007e1,<br>
&gt;=C2=A0 0x001f8000,<br>
&gt;=C2=A0 0x00470000,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt; diff --git a/src/shader/exas8nv110.fp b/src/shader/exas8nv110.fp<br>
&gt; index 4fe2e19..a555beb 100644<br>
&gt; --- a/src/shader/exas8nv110.fp<br>
&gt; +++ b/src/shader/exas8nv110.fp<br>
&gt; @@ -25,15 +25,15 @@ NV110FP_Source_A8[] =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 #else<br>
&gt;<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<b=
r>
&gt;=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
&gt;=C2=A0 mufu rcp $r0 $r0<br>
&gt;=C2=A0 ipa $r1 a[0x84] $r0 0x0 0x1<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf)<br>
&gt;=C2=A0 ipa $r0 a[0x80] $r0 0x0 0x1<br>
&gt;=C2=A0 tex nodep $r0 $r0 0x0 0x0 t2d 0x8<br>
&gt;=C2=A0 depbar le 0x5 0x0 0x0<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x1 wt 0x1) (st 0x1) (st 0x1)<br>
&gt;=C2=A0 mov $r3 $r0 0xf<br>
&gt;=C2=A0 mov $r2 $r0 0xf<br>
&gt;=C2=A0 mov $r1 $r0 0xf<br>
&gt; diff --git a/src/shader/exas8nv110.fpc b/src/shader/exas8nv110.fpc<br>
&gt; index 1181c41..e58d168 100644<br>
&gt; --- a/src/shader/exas8nv110.fpc<br>
&gt; +++ b/src/shader/exas8nv110.fpc<br>
&gt; @@ -1,21 +1,21 @@<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1a0070f,<br>
&gt; +0x003c3c01,<br>
&gt;=C2=A0 0xcff7ff00,<br>
&gt;=C2=A0 0xe003ff87,<br>
&gt;=C2=A0 0x00470000,<br>
&gt;=C2=A0 0x50800000,<br>
&gt;=C2=A0 0x4007ff01,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1e0072f,<br>
&gt; +0x001fbc03,<br>
&gt;=C2=A0 0x0007ff00,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt;=C2=A0 0x2ff70000,<br>
&gt;=C2=A0 0xc03a0004,<br>
&gt;=C2=A0 0x34070000,<br>
&gt;=C2=A0 0xf0f00000,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xfc200fe1,<br>
&gt; +0x001f8400,<br>
&gt;=C2=A0 0x00070003,<br>
&gt;=C2=A0 0x5c980780,<br>
&gt;=C2=A0 0x00070002,<br>
&gt; diff --git a/src/shader/exasanv110.fp b/src/shader/exasanv110.fp<br>
&gt; index 61374a6..ee818cd 100644<br>
&gt; --- a/src/shader/exasanv110.fp<br>
&gt; +++ b/src/shader/exasanv110.fp<br>
&gt; @@ -25,23 +25,23 @@ NV110FP_CACompositeSrcAlpha[] =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 #else<br>
&gt;<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<b=
r>
&gt;=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
&gt;=C2=A0 mufu rcp $r0 $r0<br>
&gt;=C2=A0 ipa $r3 a[0x84] $r0 0x0 0x1<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)<br>
&gt;=C2=A0 ipa $r2 a[0x80] $r0 0x0 0x1<br>
&gt;=C2=A0 tex nodep $r4 $r2 0x0 0x0 t2d 0x8<br>
&gt;=C2=A0 ipa $r1 a[0x94] $r0 0x0 0x1<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)<br>
&gt;=C2=A0 ipa $r0 a[0x90] $r0 0x0 0x1<br>
&gt;=C2=A0 tex nodep $r0 $r0 0x0 0x1 t2d 0xf<br>
&gt;=C2=A0 depbar le 0x5 0x0 0x0<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)<br>
&gt;=C2=A0 fmul ftz $r3 $r3 $r4<br>
&gt;=C2=A0 fmul ftz $r2 $r2 $r4<br>
&gt;=C2=A0 fmul ftz $r1 $r1 $r4<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x1) (st 0xf) (st 0x0)<br>
&gt;=C2=A0 fmul ftz $r0 $r0 $r4<br>
&gt;=C2=A0 exit<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/src/shader/exasanv110.fpc b/src/shader/exasanv110.fpc<br>
&gt; index 5516a03..604bf9a 100644<br>
&gt; --- a/src/shader/exasanv110.fpc<br>
&gt; +++ b/src/shader/exasanv110.fpc<br>
&gt; @@ -1,36 +1,36 @@<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1a0070f,<br>
&gt; +0x003c3c01,<br>
&gt;=C2=A0 0xcff7ff00,<br>
&gt;=C2=A0 0xe003ff87,<br>
&gt;=C2=A0 0x00470000,<br>
&gt;=C2=A0 0x50800000,<br>
&gt;=C2=A0 0x4007ff03,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1e0072f,<br>
&gt; +0x001cbc03,<br>
&gt;=C2=A0 0x0007ff02,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt;=C2=A0 0x2ff70204,<br>
&gt;=C2=A0 0xc03a0004,<br>
&gt;=C2=A0 0x4007ff01,<br>
&gt;=C2=A0 0xe043ff89,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe5e0172f,<br>
&gt; +0x001fbc02,<br>
&gt;=C2=A0 0x0007ff00,<br>
&gt;=C2=A0 0xe043ff89,<br>
&gt;=C2=A0 0xaff70000,<br>
&gt;=C2=A0 0xc03a0017,<br>
&gt;=C2=A0 0x34070000,<br>
&gt;=C2=A0 0xf0f00000,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xfc201fe1,<br>
&gt; +0x001f8400,<br>
&gt;=C2=A0 0x00470303,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt;=C2=A0 0x00470202,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt;=C2=A0 0x00470101,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt; -0xfc0007e0,<br>
&gt; +0xfde007e1,<br>
&gt;=C2=A0 0x001f8000,<br>
&gt;=C2=A0 0x00470000,<br>
&gt;=C2=A0 0x5c681000,<br>
&gt; diff --git a/src/shader/exascnv110.fp b/src/shader/exascnv110.fp<br>
&gt; index 90bbb55..86e14e8 100644<br>
&gt; --- a/src/shader/exascnv110.fp<br>
&gt; +++ b/src/shader/exascnv110.fp<br>
&gt; @@ -25,14 +25,14 @@ NV110FP_Source[] =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 #else<br>
&gt;<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<b=
r>
&gt;=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
&gt;=C2=A0 mufu rcp $r0 $r0<br>
&gt;=C2=A0 ipa $r1 a[0x84] $r0 0x0 0x1<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x1) (st 0xf wt 0x3) (st 0xf)<br>
&gt;=C2=A0 ipa $r0 a[0x80] $r0 0x0 0x1<br>
&gt;=C2=A0 tex nodep $r0 $r0 0x0 0x0 t2d 0xf<br>
&gt;=C2=A0 depbar le 0x5 0x0 0x0<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf) (st 0x0) (st 0x0)<br>
&gt;=C2=A0 exit<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/src/shader/exascnv110.fpc b/src/shader/exascnv110.fpc<br>
&gt; index 2dba15d..1fef5d2 100644<br>
&gt; --- a/src/shader/exascnv110.fpc<br>
&gt; +++ b/src/shader/exascnv110.fpc<br>
&gt; @@ -1,20 +1,20 @@<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1a0070f,<br>
&gt; +0x003c3c01,<br>
&gt;=C2=A0 0xcff7ff00,<br>
&gt;=C2=A0 0xe003ff87,<br>
&gt;=C2=A0 0x00470000,<br>
&gt;=C2=A0 0x50800000,<br>
&gt;=C2=A0 0x4007ff01,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xfde0072f,<br>
&gt; +0x001fbc03,<br>
&gt;=C2=A0 0x0007ff00,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt;=C2=A0 0xaff70000,<br>
&gt;=C2=A0 0xc03a0007,<br>
&gt;=C2=A0 0x34070000,<br>
&gt;=C2=A0 0xf0f00000,<br>
&gt; -0xfc0007e0,<br>
&gt; +0xfc0007ef,<br>
&gt;=C2=A0 0x001f8000,<br>
&gt;=C2=A0 0x0007000f,<br>
&gt;=C2=A0 0xe3000000,<br>
&gt; diff --git a/src/shader/videonv110.fp b/src/shader/videonv110.fp<br>
&gt; index 2728311..773aad5 100644<br>
&gt; --- a/src/shader/videonv110.fp<br>
&gt; +++ b/src/shader/videonv110.fp<br>
&gt; @@ -25,30 +25,30 @@ NV110FP_NV12[] =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 #else<br>
&gt;<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<b=
r>
&gt;=C2=A0 ipa pass $r2 a[0x7c] 0x0 0x0 0x1<br>
&gt;=C2=A0 mufu rcp $r2 $r2<br>
&gt;=C2=A0 ipa $r0 a[0x80] $r2 0x0 0x1<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x0 wt 0x1)<b=
r>
&gt;=C2=A0 ipa $r1 a[0x84] $r2 0x0 0x1<br>
&gt;=C2=A0 tex nodep $r4 $r0 0x0 0x0 t2d 0x8<br>
&gt;=C2=A0 tex nodep $r0 $r0 0x0 0x1 t2d 0xc<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf) (st 0x6) (st 0x1)<br>
&gt;=C2=A0 depbar le 0x5 0x1 0x1<br>
&gt;=C2=A0 fmul ftz $r5 $r4 c0[0x0]<br>
&gt;=C2=A0 fadd ftz $r3 $r5 c0[0x4]<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x6) (st 0x6) (st 0xf)<br>
&gt;=C2=A0 fadd ftz $r4 $r5 c0[0x8]<br>
&gt;=C2=A0 fadd ftz $r5 $r5 c0[0xc]<br>
&gt;=C2=A0 depbar le 0x5 0x0 0x0<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x6 wt 0x1) (st 0x1) (st 0x1)<br>
&gt;=C2=A0 ffma ftz $r3 $r0 c0[0x10] $r3<br>
&gt;=C2=A0 ffma ftz $r4 $r0 c0[0x14] $r4<br>
&gt;=C2=A0 ffma ftz $r5 $r0 c0[0x18] $r5<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0x1) (st 0x1) (st 0x6)<br>
&gt;=C2=A0 ffma ftz $r0 $r1 c0[0x1c] $r3<br>
&gt;=C2=A0 ffma ftz $r2 $r1 c0[0x24] $r5<br>
&gt;=C2=A0 ffma ftz $r1 $r1 c0[0x20] $r4<br>
&gt; -sched (st 0x0) (st 0x0) (st 0x0)<br>
&gt; +sched (st 0xf) (st 0x0) (st 0x0)<br>
&gt;=C2=A0 exit<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/src/shader/videonv110.fpc b/src/shader/videonv110.fpc<br>
&gt; index 31d745a..8e7bedf 100644<br>
&gt; --- a/src/shader/videonv110.fpc<br>
&gt; +++ b/src/shader/videonv110.fpc<br>
&gt; @@ -1,52 +1,52 @@<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1a0070f,<br>
&gt; +0x003c3c01,<br>
&gt;=C2=A0 0xcff7ff02,<br>
&gt;=C2=A0 0xe003ff87,<br>
&gt;=C2=A0 0x00470202,<br>
&gt;=C2=A0 0x50800000,<br>
&gt;=C2=A0 0x0027ff00,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xe1e0072f,<br>
&gt; +0x003c3c03,<br>
&gt;=C2=A0 0x4027ff01,<br>
&gt;=C2=A0 0xe043ff88,<br>
&gt;=C2=A0 0x2ff70004,<br>
&gt;=C2=A0 0xc03a0004,<br>
&gt;=C2=A0 0x2ff70000,<br>
&gt;=C2=A0 0xc03a0016,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xfcc007ef,<br>
&gt; +0x001f8400,<br>
&gt;=C2=A0 0x34170001,<br>
&gt;=C2=A0 0xf0f00000,<br>
&gt;=C2=A0 0x00070405,<br>
&gt;=C2=A0 0x4c681000,<br>
&gt;=C2=A0 0x00170503,<br>
&gt;=C2=A0 0x4c581000,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xfcc007e6,<br>
&gt; +0x001fbc00,<br>
&gt;=C2=A0 0x00270504,<br>
&gt;=C2=A0 0x4c581000,<br>
&gt;=C2=A0 0x00370505,<br>
&gt;=C2=A0 0x4c581000,<br>
&gt;=C2=A0 0x34070000,<br>
&gt;=C2=A0 0xf0f00000,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xfc200fe6,<br>
&gt; +0x001f8400,<br>
&gt;=C2=A0 0x00470003,<br>
&gt;=C2=A0 0x49a00180,<br>
&gt;=C2=A0 0x00570004,<br>
&gt;=C2=A0 0x49a00200,<br>
&gt;=C2=A0 0x00670005,<br>
&gt;=C2=A0 0x49a00280,<br>
&gt; -0xfc0007e0,<br>
&gt; -0x001f8000,<br>
&gt; +0xfc2007e1,<br>
&gt; +0x001f9800,<br>
&gt;=C2=A0 0x00770100,<br>
&gt;=C2=A0 0x49a00180,<br>
&gt;=C2=A0 0x00970102,<br>
&gt;=C2=A0 0x49a00280,<br>
&gt;=C2=A0 0x00870101,<br>
&gt;=C2=A0 0x49a00200,<br>
&gt; -0xfc0007e0,<br>
&gt; +0xfc0007ef,<br>
&gt;=C2=A0 0x001f8000,<br>
&gt;=C2=A0 0x0007000f,<br>
&gt;=C2=A0 0xe3000000,<br>
&gt; --<br>
&gt; 2.11.0<br>
&gt;<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nou=
veau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=
=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailma=
n/listinfo/nouveau</a><br>
</blockquote></div><br></div></div>

--001a11482c36c0ab610553017cf9--

--===============1340206790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1340206790==--
