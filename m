From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37669] [NVAC] problem when disabling external monitor
Date: Tue, 06 Dec 2011 19:44:37 +0000
Message-ID: <bug-37669-8800-zTb0zBRems@http.bugs.freedesktop.org/>
References: <bug-37669-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37669-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37669

--- Comment #1 from Antoine Reversat <a.reversat-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-12-06 11:44:37 PST ---
So I started looking deeper into this issue and it's probably somewhat
low-level as if I boot my computer into a console and load the nouveau driver
then unplug DP-1 the same flickering happens (but re-pluging the monitor on
DP-1 stops the flickering). I'll attach a demsg output with drm.debug=0x07
there's some interresting things specialy (I think) these lines :

checking generic (c0010000 640000) vs hw (c0000000 10000000)

and then 

Dec  6 10:55:25 antoine-MacBook kernel: [   15.878616] [drm] nouveau
0000:02:00.0: Register 0x00004028 not found in PLL limits table
Dec  6 10:55:25 antoine-MacBook kernel: [   15.878622] [drm] nouveau
0000:02:00.0: Register 0x00004008 not found in PLL limits table
Dec  6 10:55:25 antoine-MacBook kernel: [   15.878630] [drm] nouveau
0000:02:00.0: Register 0x00004030 not found in PLL limits table

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
