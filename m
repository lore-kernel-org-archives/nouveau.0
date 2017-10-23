From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103409] New: [GM107] reboot/suspend/lspci hang with
	nouveau
Date: Mon, 23 Oct 2017 07:38:17 +0000
Message-ID: <bug-103409-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0220938744=="
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


--===============0220938744==
Content-Type: multipart/alternative; boundary="15087442970.fAbfB.11455";
 charset="UTF-8"


--15087442970.fAbfB.11455
Date: Mon, 23 Oct 2017 07:38:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103409

            Bug ID: 103409
           Summary: [GM107] reboot/suspend/lspci hang with nouveau
           Product: Mesa
           Version: 17.2
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: lnicola-loYLBSFlYLg@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 134998
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134998&action=3Dedit
dmesg log

I have an ASUS ROG laptop (GL752V) with dual graphics. I've just installed
Linux and GNOME seems to pick the Intel card by default, but the nouveau mo=
dule
still gets loaded.

The issue is that I can't power off, reboot or suspend the laptop. On reboot
and power off it hangs with a "watchdog0 did not stop" message on the conso=
le.
I also noticed that simply running lspci hangs in uninterruptible sleep.

Blacklisting the nouveau driver fixes all these issues.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15087442970.fAbfB.11455
Date: Mon, 23 Oct 2017 07:38:17 +0000
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
   title=3D"NEW - [GM107] reboot/suspend/lspci hang with nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103409">103409</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[GM107] reboot/suspend/lspci hang with nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.2
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
          <td>lnicola&#64;dend.ro
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134998=
" name=3D"attach_134998" title=3D"dmesg log">attachment 134998</a> <a href=
=3D"attachment.cgi?id=3D134998&amp;action=3Dedit" title=3D"dmesg log">[deta=
ils]</a></span>
dmesg log

I have an ASUS ROG laptop (GL752V) with dual graphics. I've just installed
Linux and GNOME seems to pick the Intel card by default, but the nouveau mo=
dule
still gets loaded.

The issue is that I can't power off, reboot or suspend the laptop. On reboot
and power off it hangs with a &quot;watchdog0 did not stop&quot; message on=
 the console.
I also noticed that simply running lspci hangs in uninterruptible sleep.

Blacklisting the nouveau driver fixes all these issues.</pre>
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

--15087442970.fAbfB.11455--

--===============0220938744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0220938744==--
