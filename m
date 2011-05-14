From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35441] [PATCH] Mesa does not find nouveau include
 files with --enable-shared-dricore
Date: Sat, 14 May 2011 11:01:46 -0700 (PDT)
Message-ID: <20110514180147.10E4A13004F@annarchy.freedesktop.org>
References: <bug-35441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35441-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35441

Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|header files (at least      |[PATCH] Mesa does not find
                   |nouveau_device.h and        |nouveau include files with
                   |nouveau_grojb.h) missing    |--enable-shared-dricore
                   |from git                    |
             Status|NEW                         |ASSIGNED
           Severity|major                       |critical
           Priority|medium                      |highest
          Component|Drivers/DRI/nouveau         |Mesa core
         AssignedTo|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org
                   |rg                          |org

--- Comment #15 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> 2011-05-14 11:01:46 PDT ---
Set 'Component: Mesa core' since the patch touches core parts.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
