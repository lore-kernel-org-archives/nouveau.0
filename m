From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63165] New: [GTX660] GPU lockups on 3D applications
Date: Fri, 05 Apr 2013 12:54:03 +0000
Message-ID: <bug-63165-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0526065094=="
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


--===============0526065094==
Content-Type: multipart/alternative; boundary="1365166443.0bba3bC0.13103"; charset="us-ascii"


--1365166443.0bba3bC0.13103
Date: Fri, 5 Apr 2013 12:54:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63165

          Priority: medium
            Bug ID: 63165
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [GTX660] GPU lockups on 3D applications
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: miga-anyandall-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 9.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 77476
  --> https://bugs.freedesktop.org/attachment.cgi?id=77476&action=edit
crashes with compiz and red eclipse

When running anything 3D, the GPU has a very high chance of locking up within
anywhere from 2 minutes to an hour. When running a 3D application while using
Compiz, that time is decreased even further and can happen in just seconds of
launching the other 3D application. It makes using this GPU almost impossible
for anything besides 2D applications.

This is an EVGA GeForce GTX 660, 2 GB model. Attached are two dmesg logs I
saved during/after the GPU had crashed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365166443.0bba3bC0.13103
Date: Fri, 5 Apr 2013 12:54:03 +0000
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
   title="NEW --- - [GTX660] GPU lockups on 3D applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63165">63165</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[GTX660] GPU lockups on 3D applications
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
          <td>miga-anyandall&#64;hotmail.com
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
          <td>9.1
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
        <pre>Created <span class=""><a href="attachment.cgi?id=77476" name="attach_77476" title="crashes with compiz and red eclipse">attachment 77476</a> <a href="attachment.cgi?id=77476&amp;action=edit" title="crashes with compiz and red eclipse">[details]</a></span>
crashes with compiz and red eclipse

When running anything 3D, the GPU has a very high chance of locking up within
anywhere from 2 minutes to an hour. When running a 3D application while using
Compiz, that time is decreased even further and can happen in just seconds of
launching the other 3D application. It makes using this GPU almost impossible
for anything besides 2D applications.

This is an EVGA GeForce GTX 660, 2 GB model. Attached are two dmesg logs I
saved during/after the GPU had crashed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365166443.0bba3bC0.13103--

--===============0526065094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0526065094==--
