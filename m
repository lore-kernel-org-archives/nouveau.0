From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63051] New: Displist with multiple OpenGL contexts
	crashes.
Date: Wed, 03 Apr 2013 01:50:53 +0000
Message-ID: <bug-63051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0506374172=="
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


--===============0506374172==
Content-Type: multipart/alternative; boundary="1364953853.58E8D0.11863"; charset="us-ascii"


--1364953853.58E8D0.11863
Date: Wed, 3 Apr 2013 01:50:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63051

          Priority: medium
            Bug ID: 63051
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Displist with multiple OpenGL contexts crashes.
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ideasman42-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 9.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 77349
  --> https://bugs.freedesktop.org/attachment.cgi?id=77349&action=edit
open this file in blender2.66a, Press '1' key, to crash.

This is a bug we had reported in blender (3d modeling application).
But which I tracked down to being a crash in:
/usr/lib/xorg/modules/dri/nouveau_dri.so

The crash is caused by calling glCallList() when there are multiple windows
sharing the same opengl context.

(single window doesn't crash for example and removing use of display-lists in
the code also works).

I did some more tests and using Mesa-SoftwareGL doesn't crash, using NVidia
closed-source drivers.

Attached blend file to reproduce the crash, just run...

./blender displist_crash.blend

... then press ONE-Key, over either of the windows to see crash.
If you close a window before pressing ONE, it works without crashing.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1364953853.58E8D0.11863
Date: Wed, 3 Apr 2013 01:50:53 +0000
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
   title="NEW --- - Displist with multiple OpenGL contexts crashes."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63051">63051</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Displist with multiple OpenGL contexts crashes.
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
          <td>ideasman42&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=77349" name="attach_77349" title="open this file in blender2.66a, Press '1' key, to crash.">attachment 77349</a> <a href="attachment.cgi?id=77349&amp;action=edit" title="open this file in blender2.66a, Press '1' key, to crash.">[details]</a></span>
open this file in blender2.66a, Press '1' key, to crash.

This is a bug we had reported in blender (3d modeling application).
But which I tracked down to being a crash in:
/usr/lib/xorg/modules/dri/nouveau_dri.so

The crash is caused by calling glCallList() when there are multiple windows
sharing the same opengl context.

(single window doesn't crash for example and removing use of display-lists in
the code also works).

I did some more tests and using Mesa-SoftwareGL doesn't crash, using NVidia
closed-source drivers.

Attached blend file to reproduce the crash, just run...

./blender displist_crash.blend

... then press ONE-Key, over either of the windows to see crash.
If you close a window before pressing ONE, it works without crashing.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1364953853.58E8D0.11863--

--===============0506374172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0506374172==--
