From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64904] New: [BISECTED] nouveau,
 nv50: External VGA not detected anymore
Date: Thu, 23 May 2013 10:01:46 +0000
Message-ID: <bug-64904-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1028856873=="
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


--===============1028856873==
Content-Type: multipart/alternative; boundary="1369303306.3c4131.2943"; charset="us-ascii"


--1369303306.3c4131.2943
Date: Thu, 23 May 2013 10:01:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64904

          Priority: medium
            Bug ID: 64904
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [BISECTED] nouveau, nv50: External VGA not detected
                    anymore
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: wippbox-hi6Y0CQ0nG0@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I have a lenove thinkpad T61p with a NVIDIA Corporation G84GLM [Quadro FX
570M].
When connecting my external VGA monitor my monitor is no more detected
properly:
> cat /sys/class/drm/card0-VGA-1/status
gives now "disconnected"

I bisected the kernel sources from
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
and filed a bug report at https://bugzilla.kernel.org
(https://bugzilla.kernel.org/show_bug.cgi?id=58021).

Last good commit is
ef22c8bb7b3fac45919b7fde412d36d1a8367d51
drm/nv50/disp: call into core to handle dac/sor power state changes

First bad commit is
7ebb38b556485449bfaa506a196439f6a6fd6ebd
drm/nv50/disp: call into core for dac load detection

The responsible function is
nv50_dac_detect in drivers/gpu/drm/nouveau/nv50_dac.c (moved to
drivers/gpu/drm/nouveau/nv50_display.c in more recent kernels).

Also tried a 3.9.1 kernel. The problem still remains.

However, replacing nv50_dac_detect with the corresponding version from the last
good commit fixed the problem (tried with a 3.8.10 and a 3.8.13 kernel).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369303306.3c4131.2943
Date: Thu, 23 May 2013 10:01:46 +0000
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
   title="NEW --- - [BISECTED] nouveau, nv50: External VGA not detected anymore"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64904">64904</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[BISECTED] nouveau, nv50: External VGA not detected anymore
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
          <td>wippbox&#64;gmx.net
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
        <pre>I have a lenove thinkpad T61p with a NVIDIA Corporation G84GLM [Quadro FX
570M].
When connecting my external VGA monitor my monitor is no more detected
properly:
<span class="quote">&gt; cat /sys/class/drm/card0-VGA-1/status</span >
gives now &quot;disconnected&quot;

I bisected the kernel sources from
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
and filed a bug report at <a href="https://bugzilla.kernel.org">https://bugzilla.kernel.org</a>
(<a href="https://bugzilla.kernel.org/show_bug.cgi?id=58021">https://bugzilla.kernel.org/show_bug.cgi?id=58021</a>).

Last good commit is
ef22c8bb7b3fac45919b7fde412d36d1a8367d51
drm/nv50/disp: call into core to handle dac/sor power state changes

First bad commit is
7ebb38b556485449bfaa506a196439f6a6fd6ebd
drm/nv50/disp: call into core for dac load detection

The responsible function is
nv50_dac_detect in drivers/gpu/drm/nouveau/nv50_dac.c (moved to
drivers/gpu/drm/nouveau/nv50_display.c in more recent kernels).

Also tried a 3.9.1 kernel. The problem still remains.

However, replacing nv50_dac_detect with the corresponding version from the last
good commit fixed the problem (tried with a 3.8.10 and a 3.8.13 kernel).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369303306.3c4131.2943--

--===============1028856873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1028856873==--
