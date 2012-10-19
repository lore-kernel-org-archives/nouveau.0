From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56202] New: [regression][kms] Clock rework causes
 kms boot regression for NV4E (v3.7-rc1, 3.6+nouveau)
Date: Fri, 19 Oct 2012 20:21:18 +0000
Message-ID: <bug-56202-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1134376513=="
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


--===============1134376513==
Content-Type: multipart/alternative; boundary="1350678078.Ad10F651.9160"; charset="us-ascii"


--1350678078.Ad10F651.9160
Date: Fri, 19 Oct 2012 20:21:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56202

          Priority: medium
            Bug ID: 56202
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [regression][kms] Clock rework causes kms boot
                    regression for NV4E (v3.7-rc1, 3.6+nouveau)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 68815
  --> https://bugs.freedesktop.org/attachment.cgi?id=68815&action=edit
v3.6.0+ @ the commit that caused the regression

The following commit causes KMS initialisation to result in a scrambled screen
with mostly blue elements. The screen responds to changes based on actual
content (e.g. system booting, lightdm starting).

drm/nouveau/clock: pull in the implementation from all over the place

I have tested and verified this regression on a 3.6 tree and the recent v3.7
tree pulled from git.kernel.org.

Below you will find some more data about my VGA card.

Attached you will find two dmesg output logs (don't know if they differ):

both are from the v3.7-rc1 tree (they are noted as 3.6.0+ in the logs)
dmesg-good.txt @ the commit before the one that caused the regression
dmesg-bad.txt @ the commit that caused the regression

00:05.0 0300: 10de:0244 (rev a2) (prog-if 00 [VGA controller])
    Subsystem: 103c:30b7
00:05.0 VGA compatible controller: NVIDIA Corporation C51 [GeForce Go 6150]
(rev a2) (prog-if 00 [VGA controller])
    Subsystem: Hewlett-Packard Company Presario V6133CL
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin A routed to IRQ 18
    Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at b1000000 (64-bit, non-prefetchable) [size=16M]
    [virtual] Expansion ROM at 40000000 [disabled] [size=128K]
    Capabilities: [48] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Kernel driver in use: nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350678078.Ad10F651.9160
Date: Fri, 19 Oct 2012 20:21:18 +0000
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
   title="NEW --- - [regression][kms] Clock rework causes kms boot regression for NV4E (v3.7-rc1, 3.6+nouveau)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56202">56202</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[regression][kms] Clock rework causes kms boot regression for NV4E (v3.7-rc1, 3.6+nouveau)
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
          <td>ronald645&#64;gmail.com
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
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=68815" name="attach_68815" title="v3.6.0+ &#64; the commit that caused the regression">attachment 68815</a> <a href="attachment.cgi?id=68815&amp;action=edit" title="v3.6.0+ &#64; the commit that caused the regression">[details]</a></span>
v3.6.0+ &#64; the commit that caused the regression

The following commit causes KMS initialisation to result in a scrambled screen
with mostly blue elements. The screen responds to changes based on actual
content (e.g. system booting, lightdm starting).

drm/nouveau/clock: pull in the implementation from all over the place

I have tested and verified this regression on a 3.6 tree and the recent v3.7
tree pulled from git.kernel.org.

Below you will find some more data about my VGA card.

Attached you will find two dmesg output logs (don't know if they differ):

both are from the v3.7-rc1 tree (they are noted as 3.6.0+ in the logs)
dmesg-good.txt &#64; the commit before the one that caused the regression
dmesg-bad.txt &#64; the commit that caused the regression

00:05.0 0300: 10de:0244 (rev a2) (prog-if 00 [VGA controller])
    Subsystem: 103c:30b7
00:05.0 VGA compatible controller: NVIDIA Corporation C51 [GeForce Go 6150]
(rev a2) (prog-if 00 [VGA controller])
    Subsystem: Hewlett-Packard Company Presario V6133CL
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
    Latency: 0
    Interrupt: pin A routed to IRQ 18
    Region 0: Memory at b2000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at b1000000 (64-bit, non-prefetchable) [size=16M]
    [virtual] Expansion ROM at 40000000 [disabled] [size=128K]
    Capabilities: [48] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Kernel driver in use: nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350678078.Ad10F651.9160--

--===============1134376513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1134376513==--
