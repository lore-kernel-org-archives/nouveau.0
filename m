From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93110] New: [NVE4] textureSize() and
 textureQueryLevels() uses a texture bound during the previous draw call
Date: Thu, 26 Nov 2015 00:38:15 +0000
Message-ID: <bug-93110-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2054883628=="
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


--===============2054883628==
Content-Type: multipart/alternative; boundary="1448498295.3BaD0b300.24951"; charset="UTF-8"


--1448498295.3BaD0b300.24951
Date: Thu, 26 Nov 2015 00:38:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93110

            Bug ID: 93110
           Summary: [NVE4] textureSize() and textureQueryLevels() uses a
                    texture bound during the previous draw call
           Product: Mesa
           Version: 10.5
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: joseph.kucia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 120124
  --> https://bugs.freedesktop.org/attachment.cgi?id=120124&action=edit
A small program to demonstrate the issue

It seems that a texture bound in the previous draw call is used by
textureSize() and textureQueryLevels() (instead of the currently bound
texture).

The attached program demonstrated the bug. When the program is built with
-DBROKEN, it incorrectly prints "width: 2.000000 height 2.000000 miplevels
2.000000" while the current texture is 512x256 with 4 miplevels.

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVE4
OpenGL core profile version string: 4.1 (Core Profile) Mesa 11.0.5
OpenGL core profile shading language version string: 4.10
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 760]
(rev a1) (prog-if 00 [VGA controller])

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448498295.3BaD0b300.24951
Date: Thu, 26 Nov 2015 00:38:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] textureSize() and textureQueryLevels() uses a texture bound during the previous draw call"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93110">93110</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE4] textureSize() and textureQueryLevels() uses a texture bound during the previous draw call
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.5
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>joseph.kucia&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=120124" name="attach_120124" title="A small program to demonstrate the issue">attachment 120124</a> <a href="attachment.cgi?id=120124&amp;action=edit" title="A small program to demonstrate the issue">[details]</a></span>
A small program to demonstrate the issue

It seems that a texture bound in the previous draw call is used by
textureSize() and textureQueryLevels() (instead of the currently bound
texture).

The attached program demonstrated the bug. When the program is built with
-DBROKEN, it incorrectly prints &quot;width: 2.000000 height 2.000000 miplevels
2.000000&quot; while the current texture is 512x256 with 4 miplevels.

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVE4
OpenGL core profile version string: 4.1 (Core Profile) Mesa 11.0.5
OpenGL core profile shading language version string: 4.10
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

01:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 760]
(rev a1) (prog-if 00 [VGA controller])</pre>
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

--1448498295.3BaD0b300.24951--

--===============2054883628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2054883628==--
