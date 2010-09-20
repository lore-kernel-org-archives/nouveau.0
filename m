From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30286] New: Rendering Artefacts for "EffectFrames"
 with KWin trunk
Date: Mon, 20 Sep 2010 09:44:45 -0700 (PDT)
Message-ID: <bug-30286-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

https://bugs.freedesktop.org/show_bug.cgi?id=30286

           Summary: Rendering Artefacts for "EffectFrames" with KWin trunk
           Product: Mesa
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: kde-DczxDNHMV8knNWVl+fqZflaTQe2KTcn/@public.gmane.org


Created an attachment (id=38827)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=38827)
PresentWindows effect showing artefacts.

I noticed that KWin's EffectFrames are rendered incorrectly with nouveau and
current kwin trunk (please see attached screenshot). There has been a change
between 4.5 and current trunk, so I cannot say if the same problem exsists with
4.5. as well.

The EffectFrame is a GLTexture generated with TextureFromPixmap from a Qt
QPixmap. In the screenshot we see that the icons are rendered correctly (also
using QPixmap -> TFP -> GLTexture conversion) while the other textures are
rendered incorrectly. This includes the pure black background texture, the
textures generated from Plasma's FrameSvg and text textures.

The relevant code is in kwin trunk scene_opengl.cpp [1]
SceneOpenGL::EffectFrame::render() at line 2002. An example for creating a
texture can be found in SceneOpenGL::EffectFrame::updateTextTexture() at line
2264. If you want to have any other information to the code, do not hesistate
to ask, as I recently refactored that code.

I am using nouveau, dri and kernel from debian experimental. glxinfo says it's
Mesa 7.8.2

[1]
http://websvn.kde.org/trunk/KDE/kdebase/workspace/kwin/scene_opengl.cpp?view=markup

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
