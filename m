From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103217] New: Recent noveau causes errors with scilab
 5.5.2 on NVIDIA G84GL [Quadro FX 570]
Date: Wed, 11 Oct 2017 11:29:18 +0000
Message-ID: <bug-103217-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1710477060=="
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


--===============1710477060==
Content-Type: multipart/alternative; boundary="15077213580.ccA3.31344";
 charset="UTF-8"


--15077213580.ccA3.31344
Date: Wed, 11 Oct 2017 11:29:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103217

            Bug ID: 103217
           Summary: Recent noveau causes errors with scilab 5.5.2 on
                    NVIDIA G84GL [Quadro FX 570]
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: sergio.callegari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

With git tip (as of today - 11 Sept 2017) launching scilab I get

javax.media.opengl.GLException: X11GLXDrawableFactory - Could not initialize
shared resources for :0
        at
jogamp.opengl.x11.glx.X11GLXDrawableFactory$SharedResourceImplementation.cr=
eateSharedResource(X11GLXDrawableFactory.java:317)
        at
jogamp.opengl.SharedResourceRunner.run(SharedResourceRunner.java:295)
        at java.lang.Thread.run(Unknown Source)
Caused by: java.lang.NullPointerException
        at jogamp.opengl.GLContextImpl.makeCurrent(GLContextImpl.java:625)
        at jogamp.opengl.GLContextImpl.makeCurrent(GLContextImpl.java:539)
        at
jogamp.opengl.x11.glx.X11GLXDrawableFactory$SharedResourceImplementation.cr=
eateSharedResource(X11GLXDrawableFactory.java:293)
        ... 2 more

Almost sure, it used to work up to a few days ago.
Scilab works fine with LIBGL_ALWAYS_SOFTWARE=3D1

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15077213580.ccA3.31344
Date: Wed, 11 Oct 2017 11:29:18 +0000
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
   title=3D"NEW - Recent noveau causes errors with scilab 5.5.2 on NVIDIA G=
84GL [Quadro FX 570]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103217">103217</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Recent noveau causes errors with scilab 5.5.2 on NVIDIA G84GL=
 [Quadro FX 570]
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>sergio.callegari&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>With git tip (as of today - 11 Sept 2017) launching scilab I g=
et

javax.media.opengl.GLException: X11GLXDrawableFactory - Could not initialize
shared resources for :0
        at
jogamp.opengl.x11.glx.X11GLXDrawableFactory$SharedResourceImplementation.cr=
eateSharedResource(X11GLXDrawableFactory.java:317)
        at
jogamp.opengl.SharedResourceRunner.run(SharedResourceRunner.java:295)
        at java.lang.Thread.run(Unknown Source)
Caused by: java.lang.NullPointerException
        at jogamp.opengl.GLContextImpl.makeCurrent(GLContextImpl.java:625)
        at jogamp.opengl.GLContextImpl.makeCurrent(GLContextImpl.java:539)
        at
jogamp.opengl.x11.glx.X11GLXDrawableFactory$SharedResourceImplementation.cr=
eateSharedResource(X11GLXDrawableFactory.java:293)
        ... 2 more

Almost sure, it used to work up to a few days ago.
Scilab works fine with LIBGL_ALWAYS_SOFTWARE=3D1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15077213580.ccA3.31344--

--===============1710477060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1710477060==--
