From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15344] Gradual Performance Decline With Nouveau
	Driver
Date: Fri,  4 Apr 2008 09:46:44 -0700 (PDT)
Message-ID: <20080404164644.986CF130177@annarchy.freedesktop.org>
References: <bug-15344-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15344-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15344





--- Comment #5 from Devan Goodwin <dgoodwin-eRDYlh02QjtL43Ps8y5oD9BPR1lH4CV8@public.gmane.org>  2008-04-04 09:46:43 PST ---
Tried VT switching but I can't notice any difference when switching back.

Have been running without restart all morning and definitely seeing a
progressively worse delay switching desktops, up to around 3s to switch
currently.

Was becoming worried that some of what I'm seeing may just be the difference in
performance from the driver I'm used to. Certain operations are brutally
chuggy, scrolling in FF3+Gmail, pressing Esc on an empty command buffer in
vim-gnome, or rendering any app running on the network via ssh forwarding. I
was concerned I was confusing these with a performance bug but I'm definitely
seeing it get worse and worse as the day wears on. Not sure if it will peak
yet.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
