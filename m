From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62916] New: NVEnterTV fails on hybrid cards
Date: Fri, 29 Mar 2013 21:23:43 +0000
Message-ID: <bug-62916-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2131396916=="
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


--===============2131396916==
Content-Type: multipart/alternative; boundary="1364592223.A7dFC1.17007"; charset="us-ascii"


--1364592223.A7dFC1.17007
Date: Fri, 29 Mar 2013 21:23:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62916

          Priority: medium
            Bug ID: 62916
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NVEnterTV fails on hybrid cards
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: zeng.shixin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Since on system with hybrid cards, the nvidia card might not be connecting to
the screen, so Xf86SetDisiredMode could fail, which results in a fatal error
for Xserver:
[ 91825.257] (II) NOUVEAU(G0): NVEnterVT is called.
[ 91825.258] 
Fatal server error:
[ 91825.258] EnterVT failed for gpu screen 0


The following dirty hack fixes the problem. We should check for the connected
screen before setting mode, but I don't know how to do that, since this is my
first time to look at nouveau code.

--- nv_driver-orig.c    2013-03-29 17:19:34.876953461 -0400
+++ nv_driver.c    2013-03-29 17:20:15.810287942 -0400
@@ -407,8 +407,7 @@
     if (ret)
         ErrorF("Unable to get master: %s\n", strerror(errno));

-    if (!xf86SetDesiredModes(pScrn))
-        return FALSE;
+    xf86SetDesiredModes(pScrn);

     if (pNv->overlayAdaptor && pNv->Architecture != NV_ARCH_04)
         NV10WriteOverlayParameters(pScrn);

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1364592223.A7dFC1.17007
Date: Fri, 29 Mar 2013 21:23:43 +0000
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
   title="NEW --- - NVEnterTV fails on hybrid cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62916">62916</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NVEnterTV fails on hybrid cards
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>zeng.shixin&#64;gmail.com
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
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Since on system with hybrid cards, the nvidia card might not be connecting to
the screen, so Xf86SetDisiredMode could fail, which results in a fatal error
for Xserver:
[ 91825.257] (II) NOUVEAU(G0): NVEnterVT is called.
[ 91825.258] 
Fatal server error:
[ 91825.258] EnterVT failed for gpu screen 0


The following dirty hack fixes the problem. We should check for the connected
screen before setting mode, but I don't know how to do that, since this is my
first time to look at nouveau code.

--- nv_driver-orig.c    2013-03-29 17:19:34.876953461 -0400
+++ nv_driver.c    2013-03-29 17:20:15.810287942 -0400
&#64;&#64; -407,8 +407,7 &#64;&#64;
     if (ret)
         ErrorF(&quot;Unable to get master: %s\n&quot;, strerror(errno));

-    if (!xf86SetDesiredModes(pScrn))
-        return FALSE;
+    xf86SetDesiredModes(pScrn);

     if (pNv-&gt;overlayAdaptor &amp;&amp; pNv-&gt;Architecture != NV_ARCH_04)
         NV10WriteOverlayParameters(pScrn);</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1364592223.A7dFC1.17007--

--===============2131396916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2131396916==--
