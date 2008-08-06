From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16682] Xv problem on NV11
Date: Wed,  6 Aug 2008 05:05:24 -0700 (PDT)
Message-ID: <20080806120524.CC60A130058@annarchy.freedesktop.org>
References: <bug-16682-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16682-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16682





--- Comment #5 from Garnet MacPhee <garnet-vVazHDhchvNCCzmm7wA0Mw@public.gmane.org>  2008-08-06 05:05:24 PST ---
> P.S. Exist any benchmark of Xv speed? 
> 

I once tried benchmarking Xv on a 5200 (NV34) and a 6200A (NV4A). I played
exactly 1 second of Elephants_Dream_HD with 
mplayer, trying every driver (nouveau, nv, nvidia) and every port (blitter,
texture, etc.) I still have the results, if anyone 
is interested. The command I used was:

mplayer "/mnt/hda2/Elephants_Dream_HD.avi" -benchmark -endpos 00:01:00 -nosound
-fs -vo xv:port=122 # NV4A texture nouveau

Only the binary blob was able to play 1080p video at acceptable speed (so far).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
