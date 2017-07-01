From: Aaryaman Vasishta <jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] nv110/exa: update sched codes
Date: Sun, 2 Jul 2017 00:32:24 +0900
Message-ID: <CABVHfRs9TP4GbG0CVDMQhBLEis6MeQhFMeo3ETTma9i=CMcj_w@mail.gmail.com>
References: <20170627151603.2090-1-jem456.vasishta@gmail.com>
 <7794eca8-72cb-30d0-fbeb-79571d387f20@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1259131854=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <7794eca8-72cb-30d0-fbeb-79571d387f20-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1259131854==
Content-Type: multipart/alternative; boundary="001a114fdcf4ccb2530553433ee4"

--001a114fdcf4ccb2530553433ee4
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Jun 30, 2017 at 6:26 AM, Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
wrote:

> Do you still have some glitches or does it work correctly now?

No visible glitches on my machine so far (Pascal 1080, Debain stretch GNOME
desktop)
I used "rendercheck -f a8r8g8b8" to make sure there's no differences
between the test results after the patch. They've helped me in my debugging
to an extent.

> Did you also remove the spurious wait dep bars between v3 and v4?

There's a redundant read dep-bar on "sched (st 0xf wr 0x1) (st 0xf wr 0x0
rd 0x1 wt 0x3) (st 0xf wr 0x1 wt 0x2)" which I've removed in v5 of this
patch. I'll be sending them to the ML now.

Cheers,
Aaryaman

>
> On 06/27/2017 05:16 PM, Aaryaman Vasishta wrote:
>
>> v4: Updated the wait dependancy bars based on tex component masks.
>>
>> This patch adds proper delays to maxwell exa shaders. Tested with
>> rendercheck -f a8r8g8b8.
>>
>> I am still wondering whether the rd's are required. We could
>> still wait on the write bars instead. eg. see
>> "sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)" in
>> exacmnv110.fp
>>
>> Trello:
>> https://trello.com/c/6LPB2EIS/174-update-maxwell-shaders-wit
>> h-proper-delays
>>
>> Signed-off-by: Aaryaman Vasishta <jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   src/shader/exac8nv110.fp  | 10 +++++-----
>>   src/shader/exac8nv110.fpc | 18 +++++++++---------
>>   src/shader/exacanv110.fp  | 10 +++++-----
>>   src/shader/exacanv110.fpc | 18 +++++++++---------
>>   src/shader/exacmnv110.fp  | 10 +++++-----
>>   src/shader/exacmnv110.fpc | 18 +++++++++---------
>>   src/shader/exas8nv110.fp  |  6 +++---
>>   src/shader/exas8nv110.fpc | 12 ++++++------
>>   src/shader/exasanv110.fp  | 10 +++++-----
>>   src/shader/exasanv110.fpc | 18 +++++++++---------
>>   src/shader/exascnv110.fp  |  6 +++---
>>   src/shader/exascnv110.fpc | 10 +++++-----
>>   src/shader/videonv110.fp  | 14 +++++++-------
>>   src/shader/videonv110.fpc | 26 +++++++++++++-------------
>>   14 files changed, 93 insertions(+), 93 deletions(-)
>>
>> diff --git a/src/shader/exac8nv110.fp b/src/shader/exac8nv110.fp
>> index ce78036..101b67f 100644
>> --- a/src/shader/exac8nv110.fp
>> +++ b/src/shader/exac8nv110.fp
>> @@ -25,23 +25,23 @@ NV110FP_Composite_A8[] = {
>>   };
>>   #else
>>   -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>>   ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>   mufu rcp $r0 $r0
>>   ipa $r3 a[0x94] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 rd 0x1 wt 0x3) (st 0xf wr 0x1 wt
>> 0x2)
>>   ipa $r2 a[0x90] $r0 0x0 0x1
>>   tex nodep $r1 $r2 0x0 0x1 t2d 0x8
>>   ipa $r3 a[0x84] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x2) (st 0xf wr 0x1 wt 0x6) (st 0xf)
>>   ipa $r2 a[0x80] $r0 0x0 0x1
>>   tex nodep $r0 $r2 0x0 0x0 t2d 0x8
>>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x6 wt 0x3) (st 0x1) (st 0x1)
>>   fmul ftz $r3 $r0 $r1
>>   mov $r2 $r3 0xf
>>   mov $r1 $r3 0xf
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1) (st 0xf) (st 0x0)
>>   mov $r0 $r3 0xf
>>   exit
>>   #endif
>> diff --git a/src/shader/exac8nv110.fpc b/src/shader/exac8nv110.fpc
>> index 4aa1368..1f7d649 100644
>> --- a/src/shader/exac8nv110.fpc
>> +++ b/src/shader/exac8nv110.fpc
>> @@ -1,36 +1,36 @@
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1a0070f,
>> +0x003c3c01,
>>   0xcff7ff00,
>>   0xe003ff87,
>>   0x00470000,
>>   0x50800000,
>>   0x4007ff03,
>>   0xe043ff89,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0x21e0072f,
>> +0x005cbc03,
>>   0x0007ff02,
>>   0xe043ff89,
>>   0x2ff70201,
>>   0xc03a0014,
>>   0x4007ff03,
>>   0xe043ff88,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe5e0074f,
>> +0x001fbc06,
>>   0x0007ff02,
>>   0xe043ff88,
>>   0x2ff70200,
>>   0xc03a0004,
>>   0x34070000,
>>   0xf0f00000,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfc201fe6,
>> +0x001f8400,
>>   0x00170003,
>>   0x5c681000,
>>   0x00370002,
>>   0x5c980780,
>>   0x00370001,
>>   0x5c980780,
>> -0xfc0007e0,
>> +0xfde007e1,
>>   0x001f8000,
>>   0x00370000,
>>   0x5c980780,
>> diff --git a/src/shader/exacanv110.fp b/src/shader/exacanv110.fp
>> index a70d5c5..fe55fcd 100644
>> --- a/src/shader/exacanv110.fp
>> +++ b/src/shader/exacanv110.fp
>> @@ -25,23 +25,23 @@ NV110FP_CAComposite[] = {
>>   };
>>   #else
>>   -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>>   ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>   mufu rcp $r0 $r0
>>   ipa $r3 a[0x94] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)
>>   ipa $r2 a[0x90] $r0 0x0 0x1
>>   tex nodep $r4 $r2 0x0 0x1 t2d 0xf
>>   ipa $r1 a[0x84] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)
>>   ipa $r0 a[0x80] $r0 0x0 0x1
>>   tex nodep $r0 $r0 0x0 0x0 t2d 0xf
>>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)
>>   fmul ftz $r3 $r3 $r7
>>   fmul ftz $r2 $r2 $r6
>>   fmul ftz $r1 $r1 $r5
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1) (st 0xf) (st 0x0)
>>   fmul ftz $r0 $r0 $r4
>>   exit
>>   #endif
>> diff --git a/src/shader/exacanv110.fpc b/src/shader/exacanv110.fpc
>> index 7c0ca5e..7c8ebbd 100644
>> --- a/src/shader/exacanv110.fpc
>> +++ b/src/shader/exacanv110.fpc
>> @@ -1,36 +1,36 @@
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1a0070f,
>> +0x003c3c01,
>>   0xcff7ff00,
>>   0xe003ff87,
>>   0x00470000,
>>   0x50800000,
>>   0x4007ff03,
>>   0xe043ff89,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1e0072f,
>> +0x001cbc03,
>>   0x0007ff02,
>>   0xe043ff89,
>>   0xaff70204,
>>   0xc03a0017,
>>   0x4007ff01,
>>   0xe043ff88,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe5e0172f,
>> +0x001fbc02,
>>   0x0007ff00,
>>   0xe043ff88,
>>   0xaff70000,
>>   0xc03a0007,
>>   0x34070000,
>>   0xf0f00000,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfc201fe1,
>> +0x001f8400,
>>   0x00770303,
>>   0x5c681000,
>>   0x00670202,
>>   0x5c681000,
>>   0x00570101,
>>   0x5c681000,
>> -0xfc0007e0,
>> +0xfde007e1,
>>   0x001f8000,
>>   0x00470000,
>>   0x5c681000,
>> diff --git a/src/shader/exacmnv110.fp b/src/shader/exacmnv110.fp
>> index fe5c294..7113ab3 100644
>> --- a/src/shader/exacmnv110.fp
>> +++ b/src/shader/exacmnv110.fp
>> @@ -25,23 +25,23 @@ NV110FP_Composite[] = {
>>   };
>>   #else
>>   -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>>   ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>   mufu rcp $r0 $r0
>>   ipa $r3 a[0x94] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)
>>   ipa $r2 a[0x90] $r0 0x0 0x1
>>   tex nodep $r4 $r2 0x0 0x1 t2d 0x8
>>   ipa $r1 a[0x84] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)
>>   ipa $r0 a[0x80] $r0 0x0 0x1
>>   tex nodep $r0 $r0 0x0 0x0 t2d 0xf
>>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)
>>   fmul ftz $r3 $r3 $r4
>>   fmul ftz $r2 $r2 $r4
>>   fmul ftz $r1 $r1 $r4
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1) (st 0xf) (st 0x0)
>>   fmul ftz $r0 $r0 $r4
>>   exit
>>   #endif
>> diff --git a/src/shader/exacmnv110.fpc b/src/shader/exacmnv110.fpc
>> index 9d62c1a..60352a8 100644
>> --- a/src/shader/exacmnv110.fpc
>> +++ b/src/shader/exacmnv110.fpc
>> @@ -1,36 +1,36 @@
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1a0070f,
>> +0x003c3c01,
>>   0xcff7ff00,
>>   0xe003ff87,
>>   0x00470000,
>>   0x50800000,
>>   0x4007ff03,
>>   0xe043ff89,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1e0072f,
>> +0x001cbc03,
>>   0x0007ff02,
>>   0xe043ff89,
>>   0x2ff70204,
>>   0xc03a0014,
>>   0x4007ff01,
>>   0xe043ff88,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe5e0172f,
>> +0x001fbc02,
>>   0x0007ff00,
>>   0xe043ff88,
>>   0xaff70000,
>>   0xc03a0007,
>>   0x34070000,
>>   0xf0f00000,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfc201fe1,
>> +0x001f8400,
>>   0x00470303,
>>   0x5c681000,
>>   0x00470202,
>>   0x5c681000,
>>   0x00470101,
>>   0x5c681000,
>> -0xfc0007e0,
>> +0xfde007e1,
>>   0x001f8000,
>>   0x00470000,
>>   0x5c681000,
>> diff --git a/src/shader/exas8nv110.fp b/src/shader/exas8nv110.fp
>> index 4fe2e19..a555beb 100644
>> --- a/src/shader/exas8nv110.fp
>> +++ b/src/shader/exas8nv110.fp
>> @@ -25,15 +25,15 @@ NV110FP_Source_A8[] = {
>>   };
>>   #else
>>   -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>>   ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>   mufu rcp $r0 $r0
>>   ipa $r1 a[0x84] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf)
>>   ipa $r0 a[0x80] $r0 0x0 0x1
>>   tex nodep $r0 $r0 0x0 0x0 t2d 0x8
>>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1 wt 0x1) (st 0x1) (st 0x1)
>>   mov $r3 $r0 0xf
>>   mov $r2 $r0 0xf
>>   mov $r1 $r0 0xf
>> diff --git a/src/shader/exas8nv110.fpc b/src/shader/exas8nv110.fpc
>> index 1181c41..e58d168 100644
>> --- a/src/shader/exas8nv110.fpc
>> +++ b/src/shader/exas8nv110.fpc
>> @@ -1,21 +1,21 @@
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1a0070f,
>> +0x003c3c01,
>>   0xcff7ff00,
>>   0xe003ff87,
>>   0x00470000,
>>   0x50800000,
>>   0x4007ff01,
>>   0xe043ff88,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1e0072f,
>> +0x001fbc03,
>>   0x0007ff00,
>>   0xe043ff88,
>>   0x2ff70000,
>>   0xc03a0004,
>>   0x34070000,
>>   0xf0f00000,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfc200fe1,
>> +0x001f8400,
>>   0x00070003,
>>   0x5c980780,
>>   0x00070002,
>> diff --git a/src/shader/exasanv110.fp b/src/shader/exasanv110.fp
>> index 61374a6..ee818cd 100644
>> --- a/src/shader/exasanv110.fp
>> +++ b/src/shader/exasanv110.fp
>> @@ -25,23 +25,23 @@ NV110FP_CACompositeSrcAlpha[] = {
>>   };
>>   #else
>>   -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>>   ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>   mufu rcp $r0 $r0
>>   ipa $r3 a[0x84] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)
>>   ipa $r2 a[0x80] $r0 0x0 0x1
>>   tex nodep $r4 $r2 0x0 0x0 t2d 0x8
>>   ipa $r1 a[0x94] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)
>>   ipa $r0 a[0x90] $r0 0x0 0x1
>>   tex nodep $r0 $r0 0x0 0x1 t2d 0xf
>>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)
>>   fmul ftz $r3 $r3 $r4
>>   fmul ftz $r2 $r2 $r4
>>   fmul ftz $r1 $r1 $r4
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1) (st 0xf) (st 0x0)
>>   fmul ftz $r0 $r0 $r4
>>   exit
>>   #endif
>> diff --git a/src/shader/exasanv110.fpc b/src/shader/exasanv110.fpc
>> index 5516a03..604bf9a 100644
>> --- a/src/shader/exasanv110.fpc
>> +++ b/src/shader/exasanv110.fpc
>> @@ -1,36 +1,36 @@
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1a0070f,
>> +0x003c3c01,
>>   0xcff7ff00,
>>   0xe003ff87,
>>   0x00470000,
>>   0x50800000,
>>   0x4007ff03,
>>   0xe043ff88,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1e0072f,
>> +0x001cbc03,
>>   0x0007ff02,
>>   0xe043ff88,
>>   0x2ff70204,
>>   0xc03a0004,
>>   0x4007ff01,
>>   0xe043ff89,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe5e0172f,
>> +0x001fbc02,
>>   0x0007ff00,
>>   0xe043ff89,
>>   0xaff70000,
>>   0xc03a0017,
>>   0x34070000,
>>   0xf0f00000,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfc201fe1,
>> +0x001f8400,
>>   0x00470303,
>>   0x5c681000,
>>   0x00470202,
>>   0x5c681000,
>>   0x00470101,
>>   0x5c681000,
>> -0xfc0007e0,
>> +0xfde007e1,
>>   0x001f8000,
>>   0x00470000,
>>   0x5c681000,
>> diff --git a/src/shader/exascnv110.fp b/src/shader/exascnv110.fp
>> index 90bbb55..86e14e8 100644
>> --- a/src/shader/exascnv110.fp
>> +++ b/src/shader/exascnv110.fp
>> @@ -25,14 +25,14 @@ NV110FP_Source[] = {
>>   };
>>   #else
>>   -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>>   ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>   mufu rcp $r0 $r0
>>   ipa $r1 a[0x84] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x1) (st 0xf wt 0x3) (st 0xf)
>>   ipa $r0 a[0x80] $r0 0x0 0x1
>>   tex nodep $r0 $r0 0x0 0x0 t2d 0xf
>>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf) (st 0x0) (st 0x0)
>>   exit
>>   #endif
>> diff --git a/src/shader/exascnv110.fpc b/src/shader/exascnv110.fpc
>> index 2dba15d..1fef5d2 100644
>> --- a/src/shader/exascnv110.fpc
>> +++ b/src/shader/exascnv110.fpc
>> @@ -1,20 +1,20 @@
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1a0070f,
>> +0x003c3c01,
>>   0xcff7ff00,
>>   0xe003ff87,
>>   0x00470000,
>>   0x50800000,
>>   0x4007ff01,
>>   0xe043ff88,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfde0072f,
>> +0x001fbc03,
>>   0x0007ff00,
>>   0xe043ff88,
>>   0xaff70000,
>>   0xc03a0007,
>>   0x34070000,
>>   0xf0f00000,
>> -0xfc0007e0,
>> +0xfc0007ef,
>>   0x001f8000,
>>   0x0007000f,
>>   0xe3000000,
>> diff --git a/src/shader/videonv110.fp b/src/shader/videonv110.fp
>> index 2728311..773aad5 100644
>> --- a/src/shader/videonv110.fp
>> +++ b/src/shader/videonv110.fp
>> @@ -25,30 +25,30 @@ NV110FP_NV12[] = {
>>   };
>>   #else
>>   -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)
>>   ipa pass $r2 a[0x7c] 0x0 0x0 0x1
>>   mufu rcp $r2 $r2
>>   ipa $r0 a[0x80] $r2 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x0 wt 0x1)
>>   ipa $r1 a[0x84] $r2 0x0 0x1
>>   tex nodep $r4 $r0 0x0 0x0 t2d 0x8
>>   tex nodep $r0 $r0 0x0 0x1 t2d 0xc
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf) (st 0x6) (st 0x1)
>>   depbar le 0x5 0x1 0x1
>>   fmul ftz $r5 $r4 c0[0x0]
>>   fadd ftz $r3 $r5 c0[0x4]
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x6) (st 0x6) (st 0xf)
>>   fadd ftz $r4 $r5 c0[0x8]
>>   fadd ftz $r5 $r5 c0[0xc]
>>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x6 wt 0x1) (st 0x1) (st 0x1)
>>   ffma ftz $r3 $r0 c0[0x10] $r3
>>   ffma ftz $r4 $r0 c0[0x14] $r4
>>   ffma ftz $r5 $r0 c0[0x18] $r5
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1) (st 0x1) (st 0x6)
>>   ffma ftz $r0 $r1 c0[0x1c] $r3
>>   ffma ftz $r2 $r1 c0[0x24] $r5
>>   ffma ftz $r1 $r1 c0[0x20] $r4
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf) (st 0x0) (st 0x0)
>>   exit
>>   #endif
>> diff --git a/src/shader/videonv110.fpc b/src/shader/videonv110.fpc
>> index 31d745a..8e7bedf 100644
>> --- a/src/shader/videonv110.fpc
>> +++ b/src/shader/videonv110.fpc
>> @@ -1,52 +1,52 @@
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1a0070f,
>> +0x003c3c01,
>>   0xcff7ff02,
>>   0xe003ff87,
>>   0x00470202,
>>   0x50800000,
>>   0x0027ff00,
>>   0xe043ff88,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe1e0072f,
>> +0x003c3c03,
>>   0x4027ff01,
>>   0xe043ff88,
>>   0x2ff70004,
>>   0xc03a0004,
>>   0x2ff70000,
>>   0xc03a0016,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfcc007ef,
>> +0x001f8400,
>>   0x34170001,
>>   0xf0f00000,
>>   0x00070405,
>>   0x4c681000,
>>   0x00170503,
>>   0x4c581000,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfcc007e6,
>> +0x001fbc00,
>>   0x00270504,
>>   0x4c581000,
>>   0x00370505,
>>   0x4c581000,
>>   0x34070000,
>>   0xf0f00000,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfc200fe6,
>> +0x001f8400,
>>   0x00470003,
>>   0x49a00180,
>>   0x00570004,
>>   0x49a00200,
>>   0x00670005,
>>   0x49a00280,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfc2007e1,
>> +0x001f9800,
>>   0x00770100,
>>   0x49a00180,
>>   0x00970102,
>>   0x49a00280,
>>   0x00870101,
>>   0x49a00200,
>> -0xfc0007e0,
>> +0xfc0007ef,
>>   0x001f8000,
>>   0x0007000f,
>>   0xe3000000,
>>
>>

--001a114fdcf4ccb2530553433ee4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Fri, Jun 30, 2017 at 6:26 AM, Samuel Pitoiset <span dir=3D"ltr">&=
lt;<a href=3D"mailto:samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">samuel.pi=
toiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Do you still have some glitches or does it work correctly =
now?</blockquote><div>No visible glitches on my machine so far (Pascal 1080=
, Debain stretch GNOME desktop)</div><div><span style=3D"font-size:12.8px">=
I used &quot;rendercheck -f a8r8g8b8&quot;</span>=C2=A0to make sure there&#=
39;s no differences between the test results after the patch. They&#39;ve h=
elped me in my debugging to an extent.</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
Did you also remove the spurious wait dep bars between v3 and v4?</blockquo=
te><div>There&#39;s a redundant read dep-bar on &quot;sched (st 0xf wr 0x1)=
 (st 0xf wr 0x0 rd 0x1 wt 0x3) (st 0xf wr 0x1 wt 0x2)&quot; which I&#39;ve =
removed in v5 of this patch. I&#39;ll be sending them to the ML now.</div><=
div><br></div><div>Cheers,</div><div>Aaryaman</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"gmail-m_-7663460522227076715gmail-H=
OEnZb"><div class=3D"gmail-m_-7663460522227076715gmail-h5">
<br>
On 06/27/2017 05:16 PM, Aaryaman Vasishta wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
v4: Updated the wait dependancy bars based on tex component masks.<br>
<br>
This patch adds proper delays to maxwell exa shaders. Tested with<br>
rendercheck -f a8r8g8b8.<br>
<br>
I am still wondering whether the rd&#39;s are required. We could<br>
still wait on the write bars instead. eg. see<br>
&quot;sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)&quot; in=
 exacmnv110.fp<br>
<br>
Trello:<br>
<a href=3D"https://trello.com/c/6LPB2EIS/174-update-maxwell-shaders-with-pr=
oper-delays" rel=3D"noreferrer" target=3D"_blank">https://trello.com/c/6LPB=
2EIS/<wbr>174-update-maxwell-shaders-wit<wbr>h-proper-delays</a><br>
<br>
Signed-off-by: Aaryaman Vasishta &lt;<a href=3D"mailto:jem456.vasishta@gmai=
l.com" target=3D"_blank">jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
---<br>
=C2=A0 src/shader/exac8nv110.fp=C2=A0 | 10 +++++-----<br>
=C2=A0 src/shader/exac8nv110.fpc | 18 +++++++++---------<br>
=C2=A0 src/shader/exacanv110.fp=C2=A0 | 10 +++++-----<br>
=C2=A0 src/shader/exacanv110.fpc | 18 +++++++++---------<br>
=C2=A0 src/shader/exacmnv110.fp=C2=A0 | 10 +++++-----<br>
=C2=A0 src/shader/exacmnv110.fpc | 18 +++++++++---------<br>
=C2=A0 src/shader/exas8nv110.fp=C2=A0 |=C2=A0 6 +++---<br>
=C2=A0 src/shader/exas8nv110.fpc | 12 ++++++------<br>
=C2=A0 src/shader/exasanv110.fp=C2=A0 | 10 +++++-----<br>
=C2=A0 src/shader/exasanv110.fpc | 18 +++++++++---------<br>
=C2=A0 src/shader/exascnv110.fp=C2=A0 |=C2=A0 6 +++---<br>
=C2=A0 src/shader/exascnv110.fpc | 10 +++++-----<br>
=C2=A0 src/shader/videonv110.fp=C2=A0 | 14 +++++++-------<br>
=C2=A0 src/shader/videonv110.fpc | 26 +++++++++++++-------------<br>
=C2=A0 14 files changed, 93 insertions(+), 93 deletions(-)<br>
<br>
diff --git a/src/shader/exac8nv110.fp b/src/shader/exac8nv110.fp<br>
index ce78036..101b67f 100644<br>
--- a/src/shader/exac8nv110.fp<br>
+++ b/src/shader/exac8nv110.fp<br>
@@ -25,23 +25,23 @@ NV110FP_Composite_A8[] =3D {<br>
=C2=A0 };<br>
=C2=A0 #else<br>
=C2=A0 -sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0 mufu rcp $r0 $r0<br>
=C2=A0 ipa $r3 a[0x94] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 rd 0x1 wt 0x3) (st 0xf wr 0x1 wt 0x2)=
<br>
=C2=A0 ipa $r2 a[0x90] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r1 $r2 0x0 0x1 t2d 0x8<br>
=C2=A0 ipa $r3 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x2) (st 0xf wr 0x1 wt 0x6) (st 0xf)<br>
=C2=A0 ipa $r2 a[0x80] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r0 $r2 0x0 0x0 t2d 0x8<br>
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x6 wt 0x3) (st 0x1) (st 0x1)<br>
=C2=A0 fmul ftz $r3 $r0 $r1<br>
=C2=A0 mov $r2 $r3 0xf<br>
=C2=A0 mov $r1 $r3 0xf<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1) (st 0xf) (st 0x0)<br>
=C2=A0 mov $r0 $r3 0xf<br>
=C2=A0 exit<br>
=C2=A0 #endif<br>
diff --git a/src/shader/exac8nv110.fpc b/src/shader/exac8nv110.fpc<br>
index 4aa1368..1f7d649 100644<br>
--- a/src/shader/exac8nv110.fpc<br>
+++ b/src/shader/exac8nv110.fpc<br>
@@ -1,36 +1,36 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A0 0xcff7ff00,<br>
=C2=A0 0xe003ff87,<br>
=C2=A0 0x00470000,<br>
=C2=A0 0x50800000,<br>
=C2=A0 0x4007ff03,<br>
=C2=A0 0xe043ff89,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0x21e0072f,<br>
+0x005cbc03,<br>
=C2=A0 0x0007ff02,<br>
=C2=A0 0xe043ff89,<br>
=C2=A0 0x2ff70201,<br>
=C2=A0 0xc03a0014,<br>
=C2=A0 0x4007ff03,<br>
=C2=A0 0xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe5e0074f,<br>
+0x001fbc06,<br>
=C2=A0 0x0007ff02,<br>
=C2=A0 0xe043ff88,<br>
=C2=A0 0x2ff70200,<br>
=C2=A0 0xc03a0004,<br>
=C2=A0 0x34070000,<br>
=C2=A0 0xf0f00000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc201fe6,<br>
+0x001f8400,<br>
=C2=A0 0x00170003,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00370002,<br>
=C2=A0 0x5c980780,<br>
=C2=A0 0x00370001,<br>
=C2=A0 0x5c980780,<br>
-0xfc0007e0,<br>
+0xfde007e1,<br>
=C2=A0 0x001f8000,<br>
=C2=A0 0x00370000,<br>
=C2=A0 0x5c980780,<br>
diff --git a/src/shader/exacanv110.fp b/src/shader/exacanv110.fp<br>
index a70d5c5..fe55fcd 100644<br>
--- a/src/shader/exacanv110.fp<br>
+++ b/src/shader/exacanv110.fp<br>
@@ -25,23 +25,23 @@ NV110FP_CAComposite[] =3D {<br>
=C2=A0 };<br>
=C2=A0 #else<br>
=C2=A0 -sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0 mufu rcp $r0 $r0<br>
=C2=A0 ipa $r3 a[0x94] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)<br>
=C2=A0 ipa $r2 a[0x90] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r4 $r2 0x0 0x1 t2d 0xf<br>
=C2=A0 ipa $r1 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)<br>
=C2=A0 ipa $r0 a[0x80] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r0 $r0 0x0 0x0 t2d 0xf<br>
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)<br>
=C2=A0 fmul ftz $r3 $r3 $r7<br>
=C2=A0 fmul ftz $r2 $r2 $r6<br>
=C2=A0 fmul ftz $r1 $r1 $r5<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1) (st 0xf) (st 0x0)<br>
=C2=A0 fmul ftz $r0 $r0 $r4<br>
=C2=A0 exit<br>
=C2=A0 #endif<br>
diff --git a/src/shader/exacanv110.fpc b/src/shader/exacanv110.fpc<br>
index 7c0ca5e..7c8ebbd 100644<br>
--- a/src/shader/exacanv110.fpc<br>
+++ b/src/shader/exacanv110.fpc<br>
@@ -1,36 +1,36 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A0 0xcff7ff00,<br>
=C2=A0 0xe003ff87,<br>
=C2=A0 0x00470000,<br>
=C2=A0 0x50800000,<br>
=C2=A0 0x4007ff03,<br>
=C2=A0 0xe043ff89,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1e0072f,<br>
+0x001cbc03,<br>
=C2=A0 0x0007ff02,<br>
=C2=A0 0xe043ff89,<br>
=C2=A0 0xaff70204,<br>
=C2=A0 0xc03a0017,<br>
=C2=A0 0x4007ff01,<br>
=C2=A0 0xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe5e0172f,<br>
+0x001fbc02,<br>
=C2=A0 0x0007ff00,<br>
=C2=A0 0xe043ff88,<br>
=C2=A0 0xaff70000,<br>
=C2=A0 0xc03a0007,<br>
=C2=A0 0x34070000,<br>
=C2=A0 0xf0f00000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc201fe1,<br>
+0x001f8400,<br>
=C2=A0 0x00770303,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00670202,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00570101,<br>
=C2=A0 0x5c681000,<br>
-0xfc0007e0,<br>
+0xfde007e1,<br>
=C2=A0 0x001f8000,<br>
=C2=A0 0x00470000,<br>
=C2=A0 0x5c681000,<br>
diff --git a/src/shader/exacmnv110.fp b/src/shader/exacmnv110.fp<br>
index fe5c294..7113ab3 100644<br>
--- a/src/shader/exacmnv110.fp<br>
+++ b/src/shader/exacmnv110.fp<br>
@@ -25,23 +25,23 @@ NV110FP_Composite[] =3D {<br>
=C2=A0 };<br>
=C2=A0 #else<br>
=C2=A0 -sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0 mufu rcp $r0 $r0<br>
=C2=A0 ipa $r3 a[0x94] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)<br>
=C2=A0 ipa $r2 a[0x90] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r4 $r2 0x0 0x1 t2d 0x8<br>
=C2=A0 ipa $r1 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)<br>
=C2=A0 ipa $r0 a[0x80] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r0 $r0 0x0 0x0 t2d 0xf<br>
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)<br>
=C2=A0 fmul ftz $r3 $r3 $r4<br>
=C2=A0 fmul ftz $r2 $r2 $r4<br>
=C2=A0 fmul ftz $r1 $r1 $r4<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1) (st 0xf) (st 0x0)<br>
=C2=A0 fmul ftz $r0 $r0 $r4<br>
=C2=A0 exit<br>
=C2=A0 #endif<br>
diff --git a/src/shader/exacmnv110.fpc b/src/shader/exacmnv110.fpc<br>
index 9d62c1a..60352a8 100644<br>
--- a/src/shader/exacmnv110.fpc<br>
+++ b/src/shader/exacmnv110.fpc<br>
@@ -1,36 +1,36 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A0 0xcff7ff00,<br>
=C2=A0 0xe003ff87,<br>
=C2=A0 0x00470000,<br>
=C2=A0 0x50800000,<br>
=C2=A0 0x4007ff03,<br>
=C2=A0 0xe043ff89,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1e0072f,<br>
+0x001cbc03,<br>
=C2=A0 0x0007ff02,<br>
=C2=A0 0xe043ff89,<br>
=C2=A0 0x2ff70204,<br>
=C2=A0 0xc03a0014,<br>
=C2=A0 0x4007ff01,<br>
=C2=A0 0xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe5e0172f,<br>
+0x001fbc02,<br>
=C2=A0 0x0007ff00,<br>
=C2=A0 0xe043ff88,<br>
=C2=A0 0xaff70000,<br>
=C2=A0 0xc03a0007,<br>
=C2=A0 0x34070000,<br>
=C2=A0 0xf0f00000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc201fe1,<br>
+0x001f8400,<br>
=C2=A0 0x00470303,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00470202,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00470101,<br>
=C2=A0 0x5c681000,<br>
-0xfc0007e0,<br>
+0xfde007e1,<br>
=C2=A0 0x001f8000,<br>
=C2=A0 0x00470000,<br>
=C2=A0 0x5c681000,<br>
diff --git a/src/shader/exas8nv110.fp b/src/shader/exas8nv110.fp<br>
index 4fe2e19..a555beb 100644<br>
--- a/src/shader/exas8nv110.fp<br>
+++ b/src/shader/exas8nv110.fp<br>
@@ -25,15 +25,15 @@ NV110FP_Source_A8[] =3D {<br>
=C2=A0 };<br>
=C2=A0 #else<br>
=C2=A0 -sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0 mufu rcp $r0 $r0<br>
=C2=A0 ipa $r1 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf)<br>
=C2=A0 ipa $r0 a[0x80] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r0 $r0 0x0 0x0 t2d 0x8<br>
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1 wt 0x1) (st 0x1) (st 0x1)<br>
=C2=A0 mov $r3 $r0 0xf<br>
=C2=A0 mov $r2 $r0 0xf<br>
=C2=A0 mov $r1 $r0 0xf<br>
diff --git a/src/shader/exas8nv110.fpc b/src/shader/exas8nv110.fpc<br>
index 1181c41..e58d168 100644<br>
--- a/src/shader/exas8nv110.fpc<br>
+++ b/src/shader/exas8nv110.fpc<br>
@@ -1,21 +1,21 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A0 0xcff7ff00,<br>
=C2=A0 0xe003ff87,<br>
=C2=A0 0x00470000,<br>
=C2=A0 0x50800000,<br>
=C2=A0 0x4007ff01,<br>
=C2=A0 0xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1e0072f,<br>
+0x001fbc03,<br>
=C2=A0 0x0007ff00,<br>
=C2=A0 0xe043ff88,<br>
=C2=A0 0x2ff70000,<br>
=C2=A0 0xc03a0004,<br>
=C2=A0 0x34070000,<br>
=C2=A0 0xf0f00000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc200fe1,<br>
+0x001f8400,<br>
=C2=A0 0x00070003,<br>
=C2=A0 0x5c980780,<br>
=C2=A0 0x00070002,<br>
diff --git a/src/shader/exasanv110.fp b/src/shader/exasanv110.fp<br>
index 61374a6..ee818cd 100644<br>
--- a/src/shader/exasanv110.fp<br>
+++ b/src/shader/exasanv110.fp<br>
@@ -25,23 +25,23 @@ NV110FP_CACompositeSrcAlpha[] =3D {<br>
=C2=A0 };<br>
=C2=A0 #else<br>
=C2=A0 -sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0 mufu rcp $r0 $r0<br>
=C2=A0 ipa $r3 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)<br>
=C2=A0 ipa $r2 a[0x80] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r4 $r2 0x0 0x0 t2d 0x8<br>
=C2=A0 ipa $r1 a[0x94] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1 wt 0x2) (st 0xf wr 0x1 wt 0x2) (st 0xf)<br>
=C2=A0 ipa $r0 a[0x90] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r0 $r0 0x0 0x1 t2d 0xf<br>
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1 wt 0x3) (st 0x1) (st 0x1)<br>
=C2=A0 fmul ftz $r3 $r3 $r4<br>
=C2=A0 fmul ftz $r2 $r2 $r4<br>
=C2=A0 fmul ftz $r1 $r1 $r4<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1) (st 0xf) (st 0x0)<br>
=C2=A0 fmul ftz $r0 $r0 $r4<br>
=C2=A0 exit<br>
=C2=A0 #endif<br>
diff --git a/src/shader/exasanv110.fpc b/src/shader/exasanv110.fpc<br>
index 5516a03..604bf9a 100644<br>
--- a/src/shader/exasanv110.fpc<br>
+++ b/src/shader/exasanv110.fpc<br>
@@ -1,36 +1,36 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A0 0xcff7ff00,<br>
=C2=A0 0xe003ff87,<br>
=C2=A0 0x00470000,<br>
=C2=A0 0x50800000,<br>
=C2=A0 0x4007ff03,<br>
=C2=A0 0xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1e0072f,<br>
+0x001cbc03,<br>
=C2=A0 0x0007ff02,<br>
=C2=A0 0xe043ff88,<br>
=C2=A0 0x2ff70204,<br>
=C2=A0 0xc03a0004,<br>
=C2=A0 0x4007ff01,<br>
=C2=A0 0xe043ff89,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe5e0172f,<br>
+0x001fbc02,<br>
=C2=A0 0x0007ff00,<br>
=C2=A0 0xe043ff89,<br>
=C2=A0 0xaff70000,<br>
=C2=A0 0xc03a0017,<br>
=C2=A0 0x34070000,<br>
=C2=A0 0xf0f00000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc201fe1,<br>
+0x001f8400,<br>
=C2=A0 0x00470303,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00470202,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00470101,<br>
=C2=A0 0x5c681000,<br>
-0xfc0007e0,<br>
+0xfde007e1,<br>
=C2=A0 0x001f8000,<br>
=C2=A0 0x00470000,<br>
=C2=A0 0x5c681000,<br>
diff --git a/src/shader/exascnv110.fp b/src/shader/exascnv110.fp<br>
index 90bbb55..86e14e8 100644<br>
--- a/src/shader/exascnv110.fp<br>
+++ b/src/shader/exascnv110.fp<br>
@@ -25,14 +25,14 @@ NV110FP_Source[] =3D {<br>
=C2=A0 };<br>
=C2=A0 #else<br>
=C2=A0 -sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0 ipa pass $r0 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0 mufu rcp $r0 $r0<br>
=C2=A0 ipa $r1 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wt 0x3) (st 0xf)<br>
=C2=A0 ipa $r0 a[0x80] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r0 $r0 0x0 0x0 t2d 0xf<br>
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf) (st 0x0) (st 0x0)<br>
=C2=A0 exit<br>
=C2=A0 #endif<br>
diff --git a/src/shader/exascnv110.fpc b/src/shader/exascnv110.fpc<br>
index 2dba15d..1fef5d2 100644<br>
--- a/src/shader/exascnv110.fpc<br>
+++ b/src/shader/exascnv110.fpc<br>
@@ -1,20 +1,20 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A0 0xcff7ff00,<br>
=C2=A0 0xe003ff87,<br>
=C2=A0 0x00470000,<br>
=C2=A0 0x50800000,<br>
=C2=A0 0x4007ff01,<br>
=C2=A0 0xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfde0072f,<br>
+0x001fbc03,<br>
=C2=A0 0x0007ff00,<br>
=C2=A0 0xe043ff88,<br>
=C2=A0 0xaff70000,<br>
=C2=A0 0xc03a0007,<br>
=C2=A0 0x34070000,<br>
=C2=A0 0xf0f00000,<br>
-0xfc0007e0,<br>
+0xfc0007ef,<br>
=C2=A0 0x001f8000,<br>
=C2=A0 0x0007000f,<br>
=C2=A0 0xe3000000,<br>
diff --git a/src/shader/videonv110.fp b/src/shader/videonv110.fp<br>
index 2728311..773aad5 100644<br>
--- a/src/shader/videonv110.fp<br>
+++ b/src/shader/videonv110.fp<br>
@@ -25,30 +25,30 @@ NV110FP_NV12[] =3D {<br>
=C2=A0 };<br>
=C2=A0 #else<br>
=C2=A0 -sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0 ipa pass $r2 a[0x7c] 0x0 0x0 0x1<br>
=C2=A0 mufu rcp $r2 $r2<br>
=C2=A0 ipa $r0 a[0x80] $r2 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x0 wt 0x1)<br>
=C2=A0 ipa $r1 a[0x84] $r2 0x0 0x1<br>
=C2=A0 tex nodep $r4 $r0 0x0 0x0 t2d 0x8<br>
=C2=A0 tex nodep $r0 $r0 0x0 0x1 t2d 0xc<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf) (st 0x6) (st 0x1)<br>
=C2=A0 depbar le 0x5 0x1 0x1<br>
=C2=A0 fmul ftz $r5 $r4 c0[0x0]<br>
=C2=A0 fadd ftz $r3 $r5 c0[0x4]<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x6) (st 0x6) (st 0xf)<br>
=C2=A0 fadd ftz $r4 $r5 c0[0x8]<br>
=C2=A0 fadd ftz $r5 $r5 c0[0xc]<br>
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x6 wt 0x1) (st 0x1) (st 0x1)<br>
=C2=A0 ffma ftz $r3 $r0 c0[0x10] $r3<br>
=C2=A0 ffma ftz $r4 $r0 c0[0x14] $r4<br>
=C2=A0 ffma ftz $r5 $r0 c0[0x18] $r5<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1) (st 0x1) (st 0x6)<br>
=C2=A0 ffma ftz $r0 $r1 c0[0x1c] $r3<br>
=C2=A0 ffma ftz $r2 $r1 c0[0x24] $r5<br>
=C2=A0 ffma ftz $r1 $r1 c0[0x20] $r4<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf) (st 0x0) (st 0x0)<br>
=C2=A0 exit<br>
=C2=A0 #endif<br>
diff --git a/src/shader/videonv110.fpc b/src/shader/videonv110.fpc<br>
index 31d745a..8e7bedf 100644<br>
--- a/src/shader/videonv110.fpc<br>
+++ b/src/shader/videonv110.fpc<br>
@@ -1,52 +1,52 @@<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1a0070f,<br>
+0x003c3c01,<br>
=C2=A0 0xcff7ff02,<br>
=C2=A0 0xe003ff87,<br>
=C2=A0 0x00470202,<br>
=C2=A0 0x50800000,<br>
=C2=A0 0x0027ff00,<br>
=C2=A0 0xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe1e0072f,<br>
+0x003c3c03,<br>
=C2=A0 0x4027ff01,<br>
=C2=A0 0xe043ff88,<br>
=C2=A0 0x2ff70004,<br>
=C2=A0 0xc03a0004,<br>
=C2=A0 0x2ff70000,<br>
=C2=A0 0xc03a0016,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfcc007ef,<br>
+0x001f8400,<br>
=C2=A0 0x34170001,<br>
=C2=A0 0xf0f00000,<br>
=C2=A0 0x00070405,<br>
=C2=A0 0x4c681000,<br>
=C2=A0 0x00170503,<br>
=C2=A0 0x4c581000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfcc007e6,<br>
+0x001fbc00,<br>
=C2=A0 0x00270504,<br>
=C2=A0 0x4c581000,<br>
=C2=A0 0x00370505,<br>
=C2=A0 0x4c581000,<br>
=C2=A0 0x34070000,<br>
=C2=A0 0xf0f00000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc200fe6,<br>
+0x001f8400,<br>
=C2=A0 0x00470003,<br>
=C2=A0 0x49a00180,<br>
=C2=A0 0x00570004,<br>
=C2=A0 0x49a00200,<br>
=C2=A0 0x00670005,<br>
=C2=A0 0x49a00280,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc2007e1,<br>
+0x001f9800,<br>
=C2=A0 0x00770100,<br>
=C2=A0 0x49a00180,<br>
=C2=A0 0x00970102,<br>
=C2=A0 0x49a00280,<br>
=C2=A0 0x00870101,<br>
=C2=A0 0x49a00200,<br>
-0xfc0007e0,<br>
+0xfc0007ef,<br>
=C2=A0 0x001f8000,<br>
=C2=A0 0x0007000f,<br>
=C2=A0 0xe3000000,<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--001a114fdcf4ccb2530553433ee4--

--===============1259131854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1259131854==--
