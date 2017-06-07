From: Aaryaman Vasishta <jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] nv110/exa: update sched codes
Date: Thu, 8 Jun 2017 01:58:46 +0900
Message-ID: <CABVHfRteyPn_na5EZLBKZGNDBrutwu+a5_THQa5L33VsbCd0vw@mail.gmail.com>
References: <20170603141608.17771-1-jem456.vasishta@gmail.com>
 <9b783f87-81aa-de10-7153-6959ddb8c9da@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0960218972=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <9b783f87-81aa-de10-7153-6959ddb8c9da-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

--===============0960218972==
Content-Type: multipart/alternative; boundary="94eb2c057c3a712eeb055161a78c"

--94eb2c057c3a712eeb055161a78c
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 6, 2017 at 7:15 AM, Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
wrote:

> Nice work!
>
> See my comments below, and double-check if some of them can be applied to
> the shaders I didn't review yet.
>
> I recommend you to test your work because if one sched code is wrong, you
> are likely going to kill your card and reboot your box. :-)
>
>
> On 06/03/2017 04:16 PM, Aaryaman Vasishta wrote:
>
>> v2: Add missing delays
>>
>> This patch adds proper delays to maxwell exa shaders. rendercheck tests
>> seem consistent with/without this patch. I haven't extensively tested
>> them though.
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
>> index ce78036..1c4a4f1 100644
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
>>
>
> Out of curiosity, what didn't you add a read-dep-bar on $r2:$r3 here?

Missed it, thanks for pointing it out.

>
>
>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x6 wt 0x3) (st 0x6) (st 0x1)
>>   fmul ftz $r3 $r0 $r1
>>   mov $r2 $r3 0xf
>>
>
> You can stall for only one cycle here, but the 6 cycles on fmul is needed.
>
>   mov $r1 $r3 0xf
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x6) (st 0xf) (st 0x0)
>>   mov $r0 $r3 0xf
>>
>
> Same here.


>
>   exit
>>   #endif
>> diff --git a/src/shader/exac8nv110.fpc b/src/shader/exac8nv110.fpc
>> index 4aa1368..46943b7 100644
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
>> +0xfcc01fe6,
>> +0x001f8400,
>>   0x00170003,
>>   0x5c681000,
>>   0x00370002,
>>   0x5c980780,
>>   0x00370001,
>>   0x5c980780,
>> -0xfc0007e0,
>> +0xfde007e6,
>>   0x001f8000,
>>   0x00370000,
>>   0x5c980780,
>> diff --git a/src/shader/exacanv110.fp b/src/shader/exacanv110.fp
>> index a70d5c5..d7c2867 100644
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
>> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1 rd 0x2)
>>   ipa $r2 a[0x90] $r0 0x0 0x1
>>   tex nodep $r4 $r2 0x0 0x1 t2d 0xf
>>
>
> Please add a read-dep-bar and wait for on the first fmul because $r2:$r3
> are re-used before $r4. Should be safer.


>
>   ipa $r1 a[0x84] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x2 wt 0x4) (st 0xf wr 0x1 wt 0x6) (st 0xf)
>>   ipa $r0 a[0x80] $r0 0x0 0x1
>>   tex nodep $r0 $r0 0x0 0x0 t2d 0xf
>>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1 wt 0x3f) (st 0x1) (st 0x1)
>>   fmul ftz $r3 $r3 $r7
>>
>
> Why are you waiting all barriers? Only $r3 is needed here.

After adding a read-dep-bar and waiting on that over here, I wasn't able to
pass the same number of `rendercheck -f a8r8g8b8` tests as before this
patch.  After a little trial and error I discovered that wt 0xc fixes it,
which means that bar 3 and 4 were being used in this fmul somehow (assuming
bars start from 1), which is odd because this fmul only uses $r3 and $r7,
and I think it should wait on the read-dep-bar set on "tex nodep $r4 $r2
0x0 0x1 t2d 0xf" (I could be wrong though). I'm kinda stumped on what's
going on within this fmul that's causing this behavior.

>
>
>   fmul ftz $r2 $r2 $r6
>>   fmul ftz $r1 $r1 $r5
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1 wt 0x3) (st 0xf) (st 0x0)
>>   fmul ftz $r0 $r0 $r4
>>   exit
>>   #endif
>> diff --git a/src/shader/exacanv110.fpc b/src/shader/exacanv110.fpc
>> index 7c0ca5e..9cad139 100644
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
>> +0x0008bc03,
>>   0x0007ff02,
>>   0xe043ff89,
>>   0xaff70204,
>>   0xc03a0017,
>>   0x4007ff01,
>>   0xe043ff88,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe5e0274f,
>> +0x001fbc06,
>>   0x0007ff00,
>>   0xe043ff88,
>>   0xaff70000,
>>   0xc03a0007,
>>   0x34070000,
>>   0xf0f00000,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfc21ffe1,
>> +0x001f8400,
>>   0x00770303,
>>   0x5c681000,
>>   0x00670202,
>>   0x5c681000,
>>   0x00570101,
>>   0x5c681000,
>> -0xfc0007e0,
>> +0xfde01fe1,
>>   0x001f8000,
>>   0x00470000,
>>   0x5c681000,
>> diff --git a/src/shader/exacmnv110.fp b/src/shader/exacmnv110.fp
>> index fe5c294..d717138 100644
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
>> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1 rd 0x2)
>>   ipa $r2 a[0x90] $r0 0x0 0x1
>>   tex nodep $r4 $r2 0x0 0x1 t2d 0x8
>>   ipa $r1 a[0x84] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x2 wt 0x4) (st 0xf wr 0x1 wt 0x6) (st 0xf)
>>   ipa $r0 a[0x80] $r0 0x0 0x1
>>   tex nodep $r0 $r0 0x0 0x0 t2d 0xf
>>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1 wt 0x3f) (st 0x1) (st 0x1)
>>   fmul ftz $r3 $r3 $r4
>>   fmul ftz $r2 $r2 $r4
>>   fmul ftz $r1 $r1 $r4
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x6 wt 0x2) (st 0xf) (st 0x0)
>>   fmul ftz $r0 $r0 $r4
>>   exit
>>   #endif
>> diff --git a/src/shader/exacmnv110.fpc b/src/shader/exacmnv110.fpc
>> index 9d62c1a..c150875 100644
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
>> +0x0008bc03,
>>   0x0007ff02,
>>   0xe043ff89,
>>   0x2ff70204,
>>   0xc03a0014,
>>   0x4007ff01,
>>   0xe043ff88,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe5e0274f,
>> +0x001fbc06,
>>   0x0007ff00,
>>   0xe043ff88,
>>   0xaff70000,
>>   0xc03a0007,
>>   0x34070000,
>>   0xf0f00000,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfc21ffe1,
>> +0x001f8400,
>>   0x00470303,
>>   0x5c681000,
>>   0x00470202,
>>   0x5c681000,
>>   0x00470101,
>>   0x5c681000,
>> -0xfc0007e0,
>> +0xfde017e6,
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
>>
>
> This one looks good!
>
>
> diff --git a/src/shader/exas8nv110.fpc b/src/shader/exas8nv110.fpc
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
>> index 61374a6..ad7ca36 100644
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
>> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1 rd 0x2)
>>   ipa $r2 a[0x80] $r0 0x0 0x1
>>   tex nodep $r4 $r2 0x0 0x0 t2d 0x8
>>   ipa $r1 a[0x94] $r0 0x0 0x1
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf wr 0x2 wt 0x4) (st 0xf wr 0x1 wt 0x6) (st 0xf)
>>   ipa $r0 a[0x90] $r0 0x0 0x1
>>   tex nodep $r0 $r0 0x0 0x1 t2d 0xf
>>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1 wt 0x3f) (st 0x1) (st 0x1)
>>   fmul ftz $r3 $r3 $r4
>>   fmul ftz $r2 $r2 $r4
>>   fmul ftz $r1 $r1 $r4
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x1 wt 0x2) (st 0xf) (st 0x0)
>>   fmul ftz $r0 $r0 $r4
>>   exit
>>   #endif
>> diff --git a/src/shader/exasanv110.fpc b/src/shader/exasanv110.fpc
>> index 5516a03..1485f11 100644
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
>> +0x0008bc03,
>>   0x0007ff02,
>>   0xe043ff88,
>>   0x2ff70204,
>>   0xc03a0004,
>>   0x4007ff01,
>>   0xe043ff89,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xe5e0274f,
>> +0x001fbc06,
>>   0x0007ff00,
>>   0xe043ff89,
>>   0xaff70000,
>>   0xc03a0017,
>>   0x34070000,
>>   0xf0f00000,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfc21ffe1,
>> +0x001f8400,
>>   0x00470303,
>>   0x5c681000,
>>   0x00470202,
>>   0x5c681000,
>>   0x00470101,
>>   0x5c681000,
>> -0xfc0007e0,
>> +0xfde017e1,
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
>>
>
> Looks good.
>
>
>   exit
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
>> index 2728311..dd3816c 100644
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
>> +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)
>>   ipa $r1 a[0x84] $r2 0x0 0x1
>>   tex nodep $r4 $r0 0x0 0x0 t2d 0x8
>>   tex nodep $r0 $r0 0x0 0x1 t2d 0xc
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0xf) (st 0x6 wt 0x1) (st 0x6)
>>   depbar le 0x5 0x1 0x1
>>   fmul ftz $r5 $r4 c0[0x0]
>>   fadd ftz $r3 $r5 c0[0x4]
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x6) (st 0x6) (st 0xf)
>>   fadd ftz $r4 $r5 c0[0x8]
>>   fadd ftz $r5 $r5 c0[0xc]
>>   depbar le 0x5 0x0 0x0
>> -sched (st 0x0) (st 0x0) (st 0x0)
>> +sched (st 0x6 wt 0x2) (st 0x1) (st 0x1)
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
>> index 31d745a..8fbc246 100644
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
>> +0x001cbc03,
>>   0x4027ff01,
>>   0xe043ff88,
>>   0x2ff70004,
>>   0xc03a0004,
>>   0x2ff70000,
>>   0xc03a0016,
>> -0xfc0007e0,
>> -0x001f8000,
>> +0xfcc007ef,
>> +0x001f9801,
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
>> +0xfc2017e6,
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
>
As for your other comments, I have made the suggested changes.

Thanks for your review!

Cheers,
Aaryaman

--94eb2c057c3a712eeb055161a78c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 6, 2017 at 7:15 AM, Samuel Pitoiset <span dir=3D"ltr">&lt;<=
a href=3D"mailto:samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">samuel.pitois=
et-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Nice work!<br>
<br>
See my comments below, and double-check if some of them can be applied to t=
he shaders I didn&#39;t review yet.<br>
<br>
I recommend you to test your work because if one sched code is wrong, you a=
re likely going to kill your card and reboot your box. :-)<div><div class=
=3D"gmail-h5"><br>
<br>
On 06/03/2017 04:16 PM, Aaryaman Vasishta wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
v2: Add missing delays<br>
<br>
This patch adds proper delays to maxwell exa shaders. rendercheck tests<br>
seem consistent with/without this patch. I haven&#39;t extensively tested<b=
r>
them though.<br>
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
index ce78036..1c4a4f1 100644<br>
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
</blockquote>
<br></div></div>
Out of curiosity, what didn&#39;t you add a read-dep-bar on $r2:$r3 here?</=
blockquote><div>Missed it, thanks for pointing it out. =C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x6 wt 0x3) (st 0x6) (st 0x1)<br>
=C2=A0 fmul ftz $r3 $r0 $r1<br>
=C2=A0 mov $r2 $r3 0xf<br>
</blockquote>
<br></span>
You can stall for only one cycle here, but the 6 cycles on fmul is needed.<=
span class=3D"gmail-"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 mov $r1 $r3 0xf<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x6) (st 0xf) (st 0x0)<br>
=C2=A0 mov $r0 $r3 0xf<br>
</blockquote>
<br></span>
Same here.=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div><div class=3D"gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 exit<br>
=C2=A0 #endif<br>
diff --git a/src/shader/exac8nv110.fpc b/src/shader/exac8nv110.fpc<br>
index 4aa1368..46943b7 100644<br>
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
+0xfcc01fe6,<br>
+0x001f8400,<br>
=C2=A0 0x00170003,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00370002,<br>
=C2=A0 0x5c980780,<br>
=C2=A0 0x00370001,<br>
=C2=A0 0x5c980780,<br>
-0xfc0007e0,<br>
+0xfde007e6,<br>
=C2=A0 0x001f8000,<br>
=C2=A0 0x00370000,<br>
=C2=A0 0x5c980780,<br>
diff --git a/src/shader/exacanv110.fp b/src/shader/exacanv110.fp<br>
index a70d5c5..d7c2867 100644<br>
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
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1 rd 0x2)<br>
=C2=A0 ipa $r2 a[0x90] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r4 $r2 0x0 0x1 t2d 0xf<br>
</blockquote>
<br></div></div>
Please add a read-dep-bar and wait for on the first fmul because $r2:$r3 ar=
e re-used before $r4. Should be safer. =C2=A0</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span class=3D"gmail-"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 ipa $r1 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x2 wt 0x4) (st 0xf wr 0x1 wt 0x6) (st 0xf)<br>
=C2=A0 ipa $r0 a[0x80] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r0 $r0 0x0 0x0 t2d 0xf<br>
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1 wt 0x3f) (st 0x1) (st 0x1)<br>
=C2=A0 fmul ftz $r3 $r3 $r7<br>
</blockquote>
<br></span>
Why are you waiting all barriers? Only $r3 is needed here.</blockquote><div=
>After adding a read-dep-bar and waiting on that over here, I wasn&#39;t ab=
le to pass the same number of `rendercheck -f a8r8g8b8` tests as before thi=
s patch.=C2=A0 After a little trial and error I discovered that wt 0xc fixe=
s it, which means that bar 3 and 4 were being used in this fmul somehow (as=
suming bars start from 1), which is odd because this fmul only uses $r3 and=
 $r7, and I think it should wait on the read-dep-bar set on &quot;tex nodep=
 $r4 $r2 0x0 0x1 t2d 0xf&quot; (I could be wrong though). I&#39;m kinda stu=
mped on what&#39;s going on within this fmul that&#39;s causing this behavi=
or.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=
=3D"gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 fmul ftz $r2 $r2 $r6<br>
=C2=A0 fmul ftz $r1 $r1 $r5<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1 wt 0x3) (st 0xf) (st 0x0)<br>
=C2=A0 fmul ftz $r0 $r0 $r4<br>
=C2=A0 exit<br>
=C2=A0 #endif<br>
diff --git a/src/shader/exacanv110.fpc b/src/shader/exacanv110.fpc<br>
index 7c0ca5e..9cad139 100644<br>
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
+0x0008bc03,<br>
=C2=A0 0x0007ff02,<br>
=C2=A0 0xe043ff89,<br>
=C2=A0 0xaff70204,<br>
=C2=A0 0xc03a0017,<br>
=C2=A0 0x4007ff01,<br>
=C2=A0 0xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe5e0274f,<br>
+0x001fbc06,<br>
=C2=A0 0x0007ff00,<br>
=C2=A0 0xe043ff88,<br>
=C2=A0 0xaff70000,<br>
=C2=A0 0xc03a0007,<br>
=C2=A0 0x34070000,<br>
=C2=A0 0xf0f00000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc21ffe1,<br>
+0x001f8400,<br>
=C2=A0 0x00770303,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00670202,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00570101,<br>
=C2=A0 0x5c681000,<br>
-0xfc0007e0,<br>
+0xfde01fe1,<br>
=C2=A0 0x001f8000,<br>
=C2=A0 0x00470000,<br>
=C2=A0 0x5c681000,<br>
diff --git a/src/shader/exacmnv110.fp b/src/shader/exacmnv110.fp<br>
index fe5c294..d717138 100644<br>
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
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1 rd 0x2)<br>
=C2=A0 ipa $r2 a[0x90] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r4 $r2 0x0 0x1 t2d 0x8<br>
=C2=A0 ipa $r1 a[0x84] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x2 wt 0x4) (st 0xf wr 0x1 wt 0x6) (st 0xf)<br>
=C2=A0 ipa $r0 a[0x80] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r0 $r0 0x0 0x0 t2d 0xf<br>
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1 wt 0x3f) (st 0x1) (st 0x1)<br>
=C2=A0 fmul ftz $r3 $r3 $r4<br>
=C2=A0 fmul ftz $r2 $r2 $r4<br>
=C2=A0 fmul ftz $r1 $r1 $r4<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x6 wt 0x2) (st 0xf) (st 0x0)<br>
=C2=A0 fmul ftz $r0 $r0 $r4<br>
=C2=A0 exit<br>
=C2=A0 #endif<br>
diff --git a/src/shader/exacmnv110.fpc b/src/shader/exacmnv110.fpc<br>
index 9d62c1a..c150875 100644<br>
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
+0x0008bc03,<br>
=C2=A0 0x0007ff02,<br>
=C2=A0 0xe043ff89,<br>
=C2=A0 0x2ff70204,<br>
=C2=A0 0xc03a0014,<br>
=C2=A0 0x4007ff01,<br>
=C2=A0 0xe043ff88,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe5e0274f,<br>
+0x001fbc06,<br>
=C2=A0 0x0007ff00,<br>
=C2=A0 0xe043ff88,<br>
=C2=A0 0xaff70000,<br>
=C2=A0 0xc03a0007,<br>
=C2=A0 0x34070000,<br>
=C2=A0 0xf0f00000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc21ffe1,<br>
+0x001f8400,<br>
=C2=A0 0x00470303,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00470202,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00470101,<br>
=C2=A0 0x5c681000,<br>
-0xfc0007e0,<br>
+0xfde017e6,<br>
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
</blockquote>
<br></div></div>
This one looks good!<div><div class=3D"gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
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
index 61374a6..ad7ca36 100644<br>
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
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1 rd 0x2)<br>
=C2=A0 ipa $r2 a[0x80] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r4 $r2 0x0 0x0 t2d 0x8<br>
=C2=A0 ipa $r1 a[0x94] $r0 0x0 0x1<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf wr 0x2 wt 0x4) (st 0xf wr 0x1 wt 0x6) (st 0xf)<br>
=C2=A0 ipa $r0 a[0x90] $r0 0x0 0x1<br>
=C2=A0 tex nodep $r0 $r0 0x0 0x1 t2d 0xf<br>
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1 wt 0x3f) (st 0x1) (st 0x1)<br>
=C2=A0 fmul ftz $r3 $r3 $r4<br>
=C2=A0 fmul ftz $r2 $r2 $r4<br>
=C2=A0 fmul ftz $r1 $r1 $r4<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x1 wt 0x2) (st 0xf) (st 0x0)<br>
=C2=A0 fmul ftz $r0 $r0 $r4<br>
=C2=A0 exit<br>
=C2=A0 #endif<br>
diff --git a/src/shader/exasanv110.fpc b/src/shader/exasanv110.fpc<br>
index 5516a03..1485f11 100644<br>
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
+0x0008bc03,<br>
=C2=A0 0x0007ff02,<br>
=C2=A0 0xe043ff88,<br>
=C2=A0 0x2ff70204,<br>
=C2=A0 0xc03a0004,<br>
=C2=A0 0x4007ff01,<br>
=C2=A0 0xe043ff89,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xe5e0274f,<br>
+0x001fbc06,<br>
=C2=A0 0x0007ff00,<br>
=C2=A0 0xe043ff89,<br>
=C2=A0 0xaff70000,<br>
=C2=A0 0xc03a0017,<br>
=C2=A0 0x34070000,<br>
=C2=A0 0xf0f00000,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfc21ffe1,<br>
+0x001f8400,<br>
=C2=A0 0x00470303,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00470202,<br>
=C2=A0 0x5c681000,<br>
=C2=A0 0x00470101,<br>
=C2=A0 0x5c681000,<br>
-0xfc0007e0,<br>
+0xfde017e1,<br>
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
</blockquote>
<br></div></div>
Looks good.<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
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
index 2728311..dd3816c 100644<br>
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
+sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)<br>
=C2=A0 ipa $r1 a[0x84] $r2 0x0 0x1<br>
=C2=A0 tex nodep $r4 $r0 0x0 0x0 t2d 0x8<br>
=C2=A0 tex nodep $r0 $r0 0x0 0x1 t2d 0xc<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0xf) (st 0x6 wt 0x1) (st 0x6)<br>
=C2=A0 depbar le 0x5 0x1 0x1<br>
=C2=A0 fmul ftz $r5 $r4 c0[0x0]<br>
=C2=A0 fadd ftz $r3 $r5 c0[0x4]<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x6) (st 0x6) (st 0xf)<br>
=C2=A0 fadd ftz $r4 $r5 c0[0x8]<br>
=C2=A0 fadd ftz $r5 $r5 c0[0xc]<br>
=C2=A0 depbar le 0x5 0x0 0x0<br>
-sched (st 0x0) (st 0x0) (st 0x0)<br>
+sched (st 0x6 wt 0x2) (st 0x1) (st 0x1)<br>
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
index 31d745a..8fbc246 100644<br>
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
+0x001cbc03,<br>
=C2=A0 0x4027ff01,<br>
=C2=A0 0xe043ff88,<br>
=C2=A0 0x2ff70004,<br>
=C2=A0 0xc03a0004,<br>
=C2=A0 0x2ff70000,<br>
=C2=A0 0xc03a0016,<br>
-0xfc0007e0,<br>
-0x001f8000,<br>
+0xfcc007ef,<br>
+0x001f9801,<br>
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
+0xfc2017e6,<br>
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
=C2=A0 0xe3000000,<br></blockquote></div></div></blockquote><div>=C2=A0</di=
v><div>As for your other comments, I have made the suggested changes.</div>=
</div><div class=3D"gmail_extra"><br></div>Thanks for your review!<br><br>C=
heers,</div><div class=3D"gmail_extra">Aaryaman</div></div>

--94eb2c057c3a712eeb055161a78c--

--===============0960218972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0960218972==--
