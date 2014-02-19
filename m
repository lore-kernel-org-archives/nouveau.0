From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75199] New: unsupported GT620M in Samsung All-in-One
 PC DP500A2D
Date: Wed, 19 Feb 2014 11:24:53 +0000
Message-ID: <bug-75199-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1456170192=="
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


--===============1456170192==
Content-Type: multipart/alternative; boundary="1392809093.bBBCb4A31.10828"; charset="us-ascii"


--1392809093.bBBCb4A31.10828
Date: Wed, 19 Feb 2014 11:24:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75199

          Priority: medium
            Bug ID: 75199
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: unsupported GT620M in Samsung All-in-One PC DP500A2D
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: slappinjohn-hi6Y0CQ0nG0@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Created attachment 94345
  --> https://bugs.freedesktop.org/attachment.cgi?id=94345&action=edit
kernel log

I thought normally the Optimus Card in the Samsung All-in-One-PC should work,
but neither the nvidia-331 or the latest nouveau-driver in ubuntu 13.10 seems
to recognize the device correctly.

here some information (kernel-log attached):

lspci -vvxxx:

01:00.0 3D controller: NVIDIA Corporation GF117M [GeForce 610M/710M / GT
620M/625M/630M/720M] (rev a1)
    Subsystem: Samsung Electronics Co Ltd GeForce GT 620M
    Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at f0000000 (64-bit, prefetchable) [size=32M]
    Region 5: I/O ports at e000 [size=128]
    Expansion ROM at f7000000 [disabled] [size=512K]
    Capabilities: <access denied>
00: de 10 40 11 03 00 10 00 a1 00 02 03 10 00 00 00
10: 00 00 00 01 0c 00 00 f0 00 00 00 00 0c 00 00 4c
20: 00 00 00 00 01 ff 4d 14 00 00 00 00 4d 14 92 b0
30: 00 00 00 f7 60 00 00 00 00 00 00 00 ff 01 00 00


bumblebee:

optirun -vv glxheads
[20512.200644] [DEBUG]Reading file: /etc/bumblebee/bumblebee.conf
[20512.201004] [INFO]Configured driver: nouveau
[20512.201181] [DEBUG]optirun version 3.2.1 starting...
[20512.201194] [DEBUG]Active configuration:
[20512.201200] [DEBUG] bumblebeed config file: /etc/bumblebee/bumblebee.conf
[20512.201205] [DEBUG] X display: :8
[20512.201210] [DEBUG] LD_LIBRARY_PATH:
[20512.201215] [DEBUG] Socket path: /var/run/bumblebee.socket
[20512.201220] [DEBUG] Accel/display bridge: auto
[20512.201224] [DEBUG] VGL Compression: proxy
[20512.201229] [DEBUG] VGLrun extra options:
[20512.201234] [DEBUG] Primus LD Path:
/usr/lib/x86_64-linux-gnu/primus:/usr/lib/i386-linux-gnu/primus
[20512.201267] [DEBUG]Using auto-detected bridge virtualgl
[20512.435068] [INFO]Response: No - error: [XORG] (EE) [drm] KMS not enabled
[20512.435091] [ERROR]Cannot access secondary GPU - error: [XORG] (EE) [drm]
KMS not enabled
[20512.435098] [DEBUG]Socket closed.
[20512.435121] [ERROR]Aborting because fallback start is disabled.
[20512.435131] [DEBUG]Killing all remaining processes.


Versions:

xserver-xorg-video-nouveau 1:1.0.9+git2
xorg 7.7+1ubuntu6
libdrm-nouveau2 2.4.52+git2014
libmesa 10.2.0~git2014
kernel 3.11.0.17.18

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392809093.bBBCb4A31.10828
Date: Wed, 19 Feb 2014 11:24:53 +0000
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
   title="NEW --- - unsupported GT620M in Samsung All-in-One PC DP500A2D"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75199">75199</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>unsupported GT620M in Samsung All-in-One PC DP500A2D
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
          <td>slappinjohn&#64;gmx.net
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
          <td>7.7 (2011)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=94345" name="attach_94345" title="kernel log">attachment 94345</a> <a href="attachment.cgi?id=94345&amp;action=edit" title="kernel log">[details]</a></span>
kernel log

I thought normally the Optimus Card in the Samsung All-in-One-PC should work,
but neither the nvidia-331 or the latest nouveau-driver in ubuntu 13.10 seems
to recognize the device correctly.

here some information (kernel-log attached):

lspci -vvxxx:

01:00.0 3D controller: NVIDIA Corporation GF117M [GeForce 610M/710M / GT
620M/625M/630M/720M] (rev a1)
    Subsystem: Samsung Electronics Co Ltd GeForce GT 620M
    Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at f0000000 (64-bit, prefetchable) [size=32M]
    Region 5: I/O ports at e000 [size=128]
    Expansion ROM at f7000000 [disabled] [size=512K]
    Capabilities: &lt;access denied&gt;
00: de 10 40 11 03 00 10 00 a1 00 02 03 10 00 00 00
10: 00 00 00 01 0c 00 00 f0 00 00 00 00 0c 00 00 4c
20: 00 00 00 00 01 ff 4d 14 00 00 00 00 4d 14 92 b0
30: 00 00 00 f7 60 00 00 00 00 00 00 00 ff 01 00 00


bumblebee:

optirun -vv glxheads
[20512.200644] [DEBUG]Reading file: /etc/bumblebee/bumblebee.conf
[20512.201004] [INFO]Configured driver: nouveau
[20512.201181] [DEBUG]optirun version 3.2.1 starting...
[20512.201194] [DEBUG]Active configuration:
[20512.201200] [DEBUG] bumblebeed config file: /etc/bumblebee/bumblebee.conf
[20512.201205] [DEBUG] X display: :8
[20512.201210] [DEBUG] LD_LIBRARY_PATH:
[20512.201215] [DEBUG] Socket path: /var/run/bumblebee.socket
[20512.201220] [DEBUG] Accel/display bridge: auto
[20512.201224] [DEBUG] VGL Compression: proxy
[20512.201229] [DEBUG] VGLrun extra options:
[20512.201234] [DEBUG] Primus LD Path:
/usr/lib/x86_64-linux-gnu/primus:/usr/lib/i386-linux-gnu/primus
[20512.201267] [DEBUG]Using auto-detected bridge virtualgl
[20512.435068] [INFO]Response: No - error: [XORG] (EE) [drm] KMS not enabled
[20512.435091] [ERROR]Cannot access secondary GPU - error: [XORG] (EE) [drm]
KMS not enabled
[20512.435098] [DEBUG]Socket closed.
[20512.435121] [ERROR]Aborting because fallback start is disabled.
[20512.435131] [DEBUG]Killing all remaining processes.


Versions:

xserver-xorg-video-nouveau 1:1.0.9+git2
xorg 7.7+1ubuntu6
libdrm-nouveau2 2.4.52+git2014
libmesa 10.2.0~git2014
kernel 3.11.0.17.18</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392809093.bBBCb4A31.10828--

--===============1456170192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1456170192==--
