From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60868] New: Xorg update via Fedora 18 yum update on
 Macbook Pro 3, 1  causes video to crash.
Date: Fri, 15 Feb 2013 02:00:30 +0000
Message-ID: <bug-60868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0886926376=="
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


--===============0886926376==
Content-Type: multipart/alternative; boundary="1360893631.602Cb38a1.12536"; charset="us-ascii"


--1360893631.602Cb38a1.12536
Date: Fri, 15 Feb 2013 02:00:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60868

          Priority: medium
            Bug ID: 60868
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Xorg update via Fedora 18 yum update on Macbook Pro
                    3,1  causes video to crash.
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: eff9999-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

X.Org X Server 1.13.0
Release Date: 2012-09-05
X Protocol Version 11, Revision 0
Build Operating System:  2.6.32-279.9.1.el6.x86_64 
Build Date: 30 November 2012  07:30:11PM
Build ID: xorg-x11-server 1.13.0-11.fc18

REFERENCE Fedora post <http://forums.fedoraforum.org/showthread.php?t=288544>

If I perform a fresh install of Fedora 18 on my Macbook Pro 3,1 and perform no
updates, my unit runs and reboots fine. Once I perform updates and install the
latest Xorg updates my unit will only boot to a black screen after rebooting. I
determined it was Xorg after installing the Kernel and Xorg updates seperatly.
I have tried numerous times, and the cause is the Xorg current update (see the
above attached link). My video card is the Nvidia 8600M GT 128MB, but the
driver is nouveau. I tried installed the proprietary Nvidia drivers after
performing the Xorg update and it still displays no video.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360893631.602Cb38a1.12536
Date: Fri, 15 Feb 2013 02:00:31 +0000
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
   title="NEW --- - Xorg update via Fedora 18 yum update on Macbook Pro 3,1 causes video to crash."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60868">60868</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xorg update via Fedora 18 yum update on Macbook Pro 3,1  causes video to crash.
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>eff9999&#64;yahoo.com
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
        <pre>X.Org X Server 1.13.0
Release Date: 2012-09-05
X Protocol Version 11, Revision 0
Build Operating System:  2.6.32-279.9.1.el6.x86_64 
Build Date: 30 November 2012  07:30:11PM
Build ID: xorg-x11-server 1.13.0-11.fc18

REFERENCE Fedora post &lt;<a href="http://forums.fedoraforum.org/showthread.php?t=288544">http://forums.fedoraforum.org/showthread.php?t=288544</a>&gt;

If I perform a fresh install of Fedora 18 on my Macbook Pro 3,1 and perform no
updates, my unit runs and reboots fine. Once I perform updates and install the
latest Xorg updates my unit will only boot to a black screen after rebooting. I
determined it was Xorg after installing the Kernel and Xorg updates seperatly.
I have tried numerous times, and the cause is the Xorg current update (see the
above attached link). My video card is the Nvidia 8600M GT 128MB, but the
driver is nouveau. I tried installed the proprietary Nvidia drivers after
performing the Xorg update and it still displays no video.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360893631.602Cb38a1.12536--

--===============0886926376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0886926376==--
