From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99900] [NVC1] nouveau: freeze / crash after kernel
 update to 4.10
Date: Tue, 28 Feb 2017 08:05:07 +0000
Message-ID: <bug-99900-8800-Jt8VqOFJ8F@http.bugs.freedesktop.org/>
References: <bug-99900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0342239727=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0342239727==
Content-Type: multipart/alternative; boundary="14882691061.6fCDDa.20228";
 charset="UTF-8"


--14882691061.6fCDDa.20228
Date: Tue, 28 Feb 2017 08:05:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99900

--- Comment #5 from Ralph Gauges <r.gauges-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
Sorry, my report got lost whn I attached the Xorg.log. So again.

I am also seeing freezes related to the nouveau driver since upgrading to
kernel 4.10. Before that I was using 4.9 without problems.

In addition to the Xorg.log, my kern.log contains some error messsages that
repeat lots of times before the system freezes. I have added the last few l=
ines
below.

I am running the latest MESA code from git, so the last crash was with Mesa
from  20170227 and I am using a 750 Ti Card.

01:00.0 VGA compatible controller: NVIDIA Corporation GM107 [GeForce GTX 750
Ti] (rev a2)

If there is anything else I can provide, please let me know.

Thanks and keep up the good work.


Feb 27 21:12:38 zeus kernel: [34599.410668] nouveau 0000:01:00.0: gr: FECS
ucode error 2
Feb 27 21:12:38 zeus kernel: [34599.410668] nouveau 0000:01:00.0: gr: FECS
00000002
Feb 27 21:12:38 zeus kernel: [34599.410670] nouveau 0000:01:00.0: gr: 40900=
0 -
done 00000340
Feb 27 21:12:38 zeus kernel: [34599.410674] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 80000000 0001a600 00000000 80031828
Feb 27 21:12:38 zeus kernel: [34599.410677] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 200208e3 00000003 00000006 00000090
Feb 27 21:12:38 zeus kernel: [34599.410679] nouveau 0000:01:00.0: gr: 50200=
0 -
done 00000300
Feb 27 21:12:38 zeus kernel: [34599.410683] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 80000000 00010400 00000000 00000000
Feb 27 21:12:38 zeus kernel: [34599.410687] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 00000000 00000000 00000002 00000000
Feb 27 21:12:38 zeus kernel: [34599.410690] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Feb 27 21:12:38 zeus kernel: [34599.410692] nouveau 0000:01:00.0: fifo: gr
engine fault on channel 2, recovering...
Feb 27 21:12:38 zeus kernel: [34599.410709] nouveau 0000:01:00.0: gr: FECS =
MTHD
subc 3 class 0000 mthd 1828 data 200208e3
Feb 27 21:12:38 zeus kernel: [34599.410710] nouveau 0000:01:00.0: gr: FECS
00000002
Feb 27 21:12:38 zeus kernel: [34599.410712] nouveau 0000:01:00.0: gr: 40900=
0 -
done 00000340
Feb 27 21:12:38 zeus kernel: [34599.410715] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 80000000 0001a600 00000000 80031828
Feb 27 21:12:38 zeus kernel: [34599.410719] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 200208e3 00000002 00000006 00000091
Feb 27 21:12:38 zeus kernel: [34599.410720] nouveau 0000:01:00.0: gr: 50200=
0 -
done 00000300
Feb 27 21:12:38 zeus kernel: [34599.410724] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 80000000 00010400 00000000 00000000
Feb 27 21:12:38 zeus kernel: [34599.410728] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 00000000 00000000 00000002 00000000
Feb 27 21:12:38 zeus kernel: [34599.410740] nouveau 0000:01:00.0: gr: FECS =
MTHD
subc 3 class 0000 mthd 1828 data 200208e3
Feb 27 21:12:38 zeus kernel: [34599.410741] nouveau 0000:01:00.0: gr: FECS
00000002
Feb 27 21:12:38 zeus kernel: [34599.410743] nouveau 0000:01:00.0: gr: 40900=
0 -
done 00000340
Feb 27 21:12:38 zeus kernel: [34599.410746] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 80000000 0001a600 00000000 80031828
Feb 27 21:12:38 zeus kernel: [34599.410750] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 200208e3 00000003 00000006 00000090
Feb 27 21:12:38 zeus kernel: [34599.410751] nouveau 0000:01:00.0: gr: 50200=
0 -
done 00000300
Feb 27 21:12:38 zeus kernel: [34599.410755] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 80000000 00010400 00000000 00000000
Feb 27 21:12:38 zeus kernel: [34599.410759] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 00000000 00000000 00000002 00000000
Feb 27 21:12:38 zeus kernel: [34599.410769] nouveau 0000:01:00.0: gr: FECS
ucode error 2
Feb 27 21:12:38 zeus kernel: [34599.410770] nouveau 0000:01:00.0: gr: FECS
00000002
Feb 27 21:12:38 zeus kernel: [34599.410772] nouveau 0000:01:00.0: gr: 40900=
0 -
done 00000340
Feb 27 21:12:38 zeus kernel: [34599.410775] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 80000000 0001a600 00000000 80031828
Feb 27 21:12:38 zeus kernel: [34599.410779] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 200208e3 00000003 00000006 00000090
Feb 27 21:12:38 zeus kernel: [34599.410780] nouveau 0000:01:00.0: gr: 50200=
0 -
done 00000300
Feb 27 21:12:38 zeus kernel: [34599.410784] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 80000000 00010400 00000000 00000000
Feb 27 21:12:38 zeus kernel: [34599.410788] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 00000000 00000000 00000002 00000000
Feb 27 21:12:38 zeus kernel: [34599.410798] nouveau 0000:01:00.0: fifo: PBD=
MA0:
01000000 [] ch 2 [007f957000 Xorg[1458]] subc 3 mthd 0200 data 000000cf
Feb 27 21:12:38 zeus kernel: [34599.410807] nouveau 0000:01:00.0: priv: HUB=
0:
400500 00010001 (1b408201)
Feb 27 21:12:38 zeus kernel: [34599.410817] nouveau 0000:01:00.0: fifo: PBD=
MA0:
01000000 [] ch 2 [007f957000 Xorg[1458]] subc 3 mthd 0204 data 00000000
Feb 27 21:12:38 zeus kernel: [34599.411237] nouveau 0000:01:00.0: fifo: wri=
te
fault at 00019e3000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 02 [PTE] =
on
channel 7 [007f15c000 VirtualBox[8519]]
Feb 27 21:12:38 zeus kernel: [34599.411239] nouveau 0000:01:00.0: fifo: gr
engine fault on channel 7, recovering...
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Feb
28

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14882691061.6fCDDa.20228
Date: Tue, 28 Feb 2017 08:05:06 +0000
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
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900">bug 99900<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
r.gauges&#64;hotmail.com" title=3D"Ralph Gauges &lt;r.gauges&#64;hotmail.co=
m&gt;"> <span class=3D"fn">Ralph Gauges</span></a>
</span></b>
        <pre>Sorry, my report got lost whn I attached the Xorg.log. So agai=
n.

I am also seeing freezes related to the nouveau driver since upgrading to
kernel 4.10. Before that I was using 4.9 without problems.

In addition to the Xorg.log, my kern.log contains some error messsages that
repeat lots of times before the system freezes. I have added the last few l=
ines
below.

I am running the latest MESA code from git, so the last crash was with Mesa
from  20170227 and I am using a 750 Ti Card.

01:00.0 VGA compatible controller: NVIDIA Corporation GM107 [GeForce GTX 750
Ti] (rev a2)

If there is anything else I can provide, please let me know.

Thanks and keep up the good work.


Feb 27 21:12:38 zeus kernel: [34599.410668] nouveau 0000:01:00.0: gr: FECS
ucode error 2
Feb 27 21:12:38 zeus kernel: [34599.410668] nouveau 0000:01:00.0: gr: FECS
00000002
Feb 27 21:12:38 zeus kernel: [34599.410670] nouveau 0000:01:00.0: gr: 40900=
0 -
done 00000340
Feb 27 21:12:38 zeus kernel: [34599.410674] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 80000000 0001a600 00000000 80031828
Feb 27 21:12:38 zeus kernel: [34599.410677] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 200208e3 00000003 00000006 00000090
Feb 27 21:12:38 zeus kernel: [34599.410679] nouveau 0000:01:00.0: gr: 50200=
0 -
done 00000300
Feb 27 21:12:38 zeus kernel: [34599.410683] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 80000000 00010400 00000000 00000000
Feb 27 21:12:38 zeus kernel: [34599.410687] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 00000000 00000000 00000002 00000000
Feb 27 21:12:38 zeus kernel: [34599.410690] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
Feb 27 21:12:38 zeus kernel: [34599.410692] nouveau 0000:01:00.0: fifo: gr
engine fault on channel 2, recovering...
Feb 27 21:12:38 zeus kernel: [34599.410709] nouveau 0000:01:00.0: gr: FECS =
MTHD
subc 3 class 0000 mthd 1828 data 200208e3
Feb 27 21:12:38 zeus kernel: [34599.410710] nouveau 0000:01:00.0: gr: FECS
00000002
Feb 27 21:12:38 zeus kernel: [34599.410712] nouveau 0000:01:00.0: gr: 40900=
0 -
done 00000340
Feb 27 21:12:38 zeus kernel: [34599.410715] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 80000000 0001a600 00000000 80031828
Feb 27 21:12:38 zeus kernel: [34599.410719] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 200208e3 00000002 00000006 00000091
Feb 27 21:12:38 zeus kernel: [34599.410720] nouveau 0000:01:00.0: gr: 50200=
0 -
done 00000300
Feb 27 21:12:38 zeus kernel: [34599.410724] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 80000000 00010400 00000000 00000000
Feb 27 21:12:38 zeus kernel: [34599.410728] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 00000000 00000000 00000002 00000000
Feb 27 21:12:38 zeus kernel: [34599.410740] nouveau 0000:01:00.0: gr: FECS =
MTHD
subc 3 class 0000 mthd 1828 data 200208e3
Feb 27 21:12:38 zeus kernel: [34599.410741] nouveau 0000:01:00.0: gr: FECS
00000002
Feb 27 21:12:38 zeus kernel: [34599.410743] nouveau 0000:01:00.0: gr: 40900=
0 -
done 00000340
Feb 27 21:12:38 zeus kernel: [34599.410746] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 80000000 0001a600 00000000 80031828
Feb 27 21:12:38 zeus kernel: [34599.410750] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 200208e3 00000003 00000006 00000090
Feb 27 21:12:38 zeus kernel: [34599.410751] nouveau 0000:01:00.0: gr: 50200=
0 -
done 00000300
Feb 27 21:12:38 zeus kernel: [34599.410755] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 80000000 00010400 00000000 00000000
Feb 27 21:12:38 zeus kernel: [34599.410759] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 00000000 00000000 00000002 00000000
Feb 27 21:12:38 zeus kernel: [34599.410769] nouveau 0000:01:00.0: gr: FECS
ucode error 2
Feb 27 21:12:38 zeus kernel: [34599.410770] nouveau 0000:01:00.0: gr: FECS
00000002
Feb 27 21:12:38 zeus kernel: [34599.410772] nouveau 0000:01:00.0: gr: 40900=
0 -
done 00000340
Feb 27 21:12:38 zeus kernel: [34599.410775] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 80000000 0001a600 00000000 80031828
Feb 27 21:12:38 zeus kernel: [34599.410779] nouveau 0000:01:00.0: gr: 40900=
0 -
stat 200208e3 00000003 00000006 00000090
Feb 27 21:12:38 zeus kernel: [34599.410780] nouveau 0000:01:00.0: gr: 50200=
0 -
done 00000300
Feb 27 21:12:38 zeus kernel: [34599.410784] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 80000000 00010400 00000000 00000000
Feb 27 21:12:38 zeus kernel: [34599.410788] nouveau 0000:01:00.0: gr: 50200=
0 -
stat 00000000 00000000 00000002 00000000
Feb 27 21:12:38 zeus kernel: [34599.410798] nouveau 0000:01:00.0: fifo: PBD=
MA0:
01000000 [] ch 2 [007f957000 Xorg[1458]] subc 3 mthd 0200 data 000000cf
Feb 27 21:12:38 zeus kernel: [34599.410807] nouveau 0000:01:00.0: priv: HUB=
0:
400500 00010001 (1b408201)
Feb 27 21:12:38 zeus kernel: [34599.410817] nouveau 0000:01:00.0: fifo: PBD=
MA0:
01000000 [] ch 2 [007f957000 Xorg[1458]] subc 3 mthd 0204 data 00000000
Feb 27 21:12:38 zeus kernel: [34599.411237] nouveau 0000:01:00.0: fifo: wri=
te
fault at 00019e3000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 02 [PTE] =
on
channel 7 [007f15c000 VirtualBox[8519]]
Feb 27 21:12:38 zeus kernel: [34599.411239] nouveau 0000:01:00.0: fifo: gr
engine fault on channel 7, recovering...
&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;=
&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;=
&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;=
&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;=
&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;=
&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;=
&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;&#64;=
&#64;&#64;&#64;&#64;&#64;&#64;&#64;Feb
28</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14882691061.6fCDDa.20228--

--===============0342239727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0342239727==--
