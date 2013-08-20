From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68344] New: [piglit]
 shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50
Date: Tue, 20 Aug 2013 16:38:58 +0000
Message-ID: <bug-68344-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0789329176=="
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


--===============0789329176==
Content-Type: multipart/alternative; boundary="1377016739.7fB751.30378"; charset="us-ascii"


--1377016739.7fB751.30378
Date: Tue, 20 Aug 2013 16:38:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68344

          Priority: medium
            Bug ID: 68344
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [piglit] shaders/glsl-fs-texture2d-dependent-4
                    randomly passes or fails on NVAA/NV50
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: dirkneukirchen-S0/GAf8tV78@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 84349
  --> https://bugs.freedesktop.org/attachment.cgi?id=84349&action=edit
normal bootlog

./piglit-run.py -t '/shaders/glsl-fs-texture2d-dependent-4' tests/quick.tests
results/quick-shaders-single-test.tests 

passes or fails seemingly random
20 passes - 9 fails

Result of fail:
Probe color at (25,224)
  Expected: 0.000000 0.000000 1.000000
  Observed: 1.000000 0.000000 0.000000
Probe color at (224,224)
  Expected: 1.000000 1.000000 1.000000
  Observed: 0.000000 1.000000 0.000000

Hardware:
Nvidia 8200 Onboard NVAA/NV50
nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP77/MCP78 (NVAA)
nouveau  [  DEVICE][0000:02:00.0] Family : NV50

Software:
Linux Mint 15 + xorg-edgers + 3.11-rc5
Kernel: 3.11.0-rc5-vanillaice (compiled)
libdrm-nouveau: 2.4.46+git20130702.c6d73cfe-0ubuntu0sarvatt~raring
xserver-xorg-video-nouveau :
1:1.0.9+git20130730.300c5a32-0ubuntu0sarvatt~raring
mesa: 9.2.0~git20130729+9.2.9b8ad643-0ubuntu0sarvatt~raring

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377016739.7fB751.30378
Date: Tue, 20 Aug 2013 16:38:59 +0000
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
   title="NEW --- - [piglit] shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68344">68344</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[piglit] shaders/glsl-fs-texture2d-dependent-4 randomly passes or fails on NVAA/NV50
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
          <td>dirkneukirchen&#64;web.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=84349" name="attach_84349" title="normal bootlog">attachment 84349</a> <a href="attachment.cgi?id=84349&amp;action=edit" title="normal bootlog">[details]</a></span>
normal bootlog

./piglit-run.py -t '/shaders/glsl-fs-texture2d-dependent-4' tests/quick.tests
results/quick-shaders-single-test.tests 

passes or fails seemingly random
20 passes - 9 fails

Result of fail:
Probe color at (25,224)
  Expected: 0.000000 0.000000 1.000000
  Observed: 1.000000 0.000000 0.000000
Probe color at (224,224)
  Expected: 1.000000 1.000000 1.000000
  Observed: 0.000000 1.000000 0.000000

Hardware:
Nvidia 8200 Onboard NVAA/NV50
nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP77/MCP78 (NVAA)
nouveau  [  DEVICE][0000:02:00.0] Family : NV50

Software:
Linux Mint 15 + xorg-edgers + 3.11-rc5
Kernel: 3.11.0-rc5-vanillaice (compiled)
libdrm-nouveau: 2.4.46+git20130702.c6d73cfe-0ubuntu0sarvatt~raring
xserver-xorg-video-nouveau :
1:1.0.9+git20130730.300c5a32-0ubuntu0sarvatt~raring
mesa: 9.2.0~git20130729+9.2.9b8ad643-0ubuntu0sarvatt~raring</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377016739.7fB751.30378--

--===============0789329176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0789329176==--
