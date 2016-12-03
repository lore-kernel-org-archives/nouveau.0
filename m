From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98980] New: GTX 980 (GM204)
Date: Sat, 03 Dec 2016 02:29:42 +0000
Message-ID: <bug-98980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0045665404=="
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


--===============0045665404==
Content-Type: multipart/alternative; boundary="14807321821.c6fc78e05.20059";
 charset="UTF-8"


--14807321821.c6fc78e05.20059
Date: Sat, 3 Dec 2016 02:29:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98980

            Bug ID: 98980
           Summary: GTX 980 (GM204)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: zwolfe21-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 128314
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128314&action=3Dedit
dmesg output.

First, I suspect this is the same problem plaguing the 970 4GB cards howeve=
r I
have lost track of the progress and can't tell anymore if the 980 4GB was p=
art
of this. If this is a duplicate I do apologizing.=20

I run two GPUs and 3 monitors. The GTX 760 I keep in the 1st PCI slot so I =
can
boot up. The GTX 980 has never worked on LinuxMint (Linux version 4.4.0-51 =
to
date). The PC will boot, the monitor plugged into the GTX 980 will power on
however only a black screen is displayed (just as many of the 970 4GB stori=
es
I've read).=20

Attached is a DMESG log and a xorg.0 log.=20

Line 881 in the dmesg log it picks up the primary card (GTX 760) and everyt=
hing
proceeds smoothly. At line 1067 nouveau picks up the GTX 980 (GM204) there =
are
several errors in the log, but i'm no developer so its meaningless to me. I
just thought the line numbers might help someone.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14807321821.c6fc78e05.20059
Date: Sat, 3 Dec 2016 02:29:42 +0000
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
   title=3D"NEW - GTX 980 (GM204)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98980">98980</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GTX 980 (GM204)
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
          <td>zwolfe21&#64;hotmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128314=
" name=3D"attach_128314" title=3D"dmesg output.">attachment 128314</a> <a h=
ref=3D"attachment.cgi?id=3D128314&amp;action=3Dedit" title=3D"dmesg output.=
">[details]</a></span>
dmesg output.

First, I suspect this is the same problem plaguing the 970 4GB cards howeve=
r I
have lost track of the progress and can't tell anymore if the 980 4GB was p=
art
of this. If this is a duplicate I do apologizing.=20

I run two GPUs and 3 monitors. The GTX 760 I keep in the 1st PCI slot so I =
can
boot up. The GTX 980 has never worked on LinuxMint (Linux version 4.4.0-51 =
to
date). The PC will boot, the monitor plugged into the GTX 980 will power on
however only a black screen is displayed (just as many of the 970 4GB stori=
es
I've read).=20

Attached is a DMESG log and a xorg.0 log.=20

Line 881 in the dmesg log it picks up the primary card (GTX 760) and everyt=
hing
proceeds smoothly. At line 1067 nouveau picks up the GTX 980 (GM204) there =
are
several errors in the log, but i'm no developer so its meaningless to me. I
just thought the line numbers might help someone.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14807321821.c6fc78e05.20059--

--===============0045665404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0045665404==--
