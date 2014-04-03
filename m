From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76990] New: [NVE6] Xorg crashes when switching back
 from VT to X
Date: Thu, 03 Apr 2014 10:18:51 +0000
Message-ID: <bug-76990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0436490590=="
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


--===============0436490590==
Content-Type: multipart/alternative; boundary="1396520331.af4b2.30518"; charset="us-ascii"


--1396520331.af4b2.30518
Date: Thu, 3 Apr 2014 10:18:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76990

          Priority: medium
            Bug ID: 76990
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE6] Xorg crashes when switching back from VT to X
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: d-bugzilla-vUpi/VKO0VA@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Testing with GK106GLM [Quadro K2100M], QHD+ (3200x1800) screen.

Environment : Fedora 20 with kernel 3.14 and darktama's git 
633e16bb8571071b9da8ed03513a2266cbf21eb5.

When switching to a VT, and afterwards switching back to the X session, X
crashes.


Abrt data available :

Apr  3 11:55:34 cn0042 abrt-hook-ccpp: Saved core dump of pid 1237
(/usr/bin/Xorg) to /var/tmp/abrt/ccpp-2014-04-03-11:55:34-1237 (198725632
bytes)
Apr  3 11:55:34 cn0042 abrt-server: Generating core_backtrace
Apr  3 11:55:34 cn0042 abrt-server: Generating backtrace


dmesg output :

[  504.935039] nouveau E[Xorg[1237]] failed to idle channel 0xcccc0000
[Xorg[1237]]
[  519.921691] nouveau E[Xorg[1237]] failed to idle channel 0xcccc0000
[Xorg[1237]]
[  522.538824] nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
[  522.538828] nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000220
[  522.538832] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  522.538836] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000006 0x00000001
[  522.538838] nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
[  522.538842] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00008c00 0x00000000 0x00000000
[  522.538847] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  522.538849] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - done 0x00000300
[  522.538853] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  522.538857] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  522.538858] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16


(not sure if this should be filed against component Driver/nouveau)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396520331.af4b2.30518
Date: Thu, 3 Apr 2014 10:18:51 +0000
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
   title="NEW --- - [NVE6] Xorg crashes when switching back from VT to X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76990">76990</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE6] Xorg crashes when switching back from VT to X
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
          <td>d-bugzilla&#64;moens.cc
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
        <pre>Testing with GK106GLM [Quadro K2100M], QHD+ (3200x1800) screen.

Environment : Fedora 20 with kernel 3.14 and darktama's git 
633e16bb8571071b9da8ed03513a2266cbf21eb5.

When switching to a VT, and afterwards switching back to the X session, X
crashes.


Abrt data available :

Apr  3 11:55:34 cn0042 abrt-hook-ccpp: Saved core dump of pid 1237
(/usr/bin/Xorg) to /var/tmp/abrt/ccpp-2014-04-03-11:55:34-1237 (198725632
bytes)
Apr  3 11:55:34 cn0042 abrt-server: Generating core_backtrace
Apr  3 11:55:34 cn0042 abrt-server: Generating backtrace


dmesg output :

[  504.935039] nouveau E[Xorg[1237]] failed to idle channel 0xcccc0000
[Xorg[1237]]
[  519.921691] nouveau E[Xorg[1237]] failed to idle channel 0xcccc0000
[Xorg[1237]]
[  522.538824] nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out
[  522.538828] nouveau E[  PGRAPH][0000:01:00.0] 409000 - done 0x00000220
[  522.538832] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  522.538836] nouveau E[  PGRAPH][0000:01:00.0] 409000 - stat 0x00000000
0x00000000 0x00000006 0x00000001
[  522.538838] nouveau E[  PGRAPH][0000:01:00.0] 502000 - done 0x00000300
[  522.538842] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00008c00 0x00000000 0x00000000
[  522.538847] nouveau E[  PGRAPH][0000:01:00.0] 502000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  522.538849] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - done 0x00000300
[  522.538853] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  522.538857] nouveau E[  PGRAPH][0000:01:00.0] 50a000 - stat 0x00000000
0x00000000 0x00000000 0x00000000
[  522.538858] nouveau E[  PGRAPH][0000:01:00.0] init failed, -16


(not sure if this should be filed against component Driver/nouveau)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396520331.af4b2.30518--

--===============0436490590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0436490590==--
