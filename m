From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85352] New: [NVC0/Gallium] Scaling/centering issue
 in shadertoy shader
Date: Thu, 23 Oct 2014 04:56:48 +0000
Message-ID: <bug-85352-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1931210413=="
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


--===============1931210413==
Content-Type: multipart/alternative; boundary="1414040208.5CD4dC70.13209"; charset="UTF-8"


--1414040208.5CD4dC70.13209
Date: Thu, 23 Oct 2014 04:56:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85352

            Bug ID: 85352
           Summary: [NVC0/Gallium] Scaling/centering issue in shadertoy
                    shader
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org

https://www.shadertoy.com/view/4sf3Dj

The GameCube logo should be centered. Instead of a NVC1 + 10.3 (and also -git)
it appears to be centered around the upper left corner and scaled/stretched.
Confirmed to work OK on i965 and radeonsi, so most likely a nouveau issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414040208.5CD4dC70.13209
Date: Thu, 23 Oct 2014 04:56:48 +0000
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
   title="NEW - [NVC0/Gallium] Scaling/centering issue in shadertoy shader"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85352">85352</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC0/Gallium] Scaling/centering issue in shadertoy shader
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
          <td>imirkin&#64;alum.mit.edu
          </td>
        </tr></table>
      <p>
        <div>
        <pre><a href="https://www.shadertoy.com/view/4sf3Dj">https://www.shadertoy.com/view/4sf3Dj</a>

The GameCube logo should be centered. Instead of a NVC1 + 10.3 (and also -git)
it appears to be centered around the upper left corner and scaled/stretched.
Confirmed to work OK on i965 and radeonsi, so most likely a nouveau issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414040208.5CD4dC70.13209--

--===============1931210413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1931210413==--
