From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94374] New: transparent window with DRI_PRIME=1,
 depending on size of used textures
Date: Wed, 02 Mar 2016 19:17:14 +0000
Message-ID: <bug-94374-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1072029146=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1072029146==
Content-Type: multipart/alternative; boundary="14569462410.AB0c72.9345";
 charset="UTF-8"


--14569462410.AB0c72.9345
Date: Wed, 2 Mar 2016 19:17:21 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94374

            Bug ID: 94374
           Summary: transparent window with DRI_PRIME=1, depending on size
                    of used textures
           Product: Mesa
           Version: 11.2
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: peter.fiss-Mmb7MZpHnFY@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 122086
  --> https://bugs.freedesktop.org/attachment.cgi?id=122086&action=edit
the source code of the program (.tar,xz)

Here's the source code of a simple program, that reproduces incorrect behavior
of PRIME. I actually wanted to try something different, but then I discovered
this bug. The program generates noise textures and displays them on a quad
using OpenGL 3.3. You can specify the size of the noise textures with the
program's first parameter.

The program runs fine on my Intel Ivy Bridge gpu and it also runs on my GeForce
GT 640M (Kepler) with nouveau and DRI_PRIME=1. When I increase the texture size
to 128 or something larger, the program's window sometimes (>= 50% chance)
becomes transparent (see attached screenshot) when using DRI_PRIME=1. This
*never* happens with texture sizes of 64 or less. If I remove the use of
textures completely from the program, it always runs fine as well. DRI_PRIME=1
glxgears always works as expected.

My system is Arch Linux with mesa 11.1.2-1 and kernel 4.4.1-2. I'm sorry that I
cannot install mesa-git since this is my computer for productive work.
Hopefully, someone else can reproduce the issue.

Steps to build the program:
- make sure you have SDL2 installed
- ./build.sh
- DRI_PRIME=1 ./a.out 512       <- might not work
- DRI_PRIME=1 ./a.out 64        <- always works for me

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14569462410.AB0c72.9345
Date: Wed, 2 Mar 2016 19:17:21 +0000
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
   title="NEW - transparent window with DRI_PRIME=1, depending on size of used textures"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94374">94374</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>transparent window with DRI_PRIME=1, depending on size of used textures
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.2
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
          <td>peter.fiss&#64;gmx.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=122086" name="attach_122086" title="the source code of the program (.tar,xz)">attachment 122086</a> <a href="attachment.cgi?id=122086&amp;action=edit" title="the source code of the program (.tar,xz)">[details]</a></span>
the source code of the program (.tar,xz)

Here's the source code of a simple program, that reproduces incorrect behavior
of PRIME. I actually wanted to try something different, but then I discovered
this bug. The program generates noise textures and displays them on a quad
using OpenGL 3.3. You can specify the size of the noise textures with the
program's first parameter.

The program runs fine on my Intel Ivy Bridge gpu and it also runs on my GeForce
GT 640M (Kepler) with nouveau and DRI_PRIME=1. When I increase the texture size
to 128 or something larger, the program's window sometimes (&gt;= 50% chance)
becomes transparent (see attached screenshot) when using DRI_PRIME=1. This
*never* happens with texture sizes of 64 or less. If I remove the use of
textures completely from the program, it always runs fine as well. DRI_PRIME=1
glxgears always works as expected.

My system is Arch Linux with mesa 11.1.2-1 and kernel 4.4.1-2. I'm sorry that I
cannot install mesa-git since this is my computer for productive work.
Hopefully, someone else can reproduce the issue.

Steps to build the program:
- make sure you have SDL2 installed
- ./build.sh
- DRI_PRIME=1 ./a.out 512       &lt;- might not work
- DRI_PRIME=1 ./a.out 64        &lt;- always works for me</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14569462410.AB0c72.9345--

--===============1072029146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1072029146==--
