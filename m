From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75620] New: [NVAA] nouveau: tearing regression
Date: Fri, 28 Feb 2014 19:56:21 +0000
Message-ID: <bug-75620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0251489766=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0251489766==
Content-Type: multipart/alternative; boundary="1393617381.C5F488c1.1327"; charset="us-ascii"


--1393617381.C5F488c1.1327
Date: Fri, 28 Feb 2014 19:56:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75620

          Priority: medium
            Bug ID: 75620
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVAA] nouveau: tearing regression
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: alexanders83-S0/GAf8tV78@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 94915
  --> https://bugs.freedesktop.org/attachment.cgi?id=94915&action=edit
git bisect log

I noticed mplayer showing some tearing starting from kernel version v3.10.7
which wasn't there in v3.8.
I could bisect it down to commit 1d7c71a3e2f77336df536855b0efd2dc5bdeb41b
(drm/nouveau/disp: port vblank handling to event interface).
Unfortunately c7d73f6a8ad71f9d9f58c86981322c6e48093a4f introduced a
NULL-pointer dereference regression. Luckily I found
526810adb93554e17bdb83023a01cfa8758960b2 which fixes that. Doing the bisect I
had to cherry-pick that each time until I tried commit 1d7c71a. At this commit
I additionally need to cherry-pick c8f28f8.
After adding those 2 commits I could run mplayer again and could clearly see
the tearing effect.
My hardware:
02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8300] (rev
a2) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 82f2
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 20
        Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at f0000000 (64-bit, prefetchable) [size=128M]
        Region 3: Memory at fa000000 (64-bit, prefetchable) [size=32M]
        Region 5: I/O ports at ec00 [size=128]
        Expansion ROM at feae0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Kernel driver in use: nouveau
        Kernel modules: nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393617381.C5F488c1.1327
Date: Fri, 28 Feb 2014 19:56:21 +0000
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
   title="NEW --- - [NVAA] nouveau: tearing regression"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75620">75620</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVAA] nouveau: tearing regression
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>alexanders83&#64;web.de
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
        <pre>Created <span class=""><a href="attachment.cgi?id=94915" name="attach_94915" title="git bisect log">attachment 94915</a> <a href="attachment.cgi?id=94915&amp;action=edit" title="git bisect log">[details]</a></span>
git bisect log

I noticed mplayer showing some tearing starting from kernel version v3.10.7
which wasn't there in v3.8.
I could bisect it down to commit 1d7c71a3e2f77336df536855b0efd2dc5bdeb41b
(drm/nouveau/disp: port vblank handling to event interface).
Unfortunately c7d73f6a8ad71f9d9f58c86981322c6e48093a4f introduced a
NULL-pointer dereference regression. Luckily I found
526810adb93554e17bdb83023a01cfa8758960b2 which fixes that. Doing the bisect I
had to cherry-pick that each time until I tried commit 1d7c71a. At this commit
I additionally need to cherry-pick c8f28f8.
After adding those 2 commits I could run mplayer again and could clearly see
the tearing effect.
My hardware:
02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8300] (rev
a2) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 82f2
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 20
        Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at f0000000 (64-bit, prefetchable) [size=128M]
        Region 3: Memory at fa000000 (64-bit, prefetchable) [size=32M]
        Region 5: I/O ports at ec00 [size=128]
        Expansion ROM at feae0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Kernel driver in use: nouveau
        Kernel modules: nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393617381.C5F488c1.1327--

--===============0251489766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0251489766==--
