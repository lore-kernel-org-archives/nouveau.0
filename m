From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47288] System hangs with GeForce 6150SE nForce 430
Date: Wed, 18 Jul 2012 04:05:54 +0000
Message-ID: <bug-47288-8800-DR1dQ3Pj9B@http.bugs.freedesktop.org/>
References: <bug-47288-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47288-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=47288

--- Comment #7 from Frank Schaefer <fschaefer.oss-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> 2012-07-17 21:05:54 PDT ---
Still happens (even more often than before) with

kernel 3.4.5
Mesa 8.0.99.git20120707
libdrm 2.4.99.git20120706
libllvm 3.1.99.svn20120708


The kernel logs now show much more of these lines:

[drm] nouveau 0000:00:0d.0: fail pre-validate sync
[drm] nouveau 0000:00:0d.0: validate vram_list
[drm] nouveau 0000:00:0d.0: validate: -16
[drm] nouveau 0000:00:0d.0: cal_space: -16
[drm] nouveau 0000:00:0d.0: cal_space: -16
[drm] nouveau 0000:00:0d.0: cal_space: -16
...


This bug is really easy to trigger, all you need to do is to enable KDE
standard desktop effects => lockup in less than 5 minutes !

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
