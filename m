From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68854] New: [NV04] PROTECTION_ERROR /
	PROTECTION_FAULT
Date: Mon, 02 Sep 2013 16:36:32 +0000
Message-ID: <bug-68854-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0662340191=="
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


--===============0662340191==
Content-Type: multipart/alternative; boundary="1378139792.454e1.25020"; charset="us-ascii"


--1378139792.454e1.25020
Date: Mon, 2 Sep 2013 16:36:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68854

          Priority: medium
            Bug ID: 68854
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV04] PROTECTION_ERROR / PROTECTION_FAULT
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
        Depends on: 68835
           Product: xorg

+++ This bug was initially created as a clone of Bug #68835 +++

Running Fedora 19 with a live USB on an old system with Creative Labs Graphics
Blaster Riva TNT:

Linux localhost 3.9.5-301.fc19.i686 #1 SMP Tue Jun 11 20:01:50 UTC 2013 i686
i686 i386 GNU/Linux

If I run dmesg I see some errors like:

[   99.820645] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820677] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 2 class
0x0042 mthd 0x0180 data 0x00003a04
[   99.820697] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820714] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0044 mthd 0x0180 data 0x00003a04
[   99.820732] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820749] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0043 mthd 0x0180 data 0x00003a04
[   99.821101] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.821121] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0019 mthd 0x0180 data 0x00003a04

or:

[ 1226.534609] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534644] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 2 class
0x0042 mthd 0x0180 data 0x00003a04
[ 1226.534664] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534680] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0044 mthd 0x0180 data 0x00003a04
[ 1226.534699] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534716] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0043 mthd 0x0180 data 0x00003a04
[ 1226.535080] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.535099] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0019 mthd 0x0180 data 0x00003a04

The first lines appear at boot. The second ones after a wakeup from S3.
However, other wakeup events (from S3 or S4) didn't show the same error. Please
see my dmesg.txt attached to bug #68835 for the full output.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378139792.454e1.25020
Date: Mon, 2 Sep 2013 16:36:32 +0000
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
   title="NEW --- - [NV04] PROTECTION_ERROR / PROTECTION_FAULT"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68854">68854</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV04] PROTECTION_ERROR / PROTECTION_FAULT
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
          <td>mauromol&#64;tiscali.it
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
          <th>Depends on</th>
          <td>68835
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>+++ This bug was initially created as a clone of <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] Unknown opcode 0x43"
   href="show_bug.cgi?id=68835">Bug #68835</a> +++

Running Fedora 19 with a live USB on an old system with Creative Labs Graphics
Blaster Riva TNT:

Linux localhost 3.9.5-301.fc19.i686 #1 SMP Tue Jun 11 20:01:50 UTC 2013 i686
i686 i386 GNU/Linux

If I run dmesg I see some errors like:

[   99.820645] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820677] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 2 class
0x0042 mthd 0x0180 data 0x00003a04
[   99.820697] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820714] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0044 mthd 0x0180 data 0x00003a04
[   99.820732] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.820749] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0043 mthd 0x0180 data 0x00003a04
[   99.821101] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[   99.821121] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[666]] subc 6 class
0x0019 mthd 0x0180 data 0x00003a04

or:

[ 1226.534609] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534644] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 2 class
0x0042 mthd 0x0180 data 0x00003a04
[ 1226.534664] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534680] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0044 mthd 0x0180 data 0x00003a04
[ 1226.534699] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.534716] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0043 mthd 0x0180 data 0x00003a04
[ 1226.535080] nouveau E[  PGRAPH][0000:01:00.0]  NOTIFY nsource:
PROTECTION_ERROR nstatus: PROTECTION_FAULT
[ 1226.535099] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [X[2044]] subc 6 class
0x0019 mthd 0x0180 data 0x00003a04

The first lines appear at boot. The second ones after a wakeup from S3.
However, other wakeup events (from S3 or S4) didn't show the same error. Please
see my dmesg.txt attached to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] Unknown opcode 0x43"
   href="show_bug.cgi?id=68835">bug #68835</a> for the full output.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378139792.454e1.25020--

--===============0662340191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0662340191==--
