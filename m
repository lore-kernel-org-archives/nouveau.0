From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35025] Serious compiler warnings
Date: Tue, 15 Mar 2011 12:48:05 -0700 (PDT)
Message-ID: <20110315194805.440D913004E@annarchy.freedesktop.org>
References: <bug-35025-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35025-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35025

Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|medium                      |highest

--- Comment #1 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> 2011-03-15 12:48:05 PDT ---
Importance: highest/blocker because it is not possible to build it on openSUSE
(see:
https://build.opensuse.org/package/live_build_log?arch=i586&package=Mesa&project=home%3Ajobermayr&repository=openSUSE_11.4)
and determinate offenders:

Brian Paul:
Commit: b70610b9823fc7dc3672735c11be1a75fbb1a2a4

Ben Skeggs:
Commit: cd24fcedecfc41d77047fb827a88db528ed292ca

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
