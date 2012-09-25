From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55310] New: incorrect rendering of some borders in
 certain gtk3 themes
Date: Tue, 25 Sep 2012 09:34:00 +0000
Message-ID: <bug-55310-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1202255849=="
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


--===============1202255849==
Content-Type: multipart/alternative; boundary="1348565641.eC5b1.20369"; charset="us-ascii"


--1348565641.eC5b1.20369
Date: Tue, 25 Sep 2012 09:34:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55310

          Priority: medium
            Bug ID: 55310
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: incorrect rendering of some borders in certain gtk3
                    themes
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: sebastian-keller-Mmb7MZpHnFY@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 67669
  --> https://bugs.freedesktop.org/attachment.cgi?id=67669&action=edit
Screenshot showing the problem

When using a gtk3 theme that uses "border-image" with the "stretch" as repeat
mode (such as Adwaita, the default theme), gtk3 uses cairo to scale the image.
When using the "image" backend of cairo everything looks as expected. Using the
X backend on a "intel" driver should work as well (as I'm told). But using the
"nouveau" driver gives some fading out borders.

After changing NV50EXAPictTexture to use CLAMP_TO_EDGE for RepeatPad like the
intel driver does
(http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/tree/src/i915_render.c?id=c6008068372709c73034163eddc902b47bf87d24#n327)
the result looks like the one rendered with the "image" backend.

I'm attaching the patch and a screenshot that shows the rendering issue, how it
looks with the image backend and after the patch.

For the screenshot I've made the top right pixel in the top border red
(#ff0000). In the first screenshot you can see how the color "fades away"
because it gets blended with some transparent pixels when scaled. In the second
and third screenshot the rightmost pixel before the corner is #ff0000.

I've only tested the patch for nv50 but the nv40 one should work as well if the
defines are correct.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1348565641.eC5b1.20369
Date: Tue, 25 Sep 2012 09:34:00 +0000
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
   title="NEW --- - incorrect rendering of some borders in certain gtk3 themes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55310">55310</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>incorrect rendering of some borders in certain gtk3 themes
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>sebastian-keller&#64;gmx.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>Created <span class=""><a href="attachment.cgi?id=67669" name="attach_67669" title="Screenshot showing the problem">attachment 67669</a> <a href="attachment.cgi?id=67669&amp;action=edit" title="Screenshot showing the problem">[details]</a></span>
Screenshot showing the problem

When using a gtk3 theme that uses &quot;border-image&quot; with the &quot;stretch&quot; as repeat
mode (such as Adwaita, the default theme), gtk3 uses cairo to scale the image.
When using the &quot;image&quot; backend of cairo everything looks as expected. Using the
X backend on a &quot;intel&quot; driver should work as well (as I'm told). But using the
&quot;nouveau&quot; driver gives some fading out borders.

After changing NV50EXAPictTexture to use CLAMP_TO_EDGE for RepeatPad like the
intel driver does
(<a href="http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/tree/src/i915_render.c?id=c6008068372709c73034163eddc902b47bf87d24#n327">http://cgit.freedesktop.org/xorg/driver/xf86-video-intel/tree/src/i915_render.c?id=c6008068372709c73034163eddc902b47bf87d24#n327</a>)
the result looks like the one rendered with the &quot;image&quot; backend.

I'm attaching the patch and a screenshot that shows the rendering issue, how it
looks with the image backend and after the patch.

For the screenshot I've made the top right pixel in the top border red
(#ff0000). In the first screenshot you can see how the color &quot;fades away&quot;
because it gets blended with some transparent pixels when scaled. In the second
and third screenshot the rightmost pixel before the corner is #ff0000.

I've only tested the patch for nv50 but the nv40 one should work as well if the
defines are correct.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1348565641.eC5b1.20369--

--===============1202255849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1202255849==--
