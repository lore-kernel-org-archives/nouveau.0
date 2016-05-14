From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Sat, 14 May 2016 21:31:04 +0000
Message-ID: <bug-59069-8800-JiN5NIgC62@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0675891021=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0675891021==
Content-Type: multipart/alternative; boundary="14632614650.d276d.1068";
 charset="UTF-8"


--14632614650.d276d.1068
Date: Sat, 14 May 2016 21:31:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D59069

--- Comment #38 from Matt Whitlock <freedesktop-wf/ZkUcLzLDBWRuVRseHprNAH6kLmebB@public.gmane.org> ---
Created attachment 123753
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D123753&action=3Dedit
kernel log with ttm_validate, RT_FAULT, ZETA_FAULT, PAGE_NOT_PRESENT

The problems also started in earnest for me around the time I upgraded to
Plasma 5. Nouveau was never *stable* before then, but I was able to ignore =
its
errors for the most part. Now I can't go more than a few days without X
freezing or even the kernel panicking.

I do not believe the problems are triggered solely by plasmashell. I most
frequently see the "fail ttm_validate" message for kscreenlocker_greet whil=
e I
am away from my computer. I also very frequently see graphical corruption on
the lock screen in the border around my avatar.

There are other regressions too. I used to be able to use the XVideo output
module in VLC (in fact, it was the only one that was stable). Now, neither
XVideo nor OpenGL/GLX will run more than a few frames before the video free=
zes
and "fail ttm_validate" messages spew into the kernel log. The only VLC out=
put
module that gives me any stability anymore is VDPAU and only if I disable
hardware decoding, but even that will freeze X hard from time to time.

The "fail ttm_validate" messages are just the harbinger of impending doom. =
If I
continue without rebooting, eventually I'll be hit by an onslaught of much =
more
ominous errors. Here's a small sampling:

May 14 02:53:20 [kernel] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 4
[chrome[21051]] subc 0 mthd 0060 data beef0201
May 14 03:43:11 [kernel] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 6
[kwin_x11[2304]] subc 0 mthd 0060 data beef0201
May 14 05:06:50 [kernel] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [DR=
M]
subc 0 mthd 0060 data 80000002

May 14 13:17:52 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000=
040
[RT_FAULT] - Address 00204c7000
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c:
00000000, e18: 00000000, e1c: 00000000, e20: 00001100, e24: 00030000
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - 00000=
040
[RT_FAULT] - Address 00204c8000
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - e0c:
00000000, e18: 00000000, e1c: 00000010, e20: 00001100, e24: 00030000
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: gr: 00200000 [] ch 11
[000eeda000 plasmashell[2665]] subc 3 class 8297 mthd 1904 data 01000404
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: fb: trapped write at 00204c8=
000
on channel 11 [0eeda000 plasmashell[2665]] engine 00 [PGRAPH] client 0b [PR=
OP]
subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: fb: trapped write at 0020563=
800
on channel 2 [0fb2f000 X[2086]] engine 00 [PGRAPH] client 0b [PROP] subclie=
nt
08 [ZETA] reason 00000002 [PAGE_NOT_PRESENT]

May 14 13:18:01 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000=
020
[ZETA_FAULT] - Address 002054b100
May 14 13:18:01 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c:
00000000, e18: 00000000, e1c: 00040000, e20: 00020000, e24: 08030000
May 14 13:18:01 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - 00000=
040
[RT_FAULT] - Address 00204f1b00
May 14 13:18:01 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - e0c:
00000000, e18: 00000000, e1c: 006c0110, e20: 00001100, e24: 00030000
May 14 13:18:01 [kernel] nouveau 0000:01:00.0: gr: 00200000 [] ch 11
[000eeda000 plasmashell[2665]] subc 3 class 8297 mthd 1344 data 00004001
May 14 13:18:01 [kernel] nouveau 0000:01:00.0: fb: trapped write at 0020555=
b00
on channel 11 [0eeda000 plasmashell[2665]] engine 00 [PGRAPH] client 0b [PR=
OP]
subclient 08 [ZETA] reason 00000002 [PAGE_NOT_PRESENT]

Attached is the complete error log from this session.

The problems aren't limited to X, though. When nouveau enters a failure sta=
te
like this, it corrupts memory belonging to other processes. I have several
times (at least thrice) seen bitcoind crash at the same time as this storm =
of
nouveau errors, logging an error message like:

2016-05-14 16:26:37 Corruption: block checksum mismatch
2016-05-14 16:26:37 *** System error while flushing: Database corrupted
2016-05-14 16:26:37 Error: Error: A fatal internal error occurred, see
debug.log for details
2016-05-14 16:26:37 Shutdown: done

When I started seeing these problems, I suspected bad RAM, so I ran Memtest=
86+
overnight but found no errors. So my suspicion is that nouveau is writing to
pages it shouldn't.

Could someone help me modify my kernel so that, instead of merely printing
"fail ttm_validate", nouveau sends a SIGBUS to the active process when this
occurs? Then I can run plasmashell in gdb and get a clue as to what's causi=
ng
this.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14632614650.d276d.1068
Date: Sat, 14 May 2016 21:31:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069#c38">Commen=
t # 38</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069">bug 59069<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;mattwhitlock.name" title=3D"Matt Whitlock &lt;freedesktop&#=
64;mattwhitlock.name&gt;"> <span class=3D"fn">Matt Whitlock</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D123753=
" name=3D"attach_123753" title=3D"kernel log with ttm_validate, RT_FAULT, Z=
ETA_FAULT, PAGE_NOT_PRESENT">attachment 123753</a> <a href=3D"attachment.cg=
i?id=3D123753&amp;action=3Dedit" title=3D"kernel log with ttm_validate, RT_=
FAULT, ZETA_FAULT, PAGE_NOT_PRESENT">[details]</a></span>
kernel log with ttm_validate, RT_FAULT, ZETA_FAULT, PAGE_NOT_PRESENT

The problems also started in earnest for me around the time I upgraded to
Plasma 5. Nouveau was never *stable* before then, but I was able to ignore =
its
errors for the most part. Now I can't go more than a few days without X
freezing or even the kernel panicking.

I do not believe the problems are triggered solely by plasmashell. I most
frequently see the &quot;fail ttm_validate&quot; message for kscreenlocker_=
greet while I
am away from my computer. I also very frequently see graphical corruption on
the lock screen in the border around my avatar.

There are other regressions too. I used to be able to use the XVideo output
module in VLC (in fact, it was the only one that was stable). Now, neither
XVideo nor OpenGL/GLX will run more than a few frames before the video free=
zes
and &quot;fail ttm_validate&quot; messages spew into the kernel log. The on=
ly VLC output
module that gives me any stability anymore is VDPAU and only if I disable
hardware decoding, but even that will freeze X hard from time to time.

The &quot;fail ttm_validate&quot; messages are just the harbinger of impend=
ing doom. If I
continue without rebooting, eventually I'll be hit by an onslaught of much =
more
ominous errors. Here's a small sampling:

May 14 02:53:20 [kernel] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 4
[chrome[21051]] subc 0 mthd 0060 data beef0201
May 14 03:43:11 [kernel] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 6
[kwin_x11[2304]] subc 0 mthd 0060 data beef0201
May 14 05:06:50 [kernel] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [DR=
M]
subc 0 mthd 0060 data 80000002

May 14 13:17:52 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000=
040
[RT_FAULT] - Address 00204c7000
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c:
00000000, e18: 00000000, e1c: 00000000, e20: 00001100, e24: 00030000
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - 00000=
040
[RT_FAULT] - Address 00204c8000
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - e0c:
00000000, e18: 00000000, e1c: 00000010, e20: 00001100, e24: 00030000
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: gr: 00200000 [] ch 11
[000eeda000 plasmashell[2665]] subc 3 class 8297 mthd 1904 data 01000404
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: fb: trapped write at 00204c8=
000
on channel 11 [0eeda000 plasmashell[2665]] engine 00 [PGRAPH] client 0b [PR=
OP]
subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
May 14 13:17:52 [kernel] nouveau 0000:01:00.0: fb: trapped write at 0020563=
800
on channel 2 [0fb2f000 X[2086]] engine 00 [PGRAPH] client 0b [PROP] subclie=
nt
08 [ZETA] reason 00000002 [PAGE_NOT_PRESENT]

May 14 13:18:01 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000=
020
[ZETA_FAULT] - Address 002054b100
May 14 13:18:01 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c:
00000000, e18: 00000000, e1c: 00040000, e20: 00020000, e24: 08030000
May 14 13:18:01 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - 00000=
040
[RT_FAULT] - Address 00204f1b00
May 14 13:18:01 [kernel] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - e0c:
00000000, e18: 00000000, e1c: 006c0110, e20: 00001100, e24: 00030000
May 14 13:18:01 [kernel] nouveau 0000:01:00.0: gr: 00200000 [] ch 11
[000eeda000 plasmashell[2665]] subc 3 class 8297 mthd 1344 data 00004001
May 14 13:18:01 [kernel] nouveau 0000:01:00.0: fb: trapped write at 0020555=
b00
on channel 11 [0eeda000 plasmashell[2665]] engine 00 [PGRAPH] client 0b [PR=
OP]
subclient 08 [ZETA] reason 00000002 [PAGE_NOT_PRESENT]

Attached is the complete error log from this session.

The problems aren't limited to X, though. When nouveau enters a failure sta=
te
like this, it corrupts memory belonging to other processes. I have several
times (at least thrice) seen bitcoind crash at the same time as this storm =
of
nouveau errors, logging an error message like:

2016-05-14 16:26:37 Corruption: block checksum mismatch
2016-05-14 16:26:37 *** System error while flushing: Database corrupted
2016-05-14 16:26:37 Error: Error: A fatal internal error occurred, see
debug.log for details
2016-05-14 16:26:37 Shutdown: done

When I started seeing these problems, I suspected bad RAM, so I ran Memtest=
86+
overnight but found no errors. So my suspicion is that nouveau is writing to
pages it shouldn't.

Could someone help me modify my kernel so that, instead of merely printing
&quot;fail ttm_validate&quot;, nouveau sends a SIGBUS to the active process=
 when this
occurs? Then I can run plasmashell in gdb and get a clue as to what's causi=
ng
this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14632614650.d276d.1068--

--===============0675891021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0675891021==--
