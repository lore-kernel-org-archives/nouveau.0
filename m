From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92306] New: GL Excess demo renders incorrectly on
	nv43
Date: Tue, 06 Oct 2015 00:08:52 +0000
Message-ID: <bug-92306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1513831667=="
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


--===============1513831667==
Content-Type: multipart/alternative; boundary="1444090132.ad600.11913"; charset="UTF-8"


--1444090132.ad600.11913
Date: Tue, 6 Oct 2015 00:08:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92306

            Bug ID: 92306
           Summary: GL Excess demo renders incorrectly on nv43
           Product: Mesa
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 118688
  --> https://bugs.freedesktop.org/attachment.cgi?id=118688&action=edit
X log

I was trying to see if GL Excess demo still works - it does, but only some
scenes rendered correctly.

Demo: http://www.glexcess.com/files.htm

Hardware: 01:00.0 VGA compatible controller: NVIDIA Corporation NV43 [GeForce
6600 GT] (rev a2)

Mesa: OpenGL version string: 2.1 Mesa 11.1.0-devel (git-93161be)
drm: commit 8c4a1cbd98bd8d185d489395f33302a17db643a9 ("xf86drm: Fix error
handling for drmGetDevices()")
xf86-video-nouveau: commit 1ff13a922535924681b91452235b017e43a4c6f6 ("fix build
after glamor removal")
kernel from nouveau/4.3 branch: 4.2.0-rc8-40978-g778613e5
X server - standard 1.14.3 from Slackware 14.1
wine (yes, I know, old - but then same demo works with LIBGL_ALWAYS_SOFTWARE=1,
so not only wine's fault. I can upgrade after some time):
wine-1.5.25-1-gc2505fd

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444090132.ad600.11913
Date: Tue, 6 Oct 2015 00:08:52 +0000
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
   title="NEW - GL Excess demo renders incorrectly on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92306">92306</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GL Excess demo renders incorrectly on nv43
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118688" name="attach_118688" title="X log">attachment 118688</a> <a href="attachment.cgi?id=118688&amp;action=edit" title="X log">[details]</a></span>
X log

I was trying to see if GL Excess demo still works - it does, but only some
scenes rendered correctly.

Demo: <a href="http://www.glexcess.com/files.htm">http://www.glexcess.com/files.htm</a>

Hardware: 01:00.0 VGA compatible controller: NVIDIA Corporation NV43 [GeForce
6600 GT] (rev a2)

Mesa: OpenGL version string: 2.1 Mesa 11.1.0-devel (git-93161be)
drm: commit 8c4a1cbd98bd8d185d489395f33302a17db643a9 (&quot;xf86drm: Fix error
handling for drmGetDevices()&quot;)
xf86-video-nouveau: commit 1ff13a922535924681b91452235b017e43a4c6f6 (&quot;fix build
after glamor removal&quot;)
kernel from nouveau/4.3 branch: 4.2.0-rc8-40978-g778613e5
X server - standard 1.14.3 from Slackware 14.1
wine (yes, I know, old - but then same demo works with LIBGL_ALWAYS_SOFTWARE=1,
so not only wine's fault. I can upgrade after some time):
wine-1.5.25-1-gc2505fd</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444090132.ad600.11913--

--===============1513831667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1513831667==--
