From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77361] New: nouveau not working on 3.13 linux kernel
Date: Sat, 12 Apr 2014 10:22:45 +0000
Message-ID: <bug-77361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0058952927=="
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


--===============0058952927==
Content-Type: multipart/alternative; boundary="1397298165.2E7B1.27699"; charset="us-ascii"


--1397298165.2E7B1.27699
Date: Sat, 12 Apr 2014 10:22:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77361

          Priority: medium
            Bug ID: 77361
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau not working on 3.13 linux kernel
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: sam.halliday-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 97252
  --> https://bugs.freedesktop.org/attachment.cgi?id=97252&action=edit
config

I tried raising this on the debian forum, but nobody had any ideas:
http://forums.debian.net/viewtopic.php?f=6&t=112741

nouveau was working for me (but was fairly unstable) on a 3.12 Linux kernel
(Debian Jessie). However, when I upgraded to 3.13 X11 failed to start.

My config file and the error log are attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397298165.2E7B1.27699
Date: Sat, 12 Apr 2014 10:22:45 +0000
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
   title="NEW --- - nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361">77361</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau not working on 3.13 linux kernel
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
          <td>sam.halliday&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=97252" name="attach_97252" title="config">attachment 97252</a> <a href="attachment.cgi?id=97252&amp;action=edit" title="config">[details]</a></span>
config

I tried raising this on the debian forum, but nobody had any ideas:
<a href="http://forums.debian.net/viewtopic.php?f=6&amp;t=112741">http://forums.debian.net/viewtopic.php?f=6&amp;t=112741</a>

nouveau was working for me (but was fairly unstable) on a 3.12 Linux kernel
(Debian Jessie). However, when I upgraded to 3.13 X11 failed to start.

My config file and the error log are attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397298165.2E7B1.27699--

--===============0058952927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0058952927==--
