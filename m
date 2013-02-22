From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61287] New: (bisected) kernel>=3.7 breaks nouveau
 with acceleration for GeForce 6150SE nForce 430
Date: Fri, 22 Feb 2013 15:45:51 +0000
Message-ID: <bug-61287-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0198066730=="
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


--===============0198066730==
Content-Type: multipart/alternative; boundary="1361547952.383Bfb3F1.31411"; charset="us-ascii"


--1361547952.383Bfb3F1.31411
Date: Fri, 22 Feb 2013 15:45:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61287

          Priority: medium
            Bug ID: 61287
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: (bisected) kernel>=3.7 breaks nouveau with
                    acceleration for GeForce 6150SE nForce 430
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: balducci-KqplAB4qOuE@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Hello,

I am experiencing X11 problems with kernel>=3.7 (including latest 3.8
release) with the following GPU:

   NVIDIA Corporation C61 [GeForce 6150SE nForce 430] (rev a2)

I am on an AMD Athlon 64 X2 Dual Core Processor, running in
32bit mode and using DRM/NOUVEAU in KMS.

Further (possibly) useful information about software versions is:

          mesa                9.0.2   
          libdrm              2.4.42  
          xf86-video-nouveau  1.0.6   
          xorg-server         1.13.2  


I can boot just fine in KMS.

Also X11 (which I run with startx) boots nicely and is *almost*
perfectly functional (which is why it took me a while to focus the
problem)

The problem is apparently related to acceleration: if I run glxgears
(or vmd, a molecular visualization code which uses acceleration), the
X server suddenly looks (to me) overloaded and unstable (e.g. I cannot move
the pointer any more); within some 10-20 sec I can escape to the
console with CTRL-ALT-F1 and just kill manually the X server with
CTRL-c. This however takes a bit and in the meantime I get the
following repeated messages (apparently) from some nouveau component
on the console:

   nouveau E[     891] failed to idle channel 0xcccc0000

After this, the GPU is apparently left in a sort of locked state: if I
restart X, the screen shows the image just before the crash and is
totally unresponsive. However, I can still shutdown X with CTRL-ALT-F1
and kill manually the server. In order to have X running again I have
to reboot the machine.

The problem is completely reproducible.

If I boot into kernel-3.6.10 (everything else unchanged), nothing of the
above happens and glxgears (and vmd) work absolutely fine.


I have bisected the kernel commits from 3.6.10 to 3.7-rc1 in
drivers/gpu/drm/nouveau/ and it turns out that:

     612a9aab56a93533e76e3ad91642db7033e03b69 is the first bad commit

    commit 612a9aab56a93533e76e3ad91642db7033e03b69
    Merge: 3a49431 268d283
    Author: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
    Date:   Wed Oct 3 23:28:59 2012 -0700

        Merge branch 'drm-next' of git://people.freedesktop.org/~airlied/linux

        Pull drm merge (part 1) from Dave Airlie:
         "So first of all my tree and uapi stuff has a conflict mess, its my
          fault as the nouveau stuff didn't hit -next as were trying to rebase
          regressions out of it before we merged.

          Highlights:
           - SH mobile modesetting driver and associated helpers
           - some DRM core documentation
           - i915 modesetting rework, haswell hdmi, haswell and vlv fixes,
write
             combined pte writing, ilk rc6 support,
           - nouveau: major driver rework into a hw core driver, makes features
             like SLI a lot saner to implement,
           - psb: add eDP/DP support for Cedarview
           - radeon: 2 layer page tables, async VM pte updates, better PLL
             selection for > 2 screens, better ACPI interactions
    [...]


Problems for the same GPU with kernel>=3.7 have been already reported
here:

      https://bugzilla.redhat.com/show_bug.cgi?id=905629

However, it is not clear to me if that report and the present one are
dealing with the same thing...

Please, find enclosed:
=> kernel configuration
=> xorg configuration
=> xorg log after the crash
=> dmesg after the crash


(To avoid possible confusion: I opened a bug here some time ago for
another problem with another NVIDIA GPU (Bug 58776): in that report I
said that this GPU was working fine: of course, I did not discovered
yet the present issue)


I thank you very much in advance for any help

ciao
gabriele

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361547952.383Bfb3F1.31411
Date: Fri, 22 Feb 2013 15:45:52 +0000
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
   title="NEW --- - (bisected) kernel&gt;=3.7 breaks nouveau with acceleration for GeForce 6150SE nForce 430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61287">61287</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>(bisected) kernel&gt;=3.7 breaks nouveau with acceleration for GeForce 6150SE nForce 430
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
          <td>balducci&#64;units.it
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
        <pre>Hello,

I am experiencing X11 problems with kernel&gt;=3.7 (including latest 3.8
release) with the following GPU:

   NVIDIA Corporation C61 [GeForce 6150SE nForce 430] (rev a2)

I am on an AMD Athlon 64 X2 Dual Core Processor, running in
32bit mode and using DRM/NOUVEAU in KMS.

Further (possibly) useful information about software versions is:

          mesa                9.0.2   
          libdrm              2.4.42  
          xf86-video-nouveau  1.0.6   
          xorg-server         1.13.2  


I can boot just fine in KMS.

Also X11 (which I run with startx) boots nicely and is *almost*
perfectly functional (which is why it took me a while to focus the
problem)

The problem is apparently related to acceleration: if I run glxgears
(or vmd, a molecular visualization code which uses acceleration), the
X server suddenly looks (to me) overloaded and unstable (e.g. I cannot move
the pointer any more); within some 10-20 sec I can escape to the
console with CTRL-ALT-F1 and just kill manually the X server with
CTRL-c. This however takes a bit and in the meantime I get the
following repeated messages (apparently) from some nouveau component
on the console:

   nouveau E[     891] failed to idle channel 0xcccc0000

After this, the GPU is apparently left in a sort of locked state: if I
restart X, the screen shows the image just before the crash and is
totally unresponsive. However, I can still shutdown X with CTRL-ALT-F1
and kill manually the server. In order to have X running again I have
to reboot the machine.

The problem is completely reproducible.

If I boot into kernel-3.6.10 (everything else unchanged), nothing of the
above happens and glxgears (and vmd) work absolutely fine.


I have bisected the kernel commits from 3.6.10 to 3.7-rc1 in
drivers/gpu/drm/nouveau/ and it turns out that:

     612a9aab56a93533e76e3ad91642db7033e03b69 is the first bad commit

    commit 612a9aab56a93533e76e3ad91642db7033e03b69
    Merge: 3a49431 268d283
    Author: Linus Torvalds &lt;<a href="mailto:torvalds&#64;linux-foundation.org">torvalds&#64;linux-foundation.org</a>&gt;
    Date:   Wed Oct 3 23:28:59 2012 -0700

        Merge branch 'drm-next' of git://people.freedesktop.org/~airlied/linux

        Pull drm merge (part 1) from Dave Airlie:
         &quot;So first of all my tree and uapi stuff has a conflict mess, its my
          fault as the nouveau stuff didn't hit -next as were trying to rebase
          regressions out of it before we merged.

          Highlights:
           - SH mobile modesetting driver and associated helpers
           - some DRM core documentation
           - i915 modesetting rework, haswell hdmi, haswell and vlv fixes,
write
             combined pte writing, ilk rc6 support,
           - nouveau: major driver rework into a hw core driver, makes features
             like SLI a lot saner to implement,
           - psb: add eDP/DP support for Cedarview
           - radeon: 2 layer page tables, async VM pte updates, better PLL
             selection for &gt; 2 screens, better ACPI interactions
    [...]


Problems for the same GPU with kernel&gt;=3.7 have been already reported
here:

      <a href="https://bugzilla.redhat.com/show_bug.cgi?id=905629">https://bugzilla.redhat.com/show_bug.cgi?id=905629</a>

However, it is not clear to me if that report and the present one are
dealing with the same thing...

Please, find enclosed:
=&gt; kernel configuration
=&gt; xorg configuration
=&gt; xorg log after the crash
=&gt; dmesg after the crash


(To avoid possible confusion: I opened a bug here some time ago for
another problem with another NVIDIA GPU (<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - DRM NOUVEAU: cannot boot with kernel &gt;=3.7"
   href="show_bug.cgi?id=58776">Bug 58776</a>): in that report I
said that this GPU was working fine: of course, I did not discovered
yet the present issue)


I thank you very much in advance for any help

ciao
gabriele</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361547952.383Bfb3F1.31411--

--===============0198066730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0198066730==--
