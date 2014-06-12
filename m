From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79946] New: Segmentation violation at nouveau_fence.c
Date: Thu, 12 Jun 2014 18:35:27 +0000
Message-ID: <bug-79946-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1753868577=="
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


--===============1753868577==
Content-Type: multipart/alternative; boundary="1402598126.ae7Dc10.16150"; charset="us-ascii"


--1402598126.ae7Dc10.16150
Date: Thu, 12 Jun 2014 18:35:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79946

          Priority: medium
            Bug ID: 79946
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Segmentation violation at nouveau_fence.c
          Severity: minor
    Classification: Unclassified
                OS: Linux (All)
          Reporter: zeccav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 10.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

On mesa-20140509
Chipset C51 (NV4E)
Family NV40 Video card NVIDIA GeForce 6150 LE
Running ~/intel/ism/bin/intel64/intelremotedialog
from Intel VTune Amplifier XE 2013 command amplxe-gui on Linux Fedora 20.

Segmentation violation at nouveau_fence.c:226
"if (screen->fence.current->state < NOUVEAU_FENCE_STATE_EMITTING)"
pointer screen is nil because after nv30/nv30_context.c:44
"nv30 = container_of(push->user_priv, nv30, bufctx);"
assert(nv30->screen) fails.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402598126.ae7Dc10.16150
Date: Thu, 12 Jun 2014 18:35:26 +0000
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
   title="NEW --- - Segmentation violation at nouveau_fence.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79946">79946</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Segmentation violation at nouveau_fence.c
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>minor
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
          <td>zeccav&#64;gmail.com
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
          <td>10.1
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
        <pre>On mesa-20140509
Chipset C51 (NV4E)
Family NV40 Video card NVIDIA GeForce 6150 LE
Running ~/intel/ism/bin/intel64/intelremotedialog
from Intel VTune Amplifier XE 2013 command amplxe-gui on Linux Fedora 20.

Segmentation violation at nouveau_fence.c:226
&quot;if (screen-&gt;fence.current-&gt;state &lt; NOUVEAU_FENCE_STATE_EMITTING)&quot;
pointer screen is nil because after nv30/nv30_context.c:44
&quot;nv30 = container_of(push-&gt;user_priv, nv30, bufctx);&quot;
assert(nv30-&gt;screen) fails.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402598126.ae7Dc10.16150--

--===============1753868577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1753868577==--
