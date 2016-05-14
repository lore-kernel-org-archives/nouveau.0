From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95403] New: [GK110] misaligned_gpr spamming dmesg
 when playing victor vran
Date: Sat, 14 May 2016 20:53:14 +0000
Message-ID: <bug-95403-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0962922584=="
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


--===============0962922584==
Content-Type: multipart/alternative; boundary="14632591930.980eF.23655";
 charset="UTF-8"


--14632591930.980eF.23655
Date: Sat, 14 May 2016 20:53:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95403

            Bug ID: 95403
           Summary: [GK110] misaligned_gpr spamming dmesg when playing
                    victor vran
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tomenglund26-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

kernel: 4.5.2
mesa: 11.3.0_devel.81287.59156b2

when playing victor vran dmesg gets spammed with MISALIGNED_GPR and
MULTIPLE_WARP_ERRORS, the game runs and i cant notice any particular side
effects from it, i have apitraced it and found the bad
glDrawElementsInstancedBaseVertex call. karolherbst didnt get it when repla=
ying
the trace which is why we suspected its a gk110+ issue.

the call happends in frame 228 and call 372955 according to qapitrace.

trace is a bit big, 372mb compressed.

trace:
https://www.dropbox.com/s/lxrt0oneqaz4mvb/victorvran.tar.xz?dl=3D1

dmesg:
https://gist.github.com/gulafaran/012338e3c3d07c34e289957cb934f5ed

GL_FRAGMENT_SHADER from qapitrace:
https://gist.github.com/gulafaran/2dfa0998770e3b35468013df07216e71

GL_VERTEX_SHADER from qapitrace:
https://gist.github.com/gulafaran/cb51eae8ba9bdb79ed59ca8988266e39

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14632591930.980eF.23655
Date: Sat, 14 May 2016 20:53:13 +0000
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
   title=3D"NEW - [GK110] misaligned_gpr spamming dmesg when playing victor=
 vran"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95403">95403</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[GK110] misaligned_gpr spamming dmesg when playing victor vran
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
          <td>minor
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
          <td>tomenglund26&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>kernel: 4.5.2
mesa: 11.3.0_devel.81287.59156b2

when playing victor vran dmesg gets spammed with MISALIGNED_GPR and
MULTIPLE_WARP_ERRORS, the game runs and i cant notice any particular side
effects from it, i have apitraced it and found the bad
glDrawElementsInstancedBaseVertex call. karolherbst didnt get it when repla=
ying
the trace which is why we suspected its a gk110+ issue.

the call happends in frame 228 and call 372955 according to qapitrace.

trace is a bit big, 372mb compressed.

trace:
<a href=3D"https://www.dropbox.com/s/lxrt0oneqaz4mvb/victorvran.tar.xz?dl=
=3D1">https://www.dropbox.com/s/lxrt0oneqaz4mvb/victorvran.tar.xz?dl=3D1</a>

dmesg:
<a href=3D"https://gist.github.com/gulafaran/012338e3c3d07c34e289957cb934f5=
ed">https://gist.github.com/gulafaran/012338e3c3d07c34e289957cb934f5ed</a>

GL_FRAGMENT_SHADER from qapitrace:
<a href=3D"https://gist.github.com/gulafaran/2dfa0998770e3b35468013df07216e=
71">https://gist.github.com/gulafaran/2dfa0998770e3b35468013df07216e71</a>

GL_VERTEX_SHADER from qapitrace:
<a href=3D"https://gist.github.com/gulafaran/cb51eae8ba9bdb79ed59ca8988266e=
39">https://gist.github.com/gulafaran/cb51eae8ba9bdb79ed59ca8988266e39</a><=
/pre>
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

--14632591930.980eF.23655--

--===============0962922584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0962922584==--
