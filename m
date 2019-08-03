From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111292] New: Advanced Lighting option in Firestorm
 Viewer makes some objects black on nv92 card
Date: Sat, 03 Aug 2019 10:08:06 +0000
Message-ID: <bug-111292-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0397513654=="
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


--===============0397513654==
Content-Type: multipart/alternative; boundary="15648268860.b1f13fCa.24713"
Content-Transfer-Encoding: 7bit


--15648268860.b1f13fCa.24713
Date: Sat, 3 Aug 2019 10:08:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111292

            Bug ID: 111292
           Summary: Advanced Lighting option in Firestorm Viewer makes
                    some objects black on nv92 card
           Product: Mesa
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Hello!

While not everyone here likes to play Second Life - I was lured into it by
following some interesting posts, and so far it works quite OK with
nouveau/nv92 card. But when i tried to enable _everything_ in viewer's
preferences - scene become broken: / Disabling 'Advanced Lighting' in
preferences moves scene back to normal look.

Viewer: https://www.firestormviewer.org/
Phoenix_FirestormOS-Release_i686_6.0.2.56680 {but be aware viewer for Second
Life only and not OpenSimulator can be blocked when 3 new releases come out=
 ..
see https://wiki.firestormviewer.org/fs_old_version_blocks}

src:
http://www.phoenixviewer.com/phoenix-firestorm-lgpl/file/80296261f0ac/indra=
/newview/pipeline.cpp
[I think this is correct file in their VCS]


Mesa: OpenGL core profile version string: 3.3 (Core Profile) Mesa 19.2.0-de=
vel
(git-de17922b8a)
kernel: 5.1.12-x64
Xserver: 1.19.7
xf86-video-nouveau - latest git [132955.893] (II) NOUVEAU driver Date:   Mon
Jan 28 23:25:58 2019 -0500

will add two attachements - broken and correct rendering.

You can get Second Life account for free, no need for  credit card info or =
real
name.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15648268860.b1f13fCa.24713
Date: Sat, 3 Aug 2019 10:08:06 +0000
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
   title=3D"NEW - Advanced Lighting option in Firestorm Viewer makes some o=
bjects black on nv92 card"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111292">111292</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Advanced Lighting option in Firestorm Viewer makes some objec=
ts black on nv92 card
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
          <td>x86 (IA32)
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
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello!

While not everyone here likes to play Second Life - I was lured into it by
following some interesting posts, and so far it works quite OK with
nouveau/nv92 card. But when i tried to enable _everything_ in viewer's
preferences - scene become broken: / Disabling 'Advanced Lighting' in
preferences moves scene back to normal look.

Viewer: <a href=3D"https://www.firestormviewer.org/">https://www.firestormv=
iewer.org/</a>
Phoenix_FirestormOS-Release_i686_6.0.2.56680 {but be aware viewer for Second
Life only and not OpenSimulator can be blocked when 3 new releases come out=
 ..
see <a href=3D"https://wiki.firestormviewer.org/fs_old_version_blocks">http=
s://wiki.firestormviewer.org/fs_old_version_blocks</a>}

src:
<a href=3D"http://www.phoenixviewer.com/phoenix-firestorm-lgpl/file/8029626=
1f0ac/indra/newview/pipeline.cpp">http://www.phoenixviewer.com/phoenix-fire=
storm-lgpl/file/80296261f0ac/indra/newview/pipeline.cpp</a>
[I think this is correct file in their VCS]


Mesa: OpenGL core profile version string: 3.3 (Core Profile) Mesa 19.2.0-de=
vel
(git-de17922b8a)
kernel: 5.1.12-x64
Xserver: 1.19.7
xf86-video-nouveau - latest git [132955.893] (II) NOUVEAU driver Date:   Mon
Jan 28 23:25:58 2019 -0500

will add two attachements - broken and correct rendering.

You can get Second Life account for free, no need for  credit card info or =
real
name.</pre>
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

--15648268860.b1f13fCa.24713--

--===============0397513654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0397513654==--
