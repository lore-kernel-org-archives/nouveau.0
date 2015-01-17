From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88535] New: Mesa 10.3.0 implementation error:
 gen7_update_renderbuffer_surface: renderbuffer format
 MESA_FORMAT_RGBX_UNORM16 unsupported
Date: Sat, 17 Jan 2015 14:42:50 +0000
Message-ID: <bug-88535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0833769642=="
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


--===============0833769642==
Content-Type: multipart/alternative; boundary="1421505770.C4700.29806"; charset="UTF-8"


--1421505770.C4700.29806
Date: Sat, 17 Jan 2015 14:42:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88535

            Bug ID: 88535
           Summary: Mesa 10.3.0 implementation error:
                    gen7_update_renderbuffer_surface: renderbuffer format
                    MESA_FORMAT_RGBX_UNORM16 unsupported
           Product: Mesa
           Version: 10.3
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: dexcelstraun7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

When attempting to create an OpenGL framebuffer with the RGBA16 format, this
error is returned by glGetError.

System specs:
CPU: Intel i7-4710MQ
RAM: 16GB DDR3
GPU: nVidia GTX 970M (6GB VRAM)
OS: Ubuntu 14.10

Program: Minecraft 1.7.10, with Forge, Optifine, and the Shader Mod installed.
I'm using the shaderpack from http://jotunstudios.com/dragon/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421505770.C4700.29806
Date: Sat, 17 Jan 2015 14:42:50 +0000
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
   title="NEW - Mesa 10.3.0 implementation error: gen7_update_renderbuffer_surface: renderbuffer format MESA_FORMAT_RGBX_UNORM16 unsupported"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88535">88535</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Mesa 10.3.0 implementation error: gen7_update_renderbuffer_surface: renderbuffer format MESA_FORMAT_RGBX_UNORM16 unsupported
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.3
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
          <td>major
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
          <td>dexcelstraun7&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When attempting to create an OpenGL framebuffer with the RGBA16 format, this
error is returned by glGetError.

System specs:
CPU: Intel i7-4710MQ
RAM: 16GB DDR3
GPU: nVidia GTX 970M (6GB VRAM)
OS: Ubuntu 14.10

Program: Minecraft 1.7.10, with Forge, Optifine, and the Shader Mod installed.
I'm using the shaderpack from <a href="http://jotunstudios.com/dragon/">http://jotunstudios.com/dragon/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421505770.C4700.29806--

--===============0833769642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0833769642==--
