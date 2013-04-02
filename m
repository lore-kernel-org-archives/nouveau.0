From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63048] New: Dual display problem: Using xrandr to
 setup dual displays causes X to hang
Date: Tue, 02 Apr 2013 23:04:12 +0000
Message-ID: <bug-63048-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1969205098=="
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


--===============1969205098==
Content-Type: multipart/alternative; boundary="1364943852.D4f61.2881"; charset="us-ascii"


--1364943852.D4f61.2881
Date: Tue, 2 Apr 2013 23:04:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63048

          Priority: medium
            Bug ID: 63048
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Dual display problem: Using xrandr to setup dual
                    displays causes X to hang
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: guy-IGUgQLVVQiRCV4ILt04nZQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I use an xrandr to set up a dual display configuration.

A recent upgrade of the kernel supplied by the Debian "testing" distribution
caused the script to cease to function and additionally cause my system's GUI
to lock up.

The debian package maintainer for the nouveau driver suggested it may be a
problem with backported kernel components and advised me to try a 3.8 kernel
from the "experimental" Debian repository, which I did.

The 3.8 kernel didn't fix the problem: I still can't get the second display to
work, but the xrandr script no longer caused the GUI to lock.

More details can be found here:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=703291

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1364943852.D4f61.2881
Date: Tue, 2 Apr 2013 23:04:12 +0000
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
   title="NEW --- - Dual display problem: Using xrandr to setup dual displays causes X to hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63048">63048</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Dual display problem: Using xrandr to setup dual displays causes X to hang
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
          <td>guy&#64;member.fsf.org
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
        <pre>I use an xrandr to set up a dual display configuration.

A recent upgrade of the kernel supplied by the Debian &quot;testing&quot; distribution
caused the script to cease to function and additionally cause my system's GUI
to lock up.

The debian package maintainer for the nouveau driver suggested it may be a
problem with backported kernel components and advised me to try a 3.8 kernel
from the &quot;experimental&quot; Debian repository, which I did.

The 3.8 kernel didn't fix the problem: I still can't get the second display to
work, but the xrandr script no longer caused the GUI to lock.

More details can be found here:
<a href="http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=703291">http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=703291</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1364943852.D4f61.2881--

--===============1969205098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1969205098==--
