From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78439] New: Display corruption when DP connector is
	reattached
Date: Thu, 08 May 2014 13:28:11 +0000
Message-ID: <bug-78439-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0127322648=="
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


--===============0127322648==
Content-Type: multipart/alternative; boundary="1399555692.ccBF1.9302"; charset="us-ascii"


--1399555692.ccBF1.9302
Date: Thu, 8 May 2014 13:28:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78439

          Priority: medium
            Bug ID: 78439
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Display corruption when DP connector is reattached
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: andrius-4ZmsDwijFH7sq35pWSNszA@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 98687
  --> https://bugs.freedesktop.org/attachment.cgi?id=98687&action=edit
dmesg

When I unplug and replug DP connector the screen becomes corrupted (until I
restart X).

I attached dmesg file. At 266s I plug DP connector, so that part of dmesg
corresponds to screen corruption. Then at 386s I restart X, so that part
corresponds to the working state.

I suppose nouveau DDX is doing something wrong because this only happens with
X. E.g. everything is fine if I start Wayland.

I'm running:
Linux kernel:        3.14.1
xf86-video-nouveau:    1.0.10
xorg-server:        1.15.0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399555692.ccBF1.9302
Date: Thu, 8 May 2014 13:28:12 +0000
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
   title="NEW --- - Display corruption when DP connector is reattached"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78439">78439</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Display corruption when DP connector is reattached
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
          <td>andrius&#64;stikonas.eu
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
        <pre>Created <span class=""><a href="attachment.cgi?id=98687" name="attach_98687" title="dmesg">attachment 98687</a> <a href="attachment.cgi?id=98687&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

When I unplug and replug DP connector the screen becomes corrupted (until I
restart X).

I attached dmesg file. At 266s I plug DP connector, so that part of dmesg
corresponds to screen corruption. Then at 386s I restart X, so that part
corresponds to the working state.

I suppose nouveau DDX is doing something wrong because this only happens with
X. E.g. everything is fine if I start Wayland.

I'm running:
Linux kernel:        3.14.1
xf86-video-nouveau:    1.0.10
xorg-server:        1.15.0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399555692.ccBF1.9302--

--===============0127322648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0127322648==--
