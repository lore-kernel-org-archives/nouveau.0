From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66129] New: [BISECTED] nouveau,
 nv50: dual display doesn't work in 3.9
Date: Mon, 24 Jun 2013 15:46:49 +0000
Message-ID: <bug-66129-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0005016789=="
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


--===============0005016789==
Content-Type: multipart/alternative; boundary="1372088810.f2a44.14754"; charset="us-ascii"


--1372088810.f2a44.14754
Date: Mon, 24 Jun 2013 15:46:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66129

          Priority: medium
            Bug ID: 66129
                CC: drewfrank-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joshuabaergen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
                    wippbox-hi6Y0CQ0nG0@public.gmane.org
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [BISECTED] nouveau, nv50: dual display doesn't work in
                    3.9
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: corsac-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
        Depends on: 64904
           Product: xorg

+++ This bug was initially created as a clone of Bug #64904 +++

(In reply to comment #19)
> I seem to have much of the same problem.as this, but this fix does not seem
> to work for me.
> 
> I just installed kernel 3.9.7 which have these fixes included. And I still
> have the same problem.
> 
> I am running a Dell desktop with  NVIDA Quadro NVS 295 graphic card and two
> identical Dell monitors attached via DisplayPort.
> 
> I run Fedora 18 with all latest updates and using Nouveau drivers.
> 
> Starting with Kernel 3.8.11 it boots OK and both monitors works as expected.
> Starting with Kernel 3.9.2-3.9.7 it boots, but when trying to display
> anything on monitor two it gets into problems.
> 
> It boots until its tries to start the Xorg server and then monitor 2 starts
> flickering on and off. Monitor 1 stays with the boot logo of fedora.
> 
> Also during boot when booting I only have the boot logo of fedora on monitor
> 1
> when running kernel 3.9.x while I have it on both screens when running kernel
> 3.8.11
> 
> I am able to hit CTRL+f2 to get a text login.
> 
> Is having two monitor different from having an external VGA?

I have the same issue so I took the liberty to clone this bug.

I also have a DELL desktop with:

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G86 [Quadro NVS
290] [10de:042f] (rev a1)

Starting 3.9, dual screen doesn't work anymore (screen stays blank or doesn't
not start at all) and vt switch takes some time. I've bisected the issue and
here are the results:

# bad: [c1be5a5b1b355d40e6cf79cc979eb66dafa24ad1] Linux 3.9
# good: [19f949f52599ba7c3f67a5897ac6be14bfcb1200] Linux 3.8
git bisect start 'v3.9' 'v3.8'
# good: [d778df51c09264076fe0208c099ef7d428f21790] mm: vmscan: save work
scanning (almost) empty LRU lists
git bisect good d778df51c09264076fe0208c099ef7d428f21790
# bad: [ee89f81252179dcbf6cd65bd48299f5e52292d88] Merge branch 'for-3.9/core'
of git://git.kernel.dk/linux-block
git bisect bad ee89f81252179dcbf6cd65bd48299f5e52292d88
# good: [69086a78bdc973ec0b722be790b146e84ba8a8c4] Merge branch 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
git bisect good 69086a78bdc973ec0b722be790b146e84ba8a8c4
# bad: [ed5dc2372dba46e0ecd08791b1a0399d313e5cff] Merge tag
'mmc-updates-for-3.9-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc
git bisect bad ed5dc2372dba46e0ecd08791b1a0399d313e5cff
# bad: [1f3a574a4bfe86ebf7d51fac37e0668397372fd8] Merge branch
'drm-nouveau-next' of git://anongit.freedesktop.org/git/nouveau/linux-2.6 into
drm-next
git bisect bad 1f3a574a4bfe86ebf7d51fac37e0668397372fd8
# good: [cd17ef4114ad5c514b17e6a0bb02a309ab90b692] Merge tag
'drm-intel-next-2013-02-01' of git://people.freedesktop.org/~danvet/drm-intel
into drm-next
git bisect good cd17ef4114ad5c514b17e6a0bb02a309ab90b692
# good: [210561ffd72d00eccf12c0131b8024d5436bae95] intel/iommu: force
writebuffer-flush quirk on Gen 4 Chipsets
git bisect good 210561ffd72d00eccf12c0131b8024d5436bae95
# good: [0f0800661a125ddb038462570c869fe6f8ab5737] drm/nouveau/gpio: pass
number of on-die gpio lines to base
git bisect good 0f0800661a125ddb038462570c869fe6f8ab5737
# good: [35f8badc1cf652381fa3f82c1fbea39f4dbe87fd] drm: Don't set the plane->fb
to NULL on successfull set_plane
git bisect good 35f8badc1cf652381fa3f82c1fbea39f4dbe87fd
# good: [31a34aa421032cfe3b2b892c929e7539e747a7ac] drm/nouveau/i2c: aux
channels not necessarily on nvio
git bisect good 31a34aa421032cfe3b2b892c929e7539e747a7ac
# good: [0a0afd282fd715dd63d64b243299a64da14f8e8d] drm/nv50-/disp: move DP link
training to core and train from supervisor
git bisect good 0a0afd282fd715dd63d64b243299a64da14f8e8d
# bad: [eb6313add6dddf07ea3e50c4caa33a9c3b2379f1] drm/nv50: initial kms support
for off-chip TMDS/DP encoders
git bisect bad eb6313add6dddf07ea3e50c4caa33a9c3b2379f1
# good: [a2bc283f3905389ba53962a2bbb05ede0c16193d] drm/nv50-/disp: initial work
towards supporting external encoders
git bisect good a2bc283f3905389ba53962a2bbb05ede0c16193d
# bad: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp: initial
supervisor support for off-chip encoders
git bisect bad 476e84e126171d809f9c0b5d97137f5055f95ca8
# first bad commit: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp:
initial supervisor support for off-chip encoders
# bad: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp: initial
supervisor support for off-chip encoders
git bisect bad 476e84e126171d809f9c0b5d97137f5055f95ca8
# first bad commit: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp:
initial supervisor support for off-chip encoders
# bad: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp: initial
supervisor support for off-chip encoders
git bisect bad 476e84e126171d809f9c0b5d97137f5055f95ca8
# first bad commit: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp:
initial supervisor support for off-chip encoders

And:

476e84e126171d809f9c0b5d97137f5055f95ca8 is the first bad commit
commit 476e84e126171d809f9c0b5d97137f5055f95ca8
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Feb 11 09:24:23 2013 +1000

    drm/nv50-/disp: initial supervisor support for off-chip encoders

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 9a28e3a997b96d2581ff81f5e0b97a9fc4f07917
41f69d26a80082e19d3c76e6556ad5ef9eb2677d M    drivers

Unfortunately it doesn't seem easy to just revert
476e84e126171d809f9c0b5d97137f5055f95ca8. If you need more info/debugging,
please ask.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372088810.f2a44.14754
Date: Mon, 24 Jun 2013 15:46:50 +0000
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
   title="NEW --- - [BISECTED] nouveau, nv50: dual display doesn't work in 3.9"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66129">66129</a>
          </td>
        </tr>

        <tr>
          <th>CC</th>
          <td>drewfrank&#64;gmail.com, joshuabaergen&#64;gmail.com, wippbox&#64;gmx.net
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[BISECTED] nouveau, nv50: dual display doesn't work in 3.9
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
          <td>corsac&#64;debian.org
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
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Depends on</th>
          <td>64904
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>+++ This bug was initially created as a clone of <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [BISECTED] nouveau, nv50: External VGA not detected anymore"
   href="show_bug.cgi?id=64904">Bug #64904</a> +++

(In reply to <a href="show_bug.cgi?id=66129#c19">comment #19</a>)
<span class="quote">&gt; I seem to have much of the same problem.as this, but this fix does not seem
&gt; to work for me.
&gt; 
&gt; I just installed kernel 3.9.7 which have these fixes included. And I still
&gt; have the same problem.
&gt; 
&gt; I am running a Dell desktop with  NVIDA Quadro NVS 295 graphic card and two
&gt; identical Dell monitors attached via DisplayPort.
&gt; 
&gt; I run Fedora 18 with all latest updates and using Nouveau drivers.
&gt; 
&gt; Starting with Kernel 3.8.11 it boots OK and both monitors works as expected.
&gt; Starting with Kernel 3.9.2-3.9.7 it boots, but when trying to display
&gt; anything on monitor two it gets into problems.
&gt; 
&gt; It boots until its tries to start the Xorg server and then monitor 2 starts
&gt; flickering on and off. Monitor 1 stays with the boot logo of fedora.
&gt; 
&gt; Also during boot when booting I only have the boot logo of fedora on monitor
&gt; 1
&gt; when running kernel 3.9.x while I have it on both screens when running kernel
&gt; 3.8.11
&gt; 
&gt; I am able to hit CTRL+f2 to get a text login.
&gt; 
&gt; Is having two monitor different from having an external VGA?</span >

I have the same issue so I took the liberty to clone this bug.

I also have a DELL desktop with:

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation G86 [Quadro NVS
290] [10de:042f] (rev a1)

Starting 3.9, dual screen doesn't work anymore (screen stays blank or doesn't
not start at all) and vt switch takes some time. I've bisected the issue and
here are the results:

# bad: [c1be5a5b1b355d40e6cf79cc979eb66dafa24ad1] Linux 3.9
# good: [19f949f52599ba7c3f67a5897ac6be14bfcb1200] Linux 3.8
git bisect start 'v3.9' 'v3.8'
# good: [d778df51c09264076fe0208c099ef7d428f21790] mm: vmscan: save work
scanning (almost) empty LRU lists
git bisect good d778df51c09264076fe0208c099ef7d428f21790
# bad: [ee89f81252179dcbf6cd65bd48299f5e52292d88] Merge branch 'for-3.9/core'
of git://git.kernel.dk/linux-block
git bisect bad ee89f81252179dcbf6cd65bd48299f5e52292d88
# good: [69086a78bdc973ec0b722be790b146e84ba8a8c4] Merge branch 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
git bisect good 69086a78bdc973ec0b722be790b146e84ba8a8c4
# bad: [ed5dc2372dba46e0ecd08791b1a0399d313e5cff] Merge tag
'mmc-updates-for-3.9-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc
git bisect bad ed5dc2372dba46e0ecd08791b1a0399d313e5cff
# bad: [1f3a574a4bfe86ebf7d51fac37e0668397372fd8] Merge branch
'drm-nouveau-next' of git://anongit.freedesktop.org/git/nouveau/linux-2.6 into
drm-next
git bisect bad 1f3a574a4bfe86ebf7d51fac37e0668397372fd8
# good: [cd17ef4114ad5c514b17e6a0bb02a309ab90b692] Merge tag
'drm-intel-next-2013-02-01' of git://people.freedesktop.org/~danvet/drm-intel
into drm-next
git bisect good cd17ef4114ad5c514b17e6a0bb02a309ab90b692
# good: [210561ffd72d00eccf12c0131b8024d5436bae95] intel/iommu: force
writebuffer-flush quirk on Gen 4 Chipsets
git bisect good 210561ffd72d00eccf12c0131b8024d5436bae95
# good: [0f0800661a125ddb038462570c869fe6f8ab5737] drm/nouveau/gpio: pass
number of on-die gpio lines to base
git bisect good 0f0800661a125ddb038462570c869fe6f8ab5737
# good: [35f8badc1cf652381fa3f82c1fbea39f4dbe87fd] drm: Don't set the plane-&gt;fb
to NULL on successfull set_plane
git bisect good 35f8badc1cf652381fa3f82c1fbea39f4dbe87fd
# good: [31a34aa421032cfe3b2b892c929e7539e747a7ac] drm/nouveau/i2c: aux
channels not necessarily on nvio
git bisect good 31a34aa421032cfe3b2b892c929e7539e747a7ac
# good: [0a0afd282fd715dd63d64b243299a64da14f8e8d] drm/nv50-/disp: move DP link
training to core and train from supervisor
git bisect good 0a0afd282fd715dd63d64b243299a64da14f8e8d
# bad: [eb6313add6dddf07ea3e50c4caa33a9c3b2379f1] drm/nv50: initial kms support
for off-chip TMDS/DP encoders
git bisect bad eb6313add6dddf07ea3e50c4caa33a9c3b2379f1
# good: [a2bc283f3905389ba53962a2bbb05ede0c16193d] drm/nv50-/disp: initial work
towards supporting external encoders
git bisect good a2bc283f3905389ba53962a2bbb05ede0c16193d
# bad: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp: initial
supervisor support for off-chip encoders
git bisect bad 476e84e126171d809f9c0b5d97137f5055f95ca8
# first bad commit: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp:
initial supervisor support for off-chip encoders
# bad: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp: initial
supervisor support for off-chip encoders
git bisect bad 476e84e126171d809f9c0b5d97137f5055f95ca8
# first bad commit: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp:
initial supervisor support for off-chip encoders
# bad: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp: initial
supervisor support for off-chip encoders
git bisect bad 476e84e126171d809f9c0b5d97137f5055f95ca8
# first bad commit: [476e84e126171d809f9c0b5d97137f5055f95ca8] drm/nv50-/disp:
initial supervisor support for off-chip encoders

And:

476e84e126171d809f9c0b5d97137f5055f95ca8 is the first bad commit
commit 476e84e126171d809f9c0b5d97137f5055f95ca8
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Mon Feb 11 09:24:23 2013 +1000

    drm/nv50-/disp: initial supervisor support for off-chip encoders

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

:040000 040000 9a28e3a997b96d2581ff81f5e0b97a9fc4f07917
41f69d26a80082e19d3c76e6556ad5ef9eb2677d M    drivers

Unfortunately it doesn't seem easy to just revert
476e84e126171d809f9c0b5d97137f5055f95ca8. If you need more info/debugging,
please ask.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372088810.f2a44.14754--

--===============0005016789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0005016789==--
