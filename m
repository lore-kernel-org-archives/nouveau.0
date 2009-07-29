From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 22956] nv50: kms, random screen blinkage
Date: Tue, 28 Jul 2009 23:47:33 -0700 (PDT)
Message-ID: <20090729064733.79F1913005A@annarchy.freedesktop.org>
References: <bug-22956-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-22956-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=22956





--- Comment #5 from Kamil Kaminski <kamilkss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-07-28 23:47:32 PST ---
I narrowed down the 'blinkage' issue to commit "drm/nouveau: allow entire
0x0002xxxx range in VBIOS parser on >=nv50",
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=66125505c3ac0e201e8286c777be46f3b415ff53,
this is what makes my NVA0 go crazy. I'm really happy that it all went well, my
first time git bisecting anything...For each nouveau.ko that I build I had to
hexedit the vermagic section/symbol to be able to insert the module into the
current running kernel since vergmagic was always different after every compile
(and I had to end with same filesize otherwise it wouldn't load!?). Is there a
better way to do it? From what I read there's other way to do, e.g. strip
.modinfo symbol but this never worked for me (objcopy -N .modinfo mod.ko
mod-stripped.ko)

stillunknown, AFAIK the fuzzy screen was a result of blinkage. Also the
exapixmaps/tiles work for me now. There was at least 1 other person on the IRC
that described similar blinking issue, I will try to make a video of what I was
experiencing ;).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
