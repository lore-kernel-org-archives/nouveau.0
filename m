From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97217] New: apitrace error
Date: Fri, 05 Aug 2016 14:33:24 +0000
Message-ID: <bug-97217-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1061913080=="
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


--===============1061913080==
Content-Type: multipart/alternative; boundary="14704076040.3bF341.6030";
 charset="UTF-8"


--14704076040.3bF341.6030
Date: Fri, 5 Aug 2016 14:33:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97217

            Bug ID: 97217
           Summary: apitrace error
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: alejandrohp-1Ww2luigxekRVMDPamJrIw@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I trid to run 'apitrace' to record a problem with superTuxkart, but it shows
several problem too:


nouveau: kernel rejected pushbuf: Device or resource busy
nouveau: ch6: krec 0 pushes 511 bufs 83 relocs 0


Thanks.



The inicial problem about SuperTuxkart can be found here:
https://bugs.freedesktop.org/show_bug.cgi?id=3D97192

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14704076040.3bF341.6030
Date: Fri, 5 Aug 2016 14:33:24 +0000
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
   title=3D"NEW - apitrace error"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97217">97217</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>apitrace error
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
          <td>blocker
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
          <td>alejandrohp&#64;openmailbox.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I trid to run 'apitrace' to record a problem with superTuxkart=
, but it shows
several problem too:


nouveau: kernel rejected pushbuf: Device or resource busy
nouveau: ch6: krec 0 pushes 511 bufs 83 relocs 0


Thanks.



The inicial problem about SuperTuxkart can be found here:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - SuperTuxkart graphic errors [NVE4 - GK104]"
   href=3D"show_bug.cgi?id=3D97192">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D97192</a></pre>
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

--14704076040.3bF341.6030--

--===============1061913080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1061913080==--
