From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75776] New: Hearthstone displays corrupted buffers
	on NVA5
Date: Tue, 04 Mar 2014 22:18:49 +0000
Message-ID: <bug-75776-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0981345381=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0981345381==
Content-Type: multipart/alternative; boundary="1393971529.Ea6cca40.12610"; charset="us-ascii"


--1393971529.Ea6cca40.12610
Date: Tue, 4 Mar 2014 22:18:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75776

          Priority: medium
            Bug ID: 75776
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Hearthstone displays corrupted buffers on NVA5
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: lubosz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: 10.0
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 95122
  --> https://bugs.freedesktop.org/attachment.cgi?id=95122&action=edit
Screenshot

Since a patch, Blizzard's Free-To-Play game Hearthstone produces corrupted
output on my NVA5. It works on my NVC8.

The bug occurs as soon as the main menu opens. The bug is reproducable with the
output of apitrace.

Since it worked before and works on NVIDIA and other nouveau drivers, so I
suppose it is not a WINE bug.

I created a apitrace (Version 5 from git). The trace plays fine on NVIDIA and
NVC8. Other games, also other WINE games do not produce similar bugs.

Using linux 3.13.5, mesa 10.0.3

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393971529.Ea6cca40.12610
Date: Tue, 4 Mar 2014 22:18:49 +0000
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
   title="NEW --- - Hearthstone displays corrupted buffers on NVA5"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75776">75776</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Hearthstone displays corrupted buffers on NVA5
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
          <td>lubosz&#64;gmail.com
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
          <td>10.0
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
        <pre>Created <span class=""><a href="attachment.cgi?id=95122" name="attach_95122" title="Screenshot">attachment 95122</a> <a href="attachment.cgi?id=95122&amp;action=edit" title="Screenshot">[details]</a></span>
Screenshot

Since a patch, Blizzard's Free-To-Play game Hearthstone produces corrupted
output on my NVA5. It works on my NVC8.

The bug occurs as soon as the main menu opens. The bug is reproducable with the
output of apitrace.

Since it worked before and works on NVIDIA and other nouveau drivers, so I
suppose it is not a WINE bug.

I created a apitrace (Version 5 from git). The trace plays fine on NVIDIA and
NVC8. Other games, also other WINE games do not produce similar bugs.

Using linux 3.13.5, mesa 10.0.3</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393971529.Ea6cca40.12610--

--===============0981345381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0981345381==--
