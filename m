From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91986] New: Artifacts in models rendering with
 GeForce 6150 (NV4x chipsets)
Date: Sat, 12 Sep 2015 15:47:30 +0000
Message-ID: <bug-91986-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1119056751=="
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


--===============1119056751==
Content-Type: multipart/alternative; boundary="1442072850.114d2e00.7220"; charset="UTF-8"


--1442072850.114d2e00.7220
Date: Sat, 12 Sep 2015 15:47:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91986

            Bug ID: 91986
           Summary: Artifacts in models rendering with GeForce 6150 (NV4x
                    chipsets)
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 118224
  --> https://bugs.freedesktop.org/attachment.cgi?id=118224&action=edit
X-Wing model artifacts visible on with mesa 11.1git

X-Wing model and other models in FreeSpace2 with StarWars Original Trilogy mod
shows rendering artifacts.

Filing a separate bug from https://bugs.freedesktop.org/show_bug.cgi?id=91551
as requested for NV4C chipset,
also because the artifacts are different.

Here I see big black poligons filling the screen, like vertexes of the model
invading the whole screen. 

NOTE: using mesa 10.6 the artifacts are not covering the entire GUI,
but I see some kind of vertex/surfaces problem, but the shaders maps are fine
but the vertexes/surfaces are completely distorted.

Here is the link of the old trace that is able to produce the artifacs
described in the different mesa versions. (X-Wing is the model visible before
the Tie pilot)

http://www.mediafire.com/download/949r35rra31rpte/Tie_pilot_Nvidia_GT210_fs2_open_3.7.2.trace.7z

Attached pictures of the artifact for 11.1git and 10.6

Attached dmesg that show some nouveau errors, but most probably unrelated to
the bug.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1442072850.114d2e00.7220
Date: Sat, 12 Sep 2015 15:47:30 +0000
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
   title="NEW - Artifacts in models rendering with GeForce 6150 (NV4x chipsets)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91986">91986</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Artifacts in models rendering with GeForce 6150 (NV4x chipsets)
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
          <td>issor.oruam&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118224" name="attach_118224" title="X-Wing model artifacts visible on with mesa 11.1git">attachment 118224</a> <a href="attachment.cgi?id=118224&amp;action=edit" title="X-Wing model artifacts visible on with mesa 11.1git">[details]</a></span>
X-Wing model artifacts visible on with mesa 11.1git

X-Wing model and other models in FreeSpace2 with StarWars Original Trilogy mod
shows rendering artifacts.

Filing a separate bug from <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - DXTn compressed normal maps produce severe artifacts on all NV5x and NVDx chipsets"
   href="show_bug.cgi?id=91551">https://bugs.freedesktop.org/show_bug.cgi?id=91551</a>
as requested for NV4C chipset,
also because the artifacts are different.

Here I see big black poligons filling the screen, like vertexes of the model
invading the whole screen. 

NOTE: using mesa 10.6 the artifacts are not covering the entire GUI,
but I see some kind of vertex/surfaces problem, but the shaders maps are fine
but the vertexes/surfaces are completely distorted.

Here is the link of the old trace that is able to produce the artifacs
described in the different mesa versions. (X-Wing is the model visible before
the Tie pilot)

<a href="http://www.mediafire.com/download/949r35rra31rpte/Tie_pilot_Nvidia_GT210_fs2_open_3.7.2.trace.7z">http://www.mediafire.com/download/949r35rra31rpte/Tie_pilot_Nvidia_GT210_fs2_open_3.7.2.trace.7z</a>

Attached pictures of the artifact for 11.1git and 10.6

Attached dmesg that show some nouveau errors, but most probably unrelated to
the bug.</pre>
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

--1442072850.114d2e00.7220--

--===============1119056751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1119056751==--
