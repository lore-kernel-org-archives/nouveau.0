From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76414] New: [NVE4] Flash player triggers freeze
 with: PFIFO: read fault at ... [UNSUPPORTED_KIND] from PBDMA0/HOST ...
Date: Thu, 20 Mar 2014 20:33:50 +0000
Message-ID: <bug-76414-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0828440942=="
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


--===============0828440942==
Content-Type: multipart/alternative; boundary="1395347630.b2bca1.13091"; charset="us-ascii"


--1395347630.b2bca1.13091
Date: Thu, 20 Mar 2014 20:33:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76414

          Priority: medium
            Bug ID: 76414
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE4] Flash player triggers freeze with: PFIFO: read
                    fault at ... [UNSUPPORTED_KIND] from PBDMA0/HOST ...
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: tim-m/3gSgDDTkE@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

A specific web page, with some flash content triggers an Xorg freeze (100%
system CPU on one core). I reproduced the issue 4 times in a row right after
booting.

The specific web page:
http://rue89.nouvelobs.com/rue89-culture/2014/03/20/annees-rap-a-quitte-cite-parler-bieres-baise-suicide-250788

dmesg extract:
mars 20 20:47:02 titan kernel: nouveau E[   PFIFO][0000:01:00.0] PFIFO: read
fault at 0x0000011000 [UNSUPPORTED_KIND] from PBDMA0/HOST on channel
0x007edbc000 [unknown]
mars 20 20:48:03 titan kernel: nouveau E[     DRM] GPU lockup - switching to
software fbcon
mars 20 20:48:19 titan kernel: nouveau E[  X[361]] failed to idle channel
0xcccc0001 [X[361]]
mars 20 20:48:33 titan kernel: nouveau E[  X[361]] failed to idle channel
0xcccc0001 [X[361]]
mars 20 20:48:48 titan kernel: nouveau E[  X[361]] failed to idle channel
0xcccc0000 [X[361]]
mars 20 20:49:03 titan kernel: nouveau E[  X[361]] failed to idle channel
0xcccc0000 [X[361]]
mars 20 20:49:18 titan kernel: nouveau E[plugin-containe[2417]] failed to idle
channel 0xcccc0000 [plugin-containe[2417]]
mars 20 20:49:33 titan kernel: nouveau E[plugin-containe[2417]] failed to idle
channel 0xcccc0000 [plugin-containe[2417]]

linux 3.14.rc7.r28 (commit ea1cd65)
mesa 10.1.0-4
nouveau-dri 10.1.0-4

$ glxinfo | grep Open
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVE4
OpenGL core profile version string: 3.3 (Core Profile) Mesa 10.1.0
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 10.1.0
OpenGL shading language version string: 1.30
OpenGL context flags: (none)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395347630.b2bca1.13091
Date: Thu, 20 Mar 2014 20:33:50 +0000
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
   title="NEW --- - [NVE4] Flash player triggers freeze with: PFIFO: read fault at ... [UNSUPPORTED_KIND] from PBDMA0/HOST ..."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76414">76414</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE4] Flash player triggers freeze with: PFIFO: read fault at ... [UNSUPPORTED_KIND] from PBDMA0/HOST ...
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>tim&#64;siosm.fr
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
        <pre>A specific web page, with some flash content triggers an Xorg freeze (100%
system CPU on one core). I reproduced the issue 4 times in a row right after
booting.

The specific web page:
<a href="http://rue89.nouvelobs.com/rue89-culture/2014/03/20/annees-rap-a-quitte-cite-parler-bieres-baise-suicide-250788">http://rue89.nouvelobs.com/rue89-culture/2014/03/20/annees-rap-a-quitte-cite-parler-bieres-baise-suicide-250788</a>

dmesg extract:
mars 20 20:47:02 titan kernel: nouveau E[   PFIFO][0000:01:00.0] PFIFO: read
fault at 0x0000011000 [UNSUPPORTED_KIND] from PBDMA0/HOST on channel
0x007edbc000 [unknown]
mars 20 20:48:03 titan kernel: nouveau E[     DRM] GPU lockup - switching to
software fbcon
mars 20 20:48:19 titan kernel: nouveau E[  X[361]] failed to idle channel
0xcccc0001 [X[361]]
mars 20 20:48:33 titan kernel: nouveau E[  X[361]] failed to idle channel
0xcccc0001 [X[361]]
mars 20 20:48:48 titan kernel: nouveau E[  X[361]] failed to idle channel
0xcccc0000 [X[361]]
mars 20 20:49:03 titan kernel: nouveau E[  X[361]] failed to idle channel
0xcccc0000 [X[361]]
mars 20 20:49:18 titan kernel: nouveau E[plugin-containe[2417]] failed to idle
channel 0xcccc0000 [plugin-containe[2417]]
mars 20 20:49:33 titan kernel: nouveau E[plugin-containe[2417]] failed to idle
channel 0xcccc0000 [plugin-containe[2417]]

linux 3.14.rc7.r28 (commit ea1cd65)
mesa 10.1.0-4
nouveau-dri 10.1.0-4

$ glxinfo | grep Open
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVE4
OpenGL core profile version string: 3.3 (Core Profile) Mesa 10.1.0
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 10.1.0
OpenGL shading language version string: 1.30
OpenGL context flags: (none)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395347630.b2bca1.13091--

--===============0828440942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0828440942==--
