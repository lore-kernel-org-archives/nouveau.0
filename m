From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 22179] [KMS] Black screen with KMS enabled, nv44
Date: Tue,  9 Jun 2009 12:04:09 -0700 (PDT)
Message-ID: <20090609190409.51521130016@annarchy.freedesktop.org>
References: <bug-22179-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-22179-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=22179





--- Comment #6 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org>  2009-06-09 12:04:07 PST ---
Created an attachment (id=26597)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=26597)
Current X.org log, with user mode-setting

Using DRM from  freedesktop.org git master, up to 

3d4bfe8c893d016ef43d1ebf28e4607aa1f540a4
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Jun 3 13:54:43 2009 +1000

    nouveau: 0.0.14 + extend bo interface to support subrange mapping

    Normal map() should operate as before, and map_range()/map_flush() should
    give correct results but lacking any performance difference from map().

Xserver and input drivers were updated recently, 
X now at git master 

commit 2a035600e603117a4dbe668cad50bae2a5609094
Author: Peter Hutterer <peter.hutterer-Pf4JEFdB4epeoWH0uzbU5w@public.gmane.org>
Date:   Tue Jun 9 10:14:18 2009 +1000

    require inputproto 1.9.99.11

and xf86-video-nouveau at git master 

commit 6ee453381f00063522187939cb54ab9447b73ec7
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Jun 4 14:43:54 2009 +1000

    xv: fix some issues with driver pixmaps


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
