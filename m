From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70972] New: Nouveau fails with broken screen on nv40
 with kernel 3.12
Date: Mon, 28 Oct 2013 22:01:43 +0000
Message-ID: <bug-70972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1789484964=="
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


--===============1789484964==
Content-Type: multipart/alternative; boundary="1382997703.Fb6e801.11128"; charset="us-ascii"


--1382997703.Fb6e801.11128
Date: Mon, 28 Oct 2013 22:01:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70972

          Priority: medium
            Bug ID: 70972
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau fails with broken screen on nv40 with kernel
                    3.12
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: larry.finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 88259
  --> https://bugs.freedesktop.org/attachment.cgi?id=88259&action=edit
Output of dmesg

With nouveau on the graphics adapter on an HP dv2815nr laptop, both console and
X displays show an incorrect scan length with a resulting garbled screen.

The 'lspci -nnv' for this adapter is

00:12.0 VGA compatible controller [0300]: NVIDIA Corporation C67 [GeForce 7150M
/ nForce 630M] [10de:0531] (rev a2) (prog-if 00 [VGA controller])
        Subsystem: Hewlett-Packard Company Device [103c:30d6]
        Flags: bus master, 66MHz, fast devsel, latency 0, IRQ 10
        Memory at f4000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at f0000000 (64-bit, non-prefetchable) [size=16M]
        [virtual] Expansion ROM at c0000000 [disabled] [size=128K]
        Capabilities: <access denied>
        Kernel modules: nouveau

This device has never worked with nouveau on any kernel. I am trying to make it
work now as the nv driver is failing in certain cases, and fbdev cannot use the
optimum resolution (1600 x 800) for this laptop.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382997703.Fb6e801.11128
Date: Mon, 28 Oct 2013 22:01:43 +0000
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
   title="NEW --- - Nouveau fails with broken screen on nv40 with kernel 3.12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972">70972</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau fails with broken screen on nv40 with kernel 3.12
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>larry.finger&#64;lwfinger.net
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
        <pre>Created <span class=""><a href="attachment.cgi?id=88259" name="attach_88259" title="Output of dmesg">attachment 88259</a> <a href="attachment.cgi?id=88259&amp;action=edit" title="Output of dmesg">[details]</a></span>
Output of dmesg

With nouveau on the graphics adapter on an HP dv2815nr laptop, both console and
X displays show an incorrect scan length with a resulting garbled screen.

The 'lspci -nnv' for this adapter is

00:12.0 VGA compatible controller [0300]: NVIDIA Corporation C67 [GeForce 7150M
/ nForce 630M] [10de:0531] (rev a2) (prog-if 00 [VGA controller])
        Subsystem: Hewlett-Packard Company Device [103c:30d6]
        Flags: bus master, 66MHz, fast devsel, latency 0, IRQ 10
        Memory at f4000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at f0000000 (64-bit, non-prefetchable) [size=16M]
        [virtual] Expansion ROM at c0000000 [disabled] [size=128K]
        Capabilities: &lt;access denied&gt;
        Kernel modules: nouveau

This device has never worked with nouveau on any kernel. I am trying to make it
work now as the nv driver is failing in certain cases, and fbdev cannot use the
optimum resolution (1600 x 800) for this laptop.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382997703.Fb6e801.11128--

--===============1789484964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1789484964==--
