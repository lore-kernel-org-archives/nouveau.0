From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48742] fbotexture -arb misrenders on nv43
Date: Sun, 15 Apr 2012 22:14:09 +0000
Message-ID: <bug-48742-8800-kQ8DxAQsvu@http.bugs.freedesktop.org/>
References: <bug-48742-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48742-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=48742

--- Comment #3 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> 2012-04-15 15:14:09 PDT ---
for correct image i get

guest@slax:~/botva/src/demos/src/demos$ LIBGL_ALWAYS_SOFTWARE=1 ./fbotexture
-arb
GL_RENDERER = Gallium 0.4 on llvmpipe (LLVM 0x209)
Color/Texture size: 512 x 512
Depth buffer size: 422 x 422
Depth renderbuffer size = 24 bits
Stencil renderbuffer size = 8 bits
Render to texture name: 1
Color attachment[0] name: 1
Stencil attachment name: 3
Depth attachment name: 3
Usage:
  -ds  Use combined depth/stencil renderbuffer
  -arb Try GL_ARB_framebuffer_object's mismatched buffer sizes
  -ds2 Try GL_ARB_framebuffer_object's GL_DEPTH_STENCIL_ATTACHMENT
Keys:
  a    Toggle animation
  s/s  Step/rotate
  c    Toggle back-face culling
  w    Toggle wireframe mode (front-face only)
  Esc  Exit

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
