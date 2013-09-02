From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68835] New: Unknown opcode 0x43 + protection fault
 on a Graphics Blaster Riva TNT card
Date: Mon, 02 Sep 2013 09:20:02 +0000
Message-ID: <bug-68835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0673247382=="
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


--===============0673247382==
Content-Type: multipart/alternative; boundary="1378113602.0cAb1.17840"; charset="us-ascii"


--1378113602.0cAb1.17840
Date: Mon, 2 Sep 2013 09:20:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68835

          Priority: medium
            Bug ID: 68835
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Unknown opcode 0x43 + protection fault on a Graphics
                    Blaster Riva TNT card
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 85048
  --> https://bugs.freedesktop.org/attachment.cgi?id=85048&action=edit
dmesg output: system boot + a couple of S3 suspensions + a S4 hibernation

Opening this as suggested in bug #67161 comment #6.

Running Fedora 19 with a live USB on an old system with Creative Labs Graphics
Blaster Riva TNT:

Linux localhost 3.9.5-301.fc19.i686 #1 SMP Tue Jun 11 20:01:50 UTC 2013 i686
i686 i386 GNU/Linux

If I run dmesg I see some errors like:

[    5.213896] nouveau E[   VBIOS][0000:01:00.0] 0x012e[ ]: unknown opcode 0x43

or:

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

The "unknown opcode" error appears at boot and waking up from S3/S4.
Regarding the protection fault lines, it seems like they appeared on boot and
on one of the wakeups from S3.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378113602.0cAb1.17840
Date: Mon, 2 Sep 2013 09:20:02 +0000
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
   title="NEW --- - Unknown opcode 0x43 + protection fault on a Graphics Blaster Riva TNT card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835">68835</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Unknown opcode 0x43 + protection fault on a Graphics Blaster Riva TNT card
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
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=85048" name="attach_85048" title="dmesg output: system boot + a couple of S3 suspensions + a S4 hibernation">attachment 85048</a> <a href="attachment.cgi?id=85048&amp;action=edit" title="dmesg output: system boot + a couple of S3 suspensions + a S4 hibernation">[details]</a></span>
dmesg output: system boot + a couple of S3 suspensions + a S4 hibernation

Opening this as suggested in <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Blank video after resuming from S3 or S4"
   href="show_bug.cgi?id=67161#c6">bug #67161 comment #6</a>.

Running Fedora 19 with a live USB on an old system with Creative Labs Graphics
Blaster Riva TNT:

Linux localhost 3.9.5-301.fc19.i686 #1 SMP Tue Jun 11 20:01:50 UTC 2013 i686
i686 i386 GNU/Linux

If I run dmesg I see some errors like:

[    5.213896] nouveau E[   VBIOS][0000:01:00.0] 0x012e[ ]: unknown opcode 0x43

or:

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

The &quot;unknown opcode&quot; error appears at boot and waking up from S3/S4.
Regarding the protection fault lines, it seems like they appeared on boot and
on one of the wakeups from S3.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378113602.0cAb1.17840--

--===============0673247382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0673247382==--
