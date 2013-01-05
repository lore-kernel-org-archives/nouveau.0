From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] New: nouveau E[     DRM] fail ttm_validate
Date: Sat, 05 Jan 2013 21:43:22 +0000
Message-ID: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1812175842=="
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


--===============1812175842==
Content-Type: multipart/alternative; boundary="1357422202.EBcD1.12958"; charset="us-ascii"


--1357422202.EBcD1.12958
Date: Sat, 5 Jan 2013 21:43:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59069

          Priority: medium
            Bug ID: 59069
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau E[     DRM] fail ttm_validate
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: kees.bakker-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 72569
  --> https://bugs.freedesktop.org/attachment.cgi?id=72569&action=edit
/var/log/kern.log

After upgrading from Ubuntu precise to quantal there are lots of messages like
these
(attachment has /var/log/kern.log of the time when that happened)

Jan  4 12:18:12 koli kernel: [ 3705.970720] nouveau E[     DRM] fail
ttm_validate
Jan  4 12:18:12 koli kernel: [ 3705.970726] nouveau E[     DRM] validate
vram_list
Jan  4 12:18:12 koli kernel: [ 3705.970760] nouveau E[     DRM] validate: -12

and there is graphics corruption. After a while it gets really bad so that I
have to stop X. After restarting
X the graphics adapter is still unusable, graphics remain distorted.

By that time the following messages can be seen in /var/log/kern.log

Jan  4 15:08:23 koli kernel: [13917.531124] nouveau  [  PGRAPH][0000:01:00.0] 
ERROR nsource: LIMIT_COLOR nstatus: PROTECTION_FAULT
Jan  4 15:08:23 koli kernel: [13917.531137] nouveau E[  PGRAPH][0000:01:00.0]
ch 3 [0x0013c000] subc 7 class 0x4097 mthd 0x0204 data 0x00180000
Jan  4 15:08:26 koli kernel: [13920.488008] nouveau E[     DRM] reloc wait_idle
failed: -16
Jan  4 15:08:26 koli kernel: [13920.488013] nouveau E[     DRM] reloc apply:
-16
Jan  4 15:08:26 koli kernel: [13920.492005] [sched_delayed] sched: RT
throttling activated
Jan  4 15:08:29 koli kernel: [13923.600790] nouveau E[     DRM] fail
ttm_validate
Jan  4 15:08:29 koli kernel: [13923.600796] nouveau E[     DRM] validate
vram_list
Jan  4 15:08:29 koli kernel: [13923.600803] nouveau E[     DRM] validate: -16
Jan  4 15:08:35 koli kernel: [13929.600009] nouveau E[     DRM] reloc wait_idle
failed: -16
Jan  4 15:08:35 koli kernel: [13929.600014] nouveau E[     DRM] reloc apply:
-16
Jan  4 15:09:42 koli kernel: [13993.332007] nouveau E[    1701] failed to idle
channel 0xcccc0001
Jan  4 15:09:42 koli kernel: [13996.332006] nouveau E[    1701] failed to idle
channel 0xcccc0000
Jan  4 15:09:59 koli kernel: [14010.792008] nouveau E[  PGRAPH][0000:01:00.0]
idle timed out with status 0x0be80001
Jan  4 15:10:01 koli kernel: [14013.614181] nouveau E[  PGRAPH][0000:01:00.0]
idle timed out with status 0x0be80001
Jan  4 15:10:03 koli kernel: [14016.824509] [TTM] Failed to expire sync object
before buffer eviction

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357422202.EBcD1.12958
Date: Sat, 5 Jan 2013 21:43:22 +0000
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
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">59069</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau E[     DRM] fail ttm_validate
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
          <td>kees.bakker&#64;xs4all.nl
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
        <pre>Created <span class=""><a href="attachment.cgi?id=72569" name="attach_72569" title="/var/log/kern.log">attachment 72569</a> <a href="attachment.cgi?id=72569&amp;action=edit" title="/var/log/kern.log">[details]</a></span>
/var/log/kern.log

After upgrading from Ubuntu precise to quantal there are lots of messages like
these
(attachment has /var/log/kern.log of the time when that happened)

Jan  4 12:18:12 koli kernel: [ 3705.970720] nouveau E[     DRM] fail
ttm_validate
Jan  4 12:18:12 koli kernel: [ 3705.970726] nouveau E[     DRM] validate
vram_list
Jan  4 12:18:12 koli kernel: [ 3705.970760] nouveau E[     DRM] validate: -12

and there is graphics corruption. After a while it gets really bad so that I
have to stop X. After restarting
X the graphics adapter is still unusable, graphics remain distorted.

By that time the following messages can be seen in /var/log/kern.log

Jan  4 15:08:23 koli kernel: [13917.531124] nouveau  [  PGRAPH][0000:01:00.0] 
ERROR nsource: LIMIT_COLOR nstatus: PROTECTION_FAULT
Jan  4 15:08:23 koli kernel: [13917.531137] nouveau E[  PGRAPH][0000:01:00.0]
ch 3 [0x0013c000] subc 7 class 0x4097 mthd 0x0204 data 0x00180000
Jan  4 15:08:26 koli kernel: [13920.488008] nouveau E[     DRM] reloc wait_idle
failed: -16
Jan  4 15:08:26 koli kernel: [13920.488013] nouveau E[     DRM] reloc apply:
-16
Jan  4 15:08:26 koli kernel: [13920.492005] [sched_delayed] sched: RT
throttling activated
Jan  4 15:08:29 koli kernel: [13923.600790] nouveau E[     DRM] fail
ttm_validate
Jan  4 15:08:29 koli kernel: [13923.600796] nouveau E[     DRM] validate
vram_list
Jan  4 15:08:29 koli kernel: [13923.600803] nouveau E[     DRM] validate: -16
Jan  4 15:08:35 koli kernel: [13929.600009] nouveau E[     DRM] reloc wait_idle
failed: -16
Jan  4 15:08:35 koli kernel: [13929.600014] nouveau E[     DRM] reloc apply:
-16
Jan  4 15:09:42 koli kernel: [13993.332007] nouveau E[    1701] failed to idle
channel 0xcccc0001
Jan  4 15:09:42 koli kernel: [13996.332006] nouveau E[    1701] failed to idle
channel 0xcccc0000
Jan  4 15:09:59 koli kernel: [14010.792008] nouveau E[  PGRAPH][0000:01:00.0]
idle timed out with status 0x0be80001
Jan  4 15:10:01 koli kernel: [14013.614181] nouveau E[  PGRAPH][0000:01:00.0]
idle timed out with status 0x0be80001
Jan  4 15:10:03 koli kernel: [14016.824509] [TTM] Failed to expire sync object
before buffer eviction</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357422202.EBcD1.12958--

--===============1812175842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1812175842==--
