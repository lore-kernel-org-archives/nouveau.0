From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86115] New: Suspend to RAM fails when using Nouveau
Date: Mon, 10 Nov 2014 14:53:21 +0000
Message-ID: <bug-86115-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0293239620=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0293239620==
Content-Type: multipart/alternative; boundary="1415631202.fdd6f8B81.10384"; charset="UTF-8"


--1415631202.fdd6f8B81.10384
Date: Mon, 10 Nov 2014 14:53:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86115

            Bug ID: 86115
           Summary: Suspend to RAM fails when using Nouveau
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: lars-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

The system in question has a NVIDIA Corporation G84 [GeForce 8600 GT] (rev a1)
graphics card installed.

Triggering suspend to memory works but the resume fails and leads to blinking
shift and scroll lock keyboard leds.

This is a fresh install, no upgrade.

With the same hardware suspend to memory worked with openSUSE 13.1.

I've also tested kernel-vanilla 3.18.rc3.next.20141106-1.1.g2af2e06 and it
shows the same defect as with openSUSE 13.2.

Via netconsole I had been able to capture an even more detailed trace with
no_console_suspend set.  Thanks to Takashi Iwai for his debugging hints.

The same initially was reported at the SUSE bug tracked as it was first seen
with the openSUSE 13.2 kernel-default.
https://bugzilla.suse.com/show_bug.cgi?id=904483

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415631202.fdd6f8B81.10384
Date: Mon, 10 Nov 2014 14:53:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Suspend to RAM fails when using Nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86115">86115</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Suspend to RAM fails when using Nouveau
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
          <td>lars&#64;samba.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The system in question has a NVIDIA Corporation G84 [GeForce 8600 GT] (rev a1)
graphics card installed.

Triggering suspend to memory works but the resume fails and leads to blinking
shift and scroll lock keyboard leds.

This is a fresh install, no upgrade.

With the same hardware suspend to memory worked with openSUSE 13.1.

I've also tested kernel-vanilla 3.18.rc3.next.20141106-1.1.g2af2e06 and it
shows the same defect as with openSUSE 13.2.

Via netconsole I had been able to capture an even more detailed trace with
no_console_suspend set.  Thanks to Takashi Iwai for his debugging hints.

The same initially was reported at the SUSE bug tracked as it was first seen
with the openSUSE 13.2 kernel-default.
<a href="https://bugzilla.suse.com/show_bug.cgi?id=904483">https://bugzilla.suse.com/show_bug.cgi?id=904483</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415631202.fdd6f8B81.10384--

--===============0293239620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0293239620==--
