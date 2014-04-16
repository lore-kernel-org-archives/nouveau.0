From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77529] New: NVS 510 DP-3 output doesn't work
Date: Wed, 16 Apr 2014 14:15:41 +0000
Message-ID: <bug-77529-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0190473289=="
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


--===============0190473289==
Content-Type: multipart/alternative; boundary="1397657741.4DFE81.13717"; charset="us-ascii"


--1397657741.4DFE81.13717
Date: Wed, 16 Apr 2014 14:15:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77529

          Priority: medium
            Bug ID: 77529
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NVS 510 DP-3 output doesn't work
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: tex-JH6wT3sV7C4r+unkJK6bvw@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

DP-3 output doesn't work on NVS 510 (Kepler, NVE7, GK107) card.

As soon as I load nouveau, third output becomes blank. All other outputs,
including the fourth (last one) works fine.

xorg properly detects monitor and its modes on buggy videoout.
xrandr shows monitor as connected and enabled.
I see no errors anywhere.

I've tested only compiled debian kernels 3.10 -- 3.14

Let me know what output should I provide or how could I help to solve this bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397657741.4DFE81.13717
Date: Wed, 16 Apr 2014 14:15:41 +0000
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
   title="NEW --- - NVS 510 DP-3 output doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77529">77529</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NVS 510 DP-3 output doesn't work
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
          <td>tex&#64;sergio.spb.ru
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
        <pre>DP-3 output doesn't work on NVS 510 (Kepler, NVE7, GK107) card.

As soon as I load nouveau, third output becomes blank. All other outputs,
including the fourth (last one) works fine.

xorg properly detects monitor and its modes on buggy videoout.
xrandr shows monitor as connected and enabled.
I see no errors anywhere.

I've tested only compiled debian kernels 3.10 -- 3.14

Let me know what output should I provide or how could I help to solve this bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397657741.4DFE81.13717--

--===============0190473289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0190473289==--
