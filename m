From: Aaryaman Vasishta <jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] nv110/exa: update sched codes
Date: Fri, 9 Jun 2017 00:19:08 +0900
Message-ID: <CABVHfRvfNdALg6vO9_bhmgzodrYDOre-Lx90vWf4RhiBKVdVsg@mail.gmail.com>
References: <20170603141608.17771-1-jem456.vasishta@gmail.com>
 <9b783f87-81aa-de10-7153-6959ddb8c9da@gmail.com>
 <CABVHfRteyPn_na5EZLBKZGNDBrutwu+a5_THQa5L33VsbCd0vw@mail.gmail.com>
 <04bace83-4790-b233-5a07-9aff60f0875e@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1233092308=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <04bace83-4790-b233-5a07-9aff60f0875e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

--===============1233092308==
Content-Type: multipart/alternative; boundary="001a11c10fc604bcc20551746150"

--001a11c10fc604bcc20551746150
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 8, 2017 at 5:01 AM, Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
wrote:

>
>
> On 06/07/2017 06:58 PM, Aaryaman Vasishta wrote:
>
>>
>>
>> On Tue, Jun 6, 2017 at 7:15 AM, Samuel Pitoiset <
>> samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <mailto:samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>> wrote:
>>
>>     Nice work!
>>
>>     See my comments below, and double-check if some of them can be
>>     applied to the shaders I didn't review yet.
>>
>>     I recommend you to test your work because if one sched code is
>>     wrong, you are likely going to kill your card and reboot your box. :-)
>>
>>
>>     On 06/03/2017 04:16 PM, Aaryaman Vasishta wrote:
>>
>>         v2: Add missing delays
>>
>>         This patch adds proper delays to maxwell exa shaders.
>>         rendercheck tests
>>         seem consistent with/without this patch. I haven't extensively
>>         tested
>>         them though.
>>
>>         Trello:
>>         https://trello.com/c/6LPB2EIS/174-update-maxwell-shaders-wit
>> h-proper-delays
>>         <https://trello.com/c/6LPB2EIS/174-update-maxwell-shaders-wi
>> th-proper-delays>
>>
>>         Signed-off-by: Aaryaman Vasishta <jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>>         <mailto:jem456.vasishta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>>
>>
>>         ---
>>            src/shader/exac8nv110.fp  | 10 +++++-----
>>            src/shader/exac8nv110.fpc | 18 +++++++++---------
>>            src/shader/exacanv110.fp  | 10 +++++-----
>>            src/shader/exacanv110.fpc | 18 +++++++++---------
>>            src/shader/exacmnv110.fp  | 10 +++++-----
>>            src/shader/exacmnv110.fpc | 18 +++++++++---------
>>            src/shader/exas8nv110.fp  |  6 +++---
>>            src/shader/exas8nv110.fpc | 12 ++++++------
>>            src/shader/exasanv110.fp  | 10 +++++-----
>>            src/shader/exasanv110.fpc | 18 +++++++++---------
>>            src/shader/exascnv110.fp  |  6 +++---
>>            src/shader/exascnv110.fpc | 10 +++++-----
>>            src/shader/videonv110.fp  | 14 +++++++-------
>>            src/shader/videonv110.fpc | 26 +++++++++++++-------------
>>            14 files changed, 93 insertions(+), 93 deletions(-)
>>
>>         diff --git a/src/shader/exac8nv110.fp b/src/shader/exac8nv110.fp
>>         index ce78036..1c4a4f1 100644
>>         --- a/src/shader/exac8nv110.fp
>>         +++ b/src/shader/exac8nv110.fp
>>         @@ -25,23 +25,23 @@ NV110FP_Composite_A8[] = {
>>            };
>>            #else
>>            -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt
>> 0x1)
>>            ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>            mufu rcp $r0 $r0
>>            ipa $r3 a[0x94] $r0 0x0 0x1
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x1) (st 0xf wr 0x0 rd 0x1 wt 0x3) (st 0xf wr
>>         0x1 wt 0x2)
>>            ipa $r2 a[0x90] $r0 0x0 0x1
>>            tex nodep $r1 $r2 0x0 0x1 t2d 0x8
>>            ipa $r3 a[0x84] $r0 0x0 0x1
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x2) (st 0xf wr 0x1 wt 0x6) (st 0xf)
>>            ipa $r2 a[0x80] $r0 0x0 0x1
>>            tex nodep $r0 $r2 0x0 0x0 t2d 0x8
>>
>>
>>     Out of curiosity, what didn't you add a read-dep-bar on $r2:$r3 here?
>>
>> Missed it, thanks for pointing it out.
>>
>
> You don't have to. 'tex' reads two sources ($r2:$r3) and writes into $r0,
> but as $r2:$r3 are NOT re-used before $r0 is read, you can assume that $r0
> will be ready and don't need any read-dep-bar.

Ah, so r2:r3, which are written on by the two 'ipa' above it, have already
been waited on in this tex, and both of them read $r0 so we can safely
assume that since the two 'ipa' instructions are already waited on, $r0
will be ready?

>




>
>
>>
>>
>>            depbar le 0x5 0x0 0x0
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x6 wt 0x3) (st 0x6) (st 0x1)
>>            fmul ftz $r3 $r0 $r1
>>            mov $r2 $r3 0xf
>>
>>
>>     You can stall for only one cycle here, but the 6 cycles on fmul is
>>     needed.
>>
>>            mov $r1 $r3 0xf
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x6) (st 0xf) (st 0x0)
>>            mov $r0 $r3 0xf
>>
>>
>>     Same here.
>>
>>
>>            exit
>>            #endif
>>         diff --git a/src/shader/exac8nv110.fpc b/src/shader/exac8nv110.fpc
>>         index 4aa1368..46943b7 100644
>>         --- a/src/shader/exac8nv110.fpc
>>         +++ b/src/shader/exac8nv110.fpc
>>         @@ -1,36 +1,36 @@
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1a0070f,
>>         +0x003c3c01,
>>            0xcff7ff00,
>>            0xe003ff87,
>>            0x00470000,
>>            0x50800000,
>>            0x4007ff03,
>>            0xe043ff89,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0x21e0072f,
>>         +0x005cbc03,
>>            0x0007ff02,
>>            0xe043ff89,
>>            0x2ff70201,
>>            0xc03a0014,
>>            0x4007ff03,
>>            0xe043ff88,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe5e0074f,
>>         +0x001fbc06,
>>            0x0007ff02,
>>            0xe043ff88,
>>            0x2ff70200,
>>            0xc03a0004,
>>            0x34070000,
>>            0xf0f00000,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xfcc01fe6,
>>         +0x001f8400,
>>            0x00170003,
>>            0x5c681000,
>>            0x00370002,
>>            0x5c980780,
>>            0x00370001,
>>            0x5c980780,
>>         -0xfc0007e0,
>>         +0xfde007e6,
>>            0x001f8000,
>>            0x00370000,
>>            0x5c980780,
>>         diff --git a/src/shader/exacanv110.fp b/src/shader/exacanv110.fp
>>         index a70d5c5..d7c2867 100644
>>         --- a/src/shader/exacanv110.fp
>>         +++ b/src/shader/exacanv110.fp
>>         @@ -25,23 +25,23 @@ NV110FP_CAComposite[] = {
>>            };
>>            #else
>>            -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt
>> 0x1)
>>            ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>            mufu rcp $r0 $r0
>>            ipa $r3 a[0x94] $r0 0x0 0x1
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1 rd
>> 0x2)
>>            ipa $r2 a[0x90] $r0 0x0 0x1
>>            tex nodep $r4 $r2 0x0 0x1 t2d 0xf
>>
>>
>>     Please add a read-dep-bar and wait for on the first fmul because
>>     $r2:$r3 are re-used before $r4. Should be safer.
>>
>>
>>            ipa $r1 a[0x84] $r0 0x0 0x1
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x2 wt 0x4) (st 0xf wr 0x1 wt 0x6) (st 0xf)
>>            ipa $r0 a[0x80] $r0 0x0 0x1
>>            tex nodep $r0 $r0 0x0 0x0 t2d 0xf
>>            depbar le 0x5 0x0 0x0
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x1 wt 0x3f) (st 0x1) (st 0x1)
>>            fmul ftz $r3 $r3 $r7
>>
>>
>>     Why are you waiting all barriers? Only $r3 is needed here.
>>
>> After adding a read-dep-bar and waiting on that over here, I wasn't able
>> to pass the same number of `rendercheck -f a8r8g8b8` tests as before this
>> patch.  After a little trial and error I discovered that wt 0xc fixes it,
>> which means that bar 3 and 4 were being used in this fmul somehow (assuming
>> bars start from 1), which is odd because this fmul only uses $r3 and $r7,
>> and I think it should wait on the read-dep-bar set on "tex nodep $r4 $r2
>> 0x0 0x1 t2d 0xf" (I could be wrong though). I'm kinda stumped on what's
>> going on within this fmul that's causing this behavior.
>>
>
> Because you are missing a read-dep-bar on the first 'tex' in this shader.
> Presumably, if you add one, you no longer need to wait for all bars.

I made some changes which you can check out here
https://hastebin.com/cazirimeva.bash. Here are my comments on the same:
In ' sched (st 0x1 wt 0x2) (st 0x1) (st 0x1 wt 0x4)' I'm facing the same
issue, even after waiting on the read-dep bar set on the first 'tex'. I
replaced 'wt 0x2' with 'wt 0x4' so it waits on bar 3 instead of bar 2 which
was set as the read-dep bar, and the above issue goes away. It's kinda odd
for me because bar 3 is set for $r0 on the second 'tex' and that fmul
doesn't seem to use it anywhere.

Cheers,
Aaryaman

>
>
> Samuel.
>
>
>>
>>
>>            fmul ftz $r2 $r2 $r6
>>            fmul ftz $r1 $r1 $r5
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x1 wt 0x3) (st 0xf) (st 0x0)
>>            fmul ftz $r0 $r0 $r4
>>            exit
>>            #endif
>>         diff --git a/src/shader/exacanv110.fpc b/src/shader/exacanv110.fpc
>>         index 7c0ca5e..9cad139 100644
>>         --- a/src/shader/exacanv110.fpc
>>         +++ b/src/shader/exacanv110.fpc
>>         @@ -1,36 +1,36 @@
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1a0070f,
>>         +0x003c3c01,
>>            0xcff7ff00,
>>            0xe003ff87,
>>            0x00470000,
>>            0x50800000,
>>            0x4007ff03,
>>            0xe043ff89,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1e0072f,
>>         +0x0008bc03,
>>            0x0007ff02,
>>            0xe043ff89,
>>            0xaff70204,
>>            0xc03a0017,
>>            0x4007ff01,
>>            0xe043ff88,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe5e0274f,
>>         +0x001fbc06,
>>            0x0007ff00,
>>            0xe043ff88,
>>            0xaff70000,
>>            0xc03a0007,
>>            0x34070000,
>>            0xf0f00000,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xfc21ffe1,
>>         +0x001f8400,
>>            0x00770303,
>>            0x5c681000,
>>            0x00670202,
>>            0x5c681000,
>>            0x00570101,
>>            0x5c681000,
>>         -0xfc0007e0,
>>         +0xfde01fe1,
>>            0x001f8000,
>>            0x00470000,
>>            0x5c681000,
>>         diff --git a/src/shader/exacmnv110.fp b/src/shader/exacmnv110.fp
>>         index fe5c294..d717138 100644
>>         --- a/src/shader/exacmnv110.fp
>>         +++ b/src/shader/exacmnv110.fp
>>         @@ -25,23 +25,23 @@ NV110FP_Composite[] = {
>>            };
>>            #else
>>            -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt
>> 0x1)
>>            ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>            mufu rcp $r0 $r0
>>            ipa $r3 a[0x94] $r0 0x0 0x1
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1 rd
>> 0x2)
>>            ipa $r2 a[0x90] $r0 0x0 0x1
>>            tex nodep $r4 $r2 0x0 0x1 t2d 0x8
>>            ipa $r1 a[0x84] $r0 0x0 0x1
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x2 wt 0x4) (st 0xf wr 0x1 wt 0x6) (st 0xf)
>>            ipa $r0 a[0x80] $r0 0x0 0x1
>>            tex nodep $r0 $r0 0x0 0x0 t2d 0xf
>>            depbar le 0x5 0x0 0x0
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x1 wt 0x3f) (st 0x1) (st 0x1)
>>            fmul ftz $r3 $r3 $r4
>>            fmul ftz $r2 $r2 $r4
>>            fmul ftz $r1 $r1 $r4
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x6 wt 0x2) (st 0xf) (st 0x0)
>>            fmul ftz $r0 $r0 $r4
>>            exit
>>            #endif
>>         diff --git a/src/shader/exacmnv110.fpc b/src/shader/exacmnv110.fpc
>>         index 9d62c1a..c150875 100644
>>         --- a/src/shader/exacmnv110.fpc
>>         +++ b/src/shader/exacmnv110.fpc
>>         @@ -1,36 +1,36 @@
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1a0070f,
>>         +0x003c3c01,
>>            0xcff7ff00,
>>            0xe003ff87,
>>            0x00470000,
>>            0x50800000,
>>            0x4007ff03,
>>            0xe043ff89,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1e0072f,
>>         +0x0008bc03,
>>            0x0007ff02,
>>            0xe043ff89,
>>            0x2ff70204,
>>            0xc03a0014,
>>            0x4007ff01,
>>            0xe043ff88,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe5e0274f,
>>         +0x001fbc06,
>>            0x0007ff00,
>>            0xe043ff88,
>>            0xaff70000,
>>            0xc03a0007,
>>            0x34070000,
>>            0xf0f00000,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xfc21ffe1,
>>         +0x001f8400,
>>            0x00470303,
>>            0x5c681000,
>>            0x00470202,
>>            0x5c681000,
>>            0x00470101,
>>            0x5c681000,
>>         -0xfc0007e0,
>>         +0xfde017e6,
>>            0x001f8000,
>>            0x00470000,
>>            0x5c681000,
>>         diff --git a/src/shader/exas8nv110.fp b/src/shader/exas8nv110.fp
>>         index 4fe2e19..a555beb 100644
>>         --- a/src/shader/exas8nv110.fp
>>         +++ b/src/shader/exas8nv110.fp
>>         @@ -25,15 +25,15 @@ NV110FP_Source_A8[] = {
>>            };
>>            #else
>>            -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt
>> 0x1)
>>            ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>            mufu rcp $r0 $r0
>>            ipa $r1 a[0x84] $r0 0x0 0x1
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf)
>>            ipa $r0 a[0x80] $r0 0x0 0x1
>>            tex nodep $r0 $r0 0x0 0x0 t2d 0x8
>>            depbar le 0x5 0x0 0x0
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x1 wt 0x1) (st 0x1) (st 0x1)
>>            mov $r3 $r0 0xf
>>            mov $r2 $r0 0xf
>>            mov $r1 $r0 0xf
>>
>>
>>     This one looks good!
>>
>>
>>         diff --git a/src/shader/exas8nv110.fpc b/src/shader/exas8nv110.fpc
>>         index 1181c41..e58d168 100644
>>         --- a/src/shader/exas8nv110.fpc
>>         +++ b/src/shader/exas8nv110.fpc
>>         @@ -1,21 +1,21 @@
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1a0070f,
>>         +0x003c3c01,
>>            0xcff7ff00,
>>            0xe003ff87,
>>            0x00470000,
>>            0x50800000,
>>            0x4007ff01,
>>            0xe043ff88,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1e0072f,
>>         +0x001fbc03,
>>            0x0007ff00,
>>            0xe043ff88,
>>            0x2ff70000,
>>            0xc03a0004,
>>            0x34070000,
>>            0xf0f00000,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xfc200fe1,
>>         +0x001f8400,
>>            0x00070003,
>>            0x5c980780,
>>            0x00070002,
>>         diff --git a/src/shader/exasanv110.fp b/src/shader/exasanv110.fp
>>         index 61374a6..ad7ca36 100644
>>         --- a/src/shader/exasanv110.fp
>>         +++ b/src/shader/exasanv110.fp
>>         @@ -25,23 +25,23 @@ NV110FP_CACompositeSrcAlpha[] = {
>>            };
>>            #else
>>            -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt
>> 0x1)
>>            ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>            mufu rcp $r0 $r0
>>            ipa $r3 a[0x84] $r0 0x0 0x1
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1 rd
>> 0x2)
>>            ipa $r2 a[0x80] $r0 0x0 0x1
>>            tex nodep $r4 $r2 0x0 0x0 t2d 0x8
>>            ipa $r1 a[0x94] $r0 0x0 0x1
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x2 wt 0x4) (st 0xf wr 0x1 wt 0x6) (st 0xf)
>>            ipa $r0 a[0x90] $r0 0x0 0x1
>>            tex nodep $r0 $r0 0x0 0x1 t2d 0xf
>>            depbar le 0x5 0x0 0x0
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x1 wt 0x3f) (st 0x1) (st 0x1)
>>            fmul ftz $r3 $r3 $r4
>>            fmul ftz $r2 $r2 $r4
>>            fmul ftz $r1 $r1 $r4
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x1 wt 0x2) (st 0xf) (st 0x0)
>>            fmul ftz $r0 $r0 $r4
>>            exit
>>            #endif
>>         diff --git a/src/shader/exasanv110.fpc b/src/shader/exasanv110.fpc
>>         index 5516a03..1485f11 100644
>>         --- a/src/shader/exasanv110.fpc
>>         +++ b/src/shader/exasanv110.fpc
>>         @@ -1,36 +1,36 @@
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1a0070f,
>>         +0x003c3c01,
>>            0xcff7ff00,
>>            0xe003ff87,
>>            0x00470000,
>>            0x50800000,
>>            0x4007ff03,
>>            0xe043ff88,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1e0072f,
>>         +0x0008bc03,
>>            0x0007ff02,
>>            0xe043ff88,
>>            0x2ff70204,
>>            0xc03a0004,
>>            0x4007ff01,
>>            0xe043ff89,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe5e0274f,
>>         +0x001fbc06,
>>            0x0007ff00,
>>            0xe043ff89,
>>            0xaff70000,
>>            0xc03a0017,
>>            0x34070000,
>>            0xf0f00000,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xfc21ffe1,
>>         +0x001f8400,
>>            0x00470303,
>>            0x5c681000,
>>            0x00470202,
>>            0x5c681000,
>>            0x00470101,
>>            0x5c681000,
>>         -0xfc0007e0,
>>         +0xfde017e1,
>>            0x001f8000,
>>            0x00470000,
>>            0x5c681000,
>>         diff --git a/src/shader/exascnv110.fp b/src/shader/exascnv110.fp
>>         index 90bbb55..86e14e8 100644
>>         --- a/src/shader/exascnv110.fp
>>         +++ b/src/shader/exascnv110.fp
>>         @@ -25,14 +25,14 @@ NV110FP_Source[] = {
>>            };
>>            #else
>>            -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt
>> 0x1)
>>            ipa pass $r0 a[0x7c] 0x0 0x0 0x1
>>            mufu rcp $r0 $r0
>>            ipa $r1 a[0x84] $r0 0x0 0x1
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x1) (st 0xf wt 0x3) (st 0xf)
>>            ipa $r0 a[0x80] $r0 0x0 0x1
>>            tex nodep $r0 $r0 0x0 0x0 t2d 0xf
>>            depbar le 0x5 0x0 0x0
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf) (st 0x0) (st 0x0)
>>
>>
>>     Looks good.
>>
>>
>>            exit
>>            #endif
>>         diff --git a/src/shader/exascnv110.fpc b/src/shader/exascnv110.fpc
>>         index 2dba15d..1fef5d2 100644
>>         --- a/src/shader/exascnv110.fpc
>>         +++ b/src/shader/exascnv110.fpc
>>         @@ -1,20 +1,20 @@
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1a0070f,
>>         +0x003c3c01,
>>            0xcff7ff00,
>>            0xe003ff87,
>>            0x00470000,
>>            0x50800000,
>>            0x4007ff01,
>>            0xe043ff88,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xfde0072f,
>>         +0x001fbc03,
>>            0x0007ff00,
>>            0xe043ff88,
>>            0xaff70000,
>>            0xc03a0007,
>>            0x34070000,
>>            0xf0f00000,
>>         -0xfc0007e0,
>>         +0xfc0007ef,
>>            0x001f8000,
>>            0x0007000f,
>>            0xe3000000,
>>         diff --git a/src/shader/videonv110.fp b/src/shader/videonv110.fp
>>         index 2728311..dd3816c 100644
>>         --- a/src/shader/videonv110.fp
>>         +++ b/src/shader/videonv110.fp
>>         @@ -25,30 +25,30 @@ NV110FP_NV12[] = {
>>            };
>>            #else
>>            -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x0) (st 0xd wr 0x0 wt 0x1) (st 0xf wr 0x0 wt
>> 0x1)
>>            ipa pass $r2 a[0x7c] 0x0 0x0 0x1
>>            mufu rcp $r2 $r2
>>            ipa $r0 a[0x80] $r2 0x0 0x1
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf wr 0x1) (st 0xf wr 0x0 wt 0x3) (st 0xf wr 0x1)
>>            ipa $r1 a[0x84] $r2 0x0 0x1
>>            tex nodep $r4 $r0 0x0 0x0 t2d 0x8
>>            tex nodep $r0 $r0 0x0 0x1 t2d 0xc
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf) (st 0x6 wt 0x1) (st 0x6)
>>            depbar le 0x5 0x1 0x1
>>            fmul ftz $r5 $r4 c0[0x0]
>>            fadd ftz $r3 $r5 c0[0x4]
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x6) (st 0x6) (st 0xf)
>>            fadd ftz $r4 $r5 c0[0x8]
>>            fadd ftz $r5 $r5 c0[0xc]
>>            depbar le 0x5 0x0 0x0
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x6 wt 0x2) (st 0x1) (st 0x1)
>>            ffma ftz $r3 $r0 c0[0x10] $r3
>>            ffma ftz $r4 $r0 c0[0x14] $r4
>>            ffma ftz $r5 $r0 c0[0x18] $r5
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0x1) (st 0x1) (st 0x6)
>>            ffma ftz $r0 $r1 c0[0x1c] $r3
>>            ffma ftz $r2 $r1 c0[0x24] $r5
>>            ffma ftz $r1 $r1 c0[0x20] $r4
>>         -sched (st 0x0) (st 0x0) (st 0x0)
>>         +sched (st 0xf) (st 0x0) (st 0x0)
>>            exit
>>            #endif
>>         diff --git a/src/shader/videonv110.fpc b/src/shader/videonv110.fpc
>>         index 31d745a..8fbc246 100644
>>         --- a/src/shader/videonv110.fpc
>>         +++ b/src/shader/videonv110.fpc
>>         @@ -1,52 +1,52 @@
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1a0070f,
>>         +0x003c3c01,
>>            0xcff7ff02,
>>            0xe003ff87,
>>            0x00470202,
>>            0x50800000,
>>            0x0027ff00,
>>            0xe043ff88,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xe1e0072f,
>>         +0x001cbc03,
>>            0x4027ff01,
>>            0xe043ff88,
>>            0x2ff70004,
>>            0xc03a0004,
>>            0x2ff70000,
>>            0xc03a0016,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xfcc007ef,
>>         +0x001f9801,
>>            0x34170001,
>>            0xf0f00000,
>>            0x00070405,
>>            0x4c681000,
>>            0x00170503,
>>            0x4c581000,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xfcc007e6,
>>         +0x001fbc00,
>>            0x00270504,
>>            0x4c581000,
>>            0x00370505,
>>            0x4c581000,
>>            0x34070000,
>>            0xf0f00000,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xfc2017e6,
>>         +0x001f8400,
>>            0x00470003,
>>            0x49a00180,
>>            0x00570004,
>>            0x49a00200,
>>            0x00670005,
>>            0x49a00280,
>>         -0xfc0007e0,
>>         -0x001f8000,
>>         +0xfc2007e1,
>>         +0x001f9800,
>>            0x00770100,
>>            0x49a00180,
>>            0x00970102,
>>            0x49a00280,
>>            0x00870101,
>>            0x49a00200,
>>         -0xfc0007e0,
>>         +0xfc0007ef,
>>            0x001f8000,
>>            0x0007000f,
>>            0xe3000000,
>>
>> As for your other comments, I have made the suggested changes.
>>
>> Thanks for your review!
>>
>> Cheers,
>> Aaryaman
>>
>

--001a11c10fc604bcc20551746150
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIFRodSwgSnVuIDgsIDIwMTcgYXQgNTowMSBBTSwgU2FtdWVsIFBp
dG9pc2V0IDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnNhbXVlbC5waXRvaXNl
dEBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5zYW11ZWwucGl0b2lzZXRAZ21haWwuY29tPC9h
PiZndDs8L3NwYW4+IHdyb3RlOjxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigy
MDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGJyPg0KPGJyPg0KT24gMDYvMDcvMjAxNyAw
Njo1OCBQTSwgQWFyeWFtYW4gVmFzaXNodGEgd3JvdGU6PGJyPg0KPGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0
OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxzcGFuIGNsYXNz
PSJtXy00NTQyMjI5NTc0Mzc3NzkxMDA0bV8tNzA3MzU2NzMzNTg2MTU4MzA5N2dtYWlsLSI+DQo8
YnI+DQo8YnI+DQpPbiBUdWUsIEp1biA2LCAyMDE3IGF0IDc6MTUgQU0sIFNhbXVlbCBQaXRvaXNl
dCAmbHQ7PGEgaHJlZj0ibWFpbHRvOnNhbXVlbC5waXRvaXNldEBnbWFpbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5zYW11ZWwucGl0b2lzZXRAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpzYW11ZWwucGl0b2lzZXRAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+c2FtdWVs
LnBpdG9pc2V0QGdtYWlsLjx3YnI+Y29tPC9hPiZndDsmZ3Q7IHdyb3RlOjxicj4NCjxicj4NCsKg
IMKgIE5pY2Ugd29yayE8YnI+DQo8YnI+DQrCoCDCoCBTZWUgbXkgY29tbWVudHMgYmVsb3csIGFu
ZCBkb3VibGUtY2hlY2sgaWYgc29tZSBvZiB0aGVtIGNhbiBiZTxicj4NCsKgIMKgIGFwcGxpZWQg
dG8gdGhlIHNoYWRlcnMgSSBkaWRuJiMzOTt0IHJldmlldyB5ZXQuPGJyPg0KPGJyPg0KwqAgwqAg
SSByZWNvbW1lbmQgeW91IHRvIHRlc3QgeW91ciB3b3JrIGJlY2F1c2UgaWYgb25lIHNjaGVkIGNv
ZGUgaXM8YnI+DQrCoCDCoCB3cm9uZywgeW91IGFyZSBsaWtlbHkgZ29pbmcgdG8ga2lsbCB5b3Vy
IGNhcmQgYW5kIHJlYm9vdCB5b3VyIGJveC4gOi0pPGJyPg0KPGJyPg0KPGJyPg0KwqAgwqAgT24g
MDYvMDMvMjAxNyAwNDoxNiBQTSwgQWFyeWFtYW4gVmFzaXNodGEgd3JvdGU6PGJyPg0KPGJyPg0K
wqAgwqAgwqAgwqAgdjI6IEFkZCBtaXNzaW5nIGRlbGF5czxicj4NCjxicj4NCsKgIMKgIMKgIMKg
IFRoaXMgcGF0Y2ggYWRkcyBwcm9wZXIgZGVsYXlzIHRvIG1heHdlbGwgZXhhIHNoYWRlcnMuPGJy
Pg0KwqAgwqAgwqAgwqAgcmVuZGVyY2hlY2sgdGVzdHM8YnI+DQrCoCDCoCDCoCDCoCBzZWVtIGNv
bnNpc3RlbnQgd2l0aC93aXRob3V0IHRoaXMgcGF0Y2guIEkgaGF2ZW4mIzM5O3QgZXh0ZW5zaXZl
bHk8YnI+DQrCoCDCoCDCoCDCoCB0ZXN0ZWQ8YnI+DQrCoCDCoCDCoCDCoCB0aGVtIHRob3VnaC48
YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBUcmVsbG86PGJyPg0KwqAgwqAgwqAgwqAgPGEgaHJlZj0i
aHR0cHM6Ly90cmVsbG8uY29tL2MvNkxQQjJFSVMvMTc0LXVwZGF0ZS1tYXh3ZWxsLXNoYWRlcnMt
d2l0aC1wcm9wZXItZGVsYXlzIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL3RyZWxsby5jb20vYy82TFBCMkVJUy88d2JyPjE3NC11cGRhdGUtbWF4d2VsbC1zaGFkZXJz
LXdpdDx3YnI+aC1wcm9wZXItZGVsYXlzPC9hPjxicj4NCsKgIMKgIMKgIMKgICZsdDs8YSBocmVm
PSJodHRwczovL3RyZWxsby5jb20vYy82TFBCMkVJUy8xNzQtdXBkYXRlLW1heHdlbGwtc2hhZGVy
cy13aXRoLXByb3Blci1kZWxheXMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8vdHJlbGxvLmNvbS9jLzZMUEIyRUlTPHdicj4vMTc0LXVwZGF0ZS1tYXh3ZWxsLXNoYWRl
cnMtd2k8d2JyPnRoLXByb3Blci1kZWxheXM8L2E+Jmd0Ozxicj4NCjxicj4NCsKgIMKgIMKgIMKg
IFNpZ25lZC1vZmYtYnk6IEFhcnlhbWFuIFZhc2lzaHRhICZsdDs8YSBocmVmPSJtYWlsdG86amVt
NDU2LnZhc2lzaHRhQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmplbTQ1Ni52YXNpc2h0YUBn
bWFpbC5jb208L2E+PGJyPjwvc3Bhbj4NCsKgIMKgIMKgIMKgICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmplbTQ1Ni52YXNpc2h0YUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5qZW00NTYu
dmFzaXNodGFAZ21haWwuPHdicj5jb208L2E+Jmd0OyZndDs8ZGl2PjxkaXYgY2xhc3M9Im1fLTQ1
NDIyMjk1NzQzNzc3OTEwMDRtXy03MDczNTY3MzM1ODYxNTgzMDk3Z21haWwtaDUiPjxicj4NCsKg
IMKgIMKgIMKgIC0tLTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgc3JjL3NoYWRlci9leGFjOG52MTEw
LmZwwqAgfCAxMCArKysrKy0tLS0tPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBzcmMvc2hhZGVyL2V4
YWM4bnYxMTAuZnBjIHwgMTggKysrKysrKysrLS0tLS0tLS0tPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqBzcmMvc2hhZGVyL2V4YWNhbnYxMTAuZnDCoCB8IDEwICsrKysrLS0tLS08YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoHNyYy9zaGFkZXIvZXhhY2FudjExMC5mcGMgfCAxOCArKysrKysrKystLS0tLS0t
LS08YnI+DQrCoCDCoCDCoCDCoCDCoCDCoHNyYy9zaGFkZXIvZXhhY21udjExMC5mcMKgIHwgMTAg
KysrKystLS0tLTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgc3JjL3NoYWRlci9leGFjbW52MTEwLmZw
YyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgc3JjL3NoYWRl
ci9leGFzOG52MTEwLmZwwqAgfMKgIDYgKysrLS0tPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBzcmMv
c2hhZGVyL2V4YXM4bnYxMTAuZnBjIHwgMTIgKysrKysrLS0tLS0tPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqBzcmMvc2hhZGVyL2V4YXNhbnYxMTAuZnDCoCB8IDEwICsrKysrLS0tLS08YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoHNyYy9zaGFkZXIvZXhhc2FudjExMC5mcGMgfCAxOCArKysrKysrKystLS0t
LS0tLS08YnI+DQrCoCDCoCDCoCDCoCDCoCDCoHNyYy9zaGFkZXIvZXhhc2NudjExMC5mcMKgIHzC
oCA2ICsrKy0tLTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgc3JjL3NoYWRlci9leGFzY252MTEwLmZw
YyB8IDEwICsrKysrLS0tLS08YnI+DQrCoCDCoCDCoCDCoCDCoCDCoHNyYy9zaGFkZXIvdmlkZW9u
djExMC5mcMKgIHwgMTQgKysrKysrKy0tLS0tLS08YnI+DQrCoCDCoCDCoCDCoCDCoCDCoHNyYy9z
aGFkZXIvdmlkZW9udjExMC5mcGMgfCAyNiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLTxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgMTQgZmlsZXMgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgOTMg
ZGVsZXRpb25zKC0pPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgZGlmZiAtLWdpdCBhL3NyYy9zaGFk
ZXIvZXhhYzhudjExMC5mcCBiL3NyYy9zaGFkZXIvZXhhYzhudjExMC5mcDxicj4NCsKgIMKgIMKg
IMKgIGluZGV4IGNlNzgwMzYuLjFjNGE0ZjEgMTAwNjQ0PGJyPg0KwqAgwqAgwqAgwqAgLS0tIGEv
c3JjL3NoYWRlci9leGFjOG52MTEwLmZwPGJyPg0KwqAgwqAgwqAgwqAgKysrIGIvc3JjL3NoYWRl
ci9leGFjOG52MTEwLmZwPGJyPg0KwqAgwqAgwqAgwqAgQEAgLTI1LDIzICsyNSwyMyBAQCBOVjEx
MEZQX0NvbXBvc2l0ZV9BOFtdID0gezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCNlbHNlPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAtc2NoZWQgKHN0IDB4MCkg
KHN0IDB4MCkgKHN0IDB4MCk8YnI+DQrCoCDCoCDCoCDCoCArc2NoZWQgKHN0IDB4ZiB3ciAweDAp
IChzdCAweGQgd3IgMHgwIHd0IDB4MSkgKHN0IDB4ZiB3ciAweDAgd3QgMHgxKTxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgaXBhIHBhc3MgJHIwIGFbMHg3Y10gMHgwIDB4MCAweDE8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoG11ZnUgcmNwICRyMCAkcjA8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGlwYSAkcjMg
YVsweDk0XSAkcjAgMHgwIDB4MTxicj4NCsKgIMKgIMKgIMKgIC1zY2hlZCAoc3QgMHgwKSAoc3Qg
MHgwKSAoc3QgMHgwKTxicj4NCsKgIMKgIMKgIMKgICtzY2hlZCAoc3QgMHhmIHdyIDB4MSkgKHN0
IDB4ZiB3ciAweDAgcmQgMHgxIHd0IDB4MykgKHN0IDB4ZiB3cjxicj4NCsKgIMKgIMKgIMKgIDB4
MSB3dCAweDIpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBpcGEgJHIyIGFbMHg5MF0gJHIwIDB4MCAw
eDE8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoHRleCBub2RlcCAkcjEgJHIyIDB4MCAweDEgdDJkIDB4
ODxicj4NCsKgIMKgIMKgIMKgIMKgIMKgaXBhICRyMyBhWzB4ODRdICRyMCAweDAgMHgxPGJyPg0K
wqAgwqAgwqAgwqAgLXNjaGVkIChzdCAweDApIChzdCAweDApIChzdCAweDApPGJyPg0KwqAgwqAg
wqAgwqAgK3NjaGVkIChzdCAweGYgd3IgMHgyKSAoc3QgMHhmIHdyIDB4MSB3dCAweDYpIChzdCAw
eGYpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBpcGEgJHIyIGFbMHg4MF0gJHIwIDB4MCAweDE8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoHRleCBub2RlcCAkcjAgJHIyIDB4MCAweDAgdDJkIDB4ODxicj4N
Cjxicj4NCjxicj4NCsKgIMKgIE91dCBvZiBjdXJpb3NpdHksIHdoYXQgZGlkbiYjMzk7dCB5b3Ug
YWRkIGEgcmVhZC1kZXAtYmFyIG9uICRyMjokcjMgaGVyZT88YnI+DQo8YnI+DQpNaXNzZWQgaXQs
IHRoYW5rcyBmb3IgcG9pbnRpbmcgaXQgb3V0Ljxicj4NCjwvZGl2PjwvZGl2PjwvYmxvY2txdW90
ZT4NCjxicj4NCllvdSBkb24mIzM5O3QgaGF2ZSB0by4gJiMzOTt0ZXgmIzM5OyByZWFkcyB0d28g
c291cmNlcyAoJHIyOiRyMykgYW5kIHdyaXRlcyBpbnRvICRyMCwgYnV0IGFzICRyMjokcjMgYXJl
IE5PVCByZS11c2VkIGJlZm9yZSAkcjAgaXMgcmVhZCwgeW91IGNhbiBhc3N1bWUgdGhhdCAkcjAg
d2lsbCBiZSByZWFkeSBhbmQgZG9uJiMzOTt0IG5lZWQgYW55IHJlYWQtZGVwLWJhci48L2Jsb2Nr
cXVvdGU+PGRpdj5BaCwgc28gcjI6cjMsIHdoaWNoIGFyZSB3cml0dGVuIG9uIGJ5IHRoZSB0d28g
JiMzOTtpcGEmIzM5OyBhYm92ZSBpdCwgaGF2ZSBhbHJlYWR5IGJlZW4gd2FpdGVkIG9uIGluIHRo
aXMgdGV4LCBhbmQgYm90aCBvZiB0aGVtIHJlYWQgJHIwIHNvIHdlIGNhbiBzYWZlbHkgYXNzdW1l
IHRoYXQgc2luY2UgdGhlIHR3byAmIzM5O2lwYSYjMzk7IGluc3RydWN0aW9ucyBhcmUgYWxyZWFk
eSB3YWl0ZWQgb24sICRyMCB3aWxsIGJlIHJlYWR5PzwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDox
cHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij7CoDwvYmxvY2txdW90
ZT48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+wqA8L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXY+PGRpdiBjbGFzcz0ibV8tNDU0MjIy
OTU3NDM3Nzc5MTAwNG1fLTcwNzM1NjczMzU4NjE1ODMwOTdnbWFpbC1oNSI+PGJyPg0KPGJyPg0K
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPg0KPGJyPg0KPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBkZXBiYXIgbGUgMHg1
IDB4MCAweDA8YnI+DQrCoCDCoCDCoCDCoCAtc2NoZWQgKHN0IDB4MCkgKHN0IDB4MCkgKHN0IDB4
MCk8YnI+DQrCoCDCoCDCoCDCoCArc2NoZWQgKHN0IDB4NiB3dCAweDMpIChzdCAweDYpIChzdCAw
eDEpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBmbXVsIGZ0eiAkcjMgJHIwICRyMTxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgbW92ICRyMiAkcjMgMHhmPGJyPg0KPGJyPg0KPGJyPg0KwqAgwqAgWW91IGNh
biBzdGFsbCBmb3Igb25seSBvbmUgY3ljbGUgaGVyZSwgYnV0IHRoZSA2IGN5Y2xlcyBvbiBmbXVs
IGlzPGJyPg0KwqAgwqAgbmVlZGVkLjxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgbW92ICRy
MSAkcjMgMHhmPGJyPg0KwqAgwqAgwqAgwqAgLXNjaGVkIChzdCAweDApIChzdCAweDApIChzdCAw
eDApPGJyPg0KwqAgwqAgwqAgwqAgK3NjaGVkIChzdCAweDYpIChzdCAweGYpIChzdCAweDApPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqBtb3YgJHIwICRyMyAweGY8YnI+DQo8YnI+DQo8YnI+DQrCoCDC
oCBTYW1lIGhlcmUuIDxicj4NCjxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgZXhpdDxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgI2VuZGlmPGJyPg0KwqAgwqAgwqAgwqAgZGlmZiAtLWdpdCBhL3Ny
Yy9zaGFkZXIvZXhhYzhudjExMC5mcGMgYi9zcmMvc2hhZGVyL2V4YWM4bnYxMTAuZnBjPGJyPg0K
wqAgwqAgwqAgwqAgaW5kZXggNGFhMTM2OC4uNDY5NDNiNyAxMDA2NDQ8YnI+DQrCoCDCoCDCoCDC
oCAtLS0gYS9zcmMvc2hhZGVyL2V4YWM4bnYxMTAuZnBjPGJyPg0KwqAgwqAgwqAgwqAgKysrIGIv
c3JjL3NoYWRlci9leGFjOG52MTEwLmZwYzxicj4NCsKgIMKgIMKgIMKgIEBAIC0xLDM2ICsxLDM2
IEBAPGJyPg0KwqAgwqAgwqAgwqAgLTB4ZmMwMDA3ZTAsPGJyPg0KwqAgwqAgwqAgwqAgLTB4MDAx
ZjgwMDAsPGJyPg0KwqAgwqAgwqAgwqAgKzB4ZTFhMDA3MGYsPGJyPg0KwqAgwqAgwqAgwqAgKzB4
MDAzYzNjMDEsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGNmZjdmZjAwLDxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgMHhlMDAzZmY4Nyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDA0NzAwMDAsPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAweDUwODAwMDAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg0
MDA3ZmYwMyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4ZTA0M2ZmODksPGJyPg0KwqAgwqAgwqAg
wqAgLTB4ZmMwMDA3ZTAsPGJyPg0KwqAgwqAgwqAgwqAgLTB4MDAxZjgwMDAsPGJyPg0KwqAgwqAg
wqAgwqAgKzB4MjFlMDA3MmYsPGJyPg0KwqAgwqAgwqAgwqAgKzB4MDA1Y2JjMDMsPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAweDAwMDdmZjAyLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhlMDQzZmY4
OSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MmZmNzAyMDEsPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAweGMwM2EwMDE0LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg0MDA3ZmYwMyw8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoDB4ZTA0M2ZmODgsPGJyPg0KwqAgwqAgwqAgwqAgLTB4ZmMwMDA3ZTAsPGJy
Pg0KwqAgwqAgwqAgwqAgLTB4MDAxZjgwMDAsPGJyPg0KwqAgwqAgwqAgwqAgKzB4ZTVlMDA3NGYs
PGJyPg0KwqAgwqAgwqAgwqAgKzB4MDAxZmJjMDYsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDAw
MDdmZjAyLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhlMDQzZmY4OCw8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoDB4MmZmNzAyMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGMwM2EwMDA0LDxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgMHgzNDA3MDAwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4ZjBm
MDAwMDAsPGJyPg0KwqAgwqAgwqAgwqAgLTB4ZmMwMDA3ZTAsPGJyPg0KwqAgwqAgwqAgwqAgLTB4
MDAxZjgwMDAsPGJyPg0KwqAgwqAgwqAgwqAgKzB4ZmNjMDFmZTYsPGJyPg0KwqAgwqAgwqAgwqAg
KzB4MDAxZjg0MDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDAwMTcwMDAzLDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgMHg1YzY4MTAwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDAzNzAwMDIs
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDVjOTgwNzgwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
MHgwMDM3MDAwMSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4NWM5ODA3ODAsPGJyPg0KwqAgwqAg
wqAgwqAgLTB4ZmMwMDA3ZTAsPGJyPg0KwqAgwqAgwqAgwqAgKzB4ZmRlMDA3ZTYsPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAweDAwMWY4MDAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHgwMDM3MDAw
MCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4NWM5ODA3ODAsPGJyPg0KwqAgwqAgwqAgwqAgZGlm
ZiAtLWdpdCBhL3NyYy9zaGFkZXIvZXhhY2FudjExMC5mcCBiL3NyYy9zaGFkZXIvZXhhY2FudjEx
MC5mcDxicj4NCsKgIMKgIMKgIMKgIGluZGV4IGE3MGQ1YzUuLmQ3YzI4NjcgMTAwNjQ0PGJyPg0K
wqAgwqAgwqAgwqAgLS0tIGEvc3JjL3NoYWRlci9leGFjYW52MTEwLmZwPGJyPg0KwqAgwqAgwqAg
wqAgKysrIGIvc3JjL3NoYWRlci9leGFjYW52MTEwLmZwPGJyPg0KwqAgwqAgwqAgwqAgQEAgLTI1
LDIzICsyNSwyMyBAQCBOVjExMEZQX0NBQ29tcG9zaXRlW10gPSB7PGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgI2Vsc2U8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oC1zY2hlZCAoc3QgMHgwKSAoc3QgMHgwKSAoc3QgMHgwKTxicj4NCsKgIMKgIMKgIMKgICtzY2hl
ZCAoc3QgMHhmIHdyIDB4MCkgKHN0IDB4ZCB3ciAweDAgd3QgMHgxKSAoc3QgMHhmIHdyIDB4MCB3
dCAweDEpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBpcGEgcGFzcyAkcjAgYVsweDdjXSAweDAgMHgw
IDB4MTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgbXVmdSByY3AgJHIwICRyMDxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgaXBhICRyMyBhWzB4OTRdICRyMCAweDAgMHgxPGJyPg0KwqAgwqAgwqAgwqAgLXNj
aGVkIChzdCAweDApIChzdCAweDApIChzdCAweDApPGJyPg0KwqAgwqAgwqAgwqAgK3NjaGVkIChz
dCAweGYgd3IgMHgxKSAoc3QgMHhmIHdyIDB4MCB3dCAweDMpIChzdCAweGYgd3IgMHgxIHJkIDB4
Mik8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGlwYSAkcjIgYVsweDkwXSAkcjAgMHgwIDB4MTxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgdGV4IG5vZGVwICRyNCAkcjIgMHgwIDB4MSB0MmQgMHhmPGJyPg0K
PGJyPg0KPGJyPg0KwqAgwqAgUGxlYXNlIGFkZCBhIHJlYWQtZGVwLWJhciBhbmQgd2FpdCBmb3Ig
b24gdGhlIGZpcnN0IGZtdWwgYmVjYXVzZTxicj4NCsKgIMKgICRyMjokcjMgYXJlIHJlLXVzZWQg
YmVmb3JlICRyNC4gU2hvdWxkIGJlIHNhZmVyLiA8YnI+DQo8YnI+DQo8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoGlwYSAkcjEgYVsweDg0XSAkcjAgMHgwIDB4MTxicj4NCsKgIMKgIMKgIMKgIC1zY2hl
ZCAoc3QgMHgwKSAoc3QgMHgwKSAoc3QgMHgwKTxicj4NCsKgIMKgIMKgIMKgICtzY2hlZCAoc3Qg
MHhmIHdyIDB4MiB3dCAweDQpIChzdCAweGYgd3IgMHgxIHd0IDB4NikgKHN0IDB4Zik8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoGlwYSAkcjAgYVsweDgwXSAkcjAgMHgwIDB4MTxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgdGV4IG5vZGVwICRyMCAkcjAgMHgwIDB4MCB0MmQgMHhmPGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqBkZXBiYXIgbGUgMHg1IDB4MCAweDA8YnI+DQrCoCDCoCDCoCDCoCAtc2NoZWQgKHN0
IDB4MCkgKHN0IDB4MCkgKHN0IDB4MCk8YnI+DQrCoCDCoCDCoCDCoCArc2NoZWQgKHN0IDB4MSB3
dCAweDNmKSAoc3QgMHgxKSAoc3QgMHgxKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgZm11bCBmdHog
JHIzICRyMyAkcjc8YnI+DQo8YnI+DQo8YnI+DQrCoCDCoCBXaHkgYXJlIHlvdSB3YWl0aW5nIGFs
bCBiYXJyaWVycz8gT25seSAkcjMgaXMgbmVlZGVkIGhlcmUuPGJyPg0KPGJyPg0KQWZ0ZXIgYWRk
aW5nIGEgcmVhZC1kZXAtYmFyIGFuZCB3YWl0aW5nIG9uIHRoYXQgb3ZlciBoZXJlLCBJIHdhc24m
IzM5O3QgYWJsZSB0byBwYXNzIHRoZSBzYW1lIG51bWJlciBvZiBgcmVuZGVyY2hlY2sgLWYgYThy
OGc4YjhgIHRlc3RzIGFzIGJlZm9yZSB0aGlzIHBhdGNoLsKgIEFmdGVyIGEgbGl0dGxlIHRyaWFs
IGFuZCBlcnJvciBJIGRpc2NvdmVyZWQgdGhhdCB3dCAweGMgZml4ZXMgaXQsIHdoaWNoIG1lYW5z
IHRoYXQgYmFyIDMgYW5kIDQgd2VyZSBiZWluZyB1c2VkIGluIHRoaXMgZm11bCBzb21laG93IChh
c3N1bWluZyBiYXJzIHN0YXJ0IGZyb20gMSksIHdoaWNoIGlzIG9kZCBiZWNhdXNlIHRoaXMgZm11
bCBvbmx5IHVzZXMgJHIzIGFuZCAkcjcsIGFuZCBJIHRoaW5rIGl0IHNob3VsZCB3YWl0IG9uIHRo
ZSByZWFkLWRlcC1iYXIgc2V0IG9uICZxdW90O3RleCBub2RlcCAkcjQgJHIyIDB4MCAweDEgdDJk
IDB4ZiZxdW90OyAoSSBjb3VsZCBiZSB3cm9uZyB0aG91Z2gpLiBJJiMzOTttIGtpbmRhIHN0dW1w
ZWQgb24gd2hhdCYjMzk7cyBnb2luZyBvbiB3aXRoaW4gdGhpcyBmbXVsIHRoYXQmIzM5O3MgY2F1
c2luZyB0aGlzIGJlaGF2aW9yLjxicj4NCjwvYmxvY2txdW90ZT4NCjxicj48L2Rpdj48L2Rpdj4N
CkJlY2F1c2UgeW91IGFyZSBtaXNzaW5nIGEgcmVhZC1kZXAtYmFyIG9uIHRoZSBmaXJzdCAmIzM5
O3RleCYjMzk7IGluIHRoaXMgc2hhZGVyLiBQcmVzdW1hYmx5LCBpZiB5b3UgYWRkIG9uZSwgeW91
IG5vIGxvbmdlciBuZWVkIHRvIHdhaXQgZm9yIGFsbCBiYXJzLjwvYmxvY2txdW90ZT48ZGl2Pkkg
bWFkZSBzb21lIGNoYW5nZXMgd2hpY2ggeW91IGNhbiBjaGVjayBvdXQgaGVyZSA8YSBocmVmPSJo
dHRwczovL2hhc3RlYmluLmNvbS9jYXppcmltZXZhLmJhc2giIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL2hhc3RlYmluLmNvbS9jYXppcmltZXY8d2JyPmEuYmFzaDwvYT4uIEhlcmUgYXJlIG15IGNv
bW1lbnRzIG9uIHRoZSBzYW1lOjwvZGl2PjxkaXY+SW4gJiMzOTvCoHNjaGVkIChzdCAweDEgd3Qg
MHgyKSAoc3QgMHgxKSAoc3QgMHgxIHd0IDB4NCkmIzM5OyBJJiMzOTttIGZhY2luZyB0aGUgc2Ft
ZSBpc3N1ZSwgZXZlbiBhZnRlciB3YWl0aW5nIG9uIHRoZSByZWFkLWRlcCBiYXIgc2V0IG9uIHRo
ZSBmaXJzdCAmIzM5O3RleCYjMzk7LiBJIHJlcGxhY2VkICYjMzk7d3QgMHgyJiMzOTsgd2l0aCAm
IzM5O3d0IDB4NCYjMzk7IHNvIGl0IHdhaXRzIG9uIGJhciAzIGluc3RlYWQgb2YgYmFyIDIgd2hp
Y2ggd2FzIHNldCBhcyB0aGUgcmVhZC1kZXAgYmFyLCBhbmQgdGhlIGFib3ZlIGlzc3VlIGdvZXMg
YXdheS4gSXQmIzM5O3Mga2luZGEgb2RkIGZvciBtZSBiZWNhdXNlIGJhciAzIGlzIHNldCBmb3Ig
JHIwIG9uIHRoZSBzZWNvbmQgJiMzOTt0ZXgmIzM5OyBhbmQgdGhhdCBmbXVsIGRvZXNuJiMzOTt0
IHNlZW0gdG8gdXNlIGl0IGFueXdoZXJlLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2hlZXJz
LDwvZGl2PjxkaXY+QWFyeWFtYW7CoDxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNv
bGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PHNwYW4gY2xhc3M9Im1fLTQ1
NDIyMjk1NzQzNzc3OTEwMDRtXy03MDczNTY3MzM1ODYxNTgzMDk3Z21haWwtSE9FblpiIj48Zm9u
dCBjb2xvcj0iIzg4ODg4OCI+PGJyPg0KPGJyPg0KU2FtdWVsLjwvZm9udD48L3NwYW4+PGRpdiBj
bGFzcz0ibV8tNDU0MjIyOTU3NDM3Nzc5MTAwNG1fLTcwNzM1NjczMzU4NjE1ODMwOTdnbWFpbC1I
T0VuWmIiPjxkaXYgY2xhc3M9Im1fLTQ1NDIyMjk1NzQzNzc3OTEwMDRtXy03MDczNTY3MzM1ODYx
NTgzMDk3Z21haWwtaDUiPjxicj4NCjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIw
NCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxicj4NCjxicj4NCjxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgZm11bCBmdHogJHIyICRyMiAkcjY8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGZtdWwg
ZnR6ICRyMSAkcjEgJHI1PGJyPg0KwqAgwqAgwqAgwqAgLXNjaGVkIChzdCAweDApIChzdCAweDAp
IChzdCAweDApPGJyPg0KwqAgwqAgwqAgwqAgK3NjaGVkIChzdCAweDEgd3QgMHgzKSAoc3QgMHhm
KSAoc3QgMHgwKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgZm11bCBmdHogJHIwICRyMCAkcjQ8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoGV4aXQ8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCNlbmRpZjxicj4N
CsKgIMKgIMKgIMKgIGRpZmYgLS1naXQgYS9zcmMvc2hhZGVyL2V4YWNhbnYxMTAuZnBjIGIvc3Jj
L3NoYWRlci9leGFjYW52MTEwLmZwYzxicj4NCsKgIMKgIMKgIMKgIGluZGV4IDdjMGNhNWUuLjlj
YWQxMzkgMTAwNjQ0PGJyPg0KwqAgwqAgwqAgwqAgLS0tIGEvc3JjL3NoYWRlci9leGFjYW52MTEw
LmZwYzxicj4NCsKgIMKgIMKgIMKgICsrKyBiL3NyYy9zaGFkZXIvZXhhY2FudjExMC5mcGM8YnI+
DQrCoCDCoCDCoCDCoCBAQCAtMSwzNiArMSwzNiBAQDxicj4NCsKgIMKgIMKgIMKgIC0weGZjMDAw
N2UwLDxicj4NCsKgIMKgIMKgIMKgIC0weDAwMWY4MDAwLDxicj4NCsKgIMKgIMKgIMKgICsweGUx
YTAwNzBmLDxicj4NCsKgIMKgIMKgIMKgICsweDAwM2MzYzAxLDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgMHhjZmY3ZmYwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4ZTAwM2ZmODcsPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAweDAwNDcwMDAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg1MDgwMDAw
MCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4NDAwN2ZmMDMsPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAweGUwNDNmZjg5LDxicj4NCsKgIMKgIMKgIMKgIC0weGZjMDAwN2UwLDxicj4NCsKgIMKgIMKg
IMKgIC0weDAwMWY4MDAwLDxicj4NCsKgIMKgIMKgIMKgICsweGUxZTAwNzJmLDxicj4NCsKgIMKg
IMKgIMKgICsweDAwMDhiYzAzLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHgwMDA3ZmYwMiw8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoDB4ZTA0M2ZmODksPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGFm
ZjcwMjA0LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhjMDNhMDAxNyw8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoDB4NDAwN2ZmMDEsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGUwNDNmZjg4LDxicj4N
CsKgIMKgIMKgIMKgIC0weGZjMDAwN2UwLDxicj4NCsKgIMKgIMKgIMKgIC0weDAwMWY4MDAwLDxi
cj4NCsKgIMKgIMKgIMKgICsweGU1ZTAyNzRmLDxicj4NCsKgIMKgIMKgIMKgICsweDAwMWZiYzA2
LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHgwMDA3ZmYwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oDB4ZTA0M2ZmODgsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGFmZjcwMDAwLDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgMHhjMDNhMDAwNyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MzQwNzAwMDAs
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGYwZjAwMDAwLDxicj4NCsKgIMKgIMKgIMKgIC0weGZj
MDAwN2UwLDxicj4NCsKgIMKgIMKgIMKgIC0weDAwMWY4MDAwLDxicj4NCsKgIMKgIMKgIMKgICsw
eGZjMjFmZmUxLDxicj4NCsKgIMKgIMKgIMKgICsweDAwMWY4NDAwLDxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgMHgwMDc3MDMwMyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4NWM2ODEwMDAsPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAweDAwNjcwMjAyLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg1YzY4
MTAwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDA1NzAxMDEsPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAweDVjNjgxMDAwLDxicj4NCsKgIMKgIMKgIMKgIC0weGZjMDAwN2UwLDxicj4NCsKgIMKg
IMKgIMKgICsweGZkZTAxZmUxLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHgwMDFmODAwMCw8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDA0NzAwMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDVj
NjgxMDAwLDxicj4NCsKgIMKgIMKgIMKgIGRpZmYgLS1naXQgYS9zcmMvc2hhZGVyL2V4YWNtbnYx
MTAuZnAgYi9zcmMvc2hhZGVyL2V4YWNtbnYxMTAuZnA8YnI+DQrCoCDCoCDCoCDCoCBpbmRleCBm
ZTVjMjk0Li5kNzE3MTM4IDEwMDY0NDxicj4NCsKgIMKgIMKgIMKgIC0tLSBhL3NyYy9zaGFkZXIv
ZXhhY21udjExMC5mcDxicj4NCsKgIMKgIMKgIMKgICsrKyBiL3NyYy9zaGFkZXIvZXhhY21udjEx
MC5mcDxicj4NCsKgIMKgIMKgIMKgIEBAIC0yNSwyMyArMjUsMjMgQEAgTlYxMTBGUF9Db21wb3Np
dGVbXSA9IHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAj
ZWxzZTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgLXNjaGVkIChzdCAweDApIChzdCAweDApIChzdCAw
eDApPGJyPg0KwqAgwqAgwqAgwqAgK3NjaGVkIChzdCAweGYgd3IgMHgwKSAoc3QgMHhkIHdyIDB4
MCB3dCAweDEpIChzdCAweGYgd3IgMHgwIHd0IDB4MSk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGlw
YSBwYXNzICRyMCBhWzB4N2NdIDB4MCAweDAgMHgxPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBtdWZ1
IHJjcCAkcjAgJHIwPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBpcGEgJHIzIGFbMHg5NF0gJHIwIDB4
MCAweDE8YnI+DQrCoCDCoCDCoCDCoCAtc2NoZWQgKHN0IDB4MCkgKHN0IDB4MCkgKHN0IDB4MCk8
YnI+DQrCoCDCoCDCoCDCoCArc2NoZWQgKHN0IDB4ZiB3ciAweDEpIChzdCAweGYgd3IgMHgwIHd0
IDB4MykgKHN0IDB4ZiB3ciAweDEgcmQgMHgyKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgaXBhICRy
MiBhWzB4OTBdICRyMCAweDAgMHgxPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqB0ZXggbm9kZXAgJHI0
ICRyMiAweDAgMHgxIHQyZCAweDg8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGlwYSAkcjEgYVsweDg0
XSAkcjAgMHgwIDB4MTxicj4NCsKgIMKgIMKgIMKgIC1zY2hlZCAoc3QgMHgwKSAoc3QgMHgwKSAo
c3QgMHgwKTxicj4NCsKgIMKgIMKgIMKgICtzY2hlZCAoc3QgMHhmIHdyIDB4MiB3dCAweDQpIChz
dCAweGYgd3IgMHgxIHd0IDB4NikgKHN0IDB4Zik8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGlwYSAk
cjAgYVsweDgwXSAkcjAgMHgwIDB4MTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgdGV4IG5vZGVwICRy
MCAkcjAgMHgwIDB4MCB0MmQgMHhmPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBkZXBiYXIgbGUgMHg1
IDB4MCAweDA8YnI+DQrCoCDCoCDCoCDCoCAtc2NoZWQgKHN0IDB4MCkgKHN0IDB4MCkgKHN0IDB4
MCk8YnI+DQrCoCDCoCDCoCDCoCArc2NoZWQgKHN0IDB4MSB3dCAweDNmKSAoc3QgMHgxKSAoc3Qg
MHgxKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgZm11bCBmdHogJHIzICRyMyAkcjQ8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoGZtdWwgZnR6ICRyMiAkcjIgJHI0PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBm
bXVsIGZ0eiAkcjEgJHIxICRyNDxicj4NCsKgIMKgIMKgIMKgIC1zY2hlZCAoc3QgMHgwKSAoc3Qg
MHgwKSAoc3QgMHgwKTxicj4NCsKgIMKgIMKgIMKgICtzY2hlZCAoc3QgMHg2IHd0IDB4MikgKHN0
IDB4ZikgKHN0IDB4MCk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGZtdWwgZnR6ICRyMCAkcjAgJHI0
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBleGl0PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAjZW5kaWY8
YnI+DQrCoCDCoCDCoCDCoCBkaWZmIC0tZ2l0IGEvc3JjL3NoYWRlci9leGFjbW52MTEwLmZwYyBi
L3NyYy9zaGFkZXIvZXhhY21udjExMC5mcGM8YnI+DQrCoCDCoCDCoCDCoCBpbmRleCA5ZDYyYzFh
Li5jMTUwODc1IDEwMDY0NDxicj4NCsKgIMKgIMKgIMKgIC0tLSBhL3NyYy9zaGFkZXIvZXhhY21u
djExMC5mcGM8YnI+DQrCoCDCoCDCoCDCoCArKysgYi9zcmMvc2hhZGVyL2V4YWNtbnYxMTAuZnBj
PGJyPg0KwqAgwqAgwqAgwqAgQEAgLTEsMzYgKzEsMzYgQEA8YnI+DQrCoCDCoCDCoCDCoCAtMHhm
YzAwMDdlMCw8YnI+DQrCoCDCoCDCoCDCoCAtMHgwMDFmODAwMCw8YnI+DQrCoCDCoCDCoCDCoCAr
MHhlMWEwMDcwZiw8YnI+DQrCoCDCoCDCoCDCoCArMHgwMDNjM2MwMSw8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoDB4Y2ZmN2ZmMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGUwMDNmZjg3LDxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgMHgwMDQ3MDAwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4NTA4
MDAwMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDQwMDdmZjAzLDxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgMHhlMDQzZmY4OSw8YnI+DQrCoCDCoCDCoCDCoCAtMHhmYzAwMDdlMCw8YnI+DQrCoCDC
oCDCoCDCoCAtMHgwMDFmODAwMCw8YnI+DQrCoCDCoCDCoCDCoCArMHhlMWUwMDcyZiw8YnI+DQrC
oCDCoCDCoCDCoCArMHgwMDA4YmMwMyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDAwN2ZmMDIs
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGUwNDNmZjg5LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
MHgyZmY3MDIwNCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4YzAzYTAwMTQsPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAweDQwMDdmZjAxLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhlMDQzZmY4OCw8
YnI+DQrCoCDCoCDCoCDCoCAtMHhmYzAwMDdlMCw8YnI+DQrCoCDCoCDCoCDCoCAtMHgwMDFmODAw
MCw8YnI+DQrCoCDCoCDCoCDCoCArMHhlNWUwMjc0Ziw8YnI+DQrCoCDCoCDCoCDCoCArMHgwMDFm
YmMwNiw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDAwN2ZmMDAsPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAweGUwNDNmZjg4LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhhZmY3MDAwMCw8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoDB4YzAzYTAwMDcsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDM0MDcw
MDAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhmMGYwMDAwMCw8YnI+DQrCoCDCoCDCoCDCoCAt
MHhmYzAwMDdlMCw8YnI+DQrCoCDCoCDCoCDCoCAtMHgwMDFmODAwMCw8YnI+DQrCoCDCoCDCoCDC
oCArMHhmYzIxZmZlMSw8YnI+DQrCoCDCoCDCoCDCoCArMHgwMDFmODQwMCw8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoDB4MDA0NzAzMDMsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDVjNjgxMDAwLDxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgMHgwMDQ3MDIwMiw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4
NWM2ODEwMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDAwNDcwMTAxLDxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgMHg1YzY4MTAwMCw8YnI+DQrCoCDCoCDCoCDCoCAtMHhmYzAwMDdlMCw8YnI+DQrC
oCDCoCDCoCDCoCArMHhmZGUwMTdlNiw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDAxZjgwMDAs
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDAwNDcwMDAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
MHg1YzY4MTAwMCw8YnI+DQrCoCDCoCDCoCDCoCBkaWZmIC0tZ2l0IGEvc3JjL3NoYWRlci9leGFz
OG52MTEwLmZwIGIvc3JjL3NoYWRlci9leGFzOG52MTEwLmZwPGJyPg0KwqAgwqAgwqAgwqAgaW5k
ZXggNGZlMmUxOS4uYTU1NWJlYiAxMDA2NDQ8YnI+DQrCoCDCoCDCoCDCoCAtLS0gYS9zcmMvc2hh
ZGVyL2V4YXM4bnYxMTAuZnA8YnI+DQrCoCDCoCDCoCDCoCArKysgYi9zcmMvc2hhZGVyL2V4YXM4
bnYxMTAuZnA8YnI+DQrCoCDCoCDCoCDCoCBAQCAtMjUsMTUgKzI1LDE1IEBAIE5WMTEwRlBfU291
cmNlX0E4W10gPSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgI2Vsc2U8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoC1zY2hlZCAoc3QgMHgwKSAoc3QgMHgwKSAo
c3QgMHgwKTxicj4NCsKgIMKgIMKgIMKgICtzY2hlZCAoc3QgMHhmIHdyIDB4MCkgKHN0IDB4ZCB3
ciAweDAgd3QgMHgxKSAoc3QgMHhmIHdyIDB4MCB3dCAweDEpPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqBpcGEgcGFzcyAkcjAgYVsweDdjXSAweDAgMHgwIDB4MTxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
bXVmdSByY3AgJHIwICRyMDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgaXBhICRyMSBhWzB4ODRdICRy
MCAweDAgMHgxPGJyPg0KwqAgwqAgwqAgwqAgLXNjaGVkIChzdCAweDApIChzdCAweDApIChzdCAw
eDApPGJyPg0KwqAgwqAgwqAgwqAgK3NjaGVkIChzdCAweGYgd3IgMHgxKSAoc3QgMHhmIHdyIDB4
MCB3dCAweDMpIChzdCAweGYpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBpcGEgJHIwIGFbMHg4MF0g
JHIwIDB4MCAweDE8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoHRleCBub2RlcCAkcjAgJHIwIDB4MCAw
eDAgdDJkIDB4ODxicj4NCsKgIMKgIMKgIMKgIMKgIMKgZGVwYmFyIGxlIDB4NSAweDAgMHgwPGJy
Pg0KwqAgwqAgwqAgwqAgLXNjaGVkIChzdCAweDApIChzdCAweDApIChzdCAweDApPGJyPg0KwqAg
wqAgwqAgwqAgK3NjaGVkIChzdCAweDEgd3QgMHgxKSAoc3QgMHgxKSAoc3QgMHgxKTxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgbW92ICRyMyAkcjAgMHhmPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBtb3Yg
JHIyICRyMCAweGY8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoG1vdiAkcjEgJHIwIDB4Zjxicj4NCjxi
cj4NCjxicj4NCsKgIMKgIFRoaXMgb25lIGxvb2tzIGdvb2QhPGJyPg0KPGJyPg0KPGJyPg0KwqAg
wqAgwqAgwqAgZGlmZiAtLWdpdCBhL3NyYy9zaGFkZXIvZXhhczhudjExMC5mcGMgYi9zcmMvc2hh
ZGVyL2V4YXM4bnYxMTAuZnBjPGJyPg0KwqAgwqAgwqAgwqAgaW5kZXggMTE4MWM0MS4uZTU4ZDE2
OCAxMDA2NDQ8YnI+DQrCoCDCoCDCoCDCoCAtLS0gYS9zcmMvc2hhZGVyL2V4YXM4bnYxMTAuZnBj
PGJyPg0KwqAgwqAgwqAgwqAgKysrIGIvc3JjL3NoYWRlci9leGFzOG52MTEwLmZwYzxicj4NCsKg
IMKgIMKgIMKgIEBAIC0xLDIxICsxLDIxIEBAPGJyPg0KwqAgwqAgwqAgwqAgLTB4ZmMwMDA3ZTAs
PGJyPg0KwqAgwqAgwqAgwqAgLTB4MDAxZjgwMDAsPGJyPg0KwqAgwqAgwqAgwqAgKzB4ZTFhMDA3
MGYsPGJyPg0KwqAgwqAgwqAgwqAgKzB4MDAzYzNjMDEsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAw
eGNmZjdmZjAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhlMDAzZmY4Nyw8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoDB4MDA0NzAwMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDUwODAwMDAwLDxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg0MDA3ZmYwMSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4
ZTA0M2ZmODgsPGJyPg0KwqAgwqAgwqAgwqAgLTB4ZmMwMDA3ZTAsPGJyPg0KwqAgwqAgwqAgwqAg
LTB4MDAxZjgwMDAsPGJyPg0KwqAgwqAgwqAgwqAgKzB4ZTFlMDA3MmYsPGJyPg0KwqAgwqAgwqAg
wqAgKzB4MDAxZmJjMDMsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDAwMDdmZjAwLDxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgMHhlMDQzZmY4OCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MmZmNzAw
MDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGMwM2EwMDA0LDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgMHgzNDA3MDAwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4ZjBmMDAwMDAsPGJyPg0KwqAg
wqAgwqAgwqAgLTB4ZmMwMDA3ZTAsPGJyPg0KwqAgwqAgwqAgwqAgLTB4MDAxZjgwMDAsPGJyPg0K
wqAgwqAgwqAgwqAgKzB4ZmMyMDBmZTEsPGJyPg0KwqAgwqAgwqAgwqAgKzB4MDAxZjg0MDAsPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAweDAwMDcwMDAzLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg1
Yzk4MDc4MCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDAwNzAwMDIsPGJyPg0KwqAgwqAgwqAg
wqAgZGlmZiAtLWdpdCBhL3NyYy9zaGFkZXIvZXhhc2FudjExMC5mcCBiL3NyYy9zaGFkZXIvZXhh
c2FudjExMC5mcDxicj4NCsKgIMKgIMKgIMKgIGluZGV4IDYxMzc0YTYuLmFkN2NhMzYgMTAwNjQ0
PGJyPg0KwqAgwqAgwqAgwqAgLS0tIGEvc3JjL3NoYWRlci9leGFzYW52MTEwLmZwPGJyPg0KwqAg
wqAgwqAgwqAgKysrIGIvc3JjL3NoYWRlci9leGFzYW52MTEwLmZwPGJyPg0KwqAgwqAgwqAgwqAg
QEAgLTI1LDIzICsyNSwyMyBAQCBOVjExMEZQX0NBQ29tcG9zaXRlU3JjQWxwaGFbXSA9IHs8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAjZWxzZTxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgLXNjaGVkIChzdCAweDApIChzdCAweDApIChzdCAweDApPGJyPg0KwqAg
wqAgwqAgwqAgK3NjaGVkIChzdCAweGYgd3IgMHgwKSAoc3QgMHhkIHdyIDB4MCB3dCAweDEpIChz
dCAweGYgd3IgMHgwIHd0IDB4MSk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGlwYSBwYXNzICRyMCBh
WzB4N2NdIDB4MCAweDAgMHgxPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBtdWZ1IHJjcCAkcjAgJHIw
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBpcGEgJHIzIGFbMHg4NF0gJHIwIDB4MCAweDE8YnI+DQrC
oCDCoCDCoCDCoCAtc2NoZWQgKHN0IDB4MCkgKHN0IDB4MCkgKHN0IDB4MCk8YnI+DQrCoCDCoCDC
oCDCoCArc2NoZWQgKHN0IDB4ZiB3ciAweDEpIChzdCAweGYgd3IgMHgwIHd0IDB4MykgKHN0IDB4
ZiB3ciAweDEgcmQgMHgyKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgaXBhICRyMiBhWzB4ODBdICRy
MCAweDAgMHgxPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqB0ZXggbm9kZXAgJHI0ICRyMiAweDAgMHgw
IHQyZCAweDg8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGlwYSAkcjEgYVsweDk0XSAkcjAgMHgwIDB4
MTxicj4NCsKgIMKgIMKgIMKgIC1zY2hlZCAoc3QgMHgwKSAoc3QgMHgwKSAoc3QgMHgwKTxicj4N
CsKgIMKgIMKgIMKgICtzY2hlZCAoc3QgMHhmIHdyIDB4MiB3dCAweDQpIChzdCAweGYgd3IgMHgx
IHd0IDB4NikgKHN0IDB4Zik8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGlwYSAkcjAgYVsweDkwXSAk
cjAgMHgwIDB4MTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgdGV4IG5vZGVwICRyMCAkcjAgMHgwIDB4
MSB0MmQgMHhmPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBkZXBiYXIgbGUgMHg1IDB4MCAweDA8YnI+
DQrCoCDCoCDCoCDCoCAtc2NoZWQgKHN0IDB4MCkgKHN0IDB4MCkgKHN0IDB4MCk8YnI+DQrCoCDC
oCDCoCDCoCArc2NoZWQgKHN0IDB4MSB3dCAweDNmKSAoc3QgMHgxKSAoc3QgMHgxKTxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgZm11bCBmdHogJHIzICRyMyAkcjQ8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oGZtdWwgZnR6ICRyMiAkcjIgJHI0PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBmbXVsIGZ0eiAkcjEg
JHIxICRyNDxicj4NCsKgIMKgIMKgIMKgIC1zY2hlZCAoc3QgMHgwKSAoc3QgMHgwKSAoc3QgMHgw
KTxicj4NCsKgIMKgIMKgIMKgICtzY2hlZCAoc3QgMHgxIHd0IDB4MikgKHN0IDB4ZikgKHN0IDB4
MCk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGZtdWwgZnR6ICRyMCAkcjAgJHI0PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqBleGl0PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAjZW5kaWY8YnI+DQrCoCDCoCDC
oCDCoCBkaWZmIC0tZ2l0IGEvc3JjL3NoYWRlci9leGFzYW52MTEwLmZwYyBiL3NyYy9zaGFkZXIv
ZXhhc2FudjExMC5mcGM8YnI+DQrCoCDCoCDCoCDCoCBpbmRleCA1NTE2YTAzLi4xNDg1ZjExIDEw
MDY0NDxicj4NCsKgIMKgIMKgIMKgIC0tLSBhL3NyYy9zaGFkZXIvZXhhc2FudjExMC5mcGM8YnI+
DQrCoCDCoCDCoCDCoCArKysgYi9zcmMvc2hhZGVyL2V4YXNhbnYxMTAuZnBjPGJyPg0KwqAgwqAg
wqAgwqAgQEAgLTEsMzYgKzEsMzYgQEA8YnI+DQrCoCDCoCDCoCDCoCAtMHhmYzAwMDdlMCw8YnI+
DQrCoCDCoCDCoCDCoCAtMHgwMDFmODAwMCw8YnI+DQrCoCDCoCDCoCDCoCArMHhlMWEwMDcwZiw8
YnI+DQrCoCDCoCDCoCDCoCArMHgwMDNjM2MwMSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4Y2Zm
N2ZmMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGUwMDNmZjg3LDxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgMHgwMDQ3MDAwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4NTA4MDAwMDAsPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAweDQwMDdmZjAzLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhlMDQz
ZmY4OCw8YnI+DQrCoCDCoCDCoCDCoCAtMHhmYzAwMDdlMCw8YnI+DQrCoCDCoCDCoCDCoCAtMHgw
MDFmODAwMCw8YnI+DQrCoCDCoCDCoCDCoCArMHhlMWUwMDcyZiw8YnI+DQrCoCDCoCDCoCDCoCAr
MHgwMDA4YmMwMyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDAwN2ZmMDIsPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAweGUwNDNmZjg4LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHgyZmY3MDIwNCw8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4YzAzYTAwMDQsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAw
eDQwMDdmZjAxLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhlMDQzZmY4OSw8YnI+DQrCoCDCoCDC
oCDCoCAtMHhmYzAwMDdlMCw8YnI+DQrCoCDCoCDCoCDCoCAtMHgwMDFmODAwMCw8YnI+DQrCoCDC
oCDCoCDCoCArMHhlNWUwMjc0Ziw8YnI+DQrCoCDCoCDCoCDCoCArMHgwMDFmYmMwNiw8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoDB4MDAwN2ZmMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGUwNDNm
Zjg5LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhhZmY3MDAwMCw8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoDB4YzAzYTAwMTcsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDM0MDcwMDAwLDxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgMHhmMGYwMDAwMCw8YnI+DQrCoCDCoCDCoCDCoCAtMHhmYzAwMDdlMCw8
YnI+DQrCoCDCoCDCoCDCoCAtMHgwMDFmODAwMCw8YnI+DQrCoCDCoCDCoCDCoCArMHhmYzIxZmZl
MSw8YnI+DQrCoCDCoCDCoCDCoCArMHgwMDFmODQwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4
MDA0NzAzMDMsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDVjNjgxMDAwLDxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgMHgwMDQ3MDIwMiw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4NWM2ODEwMDAsPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAweDAwNDcwMTAxLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg1
YzY4MTAwMCw8YnI+DQrCoCDCoCDCoCDCoCAtMHhmYzAwMDdlMCw8YnI+DQrCoCDCoCDCoCDCoCAr
MHhmZGUwMTdlMSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDAxZjgwMDAsPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAweDAwNDcwMDAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg1YzY4MTAwMCw8
YnI+DQrCoCDCoCDCoCDCoCBkaWZmIC0tZ2l0IGEvc3JjL3NoYWRlci9leGFzY252MTEwLmZwIGIv
c3JjL3NoYWRlci9leGFzY252MTEwLmZwPGJyPg0KwqAgwqAgwqAgwqAgaW5kZXggOTBiYmI1NS4u
ODZlMTRlOCAxMDA2NDQ8YnI+DQrCoCDCoCDCoCDCoCAtLS0gYS9zcmMvc2hhZGVyL2V4YXNjbnYx
MTAuZnA8YnI+DQrCoCDCoCDCoCDCoCArKysgYi9zcmMvc2hhZGVyL2V4YXNjbnYxMTAuZnA8YnI+
DQrCoCDCoCDCoCDCoCBAQCAtMjUsMTQgKzI1LDE0IEBAIE5WMTEwRlBfU291cmNlW10gPSB7PGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgI2Vsc2U8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoC1zY2hlZCAoc3QgMHgwKSAoc3QgMHgwKSAoc3QgMHgwKTxicj4NCsKg
IMKgIMKgIMKgICtzY2hlZCAoc3QgMHhmIHdyIDB4MCkgKHN0IDB4ZCB3ciAweDAgd3QgMHgxKSAo
c3QgMHhmIHdyIDB4MCB3dCAweDEpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBpcGEgcGFzcyAkcjAg
YVsweDdjXSAweDAgMHgwIDB4MTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgbXVmdSByY3AgJHIwICRy
MDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgaXBhICRyMSBhWzB4ODRdICRyMCAweDAgMHgxPGJyPg0K
wqAgwqAgwqAgwqAgLXNjaGVkIChzdCAweDApIChzdCAweDApIChzdCAweDApPGJyPg0KwqAgwqAg
wqAgwqAgK3NjaGVkIChzdCAweGYgd3IgMHgxKSAoc3QgMHhmIHd0IDB4MykgKHN0IDB4Zik8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoGlwYSAkcjAgYVsweDgwXSAkcjAgMHgwIDB4MTxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgdGV4IG5vZGVwICRyMCAkcjAgMHgwIDB4MCB0MmQgMHhmPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqBkZXBiYXIgbGUgMHg1IDB4MCAweDA8YnI+DQrCoCDCoCDCoCDCoCAtc2NoZWQg
KHN0IDB4MCkgKHN0IDB4MCkgKHN0IDB4MCk8YnI+DQrCoCDCoCDCoCDCoCArc2NoZWQgKHN0IDB4
ZikgKHN0IDB4MCkgKHN0IDB4MCk8YnI+DQo8YnI+DQo8YnI+DQrCoCDCoCBMb29rcyBnb29kLjxi
cj4NCjxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgZXhpdDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgI2VuZGlmPGJyPg0KwqAgwqAgwqAgwqAgZGlmZiAtLWdpdCBhL3NyYy9zaGFkZXIvZXhhc2Nu
djExMC5mcGMgYi9zcmMvc2hhZGVyL2V4YXNjbnYxMTAuZnBjPGJyPg0KwqAgwqAgwqAgwqAgaW5k
ZXggMmRiYTE1ZC4uMWZlZjVkMiAxMDA2NDQ8YnI+DQrCoCDCoCDCoCDCoCAtLS0gYS9zcmMvc2hh
ZGVyL2V4YXNjbnYxMTAuZnBjPGJyPg0KwqAgwqAgwqAgwqAgKysrIGIvc3JjL3NoYWRlci9leGFz
Y252MTEwLmZwYzxicj4NCsKgIMKgIMKgIMKgIEBAIC0xLDIwICsxLDIwIEBAPGJyPg0KwqAgwqAg
wqAgwqAgLTB4ZmMwMDA3ZTAsPGJyPg0KwqAgwqAgwqAgwqAgLTB4MDAxZjgwMDAsPGJyPg0KwqAg
wqAgwqAgwqAgKzB4ZTFhMDA3MGYsPGJyPg0KwqAgwqAgwqAgwqAgKzB4MDAzYzNjMDEsPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAweGNmZjdmZjAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhlMDAz
ZmY4Nyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDA0NzAwMDAsPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAweDUwODAwMDAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg0MDA3ZmYwMSw8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoDB4ZTA0M2ZmODgsPGJyPg0KwqAgwqAgwqAgwqAgLTB4ZmMwMDA3ZTAs
PGJyPg0KwqAgwqAgwqAgwqAgLTB4MDAxZjgwMDAsPGJyPg0KwqAgwqAgwqAgwqAgKzB4ZmRlMDA3
MmYsPGJyPg0KwqAgwqAgwqAgwqAgKzB4MDAxZmJjMDMsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAw
eDAwMDdmZjAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhlMDQzZmY4OCw8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoDB4YWZmNzAwMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGMwM2EwMDA3LDxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgMHgzNDA3MDAwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4
ZjBmMDAwMDAsPGJyPg0KwqAgwqAgwqAgwqAgLTB4ZmMwMDA3ZTAsPGJyPg0KwqAgwqAgwqAgwqAg
KzB4ZmMwMDA3ZWYsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDAwMWY4MDAwLDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgMHgwMDA3MDAwZiw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4ZTMwMDAwMDAs
PGJyPg0KwqAgwqAgwqAgwqAgZGlmZiAtLWdpdCBhL3NyYy9zaGFkZXIvdmlkZW9udjExMC5mcCBi
L3NyYy9zaGFkZXIvdmlkZW9udjExMC5mcDxicj4NCsKgIMKgIMKgIMKgIGluZGV4IDI3MjgzMTEu
LmRkMzgxNmMgMTAwNjQ0PGJyPg0KwqAgwqAgwqAgwqAgLS0tIGEvc3JjL3NoYWRlci92aWRlb252
MTEwLmZwPGJyPg0KwqAgwqAgwqAgwqAgKysrIGIvc3JjL3NoYWRlci92aWRlb252MTEwLmZwPGJy
Pg0KwqAgwqAgwqAgwqAgQEAgLTI1LDMwICsyNSwzMCBAQCBOVjExMEZQX05WMTJbXSA9IHs8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAjZWxzZTxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgLXNjaGVkIChzdCAweDApIChzdCAweDApIChzdCAweDApPGJyPg0KwqAg
wqAgwqAgwqAgK3NjaGVkIChzdCAweGYgd3IgMHgwKSAoc3QgMHhkIHdyIDB4MCB3dCAweDEpIChz
dCAweGYgd3IgMHgwIHd0IDB4MSk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGlwYSBwYXNzICRyMiBh
WzB4N2NdIDB4MCAweDAgMHgxPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBtdWZ1IHJjcCAkcjIgJHIy
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBpcGEgJHIwIGFbMHg4MF0gJHIyIDB4MCAweDE8YnI+DQrC
oCDCoCDCoCDCoCAtc2NoZWQgKHN0IDB4MCkgKHN0IDB4MCkgKHN0IDB4MCk8YnI+DQrCoCDCoCDC
oCDCoCArc2NoZWQgKHN0IDB4ZiB3ciAweDEpIChzdCAweGYgd3IgMHgwIHd0IDB4MykgKHN0IDB4
ZiB3ciAweDEpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBpcGEgJHIxIGFbMHg4NF0gJHIyIDB4MCAw
eDE8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoHRleCBub2RlcCAkcjQgJHIwIDB4MCAweDAgdDJkIDB4
ODxicj4NCsKgIMKgIMKgIMKgIMKgIMKgdGV4IG5vZGVwICRyMCAkcjAgMHgwIDB4MSB0MmQgMHhj
PGJyPg0KwqAgwqAgwqAgwqAgLXNjaGVkIChzdCAweDApIChzdCAweDApIChzdCAweDApPGJyPg0K
wqAgwqAgwqAgwqAgK3NjaGVkIChzdCAweGYpIChzdCAweDYgd3QgMHgxKSAoc3QgMHg2KTxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgZGVwYmFyIGxlIDB4NSAweDEgMHgxPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqBmbXVsIGZ0eiAkcjUgJHI0IGMwWzB4MF08YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGZhZGQg
ZnR6ICRyMyAkcjUgYzBbMHg0XTxicj4NCsKgIMKgIMKgIMKgIC1zY2hlZCAoc3QgMHgwKSAoc3Qg
MHgwKSAoc3QgMHgwKTxicj4NCsKgIMKgIMKgIMKgICtzY2hlZCAoc3QgMHg2KSAoc3QgMHg2KSAo
c3QgMHhmKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgZmFkZCBmdHogJHI0ICRyNSBjMFsweDhdPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqBmYWRkIGZ0eiAkcjUgJHI1IGMwWzB4Y108YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoGRlcGJhciBsZSAweDUgMHgwIDB4MDxicj4NCsKgIMKgIMKgIMKgIC1zY2hlZCAo
c3QgMHgwKSAoc3QgMHgwKSAoc3QgMHgwKTxicj4NCsKgIMKgIMKgIMKgICtzY2hlZCAoc3QgMHg2
IHd0IDB4MikgKHN0IDB4MSkgKHN0IDB4MSk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGZmbWEgZnR6
ICRyMyAkcjAgYzBbMHgxMF0gJHIzPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqBmZm1hIGZ0eiAkcjQg
JHIwIGMwWzB4MTRdICRyNDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgZmZtYSBmdHogJHI1ICRyMCBj
MFsweDE4XSAkcjU8YnI+DQrCoCDCoCDCoCDCoCAtc2NoZWQgKHN0IDB4MCkgKHN0IDB4MCkgKHN0
IDB4MCk8YnI+DQrCoCDCoCDCoCDCoCArc2NoZWQgKHN0IDB4MSkgKHN0IDB4MSkgKHN0IDB4Nik8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGZmbWEgZnR6ICRyMCAkcjEgYzBbMHgxY10gJHIzPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqBmZm1hIGZ0eiAkcjIgJHIxIGMwWzB4MjRdICRyNTxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgZmZtYSBmdHogJHIxICRyMSBjMFsweDIwXSAkcjQ8YnI+DQrCoCDCoCDCoCDC
oCAtc2NoZWQgKHN0IDB4MCkgKHN0IDB4MCkgKHN0IDB4MCk8YnI+DQrCoCDCoCDCoCDCoCArc2No
ZWQgKHN0IDB4ZikgKHN0IDB4MCkgKHN0IDB4MCk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoGV4aXQ8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCNlbmRpZjxicj4NCsKgIMKgIMKgIMKgIGRpZmYgLS1naXQg
YS9zcmMvc2hhZGVyL3ZpZGVvbnYxMTAuZnBjIGIvc3JjL3NoYWRlci92aWRlb252MTEwLmZwYzxi
cj4NCsKgIMKgIMKgIMKgIGluZGV4IDMxZDc0NWEuLjhmYmMyNDYgMTAwNjQ0PGJyPg0KwqAgwqAg
wqAgwqAgLS0tIGEvc3JjL3NoYWRlci92aWRlb252MTEwLmZwYzxicj4NCsKgIMKgIMKgIMKgICsr
KyBiL3NyYy9zaGFkZXIvdmlkZW9udjExMC5mcGM8YnI+DQrCoCDCoCDCoCDCoCBAQCAtMSw1MiAr
MSw1MiBAQDxicj4NCsKgIMKgIMKgIMKgIC0weGZjMDAwN2UwLDxicj4NCsKgIMKgIMKgIMKgIC0w
eDAwMWY4MDAwLDxicj4NCsKgIMKgIMKgIMKgICsweGUxYTAwNzBmLDxicj4NCsKgIMKgIMKgIMKg
ICsweDAwM2MzYzAxLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHhjZmY3ZmYwMiw8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoDB4ZTAwM2ZmODcsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDAwNDcwMjAy
LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg1MDgwMDAwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oDB4MDAyN2ZmMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGUwNDNmZjg4LDxicj4NCsKgIMKg
IMKgIMKgIC0weGZjMDAwN2UwLDxicj4NCsKgIMKgIMKgIMKgIC0weDAwMWY4MDAwLDxicj4NCsKg
IMKgIMKgIMKgICsweGUxZTAwNzJmLDxicj4NCsKgIMKgIMKgIMKgICsweDAwMWNiYzAzLDxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgMHg0MDI3ZmYwMSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4ZTA0
M2ZmODgsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDJmZjcwMDA0LDxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgMHhjMDNhMDAwNCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MmZmNzAwMDAsPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAweGMwM2EwMDE2LDxicj4NCsKgIMKgIMKgIMKgIC0weGZjMDAwN2Uw
LDxicj4NCsKgIMKgIMKgIMKgIC0weDAwMWY4MDAwLDxicj4NCsKgIMKgIMKgIMKgICsweGZjYzAw
N2VmLDxicj4NCsKgIMKgIMKgIMKgICsweDAwMWY5ODAxLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
MHgzNDE3MDAwMSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4ZjBmMDAwMDAsPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAweDAwMDcwNDA1LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg0YzY4MTAwMCw8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDAxNzA1MDMsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAw
eDRjNTgxMDAwLDxicj4NCsKgIMKgIMKgIMKgIC0weGZjMDAwN2UwLDxicj4NCsKgIMKgIMKgIMKg
IC0weDAwMWY4MDAwLDxicj4NCsKgIMKgIMKgIMKgICsweGZjYzAwN2U2LDxicj4NCsKgIMKgIMKg
IMKgICsweDAwMWZiYzAwLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHgwMDI3MDUwNCw8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoDB4NGM1ODEwMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDAwMzcw
NTA1LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg0YzU4MTAwMCw8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoDB4MzQwNzAwMDAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGYwZjAwMDAwLDxicj4NCsKg
IMKgIMKgIMKgIC0weGZjMDAwN2UwLDxicj4NCsKgIMKgIMKgIMKgIC0weDAwMWY4MDAwLDxicj4N
CsKgIMKgIMKgIMKgICsweGZjMjAxN2U2LDxicj4NCsKgIMKgIMKgIMKgICsweDAwMWY4NDAwLDxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgMHgwMDQ3MDAwMyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4
NDlhMDAxODAsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweDAwNTcwMDA0LDxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgMHg0OWEwMDIwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDA2NzAwMDUsPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAweDQ5YTAwMjgwLDxicj4NCsKgIMKgIMKgIMKgIC0weGZjMDAw
N2UwLDxicj4NCsKgIMKgIMKgIMKgIC0weDAwMWY4MDAwLDxicj4NCsKgIMKgIMKgIMKgICsweGZj
MjAwN2UxLDxicj4NCsKgIMKgIMKgIMKgICsweDAwMWY5ODAwLDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgMHgwMDc3MDEwMCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4NDlhMDAxODAsPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAweDAwOTcwMTAyLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHg0OWEwMDI4
MCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoDB4MDA4NzAxMDEsPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAweDQ5YTAwMjAwLDxicj4NCsKgIMKgIMKgIMKgIC0weGZjMDAwN2UwLDxicj4NCsKgIMKgIMKg
IMKgICsweGZjMDAwN2VmLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgMHgwMDFmODAwMCw8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoDB4MDAwNzAwMGYsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAweGUzMDAw
MDAwLDxicj4NCjxicj4NCkFzIGZvciB5b3VyIG90aGVyIGNvbW1lbnRzLCBJIGhhdmUgbWFkZSB0
aGUgc3VnZ2VzdGVkIGNoYW5nZXMuPGJyPg0KPGJyPg0KVGhhbmtzIGZvciB5b3VyIHJldmlldyE8
YnI+DQo8YnI+DQpDaGVlcnMsPGJyPg0KQWFyeWFtYW48YnI+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rp
dj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2PjwvZGl2Pg0K
--001a11c10fc604bcc20551746150--

--===============1233092308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1233092308==--
