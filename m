From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24092] X with nouveau hangs in nouveau_bo_map_range
 when doing anything
Date: Wed, 23 Sep 2009 10:21:34 -0700 (PDT)
Message-ID: <20090923172134.D1C6E13005B@annarchy.freedesktop.org>
References: <bug-24092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24092





--- Comment #5 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-09-23 10:21:34 PST ---
The trigger of this problem seems to be the PFIFO_DMA_PUSHER interrupt, after
which the channel is stuck. The spinning afterwards is just a side-effect: it
looks like the kernel is always returning EAGAIN (right?) from
DRM_NOUVEAU_GEM_CPU_PREP ioctl and user space does not know to time out (and it
probably does not need to, since we spin in user space and can kill it).

We'd have to find out why the command stream is grabled, that's what a pusher
interrupt means AFAIK, bad command packet format. The randomness sounds like a
race.

I hope this is (not?) just another manifestation of the kernel memory problems
we've been seeing recently on certain setups. Unfortunately I don't have any
further insight into this right now.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
