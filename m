From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76585] New: [NVE6] kernel oops and Xorg crash when
 resuming after suspend
Date: Tue, 25 Mar 2014 09:35:51 +0000
Message-ID: <bug-76585-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1168423879=="
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


--===============1168423879==
Content-Type: multipart/alternative; boundary="1395740151.75f74ab2.5991"; charset="us-ascii"


--1395740151.75f74ab2.5991
Date: Tue, 25 Mar 2014 09:35:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76585

          Priority: medium
            Bug ID: 76585
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE6] kernel oops and Xorg crash when resuming after
                    suspend
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: All
          Reporter: d-bugzilla-vUpi/VKO0VA@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 96350
  --> https://bugs.freedesktop.org/attachment.cgi?id=96350&action=edit
/var/log/{messages,Xorg.0.log} excerpt

Running the setup (GK106GLM [Quadro K2100M] + QHD+) as described in
https://bugs.freedesktop.org/show_bug.cgi?id=76319#c8 :

- kernel 3.14rc7
- darktama's git e7cdcda87d2c2158ef34d88c9632bf7541c07c3a
- additional DP1.2 540MHz patch (bug 76319#c1).

When resuming from suspend, the kernel oopses and Xorg crashes ;
A full restart is required.

Oops call trace and Xorg.0.log backtrace with timestamps in attachment.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395740151.75f74ab2.5991
Date: Tue, 25 Mar 2014 09:35:51 +0000
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
   title="NEW --- - [NVE6] kernel oops and Xorg crash when resuming after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76585">76585</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE6] kernel oops and Xorg crash when resuming after suspend
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
        <pre>Created <span class=""><a href="attachment.cgi?id=96350" name="attach_96350" title="/var/log/{messages,Xorg.0.log} excerpt">attachment 96350</a> <a href="attachment.cgi?id=96350&amp;action=edit" title="/var/log/{messages,Xorg.0.log} excerpt">[details]</a></span>
/var/log/{messages,Xorg.0.log} excerpt

Running the setup (GK106GLM [Quadro K2100M] + QHD+) as described in
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href="show_bug.cgi?id=76319#c8">https://bugs.freedesktop.org/show_bug.cgi?id=76319#c8</a> :

- kernel 3.14rc7
- darktama's git e7cdcda87d2c2158ef34d88c9632bf7541c07c3a
- additional DP1.2 540MHz patch (<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href="show_bug.cgi?id=76319">bug 76319</a>#c1).

When resuming from suspend, the kernel oopses and Xorg crashes ;
A full restart is required.

Oops call trace and Xorg.0.log backtrace with timestamps in attachment.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395740151.75f74ab2.5991--

--===============1168423879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1168423879==--
