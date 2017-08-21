From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102337] New: Full system crash when running a custom
 OpenGL 4.3 graphic engine
Date: Mon, 21 Aug 2017 15:15:09 +0000
Message-ID: <bug-102337-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1630320137=="
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


--===============1630320137==
Content-Type: multipart/alternative; boundary="15033285090.df67cc7D.2532";
 charset="UTF-8"


--15033285090.df67cc7D.2532
Date: Mon, 21 Aug 2017 15:15:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102337

            Bug ID: 102337
           Summary: Full system crash when running a custom OpenGL 4.3
                    graphic engine
           Product: Mesa
           Version: 17.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: from.the.darkest.past-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 133645
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D133645&action=3Dedit
glxinfo output

I wrote a custom graphic engine as a school project and tested it on differ=
ent
platforms; it works everywhere (both nVidia and AMD) with binary drivers but
triggers a whole system crash (only the mouse cursor remains responsive) on
MESA + Nouveau.

I am testing it with Ubuntu 17.10 daily build (kernel version 4.12) that
supports OpenGL 4.3 (which is required) on my nVidia card, a GT 740. The fu=
ll
source code is available at https://github.com/TheBrokenGod/OmegaEngine and
includes a makefile for simple compilation.=20

The engine executes some complicated shaders (contained in Source.cpp) in o=
rder
to allow order-independent transparency through linked lists of fragments.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15033285090.df67cc7D.2532
Date: Mon, 21 Aug 2017 15:15:09 +0000
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
   title=3D"NEW - Full system crash when running a custom OpenGL 4.3 graphi=
c engine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102337">102337</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Full system crash when running a custom OpenGL 4.3 graphic en=
gine
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.1
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
          <td>critical
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
          <td>from.the.darkest.past&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D133645=
" name=3D"attach_133645" title=3D"glxinfo output">attachment 133645</a> <a =
href=3D"attachment.cgi?id=3D133645&amp;action=3Dedit" title=3D"glxinfo outp=
ut">[details]</a></span>
glxinfo output

I wrote a custom graphic engine as a school project and tested it on differ=
ent
platforms; it works everywhere (both nVidia and AMD) with binary drivers but
triggers a whole system crash (only the mouse cursor remains responsive) on
MESA + Nouveau.

I am testing it with Ubuntu 17.10 daily build (kernel version 4.12) that
supports OpenGL 4.3 (which is required) on my nVidia card, a GT 740. The fu=
ll
source code is available at <a href=3D"https://github.com/TheBrokenGod/Omeg=
aEngine">https://github.com/TheBrokenGod/OmegaEngine</a> and
includes a makefile for simple compilation.=20

The engine executes some complicated shaders (contained in Source.cpp) in o=
rder
to allow order-independent transparency through linked lists of fragments.<=
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

--15033285090.df67cc7D.2532--

--===============1630320137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1630320137==--
