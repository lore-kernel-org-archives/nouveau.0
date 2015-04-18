From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90092] New: Screen Hangs Displaying Black and White
 Rectangles After Resuming from Suspend
Date: Sat, 18 Apr 2015 22:23:49 +0000
Message-ID: <bug-90092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1662821528=="
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


--===============1662821528==
Content-Type: multipart/alternative; boundary="1429395830.daab05Fa1.17092"; charset="UTF-8"


--1429395830.daab05Fa1.17092
Date: Sat, 18 Apr 2015 22:23:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90092

            Bug ID: 90092
           Summary: Screen Hangs Displaying Black and White Rectangles
                    After Resuming from Suspend
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jean-marc-kSWvK2IlVM0@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115184
  --> https://bugs.freedesktop.org/attachment.cgi?id=115184&action=edit
dmesg (kernel_log.txt)

I got the same problem than the one described in the bug 89186.
(https://bugs.freedesktop.org/show_bug.cgi?id=89186)

A black and white mosaic displayed on my screen after resuling from suspend.

I also tried a 3.19 kernel without success.


I first reported to Debian (the distro I use).
See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=781337


The maintainers told me it is mainly a kernel problem.

They also asked to report it upstream to help.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1429395830.daab05Fa1.17092
Date: Sat, 18 Apr 2015 22:23:50 +0000
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
   title="NEW - Screen Hangs Displaying Black and White Rectangles After Resuming from Suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90092">90092</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Screen Hangs Displaying Black and White Rectangles After Resuming from Suspend
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
          <td>jean-marc&#64;6jf.be
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115184" name="attach_115184" title="dmesg (kernel_log.txt)">attachment 115184</a> <a href="attachment.cgi?id=115184&amp;action=edit" title="dmesg (kernel_log.txt)">[details]</a></span>
dmesg (kernel_log.txt)

I got the same problem than the one described in the <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [G86] Artifacts after waking up from suspend"
   href="show_bug.cgi?id=89186">bug 89186</a>.
(<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [G86] Artifacts after waking up from suspend"
   href="show_bug.cgi?id=89186">https://bugs.freedesktop.org/show_bug.cgi?id=89186</a>)

A black and white mosaic displayed on my screen after resuling from suspend.

I also tried a 3.19 kernel without success.


I first reported to Debian (the distro I use).
See <a href="https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=781337">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=781337</a>


The maintainers told me it is mainly a kernel problem.

They also asked to report it upstream to help.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1429395830.daab05Fa1.17092--

--===============1662821528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1662821528==--
