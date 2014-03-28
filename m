From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] New: Kworker using 100% CPU
Date: Fri, 28 Mar 2014 12:07:06 +0000
Message-ID: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1051904184=="
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


--===============1051904184==
Content-Type: multipart/alternative; boundary="1396008426.f2B474f1.16569"; charset="us-ascii"


--1396008426.f2B474f1.16569
Date: Fri, 28 Mar 2014 12:07:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

          Priority: medium
            Bug ID: 76732
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Kworker using 100% CPU
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Loading the nouveau driver leads to a kworker constantly using  100% of a CPU
core.

PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
211 root      20   0       0      0      0 R 100.0  0.0   2:51.00 kworker/1:1

Powertop suggests the problem comes from nouveau_connector_hotplug_work.

I noticed this problem first occurred in kernel 3.9 and still persists in 3.14
rc8. In kernel 3.8 the problem did not occur. Some time ago, trying to figure
out the cause, i also tried a kernel bisect.


git bisect start
# bad: [c1be5a5b1b355d40e6cf79cc979eb66dafa24ad1] Linux 3.9
git bisect bad c1be5a5b1b355d40e6cf79cc979eb66dafa24ad1
# good: [19f949f52599ba7c3f67a5897ac6be14bfcb1200] Linux 3.8
git bisect good 19f949f52599ba7c3f67a5897ac6be14bfcb1200
# good: [d778df51c09264076fe0208c099ef7d428f21790] mm: vmscan: save work
scanning (almost) empty LRU lists
git bisect good d778df51c09264076fe0208c099ef7d428f21790
# bad: [ee89f81252179dcbf6cd65bd48299f5e52292d88] Merge branch
'for-3.9/core' of git://git.kernel.dk/linux-block
git bisect bad ee89f81252179dcbf6cd65bd48299f5e52292d88
# good: [69086a78bdc973ec0b722be790b146e84ba8a8c4] Merge branch 'for-linus'
of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
git bisect good 69086a78bdc973ec0b722be790b146e84ba8a8c4
# bad: [ed5dc2372dba46e0ecd08791b1a0399d313e5cff] Merge tag
'mmc-updates-for-3.9-rc1' of git://
git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc
git bisect bad ed5dc2372dba46e0ecd08791b1a0399d313e5cff
# bad: [1f3a574a4bfe86ebf7d51fac37e0668397372fd8] Merge branch
'drm-nouveau-next' of
git://anongit.freedesktop.org/git/nouveau/linux-2.6into drm-next
git bisect bad 1f3a574a4bfe86ebf7d51fac37e0668397372fd8
# good: [cd17ef4114ad5c514b17e6a0bb02a309ab90b692] Merge tag
'drm-intel-next-2013-02-01' of git://
people.freedesktop.org/~danvet/drm-intel into drm-next
git bisect good cd17ef4114ad5c514b17e6a0bb02a309ab90b692
# good: [210561ffd72d00eccf12c0131b8024d5436bae95] intel/iommu: force
writebuffer-flush quirk on Gen 4 Chipsets
git bisect good 210561ffd72d00eccf12c0131b8024d5436bae95
# good: [0f0800661a125ddb038462570c869fe6f8ab5737] drm/nouveau/gpio: pass
number of on-die gpio lines to base
git bisect good 0f0800661a125ddb038462570c869fe6f8ab5737
# good: [35f8badc1cf652381fa3f82c1fbea39f4dbe87fd] drm: Don't set the
plane->fb to NULL on successfull set_plane
git bisect good 35f8badc1cf652381fa3f82c1fbea39f4dbe87fd
# good: [31a34aa421032cfe3b2b892c929e7539e747a7ac] drm/nouveau/i2c: aux
channels not necessarily on nvio
git bisect good 31a34aa421032cfe3b2b892c929e7539e747a7ac
# bad: [0a0afd282fd715dd63d64b243299a64da14f8e8d] drm/nv50-/disp: move DP
link training to core and train from supervisor
git bisect bad 0a0afd282fd715dd63d64b243299a64da14f8e8d
# good: [ac8cc241a81941932da44993242e68c62e115ec7] drm/nv50/devinit:
reverse the logic for running encoder init scripts
git bisect good ac8cc241a81941932da44993242e68c62e115ec7
# good: [7dcd060c0e6e4f76ce7eea94c66437ce8f546530] drm/nouveau/i2c: create
proper chipset-specific class implementations
git bisect good 7dcd060c0e6e4f76ce7eea94c66437ce8f546530
# good: [5cc027f6b1ec651c18a4322ed3e30c6e9cf01e96] drm/nv50-/disp: handle
supervisor tasks from workqueue
git bisect good 5cc027f6b1ec651c18a4322ed3e30c6e9cf01e96
# first bad commit: [0a0afd282fd715dd63d64b243299a64da14f8e8d]
drm/nv50-/disp: move DP link training to core and train from supervisor




0a0afd282fd715dd63d64b243299a64da14f8e8d is the first bad commit
commit 0a0afd282fd715dd63d64b243299a64da14f8e8d
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Feb 18 23:17:53 2013 -0500

    drm/nv50-/disp: move DP link training to core and train from supervisor

    We need to be able to do link training for PIOR-connected ANX9805 from
    the third supervisor handler (due to script ordering in the bios, can't
    have the "user" call train because some settings are overwritten from
    the modesetting bios scripts).

    This moves link training for SOR-connected DP encoders to the second
    supervisor interrupt, *before* we call the modesetting scripts (yes,
    different ordering from PIOR is necessary).  This is useful since we
    should now be able to remove some hacks to workaround races between
    the supervisor and link training paths.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 8f2f2d8ea35eae1b6e6ff981761be02a8818bac3
2994eb54c689056254c241fe78a3af8d0b61d1df M    drivers

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396008426.f2B474f1.16569
Date: Fri, 28 Mar 2014 12:07:06 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">76732</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kworker using 100% CPU
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
          <td>patrick.clara&#64;gmail.com
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
        <pre>Loading the nouveau driver leads to a kworker constantly using  100% of a CPU
core.

PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
211 root      20   0       0      0      0 R 100.0  0.0   2:51.00 kworker/1:1

Powertop suggests the problem comes from nouveau_connector_hotplug_work.

I noticed this problem first occurred in kernel 3.9 and still persists in 3.14
rc8. In kernel 3.8 the problem did not occur. Some time ago, trying to figure
out the cause, i also tried a kernel bisect.


git bisect start
# bad: [c1be5a5b1b355d40e6cf79cc979eb66dafa24ad1] Linux 3.9
git bisect bad c1be5a5b1b355d40e6cf79cc979eb66dafa24ad1
# good: [19f949f52599ba7c3f67a5897ac6be14bfcb1200] Linux 3.8
git bisect good 19f949f52599ba7c3f67a5897ac6be14bfcb1200
# good: [d778df51c09264076fe0208c099ef7d428f21790] mm: vmscan: save work
scanning (almost) empty LRU lists
git bisect good d778df51c09264076fe0208c099ef7d428f21790
# bad: [ee89f81252179dcbf6cd65bd48299f5e52292d88] Merge branch
'for-3.9/core' of git://git.kernel.dk/linux-block
git bisect bad ee89f81252179dcbf6cd65bd48299f5e52292d88
# good: [69086a78bdc973ec0b722be790b146e84ba8a8c4] Merge branch 'for-linus'
of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
git bisect good 69086a78bdc973ec0b722be790b146e84ba8a8c4
# bad: [ed5dc2372dba46e0ecd08791b1a0399d313e5cff] Merge tag
'mmc-updates-for-3.9-rc1' of git://
git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc
git bisect bad ed5dc2372dba46e0ecd08791b1a0399d313e5cff
# bad: [1f3a574a4bfe86ebf7d51fac37e0668397372fd8] Merge branch
'drm-nouveau-next' of
git://anongit.freedesktop.org/git/nouveau/linux-2.6into drm-next
git bisect bad 1f3a574a4bfe86ebf7d51fac37e0668397372fd8
# good: [cd17ef4114ad5c514b17e6a0bb02a309ab90b692] Merge tag
'drm-intel-next-2013-02-01' of git://
people.freedesktop.org/~danvet/drm-intel into drm-next
git bisect good cd17ef4114ad5c514b17e6a0bb02a309ab90b692
# good: [210561ffd72d00eccf12c0131b8024d5436bae95] intel/iommu: force
writebuffer-flush quirk on Gen 4 Chipsets
git bisect good 210561ffd72d00eccf12c0131b8024d5436bae95
# good: [0f0800661a125ddb038462570c869fe6f8ab5737] drm/nouveau/gpio: pass
number of on-die gpio lines to base
git bisect good 0f0800661a125ddb038462570c869fe6f8ab5737
# good: [35f8badc1cf652381fa3f82c1fbea39f4dbe87fd] drm: Don't set the
plane-&gt;fb to NULL on successfull set_plane
git bisect good 35f8badc1cf652381fa3f82c1fbea39f4dbe87fd
# good: [31a34aa421032cfe3b2b892c929e7539e747a7ac] drm/nouveau/i2c: aux
channels not necessarily on nvio
git bisect good 31a34aa421032cfe3b2b892c929e7539e747a7ac
# bad: [0a0afd282fd715dd63d64b243299a64da14f8e8d] drm/nv50-/disp: move DP
link training to core and train from supervisor
git bisect bad 0a0afd282fd715dd63d64b243299a64da14f8e8d
# good: [ac8cc241a81941932da44993242e68c62e115ec7] drm/nv50/devinit:
reverse the logic for running encoder init scripts
git bisect good ac8cc241a81941932da44993242e68c62e115ec7
# good: [7dcd060c0e6e4f76ce7eea94c66437ce8f546530] drm/nouveau/i2c: create
proper chipset-specific class implementations
git bisect good 7dcd060c0e6e4f76ce7eea94c66437ce8f546530
# good: [5cc027f6b1ec651c18a4322ed3e30c6e9cf01e96] drm/nv50-/disp: handle
supervisor tasks from workqueue
git bisect good 5cc027f6b1ec651c18a4322ed3e30c6e9cf01e96
# first bad commit: [0a0afd282fd715dd63d64b243299a64da14f8e8d]
drm/nv50-/disp: move DP link training to core and train from supervisor




0a0afd282fd715dd63d64b243299a64da14f8e8d is the first bad commit
commit 0a0afd282fd715dd63d64b243299a64da14f8e8d
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Mon Feb 18 23:17:53 2013 -0500

    drm/nv50-/disp: move DP link training to core and train from supervisor

    We need to be able to do link training for PIOR-connected ANX9805 from
    the third supervisor handler (due to script ordering in the bios, can't
    have the &quot;user&quot; call train because some settings are overwritten from
    the modesetting bios scripts).

    This moves link training for SOR-connected DP encoders to the second
    supervisor interrupt, *before* we call the modesetting scripts (yes,
    different ordering from PIOR is necessary).  This is useful since we
    should now be able to remove some hacks to workaround races between
    the supervisor and link training paths.

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

:040000 040000 8f2f2d8ea35eae1b6e6ff981761be02a8818bac3
2994eb54c689056254c241fe78a3af8d0b61d1df M    drivers</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396008426.f2B474f1.16569--

--===============1051904184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1051904184==--
