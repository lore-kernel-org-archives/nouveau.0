From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49088] MapsGL labels doen't render properly on
	nouveau
Date: Thu, 26 Apr 2012 21:41:12 +0000
Message-ID: <bug-49088-8800-8vGYzixdfl@http.bugs.freedesktop.org/>
References: <bug-49088-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49088-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=49088

Karl Tomlinson <bugs.freedesktop-685W5sqp211eoWH0uzbU5w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org
                   |rg                          |org
          Component|Drivers/DRI/nouveau         |Mesa core

--- Comment #1 from Karl Tomlinson <bugs.freedesktop-685W5sqp211eoWH0uzbU5w@public.gmane.org> 2012-04-26 14:41:12 PDT ---
I see the same issue with r600

OpenGL vendor string: X.Org
OpenGL renderer string: Gallium 0.4 on AMD JUNIPER
OpenGL version string: 2.1 Mesa 8.0.2
OpenGL shading language version string: 1.20
OpenGL extensions:

but sw works as expected.

OpenGL vendor string: VMware, Inc.
OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 0x209)
OpenGL version string: 2.1 Mesa 8.0.2
OpenGL shading language version string: 1.20

suggesting the problem is in a more core component, possibly dri2-specific.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
