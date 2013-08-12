From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68037] New: TRAP_TPDMA - TP0: Unhandled ustatus
 0x00000008 ; and other NV50 log spam errors
Date: Mon, 12 Aug 2013 23:41:43 +0000
Message-ID: <bug-68037-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1665067829=="
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


--===============1665067829==
Content-Type: multipart/alternative; boundary="1376350903.E62A7831.19250"; charset="us-ascii"


--1376350903.E62A7831.19250
Date: Mon, 12 Aug 2013 23:41:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68037

          Priority: medium
            Bug ID: 68037
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: TRAP_TPDMA - TP0: Unhandled ustatus 0x00000008 ; and
                    other NV50 log spam errors
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: dirkneukirchen-S0/GAf8tV78@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 83990
  --> https://bugs.freedesktop.org/attachment.cgi?id=83990&action=edit
dmesg with nouveau.debug=debug

Steps to reproduce:

- log in
- execute glxgears
- message appears

Hardware: 
- Dual Monitor Setup VGA+DVI
- Geforce 8200 (Onboard; Jetway JNC62K)
nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP77/MCP78 (NVAA)
nouveau  [  DEVICE][0000:02:00.0] Family : NV50

example message:
nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA - TP0: Unhandled ustatus
0x00000008
nouveau E[  PGRAPH][0000:02:00.0]  TRAP
nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x0007b45000 Xorg[4836]] subc 7 class
0x8397 mthd 0x15e0 data 0x00000000
nouveau E[     PFB][0000:02:00.0] trapped write at 0x0020491500 on channel
0x00007b45 [Xorg[4836]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[4836]] get
0x0020025494 put 0x0020025f28 ib_get 0x000000aa ib_put 0x000000c9 state
0x8000e684 (err: INVALID_CMD) push 0x00400040
nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR BEGIN_END_ACTIVE
nouveau E[  PGRAPH][0000:02:00.0]  DATA_ERROR
nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x0007b45000 Xorg[4836]] subc 7 class
0x8397 mthd 0x1360 data 0x00000001

Kernel versions affected (at least):
3.11-rc5
3.10.4
3.8.0-27 (Linux Mint 15)
and possible older versions - see
https://bugs.freedesktop.org/show_bug.cgi?id=42479 for a similar message

potential related bugs: 
- https://bugs.freedesktop.org/show_bug.cgi?id=47191

Results of log messages might be somewhat random - maybe because of Video RAM
sharing.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376350903.E62A7831.19250
Date: Mon, 12 Aug 2013 23:41:43 +0000
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
   title="NEW --- - TRAP_TPDMA - TP0: Unhandled ustatus 0x00000008 ; and other NV50 log spam errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68037">68037</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>TRAP_TPDMA - TP0: Unhandled ustatus 0x00000008 ; and other NV50 log spam errors
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
          <td>dirkneukirchen&#64;web.de
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
        <pre>Created <span class=""><a href="attachment.cgi?id=83990" name="attach_83990" title="dmesg with nouveau.debug=debug">attachment 83990</a> <a href="attachment.cgi?id=83990&amp;action=edit" title="dmesg with nouveau.debug=debug">[details]</a></span>
dmesg with nouveau.debug=debug

Steps to reproduce:

- log in
- execute glxgears
- message appears

Hardware: 
- Dual Monitor Setup VGA+DVI
- Geforce 8200 (Onboard; Jetway JNC62K)
nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP77/MCP78 (NVAA)
nouveau  [  DEVICE][0000:02:00.0] Family : NV50

example message:
nouveau E[  PGRAPH][0000:02:00.0] TRAP_TPDMA - TP0: Unhandled ustatus
0x00000008
nouveau E[  PGRAPH][0000:02:00.0]  TRAP
nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x0007b45000 Xorg[4836]] subc 7 class
0x8397 mthd 0x15e0 data 0x00000000
nouveau E[     PFB][0000:02:00.0] trapped write at 0x0020491500 on channel
0x00007b45 [Xorg[4836]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
nouveau E[   PFIFO][0000:02:00.0] DMA_PUSHER - ch 2 [Xorg[4836]] get
0x0020025494 put 0x0020025f28 ib_get 0x000000aa ib_put 0x000000c9 state
0x8000e684 (err: INVALID_CMD) push 0x00400040
nouveau E[  PGRAPH][0000:02:00.0] DATA_ERROR BEGIN_END_ACTIVE
nouveau E[  PGRAPH][0000:02:00.0]  DATA_ERROR
nouveau E[  PGRAPH][0000:02:00.0] ch 2 [0x0007b45000 Xorg[4836]] subc 7 class
0x8397 mthd 0x1360 data 0x00000001

Kernel versions affected (at least):
3.11-rc5
3.10.4
3.8.0-27 (Linux Mint 15)
and possible older versions - see
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - piglit/glean/readPixSanity fails - dmesg PGRAPH - TRAP_TPDMA - TP0: Unhandled ustatus 0x00020000"
   href="show_bug.cgi?id=42479">https://bugs.freedesktop.org/show_bug.cgi?id=42479</a> for a similar message

potential related bugs: 
- <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - random xorg hang with PGRAPH_TRAP_TPDMA_2D - TP 0 - Unknown fault at address"
   href="show_bug.cgi?id=47191">https://bugs.freedesktop.org/show_bug.cgi?id=47191</a>

Results of log messages might be somewhat random - maybe because of Video RAM
sharing.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376350903.E62A7831.19250--

--===============1665067829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1665067829==--
