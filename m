From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92126] New: [NVE4] GTX 760 Auto fan speed stays at
 10% until temp hits 90C
Date: Sat, 26 Sep 2015 03:00:42 +0000
Message-ID: <bug-92126-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1173807897=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1173807897==
Content-Type: multipart/alternative; boundary="1443236442.fDFabf1.2762"; charset="UTF-8"


--1443236442.fDFabf1.2762
Date: Sat, 26 Sep 2015 03:00:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92126

            Bug ID: 92126
           Summary: [NVE4] GTX 760 Auto fan speed stays at 10% until temp
                    hits 90C
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: lnf.purple-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 118454
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D118454&action=3Dedit
Linux 4.2.1 dmesg with master_karol_stable module

The fan speed of the PNY GTX 760 stays at 0% until reaching the critical
temperature of 90=C2=B0 C. This happens on the stock nouveau module from 4.=
2.1, but
I will include the git info nonetheless:

https://github.com/karolherbst/nouveau
Commit fc135d4e28fe05ef1269fd9e1af5f7af1284893d

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1443236442.fDFabf1.2762
Date: Sat, 26 Sep 2015 03:00:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE4] GTX 760 Auto fan speed stays at 10% until temp hit=
s 90C"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92126">92126</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE4] GTX 760 Auto fan speed stays at 10% until temp hits 90C
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>lnf.purple&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D118454=
" name=3D"attach_118454" title=3D"Linux 4.2.1 dmesg with master_karol_stabl=
e module">attachment 118454</a> <a href=3D"attachment.cgi?id=3D118454&amp;a=
ction=3Dedit" title=3D"Linux 4.2.1 dmesg with master_karol_stable module">[=
details]</a></span>
Linux 4.2.1 dmesg with master_karol_stable module

The fan speed of the PNY GTX 760 stays at 0% until reaching the critical
temperature of 90=C2=B0 C. This happens on the stock nouveau module from 4.=
2.1, but
I will include the git info nonetheless:

<a href=3D"https://github.com/karolherbst/nouveau">https://github.com/karol=
herbst/nouveau</a>
Commit fc135d4e28fe05ef1269fd9e1af5f7af1284893d</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443236442.fDFabf1.2762--

--===============1173807897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1173807897==--
