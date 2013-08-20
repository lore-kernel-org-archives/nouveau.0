From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68348] New: [piglit] shaders/glsl-array-bounds-02
 (+even nrs) produces TRAP , TRAP_MP - TP0: Unhandled ustatus 0x00000001
Date: Tue, 20 Aug 2013 17:55:23 +0000
Message-ID: <bug-68348-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0347503894=="
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


--===============0347503894==
Content-Type: multipart/alternative; boundary="1377021323.fEE81.16662"; charset="us-ascii"


--1377021323.fEE81.16662
Date: Tue, 20 Aug 2013 17:55:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68348

          Priority: medium
            Bug ID: 68348
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [piglit] shaders/glsl-array-bounds-02 (+even nrs)
                    produces TRAP , TRAP_MP - TP0: Unhandled ustatus
                    0x00000001
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: dirkneukirchen-S0/GAf8tV78@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 84353
  --> https://bugs.freedesktop.org/attachment.cgi?id=84353&action=edit
dmesg with many instances of problem occuring (while isolating the piglit
testcase)

./piglit-run.py --no-concurrency -t  '^shaders/glsl-array-bounds-02'
tests/quick.tests results/quick-shaders-array.tests

and all other even numbered cases 
glsl-array-bounds-04
glsl-array-bounds-06
glsl-array-bounds-08

print out success but get a kernel log entry like 

[ 4653.971680] nouveau E[  PGRAPH][0000:02:00.0] TRAP_MP - TP0: Unhandled
ustatus 0x00000001
[ 4653.971688] nouveau E[  PGRAPH][0000:02:00.0]  TRAP
[ 4653.971695] nouveau E[  PGRAPH][0000:02:00.0] ch 5 [0x0007814000
shader_runner[8809]] subc 3 class 0x8397 mthd 0x15e0 data 0x00000000

found with heavy use of exclude -x feature :)


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

--1377021323.fEE81.16662
Date: Tue, 20 Aug 2013 17:55:23 +0000
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
   title="NEW --- - [piglit] shaders/glsl-array-bounds-02 (+even nrs) produces TRAP , TRAP_MP - TP0: Unhandled ustatus 0x00000001"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68348">68348</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[piglit] shaders/glsl-array-bounds-02 (+even nrs) produces TRAP , TRAP_MP - TP0: Unhandled ustatus 0x00000001
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
        <pre>Created <span class=""><a href="attachment.cgi?id=84353" name="attach_84353" title="dmesg with many instances of problem occuring (while isolating the piglit testcase)">attachment 84353</a> <a href="attachment.cgi?id=84353&amp;action=edit" title="dmesg with many instances of problem occuring (while isolating the piglit testcase)">[details]</a></span>
dmesg with many instances of problem occuring (while isolating the piglit
testcase)

./piglit-run.py --no-concurrency -t  '^shaders/glsl-array-bounds-02'
tests/quick.tests results/quick-shaders-array.tests

and all other even numbered cases 
glsl-array-bounds-04
glsl-array-bounds-06
glsl-array-bounds-08

print out success but get a kernel log entry like 

[ 4653.971680] nouveau E[  PGRAPH][0000:02:00.0] TRAP_MP - TP0: Unhandled
ustatus 0x00000001
[ 4653.971688] nouveau E[  PGRAPH][0000:02:00.0]  TRAP
[ 4653.971695] nouveau E[  PGRAPH][0000:02:00.0] ch 5 [0x0007814000
shader_runner[8809]] subc 3 class 0x8397 mthd 0x15e0 data 0x00000000

found with heavy use of exclude -x feature :)


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

--1377021323.fEE81.16662--

--===============0347503894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0347503894==--
