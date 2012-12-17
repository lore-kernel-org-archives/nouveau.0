From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58428] New: X crashes when running opengl
 application after reclocking nouveau driver to use highest speed
Date: Mon, 17 Dec 2012 19:16:16 +0000
Message-ID: <bug-58428-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1806828687=="
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


--===============1806828687==
Content-Type: multipart/alternative; boundary="1355771776.5dA6F5eF1.19018"; charset="us-ascii"


--1355771776.5dA6F5eF1.19018
Date: Mon, 17 Dec 2012 19:16:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58428

          Priority: medium
            Bug ID: 58428
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: X crashes when running opengl application after
                    reclocking nouveau driver to use highest speed
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: amade-dvG7DYx+7LWsTnJN9+BGXg@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Linux lain 3.7.0-hardened #1 SMP PREEMPT Mon Dec 17 03:03:30 CET 2012 x86_64
Intel(R) Core(TM) i3 CPU M 350 @ 2.27GHz GenuineIntel GNU/Linux

(Tested both on hardened and vanilla kernels)

[    2.719980] nouveau  [     DRM] 3 available performance level(s)
[    2.719984] nouveau  [     DRM] 0: core 135MHz shader 270MHz memory 135MHz
voltage 850mV
[    2.719987] nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 405MHz
voltage 850mV
[    2.719989] nouveau  [     DRM] 3: core 625MHz shader 1530MHz memory 790MHz
voltage 1030mV
[    2.719992] nouveau  [     DRM] c: core 405MHz shader 810MHz memory 405MHz
voltage 850mV

echo 3 > /sys/class/drm/card0/device/performance_level

run opengl app (I run xonotic-glx)
at first you can move mouse a bit but it just hangs a bit later, after a while
X crashes

(It reclocks works fine when reclocking between 0 and 1)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355771776.5dA6F5eF1.19018
Date: Mon, 17 Dec 2012 19:16:16 +0000
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
   title="NEW --- - X crashes when running opengl application after reclocking nouveau driver to use highest speed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58428">58428</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X crashes when running opengl application after reclocking nouveau driver to use highest speed
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>amade&#64;asmblr.net
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
        <pre>Linux lain 3.7.0-hardened #1 SMP PREEMPT Mon Dec 17 03:03:30 CET 2012 x86_64
Intel(R) Core(TM) i3 CPU M 350 &#64; 2.27GHz GenuineIntel GNU/Linux

(Tested both on hardened and vanilla kernels)

[    2.719980] nouveau  [     DRM] 3 available performance level(s)
[    2.719984] nouveau  [     DRM] 0: core 135MHz shader 270MHz memory 135MHz
voltage 850mV
[    2.719987] nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 405MHz
voltage 850mV
[    2.719989] nouveau  [     DRM] 3: core 625MHz shader 1530MHz memory 790MHz
voltage 1030mV
[    2.719992] nouveau  [     DRM] c: core 405MHz shader 810MHz memory 405MHz
voltage 850mV

echo 3 &gt; /sys/class/drm/card0/device/performance_level

run opengl app (I run xonotic-glx)
at first you can move mouse a bit but it just hangs a bit later, after a while
X crashes

(It reclocks works fine when reclocking between 0 and 1)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355771776.5dA6F5eF1.19018--

--===============1806828687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1806828687==--
