From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95095] New: NV46 (G72) Full screen artifacts in
 Freespace 2 SW OT mod
Date: Sat, 23 Apr 2016 22:28:56 +0000
Message-ID: <bug-95095-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2058143480=="
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


--===============2058143480==
Content-Type: multipart/alternative; boundary="14614505360.73Cae.31095";
 charset="UTF-8"


--14614505360.73Cae.31095
Date: Sat, 23 Apr 2016 22:28:56 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95095

            Bug ID: 95095
           Summary: NV46 (G72) Full screen artifacts in Freespace 2 SW OT
                    mod
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Hi,

I've seen this problem sometime ago on NV44
and now traced on NV46 (G72)

The GUI and the 3D models become completely corrupted with elements of the GUI
and parts of the model distorted and covering the whole screen.

Looking at the apitrace and errors highlighted by retracer,
I'm not able to judge if it is a mesa problem.

Here is the .trace:
https://drive.google.com/file/d/0B_OFHiIqgpSFampXVVRKYkVzaTQ/view?usp=sharing

Mauro

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14614505360.73Cae.31095
Date: Sat, 23 Apr 2016 22:28:56 +0000
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
   title="NEW - NV46 (G72) Full screen artifacts in Freespace 2 SW OT mod"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95095">95095</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV46 (G72) Full screen artifacts in Freespace 2 SW OT mod
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
        <pre>Hi,

I've seen this problem sometime ago on NV44
and now traced on NV46 (G72)

The GUI and the 3D models become completely corrupted with elements of the GUI
and parts of the model distorted and covering the whole screen.

Looking at the apitrace and errors highlighted by retracer,
I'm not able to judge if it is a mesa problem.

Here is the .trace:
<a href="https://drive.google.com/file/d/0B_OFHiIqgpSFampXVVRKYkVzaTQ/view?usp=sharing">https://drive.google.com/file/d/0B_OFHiIqgpSFampXVVRKYkVzaTQ/view?usp=sharing</a>

Mauro</pre>
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
--14614505360.73Cae.31095--

--===============2058143480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2058143480==--
