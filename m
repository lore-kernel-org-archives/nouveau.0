From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68126] New: drm Nouveau fails compile
Date: Wed, 14 Aug 2013 23:20:11 +0000
Message-ID: <bug-68126-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1264564532=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1264564532==
Content-Type: multipart/alternative; boundary="1376522412.46D66850.16480"; charset="us-ascii"


--1376522412.46D66850.16480
Date: Wed, 14 Aug 2013 23:20:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D68126

          Priority: medium
            Bug ID: 68126
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: drm Nouveau fails compile
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: grey3050-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
          Hardware: All
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

commit d1ba1055d98c246d1ee9d9c14706bb9fba6a98c7
Author: Rico Sch=C3=BCller <kgbricola-S0/GAf8tV78@public.gmane.org>
Date:   Wed Aug 14 13:17:22 2013 +0200

Error: nouveau_video.c:866:33: error: 'screen' undeclared (first use in this
function)

I had someone else in #wayland try the same commit and get the same error as
well.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1376522412.46D66850.16480
Date: Wed, 14 Aug 2013 23:20:12 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - drm Nouveau fails compile"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D68126">68126</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>drm Nouveau fails compile
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>grey3050&#64;hotmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>commit d1ba1055d98c246d1ee9d9c14706bb9fba6a98c7
Author: Rico Sch=C3=BCller &lt;<a href=3D"mailto:kgbricola&#64;web.de">kgbr=
icola&#64;web.de</a>&gt;
Date:   Wed Aug 14 13:17:22 2013 +0200

Error: nouveau_video.c:866:33: error: 'screen' undeclared (first use in this
function)

I had someone else in #wayland try the same commit and get the same error as
well.</pre>
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

--1376522412.46D66850.16480--

--===============1264564532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1264564532==--
