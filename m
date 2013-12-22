From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72979] New: garbage / parts of previous session
 displayed on login screen after reboot
Date: Sun, 22 Dec 2013 21:47:45 +0000
Message-ID: <bug-72979-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1833208136=="
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


--===============1833208136==
Content-Type: multipart/alternative; boundary="1387748867.3f8b1A571.29316"; charset="us-ascii"


--1387748867.3f8b1A571.29316
Date: Sun, 22 Dec 2013 21:47:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72979

          Priority: medium
            Bug ID: 72979
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: garbage / parts of previous session displayed on login
                    screen after reboot
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: All
          Reporter: vincent-fdt-buymaDBGzMOsTnJN9+BGXg@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

After rebooting a machine using the lightdm display manager, garbage / parts of
the user's previous session are displayed on the login screen, which is an
important security problem, as anyone with physical access to the keyboard and
screen of the machine can reboot it (no need to have an account for that). See
Debian bugs:
  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=700235
  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=732854

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387748867.3f8b1A571.29316
Date: Sun, 22 Dec 2013 21:47:47 +0000
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
   title="NEW --- - garbage / parts of previous session displayed on login screen after reboot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72979">72979</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>garbage / parts of previous session displayed on login screen after reboot
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>vincent-fdt&#64;vinc17.net
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
        <pre>After rebooting a machine using the lightdm display manager, garbage / parts of
the user's previous session are displayed on the login screen, which is an
important security problem, as anyone with physical access to the keyboard and
screen of the machine can reboot it (no need to have an account for that). See
Debian bugs:
  <a href="http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=700235">http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=700235</a>
  <a href="http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=732854">http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=732854</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387748867.3f8b1A571.29316--

--===============1833208136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1833208136==--
