From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105629] New: WebGL shader regular update crashes
 nouveau driver 17.3.3
Date: Tue, 20 Mar 2018 17:31:29 +0000
Message-ID: <bug-105629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0921566056=="
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


--===============0921566056==
Content-Type: multipart/alternative; boundary="15215670890.7A5eb5.28689"
Content-Transfer-Encoding: 7bit


--15215670890.7A5eb5.28689
Date: Tue, 20 Mar 2018 17:31:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105629

            Bug ID: 105629
           Summary: WebGL shader regular update crashes nouveau driver
                    17.3.3
           Product: Mesa
           Version: 17.3
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: hugues.evrard-/thXhF8rKSFInJN2fRTu8g@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 138227
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138227&action=3Dedit
Standalone HTML file for reproduction

The repetitive updating + rendering of a fragment shader leads to a crash of
the nouveau driver.

Reproduction steps:
 - OS: Linux 4.13.0-37-generic #42~16.04.1-Ubuntu SMP Wed Mar 7 16:03:28 UTC
2018 x86_64
 - Mesa 17.3.3 (from ppa:ubuntu-x-swat)
 - GPU: NVIDIA Corporation GK107 [GeForce GT 630 OEM] (rev a1)

Using chromium (64.0.3282.167, firefox does not reproduce), visit the html =
page
attached to that bug report, and wait for approx. 30 times of shader update.
Nouveau crashes with error:

nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch7: krec 0 pushes 1 bufs 24 relocs 0
nouveau: ch7: buf 00000000 00000004 00000004 00000004 00000000
nouveau: ch7: buf 00000001 00000006 00000004 00000000 00000004
nouveau: ch7: buf 00000002 00000008 00000002 00000002 00000002
...

See attachment for the whole error trace.

Reproduction is non-deterministic as the number of time to render the shader
may vary, but it does crash reliably within the first 50 shader updates
(sometimes less than 20 updates are enough) on my setup.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15215670890.7A5eb5.28689
Date: Tue, 20 Mar 2018 17:31:29 +0000
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
   title=3D"NEW - WebGL shader regular update crashes nouveau driver 17.3.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105629">105629</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>WebGL shader regular update crashes nouveau driver 17.3.3
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.3
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
          <td>hugues.evrard&#64;graphicsfuzz.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138227=
" name=3D"attach_138227" title=3D"Standalone HTML file for reproduction">at=
tachment 138227</a> <a href=3D"attachment.cgi?id=3D138227&amp;action=3Dedit=
" title=3D"Standalone HTML file for reproduction">[details]</a></span>
Standalone HTML file for reproduction

The repetitive updating + rendering of a fragment shader leads to a crash of
the nouveau driver.

Reproduction steps:
 - OS: Linux 4.13.0-37-generic #42~16.04.1-Ubuntu SMP Wed Mar 7 16:03:28 UTC
2018 x86_64
 - Mesa 17.3.3 (from ppa:ubuntu-x-swat)
 - GPU: NVIDIA Corporation GK107 [GeForce GT 630 OEM] (rev a1)

Using chromium (64.0.3282.167, firefox does not reproduce), visit the html =
page
attached to that bug report, and wait for approx. 30 times of shader update.
Nouveau crashes with error:

nouveau: kernel rejected pushbuf: No such file or directory
nouveau: ch7: krec 0 pushes 1 bufs 24 relocs 0
nouveau: ch7: buf 00000000 00000004 00000004 00000004 00000000
nouveau: ch7: buf 00000001 00000006 00000004 00000000 00000004
nouveau: ch7: buf 00000002 00000008 00000002 00000002 00000002
...

See attachment for the whole error trace.

Reproduction is non-deterministic as the number of time to render the shader
may vary, but it does crash reliably within the first 50 shader updates
(sometimes less than 20 updates are enough) on my setup.</pre>
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

--15215670890.7A5eb5.28689--

--===============0921566056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0921566056==--
