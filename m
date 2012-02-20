From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40138] nouveau doesn't show screen on DVI on
 ALiveNF6G-DVI with DVI Graphics-SI Card
Date: Mon, 20 Feb 2012 08:50:44 +0000
Message-ID: <bug-40138-8800-zW66KMFGlc@http.bugs.freedesktop.org/>
References: <bug-40138-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40138-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40138

--- Comment #7 from Alexander Stein <alexander.stein-jNDFPZUTrfQ+B2oLq8eQJv4efur1V5z/s0AfqQuZ5sE@public.gmane.org> 2012-02-20 00:50:44 PST ---
Created attachment 57301
  --> https://bugs.freedesktop.org/attachment.cgi?id=57301
dmesg with drm.debug=6

This is the dmesg from git kernel with commit 2d44ad2a2a70c3f3a8edf8a4680dd3e15cddbde3 where only DVI is connected.
I'm wondering if these entries are related to the extension card:
[    8.982259] [drm] nouveau 0000:00:0d.0: DCB type 4 not known
[    8.982264] [drm] nouveau 0000:00:0d.0: Unknown-1 has no encoders, removing

To me it seems the DVI connector type is unknown.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
