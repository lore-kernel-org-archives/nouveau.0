From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93934] New: DRI_PRIME=1: DeadIsland crashes when
	loading finish
Date: Sat, 30 Jan 2016 02:33:42 +0000
Message-ID: <bug-93934-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1561763715=="
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


--===============1561763715==
Content-Type: multipart/alternative; boundary="14541212220.Ba01B1.31703";
 charset="UTF-8"


--14541212220.Ba01B1.31703
Date: Sat, 30 Jan 2016 02:33:42 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93934

            Bug ID: 93934
           Summary: DRI_PRIME=1: DeadIsland crashes when loading finish
           Product: Mesa
           Version: 11.0
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: marcos.souza.org-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 121406
  --> https://bugs.freedesktop.org/attachment.cgi?id=121406&action=edit
Output of game when running steam on console using DRI_PRIME=1

DeadIsland starts OK, you choose the character, and the loading starts. When
the loading finishes, screen goes black and the game crashes. I'm using Fedora
23 with mesa from reporitory.

DRI_PRIME=1 glxinfo | grep OpenGL
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVD7
OpenGL core profile version string: 4.1 (Core Profile) Mesa 11.1.0
(git-525f3c2)
OpenGL core profile shading language version string: 4.10
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 11.1.0 (git-525f3c2)
OpenGL shading language version string: 1.30
OpenGL context flags: (none)
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.0 Mesa 11.1.0 (git-525f3c2)
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.00
OpenGL ES profile extensions:

This problem also happens when using my Haswell card, and it crashes of the
same point:
OpenGL vendor string: Intel Open Source Technology Center
OpenGL renderer string: Mesa DRI Intel(R) Haswell Mobile 
OpenGL core profile version string: 3.3 (Core Profile) Mesa 11.1.0
(git-525f3c2)
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 11.1.0 (git-525f3c2)
OpenGL shading language version string: 1.30
OpenGL context flags: (none)
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.0 Mesa 11.1.0 (git-525f3c2)
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.00
OpenGL ES profile extensions:

Please, let me know if more info is needed.

Thanks.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14541212220.Ba01B1.31703
Date: Sat, 30 Jan 2016 02:33:42 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DRI_PRIME=1: DeadIsland crashes when loading finish"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93934">93934</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>DRI_PRIME=1: DeadIsland crashes when loading finish
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.0
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>marcos.souza.org&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=121406" name="attach_121406" title="Output of game when running steam on console using DRI_PRIME=1">attachment 121406</a> <a href="attachment.cgi?id=121406&amp;action=edit" title="Output of game when running steam on console using DRI_PRIME=1">[details]</a></span>
Output of game when running steam on console using DRI_PRIME=1

DeadIsland starts OK, you choose the character, and the loading starts. When
the loading finishes, screen goes black and the game crashes. I'm using Fedora
23 with mesa from reporitory.

DRI_PRIME=1 glxinfo | grep OpenGL
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVD7
OpenGL core profile version string: 4.1 (Core Profile) Mesa 11.1.0
(git-525f3c2)
OpenGL core profile shading language version string: 4.10
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 11.1.0 (git-525f3c2)
OpenGL shading language version string: 1.30
OpenGL context flags: (none)
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.0 Mesa 11.1.0 (git-525f3c2)
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.00
OpenGL ES profile extensions:

This problem also happens when using my Haswell card, and it crashes of the
same point:
OpenGL vendor string: Intel Open Source Technology Center
OpenGL renderer string: Mesa DRI Intel(R) Haswell Mobile 
OpenGL core profile version string: 3.3 (Core Profile) Mesa 11.1.0
(git-525f3c2)
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 11.1.0 (git-525f3c2)
OpenGL shading language version string: 1.30
OpenGL context flags: (none)
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.0 Mesa 11.1.0 (git-525f3c2)
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.00
OpenGL ES profile extensions:

Please, let me know if more info is needed.

Thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14541212220.Ba01B1.31703--

--===============1561763715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1561763715==--
