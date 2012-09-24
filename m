From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55294] New: Running EGL demos on DRM from mesa-demos
 causes a corrupted output on NV50
Date: Mon, 24 Sep 2012 21:39:02 +0000
Message-ID: <bug-55294-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1967419539=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1967419539==
Content-Type: multipart/alternative; boundary="1348522742.Ca827bAe1.12213"; charset="us-ascii"


--1348522742.Ca827bAe1.12213
Date: Mon, 24 Sep 2012 21:39:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55294

          Priority: medium
            Bug ID: 55294
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Running EGL demos on DRM from mesa-demos causes a
                    corrupted output on NV50
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: lubosz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 67649
  --> https://bugs.freedesktop.org/attachment.cgi?id=67649&action=edit
kernel log with nouveau.reg_debug=0x600

When I try to run the mesa demos on the EGL/DRM backend I get a corrupted
screen. 

You can find the demos here:
http://cgit.freedesktop.org/mesa/demos/tree/src/egl/opengl

The binaries for the EGL/DRM backend have a "_screen" suffix.
The demos are using eglut with the eglut_screen/drm backend.

The following kernel errors are printed:
[drm] nouveau 0000:01:00.0: EvoCh 0 Mthd 0x086c Data 0x00005564 (0x0084 0x04)
[drm] nouveau 0000:01:00.0: EvoCh 1 Mthd 0x080c Data 0x00005564 (0x0084 0x04)

You can find a screenshot and an kernel log with the "nouveau.reg_debug=0x600"
flag in the attachment.

Kernel 3.6.0 RC5 on NV50.

A similar kernel error can be found in this bug:
https://bugs.freedesktop.org/show_bug.cgi?id=27483

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1348522742.Ca827bAe1.12213
Date: Mon, 24 Sep 2012 21:39:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Running EGL demos on DRM from mesa-demos causes a corrupted output on NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55294">55294</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Running EGL demos on DRM from mesa-demos causes a corrupted output on NV50
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>lubosz&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>Created <span class=""><a href="attachment.cgi?id=67649" name="attach_67649" title="kernel log with nouveau.reg_debug=0x600">attachment 67649</a> <a href="attachment.cgi?id=67649&amp;action=edit" title="kernel log with nouveau.reg_debug=0x600">[details]</a></span>
kernel log with nouveau.reg_debug=0x600

When I try to run the mesa demos on the EGL/DRM backend I get a corrupted
screen. 

You can find the demos here:
<a href="http://cgit.freedesktop.org/mesa/demos/tree/src/egl/opengl">http://cgit.freedesktop.org/mesa/demos/tree/src/egl/opengl</a>

The binaries for the EGL/DRM backend have a &quot;_screen&quot; suffix.
The demos are using eglut with the eglut_screen/drm backend.

The following kernel errors are printed:
[drm] nouveau 0000:01:00.0: EvoCh 0 Mthd 0x086c Data 0x00005564 (0x0084 0x04)
[drm] nouveau 0000:01:00.0: EvoCh 1 Mthd 0x080c Data 0x00005564 (0x0084 0x04)

You can find a screenshot and an kernel log with the &quot;nouveau.reg_debug=0x600&quot;
flag in the attachment.

Kernel 3.6.0 RC5 on NV50.

A similar kernel error can be found in this bug:
<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - dmesg error: [drm] nouveau 0000:02:00.0: EvoCh 0 Mthd 0x0000 Data 0x00000400 (0x0002 0x01)"
   href="show_bug.cgi?id=27483">https://bugs.freedesktop.org/show_bug.cgi?id=27483</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1348522742.Ca827bAe1.12213--

--===============1967419539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1967419539==--
