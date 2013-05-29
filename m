From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65116] New: Since upgrade to libX11-1.5.99.902
 several problems with gnome desktop
Date: Wed, 29 May 2013 08:21:15 +0000
Message-ID: <bug-65116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1801620874=="
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


--===============1801620874==
Content-Type: multipart/alternative; boundary="1369815675.1E6f4F1.6931"; charset="us-ascii"


--1369815675.1E6f4F1.6931
Date: Wed, 29 May 2013 08:21:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65116

          Priority: medium
            Bug ID: 65116
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Since upgrade to libX11-1.5.99.902 several problems
                    with gnome desktop
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: rose-L/08BfOuEgquzba0o+Ga+bNAH6kLmebB@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

After installing libX11-1.5.99.902 and libXau-1.0.8 I see strange effects on
systems with NVidia cards.
At the first system (Gallium 04 on NV86 - NVIDIA Corporation G86M [Quadro NVS
140M]) the gnome desktop background is set to a green gradient, but only a
black background is shown.
At the second system, gnome systems settings says Gallium 0.4 on NVD9 - Forced
Fallback modus On (NVIDIA Corporation GF119 [GeForce GT 520]) the the desktop
background is not refreshed. If I switch at the second system to the 3D mode,
the issue with the background disappears but the desktop is frequently
crashing.

This bug is also filed as a gentoo bug at 

https://bugs.gentoo.org/show_bug.cgi?id=471396.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369815675.1E6f4F1.6931
Date: Wed, 29 May 2013 08:21:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Since upgrade to libX11-1.5.99.902 several problems with gnome desktop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65116">65116</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Since upgrade to libX11-1.5.99.902 several problems with gnome desktop
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>rose&#64;rz.uni-potsdam.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>After installing libX11-1.5.99.902 and libXau-1.0.8 I see strange effects on
systems with NVidia cards.
At the first system (Gallium 04 on NV86 - NVIDIA Corporation G86M [Quadro NVS
140M]) the gnome desktop background is set to a green gradient, but only a
black background is shown.
At the second system, gnome systems settings says Gallium 0.4 on NVD9 - Forced
Fallback modus On (NVIDIA Corporation GF119 [GeForce GT 520]) the the desktop
background is not refreshed. If I switch at the second system to the 3D mode,
the issue with the background disappears but the desktop is frequently
crashing.

This bug is also filed as a gentoo bug at 

<a href="https://bugs.gentoo.org/show_bug.cgi?id=471396">https://bugs.gentoo.org/show_bug.cgi?id=471396</a>.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369815675.1E6f4F1.6931--

--===============1801620874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1801620874==--
