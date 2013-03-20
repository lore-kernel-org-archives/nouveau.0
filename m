From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62571] New: Mesa 9.0 uses missing nouveau library
Date: Wed, 20 Mar 2013 18:53:09 +0000
Message-ID: <bug-62571-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1478097094=="
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


--===============1478097094==
Content-Type: multipart/alternative; boundary="1363805589.cd4dc10.16645"; charset="us-ascii"


--1363805589.cd4dc10.16645
Date: Wed, 20 Mar 2013 18:53:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62571

          Priority: medium
            Bug ID: 62571
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Mesa 9.0 uses missing nouveau library
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jesus.cortezjr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 9.0
         Component: Drivers/DRI/nouveau
           Product: Mesa

We are using Scientific Linux 6.3, and noticed that our 3D applications started
breaking after the auto-update to Mesa 9.0.

After the upgrade, glxinfo (with LIBGL_DEBUG=verbose) would return:

libGL: OpenDriver: trying /usr/lib/dri/nouveau_dri.so
libGL error: dlopen /usr/lib/dri/nouveau_dri.so failed
(/usr/lib/dri/nouveau_dri.so: cannot open shared object file: No such file or
directory)
libGL error: unable to load driver: nouveau_dri.so
libGL error: driver pointer missing
libGL error: failed to load driver: nouveau
libGL: OpenDriver: trying /usr/lib/dri/swrast_dri.so
GLVersion major: 1 minor: 4 

This error was also being returned in our application, resulting in crashes
that did not occur the previous day.

We were able to fix the issue by running the following commands:

rpm -e --nodeps mesa-dri1-drivers
yum -y downgrade mesa-libGL-devel mesa-libGL mesa-dri-drivers

to downgrade Mesa back to 7.11.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1363805589.cd4dc10.16645
Date: Wed, 20 Mar 2013 18:53:09 +0000
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
   title="NEW --- - Mesa 9.0 uses missing nouveau library"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62571">62571</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Mesa 9.0 uses missing nouveau library
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
          <td>jesus.cortezjr&#64;gmail.com
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
          <td>9.0
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
        <pre>We are using Scientific Linux 6.3, and noticed that our 3D applications started
breaking after the auto-update to Mesa 9.0.

After the upgrade, glxinfo (with LIBGL_DEBUG=verbose) would return:

libGL: OpenDriver: trying /usr/lib/dri/nouveau_dri.so
libGL error: dlopen /usr/lib/dri/nouveau_dri.so failed
(/usr/lib/dri/nouveau_dri.so: cannot open shared object file: No such file or
directory)
libGL error: unable to load driver: nouveau_dri.so
libGL error: driver pointer missing
libGL error: failed to load driver: nouveau
libGL: OpenDriver: trying /usr/lib/dri/swrast_dri.so
GLVersion major: 1 minor: 4 

This error was also being returned in our application, resulting in crashes
that did not occur the previous day.

We were able to fix the issue by running the following commands:

rpm -e --nodeps mesa-dri1-drivers
yum -y downgrade mesa-libGL-devel mesa-libGL mesa-dri-drivers

to downgrade Mesa back to 7.11.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1363805589.cd4dc10.16645--

--===============1478097094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1478097094==--
