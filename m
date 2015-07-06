From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91236] New: [NVC3] Passive DP to HDMI adapter cannot
 use pixel clocks greater than 165 MHz
Date: Mon, 06 Jul 2015 06:09:34 +0000
Message-ID: <bug-91236-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1453839459=="
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


--===============1453839459==
Content-Type: multipart/alternative; boundary="1436162975.Af4FaDB1.15346"; charset="UTF-8"


--1436162975.Af4FaDB1.15346
Date: Mon, 6 Jul 2015 06:09:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91236

            Bug ID: 91236
           Summary: [NVC3] Passive DP to HDMI adapter cannot use pixel
                    clocks greater than 165 MHz
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: a.boettcher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 116968
  --> https://bugs.freedesktop.org/attachment.cgi?id=116968&action=edit
dmesg of full boot + setting external display to mode with 297 MHz clock

Starting from stock linux 4.1.0 source, libdrm 2.4.61,
xf86-video-nouveau-1.0.11, xorg-server 1.17.1. The hardware is a Quatro 2000M
in a Lenovo W520 laptop setup as an offload sink and output source for an
integrated intel display. The external display is a Seiki SE39UY04 connected by
HDMI to display port passive adapter.

We attempted to use a 3840x2160@30 mode which has a pixel clock of 297 MHz.
This is known to work fine in both the nvidia blob and the windows driver, so
the hardware has no issues driving this clock in a single TDMS link.

First the connector detection code will reject this mode from the default list
because the maximum TDMS speed is based on pre-HDMI 1.3 spec. Second even if
that is worked around the mode is higher than 165 MHz, so the display port
connection will enter dual link mode, which must be stopped in this case.

We attempted to allow the mode to pass through to see if it might just work.
There were two changes:

drivers/gpu/drm/nouveau/nouvau_connector.c modified get_tmds_link_bandwidth()
to return 340000 (HDMI 1.3 spec)

drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c commented out line 1547-1548 to
not use dual link mode.

The result is a failure. The screen flickers and does not show anything. A full
dmesg log with nouveau.debug=trace is attached.

I am a C programmer but I have no familiarity with any part of the nouveau or
DRM parts of the world. Very willing to help, just don't know where to proceed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436162975.Af4FaDB1.15346
Date: Mon, 6 Jul 2015 06:09:35 +0000
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
   title="NEW - [NVC3] Passive DP to HDMI adapter cannot use pixel clocks greater than 165 MHz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91236">91236</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC3] Passive DP to HDMI adapter cannot use pixel clocks greater than 165 MHz
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
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>a.boettcher&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=116968" name="attach_116968" title="dmesg of full boot + setting external display to mode with 297 MHz clock">attachment 116968</a> <a href="attachment.cgi?id=116968&amp;action=edit" title="dmesg of full boot + setting external display to mode with 297 MHz clock">[details]</a></span>
dmesg of full boot + setting external display to mode with 297 MHz clock

Starting from stock linux 4.1.0 source, libdrm 2.4.61,
xf86-video-nouveau-1.0.11, xorg-server 1.17.1. The hardware is a Quatro 2000M
in a Lenovo W520 laptop setup as an offload sink and output source for an
integrated intel display. The external display is a Seiki SE39UY04 connected by
HDMI to display port passive adapter.

We attempted to use a 3840x2160&#64;30 mode which has a pixel clock of 297 MHz.
This is known to work fine in both the nvidia blob and the windows driver, so
the hardware has no issues driving this clock in a single TDMS link.

First the connector detection code will reject this mode from the default list
because the maximum TDMS speed is based on pre-HDMI 1.3 spec. Second even if
that is worked around the mode is higher than 165 MHz, so the display port
connection will enter dual link mode, which must be stopped in this case.

We attempted to allow the mode to pass through to see if it might just work.
There were two changes:

drivers/gpu/drm/nouveau/nouvau_connector.c modified get_tmds_link_bandwidth()
to return 340000 (HDMI 1.3 spec)

drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c commented out line 1547-1548 to
not use dual link mode.

The result is a failure. The screen flickers and does not show anything. A full
dmesg log with nouveau.debug=trace is attached.

I am a C programmer but I have no familiarity with any part of the nouveau or
DRM parts of the world. Very willing to help, just don't know where to proceed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436162975.Af4FaDB1.15346--

--===============1453839459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1453839459==--
