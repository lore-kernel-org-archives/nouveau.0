From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93004] New: Guild Wars 2 crash on nouveau DX11 cards
Date: Thu, 19 Nov 2015 07:59:00 +0000
Message-ID: <bug-93004-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1572392947=="
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


--===============1572392947==
Content-Type: multipart/alternative; boundary="1447919940.c4e00.12204"; charset="UTF-8"


--1447919940.c4e00.12204
Date: Thu, 19 Nov 2015 07:59:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93004

            Bug ID: 93004
           Summary: Guild Wars 2 crash on nouveau DX11 cards
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: siro-afHDD34IFkZrovVCs/uTlw@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Guild Wars 2 32bit crashes on DirectX 11 capable Nvidia cards using OpenGL and
Gallium Nine state tracker.
It doesn't crash on BARTS (AMD HD6850) and it doesn't crash on NV84 (Nvidia
Geforce 8600GT).

Bug reports:
https://bugs.winehq.org/show_bug.cgi?id=34342
https://github.com/iXit/Mesa-3D/issues/153

While this is referred as "Out of Memory" my guess is that the GuildWars2 crash
reporter show wrong memory usage. Don't focus on that.

Using d3dretrace and valgrind I got this:
https://github.com/iXit/Mesa-3D/issues/153#issuecomment-157977989

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1447919940.c4e00.12204
Date: Thu, 19 Nov 2015 07:59:00 +0000
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
   title="NEW - Guild Wars 2 crash on nouveau DX11 cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93004">93004</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Guild Wars 2 crash on nouveau DX11 cards
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>siro&#64;das-labor.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Guild Wars 2 32bit crashes on DirectX 11 capable Nvidia cards using OpenGL and
Gallium Nine state tracker.
It doesn't crash on BARTS (AMD HD6850) and it doesn't crash on NV84 (Nvidia
Geforce 8600GT).

Bug reports:
<a href="https://bugs.winehq.org/show_bug.cgi?id=34342">https://bugs.winehq.org/show_bug.cgi?id=34342</a>
<a href="https://github.com/iXit/Mesa-3D/issues/153">https://github.com/iXit/Mesa-3D/issues/153</a>

While this is referred as &quot;Out of Memory&quot; my guess is that the GuildWars2 crash
reporter show wrong memory usage. Don't focus on that.

Using d3dretrace and valgrind I got this:
<a href="https://github.com/iXit/Mesa-3D/issues/153#issuecomment-157977989">https://github.com/iXit/Mesa-3D/issues/153#issuecomment-157977989</a></pre>
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

--1447919940.c4e00.12204--

--===============1572392947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1572392947==--
