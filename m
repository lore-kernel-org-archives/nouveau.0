From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61489] New: Mesa-demos test subtexrate causes some
 error in dmesg
Date: Tue, 26 Feb 2013 07:49:19 +0000
Message-ID: <bug-61489-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1730453074=="
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


--===============1730453074==
Content-Type: multipart/alternative; boundary="1361864959.aEfD220.1439"; charset="us-ascii"


--1361864959.aEfD220.1439
Date: Tue, 26 Feb 2013 07:49:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61489

          Priority: medium
            Bug ID: 61489
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Mesa-demos test  subtexrate causes some error in dmesg
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Using

mesa: commit 0486d503209cf375ae77456336742774b12eda02 (" glsl: Remove VS output
varyings which are optimized out of the FS")

libdrm: commit 36d18211b196cad4761ac70c4fd08aba323f5b0d (" intel_chipset: Merge
intel-gpu-tools chipsets")

xf86-video-nouveau: commit a80785f79268ed3701fc69cbd9194ad12822c82c ("nouveau:
fix build against old servers (part 2)")

Xserver from 1.12  branch (self-compiled for  Slackware 14.0)

kernel:  uname -a
Linux slax6 3.8.0-small-00091-g2fee6f5 #45 Mon Feb 25 13:31:21 GMT 2013 i686
Intel(R) Celeron(TM) CPU                1000MHz GenuineIntel GNU/Linux

nouveau.git  master

and mesa-demos-8.0.1/src/tests/subtexrate on nv43 my dmesg  flooded with 


nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x00098000 subtexrate[1928]] subc 7
class 0x4097 mthd 0x0208 data 0x090a0348
nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT


Few  days  back this  test  lacked  its  teapots, so I assumed  this  and 
errors  in dmesg related. But  after  kernel  update  I  can see  stationary
big teapot on the left, and spinning small  one  on the  right.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361864959.aEfD220.1439
Date: Tue, 26 Feb 2013 07:49:19 +0000
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
   title="NEW --- - Mesa-demos test subtexrate causes some error in dmesg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61489">61489</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Mesa-demos test  subtexrate causes some error in dmesg
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
          <td>randrik&#64;mail.ru
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
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Using

mesa: commit 0486d503209cf375ae77456336742774b12eda02 (&quot; glsl: Remove VS output
varyings which are optimized out of the FS&quot;)

libdrm: commit 36d18211b196cad4761ac70c4fd08aba323f5b0d (&quot; intel_chipset: Merge
intel-gpu-tools chipsets&quot;)

xf86-video-nouveau: commit a80785f79268ed3701fc69cbd9194ad12822c82c (&quot;nouveau:
fix build against old servers (part 2)&quot;)

Xserver from 1.12  branch (self-compiled for  Slackware 14.0)

kernel:  uname -a
Linux slax6 3.8.0-small-00091-g2fee6f5 #45 Mon Feb 25 13:31:21 GMT 2013 i686
Intel(R) Celeron(TM) CPU                1000MHz GenuineIntel GNU/Linux

nouveau.git  master

and mesa-demos-8.0.1/src/tests/subtexrate on nv43 my dmesg  flooded with 


nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x00098000 subtexrate[1928]] subc 7
class 0x4097 mthd 0x0208 data 0x090a0348
nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR nstatus:
BAD_ARGUMENT


Few  days  back this  test  lacked  its  teapots, so I assumed  this  and 
errors  in dmesg related. But  after  kernel  update  I  can see  stationary
big teapot on the left, and spinning small  one  on the  right.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361864959.aEfD220.1439--

--===============1730453074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1730453074==--
