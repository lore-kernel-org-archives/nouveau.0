From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61537] New: Screen flicker when using display with
 incorrect EDID
Date: Wed, 27 Feb 2013 02:05:00 +0000
Message-ID: <bug-61537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0282184498=="
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


--===============0282184498==
Content-Type: multipart/alternative; boundary="1361930700.6657f0ed1.14024"; charset="us-ascii"


--1361930700.6657f0ed1.14024
Date: Wed, 27 Feb 2013 02:05:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61537

          Priority: medium
            Bug ID: 61537
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Screen flicker when using display with incorrect EDID
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: tsalacinski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 75614
  --> https://bugs.freedesktop.org/attachment.cgi?id=75614&action=edit
Nouveau log (dmesg)

While trying to use Nouveau driver with display that sends incorrect EDID (only
FF, Samsung 226BW), screen flickers every ~10 seconds. Attached nouveau driver
log.

Everything works fine and very smooth, I can pass custom modelines to X server
to have 1680x1050 resolution, the only thing left that works very bad is this
flicker. If this matters, my GPU is GeForce 8600 GT.

Windows 7 uses 1024x768 resolution (same as Nouveau) while installing, but
without flicker.

Everytime log is filled up with new message, flicker happens.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361930700.6657f0ed1.14024
Date: Wed, 27 Feb 2013 02:05:00 +0000
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
   title="NEW --- - Screen flicker when using display with incorrect EDID"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61537">61537</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Screen flicker when using display with incorrect EDID
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
          <td>tsalacinski&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=75614" name="attach_75614" title="Nouveau log (dmesg)">attachment 75614</a> <a href="attachment.cgi?id=75614&amp;action=edit" title="Nouveau log (dmesg)">[details]</a></span>
Nouveau log (dmesg)

While trying to use Nouveau driver with display that sends incorrect EDID (only
FF, Samsung 226BW), screen flickers every ~10 seconds. Attached nouveau driver
log.

Everything works fine and very smooth, I can pass custom modelines to X server
to have 1680x1050 resolution, the only thing left that works very bad is this
flicker. If this matters, my GPU is GeForce 8600 GT.

Windows 7 uses 1024x768 resolution (same as Nouveau) while installing, but
without flicker.

Everytime log is filled up with new message, flicker happens.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361930700.6657f0ed1.14024--

--===============0282184498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0282184498==--
