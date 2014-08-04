From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82152] New: any OpenGL application crashes X,
 locks up machine with nouveau and PRIME
Date: Mon, 04 Aug 2014 21:28:04 +0000
Message-ID: <bug-82152-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1874390896=="
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


--===============1874390896==
Content-Type: multipart/alternative; boundary="1407187684.AA8cb0.30021"; charset="us-ascii"


--1407187684.AA8cb0.30021
Date: Mon, 4 Aug 2014 21:28:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82152

          Priority: medium
            Bug ID: 82152
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: any OpenGL application crashes X, locks up machine
                    with nouveau and PRIME
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: celticmadman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 10.2
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 104017
  --> https://bugs.freedesktop.org/attachment.cgi?id=104017&action=edit
Full output of journalctl, including kernel logs, between system boot and
poweroff after crash.

Any OpenGL application, even as minor as glxinfo, either crashes Xorg or locks
up the machine entirely (no network, magic sysrq fails) when started with
DRI_PRIME=1. Has happened across multiple Mesa and kernel versions, most
recently with Mesa 10.2.4 and Linux 3.15.8 on Arch Linux.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407187684.AA8cb0.30021
Date: Mon, 4 Aug 2014 21:28:04 +0000
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
   title="NEW --- - any OpenGL application crashes X, locks up machine with nouveau and PRIME"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82152">82152</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>any OpenGL application crashes X, locks up machine with nouveau and PRIME
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
          <td>celticmadman&#64;gmail.com
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
          <td>10.2
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
        <pre>Created <span class=""><a href="attachment.cgi?id=104017" name="attach_104017" title="Full output of journalctl, including kernel logs, between system boot and poweroff after crash.">attachment 104017</a> <a href="attachment.cgi?id=104017&amp;action=edit" title="Full output of journalctl, including kernel logs, between system boot and poweroff after crash.">[details]</a></span>
Full output of journalctl, including kernel logs, between system boot and
poweroff after crash.

Any OpenGL application, even as minor as glxinfo, either crashes Xorg or locks
up the machine entirely (no network, magic sysrq fails) when started with
DRI_PRIME=1. Has happened across multiple Mesa and kernel versions, most
recently with Mesa 10.2.4 and Linux 3.15.8 on Arch Linux.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407187684.AA8cb0.30021--

--===============1874390896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1874390896==--
