From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94637] New: system crash, no messages, GT215,
 ubuntu 16.04 when running glmark2 for a few minutes.
Date: Sun, 20 Mar 2016 13:49:14 +0000
Message-ID: <bug-94637-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0432847595=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0432847595==
Content-Type: multipart/alternative; boundary="14584817540.F9e4c.16775";
 charset="UTF-8"


--14584817540.F9e4c.16775
Date: Sun, 20 Mar 2016 13:49:14 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94637

            Bug ID: 94637
           Summary: system crash, no messages, GT215, ubuntu 16.04 when
                    running glmark2 for a few minutes.
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: peter-UmW4lSGjmaZq3vnQzO7mXA@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 122444
  --> https://bugs.freedesktop.org/attachment.cgi?id=122444&action=edit
general info about the system... going through the FAQ

running fully patched ubuntu xenial, only nouveau drivers.  If I start
minecraft, and run for a few minutes, the system locks up for about 3 minutes,
then spontaneously reboots.  There are no messages I can see in any log, only
bootup messages after the event.

Using distribution packages, no xorg.conf, no trace of proprietary drivers I
can see.

The same hardware was stable using proprietary drivers on ubuntu 14.04.
just upgraded to 16.04 and switched to nouveau.

I can browse the web all day. Works fine as long as the GL isn't exercised. 
Nothing to do with minecraft as, it takes a little longer, say 10 to 15
minutes, but I can reproduce the problem exactly by just running glmark2
package from the repository.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14584817540.F9e4c.16775
Date: Sun, 20 Mar 2016 13:49:14 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94637">94637</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes.
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>peter&#64;bsqt.homeip.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=122444" name="attach_122444" title="general info about the system... going through the FAQ">attachment 122444</a> <a href="attachment.cgi?id=122444&amp;action=edit" title="general info about the system... going through the FAQ">[details]</a></span>
general info about the system... going through the FAQ

running fully patched ubuntu xenial, only nouveau drivers.  If I start
minecraft, and run for a few minutes, the system locks up for about 3 minutes,
then spontaneously reboots.  There are no messages I can see in any log, only
bootup messages after the event.

Using distribution packages, no xorg.conf, no trace of proprietary drivers I
can see.

The same hardware was stable using proprietary drivers on ubuntu 14.04.
just upgraded to 16.04 and switched to nouveau.

I can browse the web all day. Works fine as long as the GL isn't exercised. 
Nothing to do with minecraft as, it takes a little longer, say 10 to 15
minutes, but I can reproduce the problem exactly by just running glmark2
package from the repository.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14584817540.F9e4c.16775--

--===============0432847595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0432847595==--
