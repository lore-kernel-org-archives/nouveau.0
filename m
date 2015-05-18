From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90513] New: Odd gray and red flicker in The Talos
 Principle on GK104
Date: Mon, 18 May 2015 22:43:35 +0000
Message-ID: <bug-90513-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0445888016=="
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


--===============0445888016==
Content-Type: multipart/alternative; boundary="1431989015.AB5c3F10.6526"; charset="UTF-8"


--1431989015.AB5c3F10.6526
Date: Mon, 18 May 2015 22:43:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90513

            Bug ID: 90513
           Summary: Odd gray and red flicker in The Talos Principle on
                    GK104
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gediminas-1NU85dn7e2ownf/OCUKchA@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

When running The Talos Principle[1] on my GK104 under Nouveau, I get two ki=
nds
of odd flickering:
=C2=B7 some parts of some objects flicker between being bright and less bri=
ght
=C2=B7 some objects flicker between being "normal" and full-red
Although, the "red" flicker does not appear if the game's graphics settings=
 are
set to "minimum" =E2=80=93 only the bright / less bright flicker happens.
It looks fine on proprietary drivers, which probably rules out hardware
defects. It also looks fine on an Intel GPU under Mesa.

I recorded a short video[2] in case anyone agrees that one look is better t=
han
a thousand words and wants to see it in action.


I recorded an apitrace[3] of it. On nouveau this replays the same way it lo=
oks
"live". On proprietary drivers it replays "correctly" =E2=80=93 the flicker=
 is
nonexistent. I did not manage to do the reverse =E2=80=93 sadly, an apitrac=
e recorded
on proprietary drivers fail to replay at all regardless of what driver is u=
sed.

[1] http://store.steampowered.com/app/257510/ [a free demo version which ca=
n be
used to reproduce is also available]
[2] https://seriouss.am/video/talos-redflicker.mp4 length: 20 seconds;
filesize: 24.6 MiB
[3] https://seriouss.am/talos-nouveau-2015-05-11T1231.trace.xz filesize: 36=
1.9
MiB

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1431989015.AB5c3F10.6526
Date: Mon, 18 May 2015 22:43:35 +0000
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
   title=3D"NEW - Odd gray and red flicker in The Talos Principle on GK104"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90513">90513</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Odd gray and red flicker in The Talos Principle on GK104
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>gediminas&#64;varciai.lt
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When running The Talos Principle[1] on my GK104 under Nouveau,=
 I get two kinds
of odd flickering:
=C2=B7 some parts of some objects flicker between being bright and less bri=
ght
=C2=B7 some objects flicker between being &quot;normal&quot; and full-red
Although, the &quot;red&quot; flicker does not appear if the game's graphic=
s settings are
set to &quot;minimum&quot; =E2=80=93 only the bright / less bright flicker =
happens.
It looks fine on proprietary drivers, which probably rules out hardware
defects. It also looks fine on an Intel GPU under Mesa.

I recorded a short video[2] in case anyone agrees that one look is better t=
han
a thousand words and wants to see it in action.


I recorded an apitrace[3] of it. On nouveau this replays the same way it lo=
oks
&quot;live&quot;. On proprietary drivers it replays &quot;correctly&quot; =
=E2=80=93 the flicker is
nonexistent. I did not manage to do the reverse =E2=80=93 sadly, an apitrac=
e recorded
on proprietary drivers fail to replay at all regardless of what driver is u=
sed.

[1] <a href=3D"http://store.steampowered.com/app/257510/">http://store.stea=
mpowered.com/app/257510/</a> [a free demo version which can be
used to reproduce is also available]
[2] <a href=3D"https://seriouss.am/video/talos-redflicker.mp4">https://seri=
ouss.am/video/talos-redflicker.mp4</a> length: 20 seconds;
filesize: 24.6 MiB
[3] <a href=3D"https://seriouss.am/talos-nouveau-2015-05-11T1231.trace.xz">=
https://seriouss.am/talos-nouveau-2015-05-11T1231.trace.xz</a> filesize: 36=
1.9
MiB</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431989015.AB5c3F10.6526--

--===============0445888016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0445888016==--
