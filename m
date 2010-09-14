From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30172] GL_EXT_framebuffer_blit function required
Date: Tue, 14 Sep 2010 00:43:24 -0700 (PDT)
Message-ID: <20100914074324.EE8661300C8@annarchy.freedesktop.org>
References: <bug-30172-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30172-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30172

--- Comment #2 from Alex Buell <alex.buell-XLQCo7u1tb3e9xe1eoZjHA@public.gmane.org> 2010-09-14 00:43:25 PDT ---
I am getting this:

$ scons
scons: Reading SConscript files ...
scons: done reading SConscript files.
scons: Building targets ...
g++ -o glsl_toon glsl_toon.o build/Shader.o build/ShaderProgram.o build/Timer.o
build/VertexBuffer.o build/Mesh.o build/Light.o build/Texture.o
build/FrameTimer.o build/FrameBuffer.o -lSDL -lSDL_image -lGL -lGLU
build/FrameBuffer.o: In function `FrameBuffer::BlitTo(FrameBuffer*, unsigned
int, unsigned int)':
FrameBuffer.cpp:(.text+0x1373): undefined reference to `glBlitFramebufferEXT'
collect2: ld returned 1 exit status
scons: *** [glsl_toon] Error 1
scons: building terminated because of errors.

Grepping the includes shows that it is definitely defined in the includes so
probably it's not in the libraries.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
