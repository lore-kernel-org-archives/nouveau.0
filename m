From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104784] New: Unable to do reclocking manually
Date: Thu, 25 Jan 2018 07:16:03 +0000
Message-ID: <bug-104784-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0244688276=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0244688276==
Content-Type: multipart/alternative; boundary="15168645631.4faaf.31231"
Content-Transfer-Encoding: 7bit


--15168645631.4faaf.31231
Date: Thu, 25 Jan 2018 07:16:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104784

            Bug ID: 104784
           Summary: Unable to do reclocking manually
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: berillions-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hi,

I have a laptop with Optimus technology, my Nvidia card is a GTX 640MX. I u=
se
Debian Unstable x86_64 with nouveau 1.0.15 and Mesa 17.3.3

Unfortunatly, it's impossible to do reclocking with Nouveau and my GPU.

When i launch "cat /sys/kernel/debug/dri/1/pstate", i have these results :
07: core 270-405 MHz memory 648 MHz
0a: core 270-601 MHz memory 1600 MHz
0f: core 270-614 MHz memory 2800 MHz
AC: core 0 MHz memory 0 MHz

------

It's anormal to have these line "AC: core 0 MHz memory 0 MHz", right ?
Because when i set "echo 0f > /sys/kernel/debug/dri/1/pstate", the console =
(not
the system) hangs. And when i launch a game (Tyranny), it does not work.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15168645631.4faaf.31231
Date: Thu, 25 Jan 2018 07:16:03 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to do reclocking manually"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104784">104784</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Unable to do reclocking manually
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
          <td>berillions&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

I have a laptop with Optimus technology, my Nvidia card is a GTX 640MX. I u=
se
Debian Unstable x86_64 with nouveau 1.0.15 and Mesa 17.3.3

Unfortunatly, it's impossible to do reclocking with Nouveau and my GPU.

When i launch &quot;cat /sys/kernel/debug/dri/1/pstate&quot;, i have these =
results :
07: core 270-405 MHz memory 648 MHz
0a: core 270-601 MHz memory 1600 MHz
0f: core 270-614 MHz memory 2800 MHz
AC: core 0 MHz memory 0 MHz

------

It's anormal to have these line &quot;AC: core 0 MHz memory 0 MHz&quot;, ri=
ght ?
Because when i set &quot;echo 0f &gt; /sys/kernel/debug/dri/1/pstate&quot;,=
 the console (not
the system) hangs. And when i launch a game (Tyranny), it does not work.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15168645631.4faaf.31231--

--===============0244688276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0244688276==--
