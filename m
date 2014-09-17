From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83957] New: [NV50 - NVAF][MCP89] Major screen
 corruption and X crash soon after log in
Date: Wed, 17 Sep 2014 00:59:39 +0000
Message-ID: <bug-83957-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1999345758=="
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


--===============1999345758==
Content-Type: multipart/alternative; boundary="1410915579.EE2B1.4620"; charset="us-ascii"


--1410915579.EE2B1.4620
Date: Wed, 17 Sep 2014 00:59:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83957

          Priority: medium
            Bug ID: 83957
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV50 - NVAF][MCP89] Major screen corruption and X
                    crash soon after log in
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: qc.loic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 106398
  --> https://bugs.freedesktop.org/attachment.cgi?id=106398&action=edit
Screen corruption

Boots and login fine, then as I open a terminal, there will be some screen
corruption. As I open more windows (firefox) and loads pages the screen gets
worse and worse up till X crashes (can still move the mouse).

I've built the newest linux kernel with the nouveau git (kernel 3.17 rc2+),
also had the problem with stock ubuntu14.04 and with a 3.16 kernel.

The card is an Apple Nvidia Geforce 320M. It doesn't have dedicated memory, it
uses 256MB from the system ram.


I include the logs, in the syslog, you will see many boots most of them in 3.16
but one in 3.17 at the end. Let me know if I can give you anymore
info/logs/trace.

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410915579.EE2B1.4620
Date: Wed, 17 Sep 2014 00:59:39 +0000
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
   title="NEW --- - [NV50 - NVAF][MCP89] Major screen corruption and X crash soon after log in"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83957">83957</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV50 - NVAF][MCP89] Major screen corruption and X crash soon after log in
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>qc.loic&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=106398" name="attach_106398" title="Screen corruption">attachment 106398</a> <a href="attachment.cgi?id=106398&amp;action=edit" title="Screen corruption">[details]</a></span>
Screen corruption

Boots and login fine, then as I open a terminal, there will be some screen
corruption. As I open more windows (firefox) and loads pages the screen gets
worse and worse up till X crashes (can still move the mouse).

I've built the newest linux kernel with the nouveau git (kernel 3.17 rc2+),
also had the problem with stock ubuntu14.04 and with a 3.16 kernel.

The card is an Apple Nvidia Geforce 320M. It doesn't have dedicated memory, it
uses 256MB from the system ram.


I include the logs, in the syslog, you will see many boots most of them in 3.16
but one in 3.17 at the end. Let me know if I can give you anymore
info/logs/trace.

Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410915579.EE2B1.4620--

--===============1999345758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1999345758==--
