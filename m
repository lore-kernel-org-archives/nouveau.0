From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60007] New: BUG: nouveau crashes in various ways in
 32-bits Fedora 18
Date: Tue, 29 Jan 2013 09:47:19 +0000
Message-ID: <bug-60007-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0103840645=="
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


--===============0103840645==
Content-Type: multipart/alternative; boundary="1359452840.4efEbe431.16386"; charset="us-ascii"


--1359452840.4efEbe431.16386
Date: Tue, 29 Jan 2013 09:47:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60007

          Priority: medium
            Bug ID: 60007
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: BUG: nouveau crashes in various ways in 32-bits Fedora
                    18
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: cpanceac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 73815
  --> https://bugs.freedesktop.org/attachment.cgi?id=73815&action=edit
messages

During normal usage, xorg crashes in various ways. In dmesg and Xorg.0.log i
didn't find anything. In /var/log/messages, i did found various messages from
nouveau. I'll attach the file. This happens often: xorg restarts, or just
temprarily loses the "display" function, or artefacts are shown whenever i lock
gnome. 

Roy Spliet says that nv_wo32() has a problem, on 32-bit version.

From #nouveau: 

<RSpliet> nouveau_gpuobj_create:134 says nv_wo32(gpuobj, i, 0x00000000);
<RSpliet> the second parameter is supposed to be 64-bit, but i is 32-bits

Hopefully this will be fixed soon. Most of my family computers have NVIDIA
video cards and all that were migrated to Fedora 18 have these kinds of
problems :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359452840.4efEbe431.16386
Date: Tue, 29 Jan 2013 09:47:20 +0000
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
   title="NEW --- - BUG: nouveau crashes in various ways in 32-bits Fedora 18"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007">60007</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>BUG: nouveau crashes in various ways in 32-bits Fedora 18
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
          <td>cpanceac&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=73815" name="attach_73815" title="messages">attachment 73815</a> <a href="attachment.cgi?id=73815&amp;action=edit" title="messages">[details]</a></span>
messages

During normal usage, xorg crashes in various ways. In dmesg and Xorg.0.log i
didn't find anything. In /var/log/messages, i did found various messages from
nouveau. I'll attach the file. This happens often: xorg restarts, or just
temprarily loses the &quot;display&quot; function, or artefacts are shown whenever i lock
gnome. 

Roy Spliet says that nv_wo32() has a problem, on 32-bit version.

From #nouveau: 

&lt;RSpliet&gt; nouveau_gpuobj_create:134 says nv_wo32(gpuobj, i, 0x00000000);
&lt;RSpliet&gt; the second parameter is supposed to be 64-bit, but i is 32-bits

Hopefully this will be fixed soon. Most of my family computers have NVIDIA
video cards and all that were migrated to Fedora 18 have these kinds of
problems :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359452840.4efEbe431.16386--

--===============0103840645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0103840645==--
