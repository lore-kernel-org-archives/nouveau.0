From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80627] New: [NVE6] 'HUB_INIT timed out' 'Watchdog
 detected hard LOCKUP on cpu 7'
Date: Sat, 28 Jun 2014 12:47:57 +0000
Message-ID: <bug-80627-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0006786519=="
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


--===============0006786519==
Content-Type: multipart/alternative; boundary="1403959677.1BF50e71.26805"; charset="us-ascii"


--1403959677.1BF50e71.26805
Date: Sat, 28 Jun 2014 12:47:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80627

          Priority: medium
            Bug ID: 80627
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE6] 'HUB_INIT timed out' 'Watchdog detected hard
                    LOCKUP on cpu 7'
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: zack-hQ3HDwcYbXcdnm+yROfE0A@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 101915
  --> https://bugs.freedesktop.org/attachment.cgi?id=101915&action=edit
linux 3.15.1

On kernels after ~3.14, some time after nouveau fails to initialize
(<60 seconds) ~all of userland becomes mostly unreponsive (cpu time
preemption?) [dmesg1]. The 'unresponsive' behavior starts
at around the same time 56.740245 happens.

I bisected, and found the first commit where this happens is
1f1ac3bf2a804911ad46076b10ce15364237a698. Removing this commit causes
the previous behavior: initialization fails as usual but nothing else
interesting happens.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403959677.1BF50e71.26805
Date: Sat, 28 Jun 2014 12:47:57 +0000
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
   title="NEW --- - [NVE6] 'HUB_INIT timed out' 'Watchdog detected hard LOCKUP on cpu 7'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80627">80627</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE6] 'HUB_INIT timed out' 'Watchdog detected hard LOCKUP on cpu 7'
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
          <td>zack&#64;buhman.org
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
        <pre>Created <span class=""><a href="attachment.cgi?id=101915" name="attach_101915" title="linux 3.15.1">attachment 101915</a> <a href="attachment.cgi?id=101915&amp;action=edit" title="linux 3.15.1">[details]</a></span>
linux 3.15.1

On kernels after ~3.14, some time after nouveau fails to initialize
(&lt;60 seconds) ~all of userland becomes mostly unreponsive (cpu time
preemption?) [dmesg1]. The 'unresponsive' behavior starts
at around the same time 56.740245 happens.

I bisected, and found the first commit where this happens is
1f1ac3bf2a804911ad46076b10ce15364237a698. Removing this commit causes
the previous behavior: initialization fails as usual but nothing else
interesting happens.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403959677.1BF50e71.26805--

--===============0006786519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0006786519==--
