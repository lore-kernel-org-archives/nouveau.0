From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99202] system freeze - fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT] - MULTIPLE_WARP_ERRORS - DATA_ERROR 00000004
 [INVALID_VALUE] - ILLEGAL_CLASS ch 11 - RT_STORAGE_TYPE_MISMATCH -
 CLASS_SUBCH_MISMATCH
Date: Sat, 18 Feb 2017 19:42:00 +0000
Message-ID: <bug-99202-8800-nqownge5K9@http.bugs.freedesktop.org/>
References: <bug-99202-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0793736813=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99202-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0793736813==
Content-Type: multipart/alternative; boundary="14874469190.D1C7.32362";
 charset="UTF-8"


--14874469190.D1C7.32362
Date: Sat, 18 Feb 2017 19:41:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99202

--- Comment #1 from derrierdo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Problem still appear with my
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (=
rev
a2)

Linux wizz 4.9.0-aufs #7 SMP Mon Jan 16 19:33:55 EST 2017 x86_64 Intel(R)
Core(TM) i3-3220 CPU @ 3.30GHz GenuineIntel GNU/Linux



2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ER=
ROR
- ch 17 [dolphin[5746]] subc 3 mthd 01d0 data beef0201
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ER=
ROR
- ch 17 [dolphin[5746]] subc 3 mthd 01d4 data beef0201
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ER=
ROR
- ch 17 [dolphin[5746]] subc 3 mthd 01d8 data beef0201
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ER=
ROR
- ch 17 [dolphin[5746]] subc 3 mthd 01dc data beef0201
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: gr: TRAP_CCACHE
00000001 [FAULT]
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: gr: TRAP_CCACHE
000e0080 00000000 00000000 00000000 00000000 00000004 00000000
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: gr: 00200000 [=
] ch
17 [003ea0f000 dolphin[5746]] subc 3 class 8597 mthd 13bc data 00000054
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: fb: trapped re=
ad
at 002027ff00 on channel 17 [3ea0f000 dolphin[5746]] engine 00 [PGRAPH] cli=
ent
05 [CCACHE] subclient 00 [CB] reason 00000006 [NULL_DMAOBJ]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14874469190.D1C7.32362
Date: Sat, 18 Feb 2017 19:41:59 +0000
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
          bz_status_NEW "
   title=3D"NEW - system freeze - fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT] - MU=
LTIPLE_WARP_ERRORS - DATA_ERROR 00000004 [INVALID_VALUE] - ILLEGAL_CLASS ch=
 11 - RT_STORAGE_TYPE_MISMATCH - CLASS_SUBCH_MISMATCH"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99202#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - system freeze - fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT] - MU=
LTIPLE_WARP_ERRORS - DATA_ERROR 00000004 [INVALID_VALUE] - ILLEGAL_CLASS ch=
 11 - RT_STORAGE_TYPE_MISMATCH - CLASS_SUBCH_MISMATCH"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99202">bug 99202<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
derrierdo&#64;gmail.com" title=3D"derrierdo&#64;gmail.com">derrierdo&#64;gm=
ail.com</a>
</span></b>
        <pre>Problem still appear with my
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (=
rev
a2)

Linux wizz 4.9.0-aufs #7 SMP Mon Jan 16 19:33:55 EST 2017 x86_64 Intel(R)
Core(TM) i3-3220 CPU &#64; 3.30GHz GenuineIntel GNU/Linux



2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ER=
ROR
- ch 17 [dolphin[5746]] subc 3 mthd 01d0 data beef0201
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ER=
ROR
- ch 17 [dolphin[5746]] subc 3 mthd 01d4 data beef0201
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ER=
ROR
- ch 17 [dolphin[5746]] subc 3 mthd 01d8 data beef0201
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: fifo: CACHE_ER=
ROR
- ch 17 [dolphin[5746]] subc 3 mthd 01dc data beef0201
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: gr: TRAP_CCACHE
00000001 [FAULT]
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: gr: TRAP_CCACHE
000e0080 00000000 00000000 00000000 00000000 00000004 00000000
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: gr: 00200000 [=
] ch
17 [003ea0f000 dolphin[5746]] subc 3 class 8597 mthd 13bc data 00000054
2017-02-18T14:17:30-05:00 wizz kernel: nouveau 0000:01:00.0: fb: trapped re=
ad
at 002027ff00 on channel 17 [3ea0f000 dolphin[5746]] engine 00 [PGRAPH] cli=
ent
05 [CCACHE] subclient 00 [CB] reason 00000006 [NULL_DMAOBJ]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14874469190.D1C7.32362--

--===============0793736813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0793736813==--
