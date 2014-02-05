From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67628] [NVC1] [BISECTED] Monitor on Display port
 shows distortions
Date: Wed, 05 Feb 2014 09:28:31 +0000
Message-ID: <bug-67628-8800-Mta22EowSW@http.bugs.freedesktop.org/>
References: <bug-67628-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1869594698=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67628-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1869594698==
Content-Type: multipart/alternative; boundary="1391592511.cE41a1.12702"; charset="us-ascii"


--1391592511.cE41a1.12702
Date: Wed, 5 Feb 2014 09:28:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67628

--- Comment #10 from Torsten Wagner <torsten.wagner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia,
thanks for the feedback. Attached you will find the kernel log of an
working and non-working kernel.
A quick look showed that the non-working kernel reads in (or simply
log) much more data from the display port init.
The lines below can be found in the NON working kernel but not in the
working one

NOT WORKING KERNEL: (grep DP)

[    1.742406] nouveau T[   VBIOS][0000:01:00.0] 0x57ab[1]:
DP_CONDITION    0x05 0x15
[    1.742584] nouveau T[   VBIOS][0000:01:00.0] 0x591d[ ]:
DP_CONDITION    0x00 0x08
[    1.742589] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: 2 lanes
at 270000 KB/s
[    1.742772] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342:
training pattern 1
[    1.743115] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 00
[    1.743122] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 00
[    1.743796] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
00 00 00 00 cc cc
[    1.743797] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 38
[    1.743807] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 38
[    1.744478] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 cc cc
[    1.744479] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342:
training pattern 2
[    1.745486] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 cc cc
[    1.745487] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 38
[    1.745493] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 38
[    1.746432] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 88 88
[    1.746432] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 10
[    1.746443] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 10
[    1.747381] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 44 44
[    1.747382] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 08
[    1.747390] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 08
[    1.748330] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 00 00
[    1.748331] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 00
[    1.748340] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 00
[    1.749301] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 44 44
[    1.749301] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 08
[    1.749308] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 08
[    1.750265] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
77 00 01 00 44 44
[    1.750265] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 08
[    1.750272] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 08
[    1.750596] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342:
training pattern 0
[    1.751350] nouveau T[   VBIOS][0000:01:00.0] 0x58fd[0]:
DP_CONDITION    0x00 0x11


vs.

WORKING KERNEL (grep DP)

[    5.677400] nouveau T[   VBIOS][0000:01:00.0] 0x57ab[1]:
DP_CONDITION    0x05 0x15
[    5.677577] nouveau T[   VBIOS][0000:01:00.0] 0x591d[ ]:
DP_CONDITION    0x00 0x08
[    5.686368] nouveau T[   VBIOS][0000:01:00.0] 0x58fd[0]:
DP_CONDITION    0x00 0x11

As you can see, the entire PDISP part is missing not sure it is simply
not logged or it is a new feature which creates the problem.

Thanks for looking into this....


On 5 February 2014 04:21,  <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:
> Comment # 9 on bug 67628 from Ilia Mirkin
>
> Can you post boot logs of kernels with and without the problem booted with
>
> nouveau.debug=trace drm.debug=0xe
>
> ________________________________
> You are receiving this mail because:
>
> You reported the bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391592511.cE41a1.12702
Date: Wed, 5 Feb 2014 09:28:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628">bug 67628</a>
              from <span class="vcard"><a class="email" href="mailto:torsten.wagner&#64;gmail.com" title="Torsten Wagner &lt;torsten.wagner&#64;gmail.com&gt;"> <span class="fn">Torsten Wagner</span></a>
</span></b>
        <pre>Hi Ilia,
thanks for the feedback. Attached you will find the kernel log of an
working and non-working kernel.
A quick look showed that the non-working kernel reads in (or simply
log) much more data from the display port init.
The lines below can be found in the NON working kernel but not in the
working one

NOT WORKING KERNEL: (grep DP)

[    1.742406] nouveau T[   VBIOS][0000:01:00.0] 0x57ab[1]:
DP_CONDITION    0x05 0x15
[    1.742584] nouveau T[   VBIOS][0000:01:00.0] 0x591d[ ]:
DP_CONDITION    0x00 0x08
[    1.742589] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: 2 lanes
at 270000 KB/s
[    1.742772] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342:
training pattern 1
[    1.743115] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 00
[    1.743122] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 00
[    1.743796] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
00 00 00 00 cc cc
[    1.743797] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 38
[    1.743807] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 38
[    1.744478] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 cc cc
[    1.744479] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342:
training pattern 2
[    1.745486] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 cc cc
[    1.745487] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 38
[    1.745493] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 38
[    1.746432] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 88 88
[    1.746432] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 10
[    1.746443] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 10
[    1.747381] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 44 44
[    1.747382] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 08
[    1.747390] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 08
[    1.748330] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 00 00
[    1.748331] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 00
[    1.748340] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 00
[    1.749301] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
11 00 00 00 44 44
[    1.749301] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 08
[    1.749308] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 08
[    1.750265] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: status
77 00 01 00 44 44
[    1.750265] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 0 08
[    1.750272] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342: config lane 1 08
[    1.750596] nouveau D[   PDISP][0000:01:00.0] DP:0006:0342:
training pattern 0
[    1.751350] nouveau T[   VBIOS][0000:01:00.0] 0x58fd[0]:
DP_CONDITION    0x00 0x11


vs.

WORKING KERNEL (grep DP)

[    5.677400] nouveau T[   VBIOS][0000:01:00.0] 0x57ab[1]:
DP_CONDITION    0x05 0x15
[    5.677577] nouveau T[   VBIOS][0000:01:00.0] 0x591d[ ]:
DP_CONDITION    0x00 0x08
[    5.686368] nouveau T[   VBIOS][0000:01:00.0] 0x58fd[0]:
DP_CONDITION    0x00 0x11

As you can see, the entire PDISP part is missing not sure it is simply
not logged or it is a new feature which creates the problem.

Thanks for looking into this....


On 5 February 2014 04:21,  &lt;<a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:
<span class="quote">&gt; <a href="show_bug.cgi?id=67628#c9">Comment # 9</a> on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="show_bug.cgi?id=67628">bug 67628</a> from Ilia Mirkin</span >
&gt;
<span class="quote">&gt; Can you post boot logs of kernels with and without the problem booted with</span >
&gt;
<span class="quote">&gt; nouveau.debug=trace drm.debug=0xe</span >
&gt;
<span class="quote">&gt; ________________________________
&gt; You are receiving this mail because:</span >
&gt;
<span class="quote">&gt; You reported the bug.</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391592511.cE41a1.12702--

--===============1869594698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1869594698==--
