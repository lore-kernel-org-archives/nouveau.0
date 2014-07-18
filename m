From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81485] New: dmesg spam on startup
Date: Fri, 18 Jul 2014 08:11:32 +0000
Message-ID: <bug-81485-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0612214028=="
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


--===============0612214028==
Content-Type: multipart/alternative; boundary="1405671092.f3Ca2.32611"; charset="us-ascii"


--1405671092.f3Ca2.32611
Date: Fri, 18 Jul 2014 08:11:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81485

          Priority: medium
            Bug ID: 81485
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: dmesg spam on startup
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: fry.kun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Sager NP8268-S (Clevo P150SM-A) with dual graphics
lspci -nn
00:02.0 VGA compatible controller [0300]: Intel Corporation 4th Gen Core
Processor Integrated Graphics Controller [8086:0416] (rev 06)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK104M [GeForce
GTX 870M] [10de:1199] (rev a1)

Had to blacklist nouveau module since it was spamming dmesg from startup:


Jul 17 05:52:48 mireille kernel: [   18.417467] nouveau E[  
PFIFO][0000:01:00.0] PBDMA1: ch 0 [DRM] subc 0 mthd 0x0000 data 0x00000000
Jul 17 05:52:48 mireille kernel: [   18.417477] nouveau E[  
PFIFO][0000:01:00.0] PBDMA1: GPPTR
Jul 17 05:52:48 mireille kernel: [   18.417479] nouveau E[  
PFIFO][0000:01:00.0] PBDMA1: ch 0 [DRM] subc 0 mthd 0x0000 data 0x00000000
Jul 17 05:52:48 mireille kernel: [   18.417489] nouveau E[  
PFIFO][0000:01:00.0] PBDMA1: GPPTR


Using Fedora 20 with default Xorg and Intel driver 2.99.911 (from git)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405671092.f3Ca2.32611
Date: Fri, 18 Jul 2014 08:11:32 +0000
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
   title="NEW --- - dmesg spam on startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81485">81485</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>dmesg spam on startup
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
          <td>fry.kun&#64;gmail.com
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
        <pre>Sager NP8268-S (Clevo P150SM-A) with dual graphics
lspci -nn
00:02.0 VGA compatible controller [0300]: Intel Corporation 4th Gen Core
Processor Integrated Graphics Controller [8086:0416] (rev 06)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK104M [GeForce
GTX 870M] [10de:1199] (rev a1)

Had to blacklist nouveau module since it was spamming dmesg from startup:


Jul 17 05:52:48 mireille kernel: [   18.417467] nouveau E[  
PFIFO][0000:01:00.0] PBDMA1: ch 0 [DRM] subc 0 mthd 0x0000 data 0x00000000
Jul 17 05:52:48 mireille kernel: [   18.417477] nouveau E[  
PFIFO][0000:01:00.0] PBDMA1: GPPTR
Jul 17 05:52:48 mireille kernel: [   18.417479] nouveau E[  
PFIFO][0000:01:00.0] PBDMA1: ch 0 [DRM] subc 0 mthd 0x0000 data 0x00000000
Jul 17 05:52:48 mireille kernel: [   18.417489] nouveau E[  
PFIFO][0000:01:00.0] PBDMA1: GPPTR


Using Fedora 20 with default Xorg and Intel driver 2.99.911 (from git)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405671092.f3Ca2.32611--

--===============0612214028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0612214028==--
