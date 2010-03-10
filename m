From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26986] TNT2 crashed on startup with 2.6.34-rc1
Date: Tue,  9 Mar 2010 21:21:59 -0800 (PST)
Message-ID: <20100310052159.E2E2E1300DA@annarchy.freedesktop.org>
References: <bug-26986-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26986-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=26986





--- Comment #6 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org>  2010-03-09 21:21:59 PST ---
Created an attachment (id=33909)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33909)
X log

Upgrading X (to latest master + Francisco's  dri2 patches, due to new dri2proto
installed), Mesa, DDX doesn't help. Nor removing dri driver ....

I found this  a bit weird:

[100.725] (II) NOUVEAU(0): GART: 32MiB available
[   100.725] (EE) NOUVEAU(0): Unable to allocate GART memory

....

[   100.775] (WW) NOUVEAU(0): Failed to retrieve fbcon fb: id 25
[   100.775] (II) NOUVEAU(0): NVEnterVT is called.
[   100.775] Unable to get master: -1

May be some changes in gart drivers in new kernel caused this bug to surface?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
