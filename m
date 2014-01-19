From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73791] New: [NV96] [BISECTED] Regression: 9600M GT
 fails to boot with 3.13-rc8
Date: Sun, 19 Jan 2014 12:35:53 +0000
Message-ID: <bug-73791-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1261591338=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1261591338==
Content-Type: multipart/alternative; boundary="1390134954.aDEeCed1.23037"; charset="us-ascii"


--1390134954.aDEeCed1.23037
Date: Sun, 19 Jan 2014 12:35:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D73791

          Priority: medium
            Bug ID: 73791
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV96] [BISECTED] Regression: 9600M GT fails to boot
                    with 3.13-rc8
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: andreas.reis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 92385
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D92385&action=3Dedit
dmesg (rc8 with commit reverted)

Commit "populate master subdev pointer only when fully constructed" breaks
support for my 9600M GT (G96 on an Acer Aspire 6935G, bios 1.21), identifie=
d by
bisection and reverting it from the current git head (7d0d46da).

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=
=3D61b365a505d625734be9ac54066fe4700672abc9

Instead of the framebuffer switching to the display's native resolution it =
just
stays at the one given by the bios and the boot comes to a halt after a few
seconds (with a few tasks, like wifi initialization, still being done
afterwards).

(I don't know the proper terminology; I hope that this description is clear
enough=E2=80=A6)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1390134954.aDEeCed1.23037
Date: Sun, 19 Jan 2014 12:35:54 +0000
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
   title=3D"NEW --- - [NV96] [BISECTED] Regression: 9600M GT fails to boot =
with 3.13-rc8"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D73791">73791</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV96] [BISECTED] Regression: 9600M GT fails to boot with 3.1=
3-rc8
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>andreas.reis&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D92385"=
 name=3D"attach_92385" title=3D"dmesg (rc8 with commit reverted)">attachmen=
t 92385</a> <a href=3D"attachment.cgi?id=3D92385&amp;action=3Dedit" title=
=3D"dmesg (rc8 with commit reverted)">[details]</a></span>
dmesg (rc8 with commit reverted)

Commit &quot;populate master subdev pointer only when fully constructed&quo=
t; breaks
support for my 9600M GT (G96 on an Acer Aspire 6935G, bios 1.21), identifie=
d by
bisection and reverting it from the current git head (7d0d46da).

<a href=3D"https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/=
commit/?id=3D61b365a505d625734be9ac54066fe4700672abc9">https://git.kernel.o=
rg/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3D61b365a505d625734b=
e9ac54066fe4700672abc9</a>

Instead of the framebuffer switching to the display's native resolution it =
just
stays at the one given by the bios and the boot comes to a halt after a few
seconds (with a few tasks, like wifi initialization, still being done
afterwards).

(I don't know the proper terminology; I hope that this description is clear
enough=E2=80=A6)</pre>
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

--1390134954.aDEeCed1.23037--

--===============1261591338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1261591338==--
