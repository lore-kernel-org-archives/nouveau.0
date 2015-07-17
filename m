From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91373] New: Nouveau fills kern.log with gigabytes of
 data when molecule screensaver is ran
Date: Fri, 17 Jul 2015 14:46:08 +0000
Message-ID: <bug-91373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0782858130=="
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


--===============0782858130==
Content-Type: multipart/alternative; boundary="1437144368.3F1A80b41.27924"; charset="UTF-8"


--1437144368.3F1A80b41.27924
Date: Fri, 17 Jul 2015 14:46:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91373

            Bug ID: 91373
           Summary: Nouveau fills kern.log with gigabytes of data when
                    molecule screensaver is ran
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vhann3000+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

On Ubuntu 14.04.2, with both the stock kernel and 3.19.0-22, nouveau fills
kern.log with messages like these:

====================8< CUT HERE
8<=================================================================
$ tail -n 3000 kern.log.1 | head -n 50
Jul 10 18:02:35 dioo-XPS kernel: [114893.357149] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.406261] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.406269] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.420442] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.420447] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.479210] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.479217] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.568349] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.568356] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.622806] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.622813] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.637217] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.637221] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.695836] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.695843] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.784309] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.784316] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.838180] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.838187] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.853754] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.853759] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.913521] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.913528] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.977242] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.977249] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114894.068780] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114894.068788] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114894.122599] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114894.122606] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114894.137025] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114894.137030] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114894.195675] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114894.195682] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.284069] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.284078] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.339830] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.339837] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.353411] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.353416] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.412188] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.412204] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.501906] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.501913] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.558826] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.558831] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.570001] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.570006] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.628831] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.628839] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.717193] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
====================8< CUT HERE
8<==================================================================

On Kernel 4.2.0-rc2 (compiled based on the stock kernel's config), the computer
just locks up:

I xscreensaver-command -lock, then logged back in (no issue there), then I
xscreensaver-command -lock again and the computer just locked up. Caps lock
light was unresponsive on the keyboard, Ctrl+Alt+Delete didn't work, RESIUB
magic keys either.

After hard rebooting the computer, here is what what in kern.log and syslog:

Jul 16 17:19:45 dioo-XPS rtkit-daemon[2678]: Supervising 4 threads of 1
processes of 1 users.
Jul 16 17:27:15 dioo-XPS kernel: [ 619.825758] nouveau E[ PFIFO][0000:01:00.0]
SCHED_ERROR [ CTXSW_TIMEOUT ]
Jul 16 17:27:15 dioo-XPS kernel: [ 619.825764] nouveau E[ PFIFO][0000:01:00.0]
PGRAPH engine fault on channel 2, recovering...
Jul 16 17:28:35 dioo-XPS dbus[894]: [system] Activating service
name='org.freedesktop.systemd1' (using servicehelper)

The downstream bug is
https://bugs.launchpad.net/ubuntu/+source/linux-lts-vivid/+bug/1474538

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437144368.3F1A80b41.27924
Date: Fri, 17 Jul 2015 14:46:08 +0000
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
   title="NEW - Nouveau fills kern.log with gigabytes of data when molecule screensaver is ran"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91373">91373</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau fills kern.log with gigabytes of data when molecule screensaver is ran
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
          <td>vhann3000+freedesktop&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>On Ubuntu 14.04.2, with both the stock kernel and 3.19.0-22, nouveau fills
kern.log with messages like these:

====================8&lt; CUT HERE
8&lt;=================================================================
$ tail -n 3000 kern.log.1 | head -n 50
Jul 10 18:02:35 dioo-XPS kernel: [114893.357149] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.406261] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.406269] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.420442] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.420447] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.479210] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.479217] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.568349] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.568356] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.622806] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.622813] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.637217] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.637221] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.695836] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.695843] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.784309] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.784316] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.838180] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.838187] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.853754] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.853759] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.913521] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.913528] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114893.977242] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114893.977249] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114894.068780] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114894.068788] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114894.122599] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114894.122606] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114894.137025] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114894.137030] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:35 dioo-XPS kernel: [114894.195675] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:35 dioo-XPS kernel: [114894.195682] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.284069] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.284078] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.339830] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.339837] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.353411] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.353416] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.412188] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.412204] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.501906] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.501913] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.558826] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.558831] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.570001] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.570006] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.628831] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
Jul 10 18:02:36 dioo-XPS kernel: [114894.628839] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[16558]] subc 5 mthd 0x0000 data
0x0000906e
Jul 10 18:02:36 dioo-XPS kernel: [114894.717193] nouveau E[
PFIFO][0000:01:00.0] PBDMA0: LBREQ
====================8&lt; CUT HERE
8&lt;==================================================================

On Kernel 4.2.0-rc2 (compiled based on the stock kernel's config), the computer
just locks up:

I xscreensaver-command -lock, then logged back in (no issue there), then I
xscreensaver-command -lock again and the computer just locked up. Caps lock
light was unresponsive on the keyboard, Ctrl+Alt+Delete didn't work, RESIUB
magic keys either.

After hard rebooting the computer, here is what what in kern.log and syslog:

Jul 16 17:19:45 dioo-XPS rtkit-daemon[2678]: Supervising 4 threads of 1
processes of 1 users.
Jul 16 17:27:15 dioo-XPS kernel: [ 619.825758] nouveau E[ PFIFO][0000:01:00.0]
SCHED_ERROR [ CTXSW_TIMEOUT ]
Jul 16 17:27:15 dioo-XPS kernel: [ 619.825764] nouveau E[ PFIFO][0000:01:00.0]
PGRAPH engine fault on channel 2, recovering...
Jul 16 17:28:35 dioo-XPS dbus[894]: [system] Activating service
name='org.freedesktop.systemd1' (using servicehelper)

The downstream bug is
<a href="https://bugs.launchpad.net/ubuntu/+source/linux-lts-vivid/+bug/1474538">https://bugs.launchpad.net/ubuntu/+source/linux-lts-vivid/+bug/1474538</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437144368.3F1A80b41.27924--

--===============0782858130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0782858130==--
