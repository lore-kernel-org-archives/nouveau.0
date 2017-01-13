From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99400] New: [nouveau] garbled rending with glamor on
	G71
Date: Fri, 13 Jan 2017 15:21:00 +0000
Message-ID: <bug-99400-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1731167378=="
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


--===============1731167378==
Content-Type: multipart/alternative; boundary="14843208600.ee01B1a.4708";
 charset="UTF-8"


--14843208600.ee01B1a.4708
Date: Fri, 13 Jan 2017 15:21:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99400

            Bug ID: 99400
           Summary: [nouveau] garbled rending with glamor on G71
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: fourdan-eaOCjQ5FDoY@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 128933
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128933&action=3Dedit
Screenshot of the issue

Description:

While investigating rendering bugs on Xwayland with nouveau specifically ([=
1]
and [2]) I realized that some gtk2 output (this Xwayland) is completely
garbled.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=3D1411447
[2] https://bugzilla.gnome.org/show_bug.cgi?id=3D776255

How reproducible:

Always

Steps to reproduce:

1. Log in a Wayland session (either Weston or GNOME shell) on a Dell M1710 =
with
a GeForce Go 7950 GTX=20
2. Run gtk-demo (the one from gtk2, i.e. not Wayland native but relying on
Xwayland)
3. Start the "Assistant" demo (second starting from the top)

Actual result:

The window is black with random content

Expected result:

The rendering is correct

Additional data:

This issue does not occur when using "shm" and CPU rendering instead of gla=
mor
in Xwayland.

I am not aware of any other hardware where glamor produces such garbled out=
put,
so I suspect an issue with nouveau, but if you reckon it's an issue with gl=
amor
instead, please flip this bug back to xserver/glamor

I have seen other issue with black icons being reported with glamor and nou=
veau
as well and these do not occur when using the CPU render in weston for exam=
ple
(https://bugzilla.redhat.com/show_bug.cgi?id=3D1411447#c12)

In my case, hardware is VGA compatible controller: NVIDIA Corporation G71M
[GeForce Go 7950 GTX] (rev a1) (prog-if 00 [VGA controller])

01:00.0 0300: 10de:0297 (rev a1) (prog-if 00 [VGA controller])
        Subsystem: 1028:019b

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14843208600.ee01B1a.4708
Date: Fri, 13 Jan 2017 15:21:00 +0000
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
   title=3D"NEW - [nouveau] garbled rending with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400">99400</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nouveau] garbled rending with glamor on G71
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>fourdan&#64;xfce.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128933=
" name=3D"attach_128933" title=3D"Screenshot of the issue">attachment 12893=
3</a> <a href=3D"attachment.cgi?id=3D128933&amp;action=3Dedit" title=3D"Scr=
eenshot of the issue">[details]</a></span>
Screenshot of the issue

Description:

While investigating rendering bugs on Xwayland with nouveau specifically ([=
1]
and [2]) I realized that some gtk2 output (this Xwayland) is completely
garbled.

[1] <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1411447">https=
://bugzilla.redhat.com/show_bug.cgi?id=3D1411447</a>
[2] <a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D776255">https:/=
/bugzilla.gnome.org/show_bug.cgi?id=3D776255</a>

How reproducible:

Always

Steps to reproduce:

1. Log in a Wayland session (either Weston or GNOME shell) on a Dell M1710 =
with
a GeForce Go 7950 GTX=20
2. Run gtk-demo (the one from gtk2, i.e. not Wayland native but relying on
Xwayland)
3. Start the &quot;Assistant&quot; demo (second starting from the top)

Actual result:

The window is black with random content

Expected result:

The rendering is correct

Additional data:

This issue does not occur when using &quot;shm&quot; and CPU rendering inst=
ead of glamor
in Xwayland.

I am not aware of any other hardware where glamor produces such garbled out=
put,
so I suspect an issue with nouveau, but if you reckon it's an issue with gl=
amor
instead, please flip this bug back to xserver/glamor

I have seen other issue with black icons being reported with glamor and nou=
veau
as well and these do not occur when using the CPU render in weston for exam=
ple
(<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1411447#c12">http=
s://bugzilla.redhat.com/show_bug.cgi?id=3D1411447#c12</a>)

In my case, hardware is VGA compatible controller: NVIDIA Corporation G71M
[GeForce Go 7950 GTX] (rev a1) (prog-if 00 [VGA controller])

01:00.0 0300: 10de:0297 (rev a1) (prog-if 00 [VGA controller])
        Subsystem: 1028:019b</pre>
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

--14843208600.ee01B1a.4708--

--===============1731167378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1731167378==--
