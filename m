From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81136] New: [NV92] Regression in Linux 3.15: GPU
 lockup after suspend
Date: Thu, 10 Jul 2014 00:35:07 +0000
Message-ID: <bug-81136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0667313106=="
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


--===============0667313106==
Content-Type: multipart/alternative; boundary="1404952507.46CCB1.19657"; charset="us-ascii"


--1404952507.46CCB1.19657
Date: Thu, 10 Jul 2014 00:35:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81136

          Priority: medium
            Bug ID: 81136
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV92] Regression in Linux 3.15: GPU lockup after
                    suspend
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: agustin-G80yVrlpk+aH0oMTQjrRWA@public.gmane.org
          Hardware: All
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 102508
  --> https://bugs.freedesktop.org/attachment.cgi?id=102508&action=edit
Logs for git kernel

After a suspend I get messages such as these: 

<3>[   39.550435] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush idle
timeout fail
<3>[   39.550435] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  : 0x01000001
BUSY ROP
<3>[   39.550435] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0: 0x00000000
<3>[   39.550435] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1: 0x00000000
<3>[   39.550435] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2: 0x00200000
ROP
<3>[   41.685486] nouveau E[     DRM] GPU lockup - switching to software fbcon

And if I was running X it crashes and the screen ends up looking like this:
http://imgur.com/a/D3VKw

This is always reproducible but only since Linux 3.15, so I ran a git bisect.
The first bad commit is [ecf24de071f4f6cea79ecef5d990794df5875ee1] drm/nouveau:
fix fbcon not being accelerated after suspend. After reverting the commmit the
machine resumes properly.

The issue persists in drm-nouveau-next (last commit 0b4e8e7... from Jul 8),
even if I boot with noaccel=1 nofbaccel=1.

Relevant IRC logs:
http://people.freedesktop.org/~cbrill/dri-log/index.php?channel=nouveau&highlight_names=Nitsuga&date=2014-07-09

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404952507.46CCB1.19657
Date: Thu, 10 Jul 2014 00:35:07 +0000
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
   title="NEW --- - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81136">81136</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV92] Regression in Linux 3.15: GPU lockup after suspend
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
          <td>agustin&#64;dallalba.com.ar
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>All
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
        <pre>Created <span class=""><a href="attachment.cgi?id=102508" name="attach_102508" title="Logs for git kernel">attachment 102508</a> <a href="attachment.cgi?id=102508&amp;action=edit" title="Logs for git kernel">[details]</a></span>
Logs for git kernel

After a suspend I get messages such as these: 

&lt;3&gt;[   39.550435] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush idle
timeout fail
&lt;3&gt;[   39.550435] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  : 0x01000001
BUSY ROP
&lt;3&gt;[   39.550435] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0: 0x00000000
&lt;3&gt;[   39.550435] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1: 0x00000000
&lt;3&gt;[   39.550435] nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2: 0x00200000
ROP
&lt;3&gt;[   41.685486] nouveau E[     DRM] GPU lockup - switching to software fbcon

And if I was running X it crashes and the screen ends up looking like this:
<a href="http://imgur.com/a/D3VKw">http://imgur.com/a/D3VKw</a>

This is always reproducible but only since Linux 3.15, so I ran a git bisect.
The first bad commit is [ecf24de071f4f6cea79ecef5d990794df5875ee1] drm/nouveau:
fix fbcon not being accelerated after suspend. After reverting the commmit the
machine resumes properly.

The issue persists in drm-nouveau-next (last commit 0b4e8e7... from Jul 8),
even if I boot with noaccel=1 nofbaccel=1.

Relevant IRC logs:
<a href="http://people.freedesktop.org/~cbrill/dri-log/index.php?channel=nouveau&amp;highlight_names=Nitsuga&amp;date=2014-07-09">http://people.freedesktop.org/~cbrill/dri-log/index.php?channel=nouveau&amp;highlight_names=Nitsuga&amp;date=2014-07-09</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404952507.46CCB1.19657--

--===============0667313106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0667313106==--
