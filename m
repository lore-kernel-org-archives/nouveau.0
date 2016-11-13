From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98709] New: [NV50] clocksource: timekeeping watchdog
 on CPU2: Marking clocksource 'tsc' as unstable because the skew is too
 large
Date: Sun, 13 Nov 2016 17:13:21 +0000
Message-ID: <bug-98709-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2044426773=="
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


--===============2044426773==
Content-Type: multipart/alternative; boundary="14790572000.7B9aEf57.16339";
 charset="UTF-8"


--14790572000.7B9aEf57.16339
Date: Sun, 13 Nov 2016 17:13:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98709

            Bug ID: 98709
           Summary: [NV50] clocksource: timekeeping watchdog on CPU2:
                    Marking clocksource 'tsc' as unstable because the skew
                    is too large
           Product: Mesa
           Version: 12.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: thican+freedesktop-RcM+vJdHk5GsTnJN9+BGXg@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 127955
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D127955&action=3Dedit
dmesg content after the kernel dump.

Hello everyone,

I met an error bricking my graphical session, just after launching a game
(named Hacknet, some irony).
I attached the content of dmesg after the crash.

I am about to do an apitrace of the program.

My GPU is an 8600 GT on a MSI board, I am using kernel 4.7.10-hardened and =
Mesa
12.0.3. I consider updating the version of Mesa on my system, but it might =
be
unlikely related.

I can provide more information if you need it.

Thanks for support.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14790572000.7B9aEf57.16339
Date: Sun, 13 Nov 2016 17:13:20 +0000
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
   title=3D"NEW - [NV50] clocksource: timekeeping watchdog on CPU2: Marking=
 clocksource 'tsc' as unstable because the skew is too large"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98709">98709</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV50] clocksource: timekeeping watchdog on CPU2: Marking clo=
cksource 'tsc' as unstable because the skew is too large
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>12.0
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
          <td>thican+freedesktop&#64;thican.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D127955=
" name=3D"attach_127955" title=3D"dmesg content after the kernel dump.">att=
achment 127955</a> <a href=3D"attachment.cgi?id=3D127955&amp;action=3Dedit"=
 title=3D"dmesg content after the kernel dump.">[details]</a></span>
dmesg content after the kernel dump.

Hello everyone,

I met an error bricking my graphical session, just after launching a game
(named Hacknet, some irony).
I attached the content of dmesg after the crash.

I am about to do an apitrace of the program.

My GPU is an 8600 GT on a MSI board, I am using kernel 4.7.10-hardened and =
Mesa
12.0.3. I consider updating the version of Mesa on my system, but it might =
be
unlikely related.

I can provide more information if you need it.

Thanks for support.</pre>
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

--14790572000.7B9aEf57.16339--

--===============2044426773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2044426773==--
