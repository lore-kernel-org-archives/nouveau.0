From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74123] New: [NVE7] windows maximize behind
 xfce4-panel until settings viewed
Date: Mon, 27 Jan 2014 18:48:29 +0000
Message-ID: <bug-74123-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1936875017=="
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


--===============1936875017==
Content-Type: multipart/alternative; boundary="1390848509.2ba01.12072"; charset="us-ascii"


--1390848509.2ba01.12072
Date: Mon, 27 Jan 2014 18:48:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74123

          Priority: medium
            Bug ID: 74123
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE7] windows maximize behind xfce4-panel until
                    settings viewed
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jcollins-u0TlgVUp4POoiH3BShWgcg@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 92873
  --> https://bugs.freedesktop.org/attachment.cgi?id=92873&action=edit
window maximizing behind panel

Running a 3.13 kernel, built from upstream git repository (commit
d8ec26d7f8287f5788a494f56e8814210f0e64be) and the associated nouveau driver
from the kernel source tree.

When any window is maximized before first viewing the xfce4-panel settings, it
maximized behind the xfce4-panel(s).  Once the panel settings have been viewed,
the windows no longer maximize behind the panel.  The settings for each panel
have to be viewed, but only once per session.

Normally, I would consider this an issue with xfce4 (either the panel or window
manager).  However, changing the video driver (from nouveau to intel) prevents
the problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390848509.2ba01.12072
Date: Mon, 27 Jan 2014 18:48:29 +0000
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
   title="NEW --- - [NVE7] windows maximize behind xfce4-panel until settings viewed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74123">74123</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE7] windows maximize behind xfce4-panel until settings viewed
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
          <td>jcollins&#64;asgardsrealm.net
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
        <pre>Created <span class=""><a href="attachment.cgi?id=92873" name="attach_92873" title="window maximizing behind panel">attachment 92873</a> <a href="attachment.cgi?id=92873&amp;action=edit" title="window maximizing behind panel">[details]</a></span>
window maximizing behind panel

Running a 3.13 kernel, built from upstream git repository (commit
d8ec26d7f8287f5788a494f56e8814210f0e64be) and the associated nouveau driver
from the kernel source tree.

When any window is maximized before first viewing the xfce4-panel settings, it
maximized behind the xfce4-panel(s).  Once the panel settings have been viewed,
the windows no longer maximize behind the panel.  The settings for each panel
have to be viewed, but only once per session.

Normally, I would consider this an issue with xfce4 (either the panel or window
manager).  However, changing the video driver (from nouveau to intel) prevents
the problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390848509.2ba01.12072--

--===============1936875017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1936875017==--
