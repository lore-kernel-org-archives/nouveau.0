From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57034] New: [Quadro FX 4800] display port connectors
 not recognized
Date: Mon, 12 Nov 2012 21:37:17 +0000
Message-ID: <bug-57034-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0702580295=="
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


--===============0702580295==
Content-Type: multipart/alternative; boundary="1352756238.Fde00A51.11406"; charset="us-ascii"


--1352756238.Fde00A51.11406
Date: Mon, 12 Nov 2012 21:37:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57034

          Priority: medium
            Bug ID: 57034
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [Quadro FX 4800] display port connectors not
                    recognized
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: orion-CVdf0l11yl+B+jHODAdFcQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 69963
  --> https://bugs.freedesktop.org/attachment.cgi?id=69963&action=edit
Xorg.0.log

02:00.0 VGA compatible controller: NVIDIA Corporation GT200GL [Quadro FX 4800]
(rev a1)

System does not appear to recognize or be able to use the two display port
connectors on this card.

# dmesg |grep drm
[    2.771310] [drm] Initialized drm 1.1.0 20060810
[    2.775685] [drm] nouveau 0000:02:00.0: Detected an NV50 generation card
(0x0a0f00b1)
[    2.778295] [drm] nouveau 0000:02:00.0: Checking PRAMIN for VBIOS
[    2.849995] [drm] nouveau 0000:02:00.0: ... appears to be valid
[    2.849997] [drm] nouveau 0000:02:00.0: Using VBIOS from PRAMIN
[    2.850000] [drm] nouveau 0000:02:00.0: BIT BIOS found
[    2.850002] [drm] nouveau 0000:02:00.0: Bios version 62.00.25.01
[    2.850004] [drm] nouveau 0000:02:00.0: TMDS table version 2.0
[    2.850101] [drm] nouveau 0000:02:00.0: MXM: no VBIOS data, nothing to do
[    2.850103] [drm] nouveau 0000:02:00.0: DCB version 4.0
[    2.850105] [drm] nouveau 0000:02:00.0: DCB outp 00: 04000320 00000028
[    2.850106] [drm] nouveau 0000:02:00.0: DCB outp 01: 01000322 00020030
[    2.850107] [drm] nouveau 0000:02:00.0: DCB outp 02: 02132336 0f220d00
[    2.850108] [drm] nouveau 0000:02:00.0: DCB outp 03: 02132332 00020d00
[    2.850109] [drm] nouveau 0000:02:00.0: DCB outp 04: 01121336 0f220e00
[    2.850110] [drm] nouveau 0000:02:00.0: DCB outp 05: 01121332 00020e00
[    2.850111] [drm] nouveau 0000:02:00.0: DCB conn 00: 00001030
[    2.850113] [drm] nouveau 0000:02:00.0: DCB conn 01: 0000a146
[    2.850114] [drm] nouveau 0000:02:00.0: DCB conn 02: 00050246
[    2.850115] [drm] nouveau 0000:02:00.0: DCB conn 03: 00000360
[    2.850118] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset
0xD0B6
[    2.872973] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset
0xD39A
[    2.875818] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset
0xE7FE
[    2.875824] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset
0xE8FF
[    2.876832] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset
0xE9BA
[    2.876833] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table at offset
0xEA1F
[    2.896837] [drm] nouveau 0000:02:00.0: 0xEA1F: Condition still not met
after 20ms, skipping following opcodes
[    2.901853] [drm] nouveau 0000:02:00.0: Detected 1536MiB VRAM (GDDR3)
[    2.907334] [drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
[    2.955290] [drm] nouveau 0000:02:00.0: Off-chip encoder 6/1 unsupported
[    2.955292] [drm] nouveau 0000:02:00.0: Off-chip encoder 2/1 unsupported
[    2.955293] [drm] nouveau 0000:02:00.0: Off-chip encoder 6/0 unsupported
[    2.955294] [drm] nouveau 0000:02:00.0: Off-chip encoder 2/0 unsupported
[    2.957289] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    2.957291] [drm] No driver support for vblank timestamp query.
[    2.965008] [drm] nouveau 0000:02:00.0: 3 available performance level(s)
[    2.965011] [drm] nouveau 0000:02:00.0: 0: core 300MHz shader 600MHz memory
100MHz voltage 1050mV fanspeed 100%
[    2.965013] [drm] nouveau 0000:02:00.0: 2: core 400MHz shader 800MHz memory
300MHz voltage 1050mV fanspeed 100%
[    2.965015] [drm] nouveau 0000:02:00.0: 3: core 602MHz shader 1204MHz memory
800MHz voltage 1180mV fanspeed 100%
[    2.965017] [drm] nouveau 0000:02:00.0: c: core 399MHz shader 810MHz memory
297MHz voltage 1180mV
[    3.010759] [drm] nouveau 0000:02:00.0: MM: using CRYPT for buffer copies
[    3.084261] [drm] nouveau 0000:02:00.0: allocated 1600x1200 fb: 0x2c0000, bo
ffff880134e45000
[    3.103452] drm: registered panic notifier
[    3.103457] [drm] Initialized nouveau 1.0.0 20120316 for 0000:02:00.0 on
minor 0
[   29.907369] [drm] nouveau 0000:02:00.0: Failed to idle channel 4.
[   32.907403] [drm] nouveau 0000:02:00.0: Failed to idle channel 4.
[   35.907393] [drm] nouveau 0000:02:00.0: Failed to idle channel 4.
[   38.907465] [drm] nouveau 0000:02:00.0: Failed to idle channel 4.
[   41.907473] [drm] nouveau 0000:02:00.0: Failed to idle channel 4.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352756238.Fde00A51.11406
Date: Mon, 12 Nov 2012 21:37:18 +0000
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
   title="NEW --- - [Quadro FX 4800] display port connectors not recognized"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57034">57034</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Quadro FX 4800] display port connectors not recognized
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
          <td>orion&#64;cora.nwra.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=69963" name="attach_69963" title="Xorg.0.log">attachment 69963</a> <a href="attachment.cgi?id=69963&amp;action=edit" title="Xorg.0.log">[details]</a></span>
Xorg.0.log

02:00.0 VGA compatible controller: NVIDIA Corporation GT200GL [Quadro FX 4800]
(rev a1)

System does not appear to recognize or be able to use the two display port
connectors on this card.

# dmesg |grep drm
[    2.771310] [drm] Initialized drm 1.1.0 20060810
[    2.775685] [drm] nouveau 0000:02:00.0: Detected an NV50 generation card
(0x0a0f00b1)
[    2.778295] [drm] nouveau 0000:02:00.0: Checking PRAMIN for VBIOS
[    2.849995] [drm] nouveau 0000:02:00.0: ... appears to be valid
[    2.849997] [drm] nouveau 0000:02:00.0: Using VBIOS from PRAMIN
[    2.850000] [drm] nouveau 0000:02:00.0: BIT BIOS found
[    2.850002] [drm] nouveau 0000:02:00.0: Bios version 62.00.25.01
[    2.850004] [drm] nouveau 0000:02:00.0: TMDS table version 2.0
[    2.850101] [drm] nouveau 0000:02:00.0: MXM: no VBIOS data, nothing to do
[    2.850103] [drm] nouveau 0000:02:00.0: DCB version 4.0
[    2.850105] [drm] nouveau 0000:02:00.0: DCB outp 00: 04000320 00000028
[    2.850106] [drm] nouveau 0000:02:00.0: DCB outp 01: 01000322 00020030
[    2.850107] [drm] nouveau 0000:02:00.0: DCB outp 02: 02132336 0f220d00
[    2.850108] [drm] nouveau 0000:02:00.0: DCB outp 03: 02132332 00020d00
[    2.850109] [drm] nouveau 0000:02:00.0: DCB outp 04: 01121336 0f220e00
[    2.850110] [drm] nouveau 0000:02:00.0: DCB outp 05: 01121332 00020e00
[    2.850111] [drm] nouveau 0000:02:00.0: DCB conn 00: 00001030
[    2.850113] [drm] nouveau 0000:02:00.0: DCB conn 01: 0000a146
[    2.850114] [drm] nouveau 0000:02:00.0: DCB conn 02: 00050246
[    2.850115] [drm] nouveau 0000:02:00.0: DCB conn 03: 00000360
[    2.850118] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at offset
0xD0B6
[    2.872973] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at offset
0xD39A
[    2.875818] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at offset
0xE7FE
[    2.875824] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at offset
0xE8FF
[    2.876832] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at offset
0xE9BA
[    2.876833] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table at offset
0xEA1F
[    2.896837] [drm] nouveau 0000:02:00.0: 0xEA1F: Condition still not met
after 20ms, skipping following opcodes
[    2.901853] [drm] nouveau 0000:02:00.0: Detected 1536MiB VRAM (GDDR3)
[    2.907334] [drm] nouveau 0000:02:00.0: 512 MiB GART (aperture)
[    2.955290] [drm] nouveau 0000:02:00.0: Off-chip encoder 6/1 unsupported
[    2.955292] [drm] nouveau 0000:02:00.0: Off-chip encoder 2/1 unsupported
[    2.955293] [drm] nouveau 0000:02:00.0: Off-chip encoder 6/0 unsupported
[    2.955294] [drm] nouveau 0000:02:00.0: Off-chip encoder 2/0 unsupported
[    2.957289] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    2.957291] [drm] No driver support for vblank timestamp query.
[    2.965008] [drm] nouveau 0000:02:00.0: 3 available performance level(s)
[    2.965011] [drm] nouveau 0000:02:00.0: 0: core 300MHz shader 600MHz memory
100MHz voltage 1050mV fanspeed 100%
[    2.965013] [drm] nouveau 0000:02:00.0: 2: core 400MHz shader 800MHz memory
300MHz voltage 1050mV fanspeed 100%
[    2.965015] [drm] nouveau 0000:02:00.0: 3: core 602MHz shader 1204MHz memory
800MHz voltage 1180mV fanspeed 100%
[    2.965017] [drm] nouveau 0000:02:00.0: c: core 399MHz shader 810MHz memory
297MHz voltage 1180mV
[    3.010759] [drm] nouveau 0000:02:00.0: MM: using CRYPT for buffer copies
[    3.084261] [drm] nouveau 0000:02:00.0: allocated 1600x1200 fb: 0x2c0000, bo
ffff880134e45000
[    3.103452] drm: registered panic notifier
[    3.103457] [drm] Initialized nouveau 1.0.0 20120316 for 0000:02:00.0 on
minor 0
[   29.907369] [drm] nouveau 0000:02:00.0: Failed to idle channel 4.
[   32.907403] [drm] nouveau 0000:02:00.0: Failed to idle channel 4.
[   35.907393] [drm] nouveau 0000:02:00.0: Failed to idle channel 4.
[   38.907465] [drm] nouveau 0000:02:00.0: Failed to idle channel 4.
[   41.907473] [drm] nouveau 0000:02:00.0: Failed to idle channel 4.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352756238.Fde00A51.11406--

--===============0702580295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0702580295==--
