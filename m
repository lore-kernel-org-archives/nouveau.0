From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69203] New: Kernel 3.11 - Xorg hangs immediately
 after invocation
Date: Wed, 11 Sep 2013 03:35:08 +0000
Message-ID: <bug-69203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0964381249=="
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


--===============0964381249==
Content-Type: multipart/alternative; boundary="1378870508.D7D260.10004"; charset="us-ascii"


--1378870508.D7D260.10004
Date: Wed, 11 Sep 2013 03:35:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69203

          Priority: medium
            Bug ID: 69203
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Kernel 3.11 - Xorg hangs immediately after invocation
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: 9.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

System:
(B)LFS i686-pc-linux-gnu
kernel 3.10.10 (with its nouveau module)
xorg-server v1.14.1
libdrm: git 2013-07-17 18:44 EST
Xorg_nouveau: git 2013-07-17 18:46 EST
Mesa v9.1.1
Motherboard:  "ASUS P5E-VM HDMI" with Intel G35/ICH9R,
 intel Core2Duo E8400@3.0GHz, 4 GB.
Graphics card:  EVGA GeForce GT430 active;  connected to
Monitor: ASUS VE258
---------------------------------------------------------
Description
1.  Boot up system to level 3 (text/VGA/console mode)
2.  Start Xorg (also known as "X", "X11")
3.  The system hangs.
  You can see the mouse pointer.  You can manipulate it but that's all.
  The only way out is to hard reboot the machine.
----------------------------------------------------------
Comments
1.  Up to and including 3.10.10, Xorg behaves normally.
2.  A git bisect procedure starting with
 git bisect good v3.10
 git bisect bad v3.11-rc7
reaches the last bisect step.  At that point
after compile and reboot the system hangs somewhere in the boot-up sequence.

git show
commit 5ee86c4190f9e19a9e13906389069c73d7f75bfb
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Jul 1 14:32:42 2013 +1000

    drm/nve0-/gr: some new gpc registers can have multiple copies

    GK110 exposes more than one, and needs to be dealt with in the ctxsw
    ucode just like the TPC sets are.

    Broadcast is at +0xe00.
 ...

cat .git/HEAD                                 # For confirmation
5ee86c4190f9e19a9e13906389069c73d7f75bfb

Please note that at this point the bisect is at 0 revisions left, 1 step.
Unfortunately, this commit bring the additional problem, the boot hung.

3. See attachments
Xorg.0.log-3.10.10good
Xorg.0.log-3.11bug                      # The most telling as to the problem
config-3.10.10
config-3.11

4. In trying to narrow down to the "exact" commit responsible for the
 subject bug, I created a "timeline" of events related to the problems
 befalling my system.

A-----a---b---c---d---e---f---g-----B

(to the left:  earlier in time)
Note:  the "line" component of the word "timeline" is from a bisect standpoint.
       Actually, there are a lot of branches and merges along the way.

Legend:
A: v3.10      X11 Good (a good "bisect good" start)
B: v3.11-rc1  X11 Bug  (a good "bisect bad" start)

a: 791dc143   X11 Good                                          Jun 27 17:35
b: 7c397cd9   X11 Good                                          Jun 28 14:24
c: 56fbd2b6   Hang on boot-up                                   May 2 12:37
d: c03ff9e8   Hang on boot-up                                   Jul 1 10:54
e: 5ee86c41   Hang on boot-up                                   Jul 1 14:32
f: 70f824ac   X11 starts but cursor is flaky (and soon lost)    Jul 1 14:48
g: 8f6fe267   X11 Bug                                           Jul 4 13:03

Commit references:

791dc143ed2c441f5202d8721609d94dce9fcf88
Author: Maarten Lankhorst
drm/nvd0-/disp: handle case where display engine is missing/disabled
Signed-off-by: Ben Skeggs

7c397cd97b8f46659698396b420bd48c3e6703e6
Author: Joonyoung Shim
drm: add mmap function to prime helpers
Signed-off-by: Joonyoung Shim and Dave Airlie

56fbd2b65446d4fb4df7770c49a70d563b7569c9
Author: Ben Skeggs
drm/nvf0/fifo: enable support
Signed-off-by: Ben Skeggs
[drivers/gpu/drm/nouveau]

c03ff9e8fa5fc0186158b99a89f613325ff352cf
Author: Ben Skeggs
drm/nvc0-/gr: pull out a group of separately context-switched gpc regs
Signed-off-by: Ben Skeggs
[drivers/gpu/drm/nouveau]

commit 5ee86c4190f9e19a9e13906389069c73d7f75bfb
Author: Ben Skeggs
drm/nve0-/gr: some new gpc registers can have multiple copies
Signed-off-by: Ben Skeggs
[drivers/gpu/drm/nouveau]

70f824ac8c369194e9499c59e687c6aa8b1a10c8
Author: Ben Skeggs
drm/nvc0-/gr: tpc regs a subset of gpc, add separate list for gpc/unk regs
Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
[drivers/gpu/drm/nouveau]

8f6fe26745d39299d43d79dd7ba9838517624c3f
Author: Ben Skeggs
drm/nvf0/gr: build cs ucode for GK110
Signed-off-by: Ben Skeggs
[drivers/gpu/drm/nouveau]

CONCLUSION
The bug was introduced and is lurking in the "nouveau" code of the "official"
release, 3.11.
The NVidia GT430 uses the "nouveau" driver, so it is affected, as described,
by the subject bug.
Note:  There is a "fix gpc hardware regression" in the nouveau branch:
 a0b7ebfb39bf80078d12bd1a46ec40d0d0dbdeef
including some patches.
Apparently, the corresponding "mainline" commit is
 d2989b534ef6834ebf2425aecc040b894b567c91
but it doesn't seem to affect (positively) the "problem" commit,
 5ee86c4190f9e19a9e13906389069c73d7f75bfb
(nor can one test it as long as the system hangs at boot!)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378870508.D7D260.10004
Date: Wed, 11 Sep 2013 03:35:08 +0000
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
   title="NEW --- - Kernel 3.11 - Xorg hangs immediately after invocation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69203">69203</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel 3.11 - Xorg hangs immediately after invocation
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
          <td>alupu01&#64;gmail.com
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
          <td>9.1
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
        <pre>System:
(B)LFS i686-pc-linux-gnu
kernel 3.10.10 (with its nouveau module)
xorg-server v1.14.1
libdrm: git 2013-07-17 18:44 EST
Xorg_nouveau: git 2013-07-17 18:46 EST
Mesa v9.1.1
Motherboard:  &quot;ASUS P5E-VM HDMI&quot; with Intel G35/ICH9R,
 intel Core2Duo <a href="mailto:E8400&#64;3.0GHz">E8400&#64;3.0GHz</a>, 4 GB.
Graphics card:  EVGA GeForce GT430 active;  connected to
Monitor: ASUS VE258
---------------------------------------------------------
Description
1.  Boot up system to level 3 (text/VGA/console mode)
2.  Start Xorg (also known as &quot;X&quot;, &quot;X11&quot;)
3.  The system hangs.
  You can see the mouse pointer.  You can manipulate it but that's all.
  The only way out is to hard reboot the machine.
----------------------------------------------------------
Comments
1.  Up to and including 3.10.10, Xorg behaves normally.
2.  A git bisect procedure starting with
 git bisect good v3.10
 git bisect bad v3.11-rc7
reaches the last bisect step.  At that point
after compile and reboot the system hangs somewhere in the boot-up sequence.

git show
commit 5ee86c4190f9e19a9e13906389069c73d7f75bfb
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Mon Jul 1 14:32:42 2013 +1000

    drm/nve0-/gr: some new gpc registers can have multiple copies

    GK110 exposes more than one, and needs to be dealt with in the ctxsw
    ucode just like the TPC sets are.

    Broadcast is at +0xe00.
 ...

cat .git/HEAD                                 # For confirmation
5ee86c4190f9e19a9e13906389069c73d7f75bfb

Please note that at this point the bisect is at 0 revisions left, 1 step.
Unfortunately, this commit bring the additional problem, the boot hung.

3. See attachments
Xorg.0.log-3.10.10good
Xorg.0.log-3.11bug                      # The most telling as to the problem
config-3.10.10
config-3.11

4. In trying to narrow down to the &quot;exact&quot; commit responsible for the
 subject bug, I created a &quot;timeline&quot; of events related to the problems
 befalling my system.

A-----a---b---c---d---e---f---g-----B

(to the left:  earlier in time)
Note:  the &quot;line&quot; component of the word &quot;timeline&quot; is from a bisect standpoint.
       Actually, there are a lot of branches and merges along the way.

Legend:
A: v3.10      X11 Good (a good &quot;bisect good&quot; start)
B: v3.11-rc1  X11 Bug  (a good &quot;bisect bad&quot; start)

a: 791dc143   X11 Good                                          Jun 27 17:35
b: 7c397cd9   X11 Good                                          Jun 28 14:24
c: 56fbd2b6   Hang on boot-up                                   May 2 12:37
d: c03ff9e8   Hang on boot-up                                   Jul 1 10:54
e: 5ee86c41   Hang on boot-up                                   Jul 1 14:32
f: 70f824ac   X11 starts but cursor is flaky (and soon lost)    Jul 1 14:48
g: 8f6fe267   X11 Bug                                           Jul 4 13:03

Commit references:

791dc143ed2c441f5202d8721609d94dce9fcf88
Author: Maarten Lankhorst
drm/nvd0-/disp: handle case where display engine is missing/disabled
Signed-off-by: Ben Skeggs

7c397cd97b8f46659698396b420bd48c3e6703e6
Author: Joonyoung Shim
drm: add mmap function to prime helpers
Signed-off-by: Joonyoung Shim and Dave Airlie

56fbd2b65446d4fb4df7770c49a70d563b7569c9
Author: Ben Skeggs
drm/nvf0/fifo: enable support
Signed-off-by: Ben Skeggs
[drivers/gpu/drm/nouveau]

c03ff9e8fa5fc0186158b99a89f613325ff352cf
Author: Ben Skeggs
drm/nvc0-/gr: pull out a group of separately context-switched gpc regs
Signed-off-by: Ben Skeggs
[drivers/gpu/drm/nouveau]

commit 5ee86c4190f9e19a9e13906389069c73d7f75bfb
Author: Ben Skeggs
drm/nve0-/gr: some new gpc registers can have multiple copies
Signed-off-by: Ben Skeggs
[drivers/gpu/drm/nouveau]

70f824ac8c369194e9499c59e687c6aa8b1a10c8
Author: Ben Skeggs
drm/nvc0-/gr: tpc regs a subset of gpc, add separate list for gpc/unk regs
Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
[drivers/gpu/drm/nouveau]

8f6fe26745d39299d43d79dd7ba9838517624c3f
Author: Ben Skeggs
drm/nvf0/gr: build cs ucode for GK110
Signed-off-by: Ben Skeggs
[drivers/gpu/drm/nouveau]

CONCLUSION
The bug was introduced and is lurking in the &quot;nouveau&quot; code of the &quot;official&quot;
release, 3.11.
The NVidia GT430 uses the &quot;nouveau&quot; driver, so it is affected, as described,
by the subject bug.
Note:  There is a &quot;fix gpc hardware regression&quot; in the nouveau branch:
 a0b7ebfb39bf80078d12bd1a46ec40d0d0dbdeef
including some patches.
Apparently, the corresponding &quot;mainline&quot; commit is
 d2989b534ef6834ebf2425aecc040b894b567c91
but it doesn't seem to affect (positively) the &quot;problem&quot; commit,
 5ee86c4190f9e19a9e13906389069c73d7f75bfb
(nor can one test it as long as the system hangs at boot!)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378870508.D7D260.10004--

--===============0964381249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0964381249==--
