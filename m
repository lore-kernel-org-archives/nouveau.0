From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58729] New: [bisected] Display fails to turn on
 after suspend/resume (NV86)
Date: Mon, 24 Dec 2012 21:25:16 +0000
Message-ID: <bug-58729-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2115238062=="
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


--===============2115238062==
Content-Type: multipart/alternative; boundary="1356384317.41A00.17066"; charset="us-ascii"


--1356384317.41A00.17066
Date: Mon, 24 Dec 2012 21:25:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58729

          Priority: medium
            Bug ID: 58729
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [bisected] Display fails to turn on after
                    suspend/resume (NV86)
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: wheel-pGoT+mvyLdp4LYgiJMQgWbNAH6kLmebB@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 72083
  --> https://bugs.freedesktop.org/attachment.cgi?id=72083&action=edit
dmesg for boot and one suspen/resume cycle

Since 3.7-rc7 from the nouveau git, the screen of my laptop will not turn on
after resuming from suspend to RAM.

I have bisected the problem to the commit

bb49f2c0dbff280c20830a1b303844fc604a611c is the first bad commit
commit bb49f2c0dbff280c20830a1b303844fc604a611c
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Fri Nov 9 12:09:48 2012 +1000

    drm/nv50/disp: move remaining interrupt handling into core

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

In the current nouveau kernel git the problem still occurs, the bad commit is
14464b8cd643467cb97335eb75ea676260dd0ad8 and applies after 3.7.0.

Dmesg attached, the relevant error is probably:

[   66.285584] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x400724
[   66.285597] nouveau E[  PTHERM][0000:01:00.0] unhandled intr 0x000001e1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356384317.41A00.17066
Date: Mon, 24 Dec 2012 21:25:17 +0000
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
   title="NEW --- - [bisected] Display fails to turn on after suspend/resume (NV86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58729">58729</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[bisected] Display fails to turn on after suspend/resume (NV86)
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
          <td>wheel&#64;herr-der-mails.de
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=72083" name="attach_72083" title="dmesg for boot and one suspen/resume cycle">attachment 72083</a> <a href="attachment.cgi?id=72083&amp;action=edit" title="dmesg for boot and one suspen/resume cycle">[details]</a></span>
dmesg for boot and one suspen/resume cycle

Since 3.7-rc7 from the nouveau git, the screen of my laptop will not turn on
after resuming from suspend to RAM.

I have bisected the problem to the commit

bb49f2c0dbff280c20830a1b303844fc604a611c is the first bad commit
commit bb49f2c0dbff280c20830a1b303844fc604a611c
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Fri Nov 9 12:09:48 2012 +1000

    drm/nv50/disp: move remaining interrupt handling into core

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

In the current nouveau kernel git the problem still occurs, the bad commit is
14464b8cd643467cb97335eb75ea676260dd0ad8 and applies after 3.7.0.

Dmesg attached, the relevant error is probably:

[   66.285584] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x400724
[   66.285597] nouveau E[  PTHERM][0000:01:00.0] unhandled intr 0x000001e1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356384317.41A00.17066--

--===============2115238062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2115238062==--
