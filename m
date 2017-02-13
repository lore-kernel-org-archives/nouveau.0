From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99799] New: Civilization VI makes nouveau crash on
 register allocation
Date: Mon, 13 Feb 2017 20:27:01 +0000
Message-ID: <bug-99799-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0787093258=="
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


--===============0787093258==
Content-Type: multipart/alternative; boundary="14870176210.A12E2.19005";
 charset="UTF-8"


--14870176210.A12E2.19005
Date: Mon, 13 Feb 2017 20:27:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99799

            Bug ID: 99799
           Summary: Civilization VI makes nouveau crash on register
                    allocation
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

Civilization IV consistently segfaults on register allocation when loading a
scenario, regardless if it's actual game or the benchmark mode.
I am attaching an apitrace [1] leading to the aforementioned segfault.
Also attaching a stacktrace, line listing of the crashing point and register
dump [2] obtained by running the game through gdb.

I should also mention that the game sometimes randomly crashes in a peculiar
way before even reaching the main menu. This report is not for that bug, wh=
ich
is not yet properly reported. I am mentioning this because replaying the tr=
ace
does sometimes trigger that bug, too. Therefore, be advised that unless the
trace goes past the main menu, You ought to replay again to reach the point=
 of
this bug.

[1] https://seriouss.am/etc/civ6-nouveau.trace.xz (apitrace file; xz'ed;
653MiB; 1050MiB uncompressed)
[2] https://seriouss.am/etc/civ6-gdb (plaintext; 5.6KiB)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14870176210.A12E2.19005
Date: Mon, 13 Feb 2017 20:27:01 +0000
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
   title=3D"NEW - Civilization VI makes nouveau crash on register allocatio=
n"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99799">99799</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Civilization VI makes nouveau crash on register allocation
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
        <pre>Civilization IV consistently segfaults on register allocation =
when loading a
scenario, regardless if it's actual game or the benchmark mode.
I am attaching an apitrace [1] leading to the aforementioned segfault.
Also attaching a stacktrace, line listing of the crashing point and register
dump [2] obtained by running the game through gdb.

I should also mention that the game sometimes randomly crashes in a peculiar
way before even reaching the main menu. This report is not for that bug, wh=
ich
is not yet properly reported. I am mentioning this because replaying the tr=
ace
does sometimes trigger that bug, too. Therefore, be advised that unless the
trace goes past the main menu, You ought to replay again to reach the point=
 of
this bug.

[1] <a href=3D"https://seriouss.am/etc/civ6-nouveau.trace.xz">https://serio=
uss.am/etc/civ6-nouveau.trace.xz</a> (apitrace file; xz'ed;
653MiB; 1050MiB uncompressed)
[2] <a href=3D"https://seriouss.am/etc/civ6-gdb">https://seriouss.am/etc/ci=
v6-gdb</a> (plaintext; 5.6KiB)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14870176210.A12E2.19005--

--===============0787093258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0787093258==--
