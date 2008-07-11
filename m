From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14393] Card detected as NV20 (endian issue?) With nv
 driver run first, fifo lockup on nv11ppc machine
Date: Thu, 10 Jul 2008 21:28:09 -0700 (PDT)
Message-ID: <20080711042810.0910D130059@annarchy.freedesktop.org>
References: <bug-14393-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14393-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14393





--- Comment #6 from Danny <obiwan-ajv+KCCKUOlAfugRpC6u6w@public.gmane.org>  2008-07-10 21:28:09 PST ---
Created an attachment (id=17630)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=17630)
correctly set endian access in nouveau_state.c

The first issue (card being in the wrong mode) is probably a bug in the drm. 
Both nv and nvidiafb set up BE access by writing 0x01000001 to NV03_PMC_BOOT_1
(instead of 0x00000001 as done by drm). This also explains why it worked after
running nv (nv set up the card correctly).

Patch is attached. The second problem is probably something else. It may have
been fixed in the meantime, so pls test.

Actually, the drm used to write 0x01000001 but this was changed by marcheu in
commit 30353c8efcc026ee8940f3eadab084c42a3acd4e. I do not know the reason of
this change.

d.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
