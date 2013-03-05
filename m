From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61854] New: [nv50]glClipPlane not clipping correctly
	for glsl
Date: Tue, 05 Mar 2013 12:54:53 +0000
Message-ID: <bug-61854-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0818658034=="
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


--===============0818658034==
Content-Type: multipart/alternative; boundary="1362488093.73F30.26764"; charset="us-ascii"


--1362488093.73F30.26764
Date: Tue, 5 Mar 2013 12:54:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61854

          Priority: medium
            Bug ID: 61854
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nv50]glClipPlane not clipping correctly for glsl
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: bill-xUg5jqCTrWtAfugRpC6u6w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 75953
  --> https://bugs.freedesktop.org/attachment.cgi?id=75953&action=edit
blender file demonstrating FF vs GLSL behavior of glClipPlane

hw: NVIDIA Corporation G80 [GeForce 8800 GTS] (rev a2)


The problem was found using the alt-b clipping border option in blender.

In blender's default scene, press alt-b with the mouse in the 3d view and
"select" part of the cube. It gets clipped properly. However, turn on matcap
(press N to get the properties panel, scroll down and open the display
sub-panel, and turn on "Matcap") and the clipping of the cube will depend on
the viewer's position and angle with respect to the clipping planes. However,
the highlighted wire-frame of the cube is always clipped correctly.

I was told by Ton (blender leader) that blender uses glClipPlane for the
clipping border, and that enabling matcap simply causes blender to use glsl for
the solid rendering.

Although I've included the url to the bug report in blender's bug tracker, I've
also attached the same blend file to this report. For the blend file, turning
off matcap will cause the cube to clip correctly, independently of the viewer's
position and angle. Zooming in a little (mouse wheel) with matcap enabled will
cause the cube's surface to become partially visible, but it will still be
incorrect.

Blender bug tracker url:
http://projects.blender.org/tracker/?func=detail&atid=231&aid=34492&group_id=9

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362488093.73F30.26764
Date: Tue, 5 Mar 2013 12:54:53 +0000
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
   title="NEW --- - [nv50]glClipPlane not clipping correctly for glsl"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61854">61854</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nv50]glClipPlane not clipping correctly for glsl
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>bill&#64;taniwha.org
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=75953" name="attach_75953" title="blender file demonstrating FF vs GLSL behavior of glClipPlane">attachment 75953</a> <a href="attachment.cgi?id=75953&amp;action=edit" title="blender file demonstrating FF vs GLSL behavior of glClipPlane">[details]</a></span>
blender file demonstrating FF vs GLSL behavior of glClipPlane

hw: NVIDIA Corporation G80 [GeForce 8800 GTS] (rev a2)


The problem was found using the alt-b clipping border option in blender.

In blender's default scene, press alt-b with the mouse in the 3d view and
&quot;select&quot; part of the cube. It gets clipped properly. However, turn on matcap
(press N to get the properties panel, scroll down and open the display
sub-panel, and turn on &quot;Matcap&quot;) and the clipping of the cube will depend on
the viewer's position and angle with respect to the clipping planes. However,
the highlighted wire-frame of the cube is always clipped correctly.

I was told by Ton (blender leader) that blender uses glClipPlane for the
clipping border, and that enabling matcap simply causes blender to use glsl for
the solid rendering.

Although I've included the url to the bug report in blender's bug tracker, I've
also attached the same blend file to this report. For the blend file, turning
off matcap will cause the cube to clip correctly, independently of the viewer's
position and angle. Zooming in a little (mouse wheel) with matcap enabled will
cause the cube's surface to become partially visible, but it will still be
incorrect.

Blender bug tracker url:
<a href="http://projects.blender.org/tracker/?func=detail&amp;atid=231&amp;aid=34492&amp;group_id=9">http://projects.blender.org/tracker/?func=detail&amp;atid=231&amp;aid=34492&amp;group_id=9</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362488093.73F30.26764--

--===============0818658034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0818658034==--
