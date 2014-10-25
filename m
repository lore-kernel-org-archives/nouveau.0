From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85459] New: DPMS not working on Dell M4800 / QHD+
Date: Sat, 25 Oct 2014 22:06:38 +0000
Message-ID: <bug-85459-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1768061215=="
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


--===============1768061215==
Content-Type: multipart/alternative; boundary="1414274798.c4ce341.3807"; charset="UTF-8"


--1414274798.c4ce341.3807
Date: Sat, 25 Oct 2014 22:06:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85459

            Bug ID: 85459
           Summary: DPMS not working on Dell M4800 / QHD+
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: freedesktop-aVMt7ygKTj2t/hvpvFFPbQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 108419
  --> https://bugs.freedesktop.org/attachment.cgi?id=108419&action=edit
Xorg.0.log

X screen blanks after timeout, but backlight remains on forever. "xset dpms
force off" has no effect. "vbetool dpms off" does turn off the backlight. Using
nvidia proprietary driver, "xset dpms force off" turns off backlight but then
has other issues (
https://bugs.launchpad.net/ubuntu/+source/nvidia-graphics-drivers-331/+bug/1268151
)

Curiously, and possibly related, "xset s activate" (via ssh and/or using sleep
1) has no effect. It does not blank the screen.

Possibly related, from Xorg.0.log:

    [    27.193] (II) NOUVEAU(0): No DPMS capabilities specified

version: nouveau from kernel 3.16.6-gentoo.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414274798.c4ce341.3807
Date: Sat, 25 Oct 2014 22:06:38 +0000
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
   title="NEW - DPMS not working on Dell M4800 / QHD+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85459">85459</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>DPMS not working on Dell M4800 / QHD+
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
          <td>minor
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
          <td>freedesktop&#64;edsantiago.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=108419" name="attach_108419" title="Xorg.0.log">attachment 108419</a> <a href="attachment.cgi?id=108419&amp;action=edit" title="Xorg.0.log">[details]</a></span>
Xorg.0.log

X screen blanks after timeout, but backlight remains on forever. &quot;xset dpms
force off&quot; has no effect. &quot;vbetool dpms off&quot; does turn off the backlight. Using
nvidia proprietary driver, &quot;xset dpms force off&quot; turns off backlight but then
has other issues (
<a href="https://bugs.launchpad.net/ubuntu/+source/nvidia-graphics-drivers-331/+bug/1268151">https://bugs.launchpad.net/ubuntu/+source/nvidia-graphics-drivers-331/+bug/1268151</a>
)

Curiously, and possibly related, &quot;xset s activate&quot; (via ssh and/or using sleep
1) has no effect. It does not blank the screen.

Possibly related, from Xorg.0.log:

    [    27.193] (II) NOUVEAU(0): No DPMS capabilities specified

version: nouveau from kernel 3.16.6-gentoo.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414274798.c4ce341.3807--

--===============1768061215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1768061215==--
