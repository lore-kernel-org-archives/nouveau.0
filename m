From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47288] System hangs with GeForce 6150SE nForce 430
Date: Tue, 13 Mar 2012 21:07:44 +0000
Message-ID: <bug-47288-8800-x5MKLvgHqk@http.bugs.freedesktop.org/>
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

--- Comment #3 from Frank Schaefer <fschaefer.oss-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> 2012-03-13 14:07:44 PDT ---
Ok, I will try that...
The kernel is already up-to-date (3.1.9).

Please confirm that the following changes are correct:

drm-nouveau-kmp-desktop: currently not installed (?!) =>
20120309.0650_k3.1.9_1.4-1.1
libllvm: currently not installed (?!) => 3.0.99.svn20120312
libdrm: 2.4.26-15.1.2 => no update available. Do you mean libdrm2
(2.4.99git20120310.1721-2.1) ?
Mesa: 7.11 => 8.0.99
xorg-x11-driver-video: 7.6 => 7.6.99

What about xorg-x11-driver-nouveau ?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
