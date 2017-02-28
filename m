From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99900] [NVC1] nouveau: freeze / crash after kernel
 update to 4.10
Date: Tue, 28 Feb 2017 08:17:08 +0000
Message-ID: <bug-99900-8800-mldhCIWQGS@http.bugs.freedesktop.org/>
References: <bug-99900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1242717605=="
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


--===============1242717605==
Content-Type: multipart/alternative; boundary="14882698280.9dE7ff8.21177";
 charset="UTF-8"


--14882698280.9dE7ff8.21177
Date: Tue, 28 Feb 2017 08:17:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99900

--- Comment #6 from Ralph Gauges <r.gauges-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
Just managed to freeze X again. This time I just started VirtualBox.
kern.log entries are as follows. Xorg shows the same backtraces as the one I
already attached.

Feb 28 09:08:50 zeus kernel: [ 3164.314029] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b00
data 20
046234
Feb 28 09:08:50 zeus kernel: [ 3164.314037] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b04
data 00
000000
Feb 28 09:08:50 zeus kernel: [ 3164.314046] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b08
data 00
000000
Feb 28 09:08:50 zeus kernel: [ 3164.314054] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b0c
data 00
000000
Feb 28 09:08:50 zeus kernel: [ 3164.314062] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b10
data 00
000000
Feb 28 09:08:50 zeus kernel: [ 3164.314070] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b14
data 20
050004
Feb 28 09:08:50 zeus kernel: [ 3164.314078] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b18
data 00
000000
Feb 28 09:08:50 zeus kernel: [ 3164.314087] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b1c
data 00
013070
Feb 28 09:08:50 zeus kernel: [ 3164.314095] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b20
data 00
0002ef
Feb 28 09:08:50 zeus kernel: [ 3164.314103] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b24
data 00
000002
Feb 28 09:08:50 zeus kernel: [ 3164.314111] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b28
data 00
000000
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14882698280.9dE7ff8.21177
Date: Tue, 28 Feb 2017 08:17:08 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c6">Comment=
 # 6</a>
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
        <pre>Just managed to freeze X again. This time I just started Virtu=
alBox.
kern.log entries are as follows. Xorg shows the same backtraces as the one I
already attached.

Feb 28 09:08:50 zeus kernel: [ 3164.314029] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b00
data 20
046234
Feb 28 09:08:50 zeus kernel: [ 3164.314037] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b04
data 00
000000
Feb 28 09:08:50 zeus kernel: [ 3164.314046] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b08
data 00
000000
Feb 28 09:08:50 zeus kernel: [ 3164.314054] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b0c
data 00
000000
Feb 28 09:08:50 zeus kernel: [ 3164.314062] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b10
data 00
000000
Feb 28 09:08:50 zeus kernel: [ 3164.314070] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b14
data 20
050004
Feb 28 09:08:50 zeus kernel: [ 3164.314078] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b18
data 00
000000
Feb 28 09:08:50 zeus kernel: [ 3164.314087] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b1c
data 00
013070
Feb 28 09:08:50 zeus kernel: [ 3164.314095] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b20
data 00
0002ef
Feb 28 09:08:50 zeus kernel: [ 3164.314103] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b24
data 00
000002
Feb 28 09:08:50 zeus kernel: [ 3164.314111] nouveau 0000:01:00.0: gr:
ILLEGAL_CLASS ch 7 [007f15c000 VirtualBox[8257]] subc 0 class 0000 mthd 2b28
data 00
000000
^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#=
64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;=
^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#=
64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;=
^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#=
64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;=
^&#64;^&#64;
^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#=
64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;=
^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#=
64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;=
^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#=
64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;=
^&#64;^&#64;
^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#=
64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;=
^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#=
64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;=
^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#=
64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;=
^&#64;^&#64;
^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#=
64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;^&#64;=
^&#64;^&#64;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14882698280.9dE7ff8.21177--

--===============1242717605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1242717605==--
