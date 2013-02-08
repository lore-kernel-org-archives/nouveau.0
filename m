From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60510] New: Firefox 18.0.2 Crash On Nvidia GeForce2
Date: Fri, 08 Feb 2013 18:40:09 +0000
Message-ID: <bug-60510-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1130736052=="
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


--===============1130736052==
Content-Type: multipart/alternative; boundary="1360348810.6cdb51.13717"; charset="us-ascii"


--1360348810.6cdb51.13717
Date: Fri, 8 Feb 2013 18:40:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60510

          Priority: medium
            Bug ID: 60510
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Firefox 18.0.2 Crash On Nvidia GeForce2
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: sacanti.ernesto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Firefox 18.0.2 and Thunderbird 17.0.2 crashes randomly.

Error Report:GLXtest process failed (exited with status 1): X error occurred in
GLX probe, error_code=11, request_code=154, minor_code=3

lspci command:
02:00.0 VGA compatible controller: nVidia Corporation NVCrush11 [GeForce2 MX
Integrated Graphics] (rev b1) (prog-if 00 [VGA controller])
    Subsystem: nVidia Corporation Device 0c11
    Flags: bus master, 66MHz, medium devsel, latency 32, IRQ 19
    Memory at ec000000 (32-bit, non-prefetchable) [size=16M]
    Memory at f0000000 (32-bit, prefetchable) [size=128M]
    Expansion ROM at efff0000 [disabled] [size=64K]
    Capabilities: <access denied>
    Kernel driver in use: nouveau
    Kernel modules: nouveau, nvidiafb, rivafb

I'm using Linux Mint 12 Lisa (GNU/Linux 3.0.0-12-generic i686)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360348810.6cdb51.13717
Date: Fri, 8 Feb 2013 18:40:10 +0000
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
   title="NEW --- - Firefox 18.0.2 Crash On Nvidia GeForce2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60510">60510</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Firefox 18.0.2 Crash On Nvidia GeForce2
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
          <td>sacanti.ernesto&#64;gmail.com
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
        <pre>Firefox 18.0.2 and Thunderbird 17.0.2 crashes randomly.

Error Report:GLXtest process failed (exited with status 1): X error occurred in
GLX probe, error_code=11, request_code=154, minor_code=3

lspci command:
02:00.0 VGA compatible controller: nVidia Corporation NVCrush11 [GeForce2 MX
Integrated Graphics] (rev b1) (prog-if 00 [VGA controller])
    Subsystem: nVidia Corporation Device 0c11
    Flags: bus master, 66MHz, medium devsel, latency 32, IRQ 19
    Memory at ec000000 (32-bit, non-prefetchable) [size=16M]
    Memory at f0000000 (32-bit, prefetchable) [size=128M]
    Expansion ROM at efff0000 [disabled] [size=64K]
    Capabilities: &lt;access denied&gt;
    Kernel driver in use: nouveau
    Kernel modules: nouveau, nvidiafb, rivafb

I'm using Linux Mint 12 Lisa (GNU/Linux 3.0.0-12-generic i686)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360348810.6cdb51.13717--

--===============1130736052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1130736052==--
