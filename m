From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94803] New: nouveau bug crashes kernel 4.4.6 on warm
	boot
Date: Sat, 02 Apr 2016 23:14:46 +0000
Message-ID: <bug-94803-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0395969367=="
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


--===============0395969367==
Content-Type: multipart/alternative; boundary="14596388861.3Cb4A.17598";
 charset="UTF-8"


--14596388861.3Cb4A.17598
Date: Sat, 2 Apr 2016 23:14:46 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94803

            Bug ID: 94803
           Summary: nouveau bug crashes kernel 4.4.6 on warm boot
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mic.daum-Mmb7MZpHnFY@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 122684
  --> https://bugs.freedesktop.org/attachment.cgi?id=122684&action=edit
picture from stack trace taken with camera

Whenever doing a warm boot (reboot), kernel 4.4.6 crashes showing the stack
trace in the attached picture. The kernel boots fine when doing a cold start or
after pressing the reset button.

The GPU in question is a "PNY Quadro FX 580" (Tesla / G96) with two attached
monitors, both connected on display port.

The crash happens quite early when the kernel sets mode on the framebuffer.
Resolution is set to 1920x1200 px, 240x75 cols/lines.

attached:

picture of the screen showing the stack trace
dump of "nv50_disp_intr_supervisor" function from the 4.4.6 vmlinux

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14596388861.3Cb4A.17598
Date: Sat, 2 Apr 2016 23:14:46 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau bug crashes kernel 4.4.6 on warm boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94803">94803</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau bug crashes kernel 4.4.6 on warm boot
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
          <td>mic.daum&#64;gmx.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=122684" name="attach_122684" title="picture from stack trace taken with camera">attachment 122684</a> <a href="attachment.cgi?id=122684&amp;action=edit" title="picture from stack trace taken with camera">[details]</a></span>
picture from stack trace taken with camera

Whenever doing a warm boot (reboot), kernel 4.4.6 crashes showing the stack
trace in the attached picture. The kernel boots fine when doing a cold start or
after pressing the reset button.

The GPU in question is a &quot;PNY Quadro FX 580&quot; (Tesla / G96) with two attached
monitors, both connected on display port.

The crash happens quite early when the kernel sets mode on the framebuffer.
Resolution is set to 1920x1200 px, 240x75 cols/lines.

attached:

picture of the screen showing the stack trace
dump of &quot;nv50_disp_intr_supervisor&quot; function from the 4.4.6 vmlinux</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14596388861.3Cb4A.17598--

--===============0395969367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0395969367==--
