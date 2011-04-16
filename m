From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36163] nouveau fails to render framebuffer on
	[GeForce 7300 GS]
Date: Sat, 16 Apr 2011 06:28:50 -0700 (PDT)
Message-ID: <20110416132850.D4A9A13000C@annarchy.freedesktop.org>
References: <bug-36163-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36163-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36163

--- Comment #2 from SanskritFritz <semmikozod-hRtevi7K+EU+Va1GwOuvDg@public.gmane.org> 2011-04-16 06:28:49 PDT ---
Created an attachment (id=45710)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=45710)
kernel.log

This is the kernel.log. This time I didnt load nouveau automatically at boot,
but just modprobed it, it has the same effect. This way I also noticed that the
screen is not garbled in a sense that something has put errorneus data to the
screen, but rather nothing was produced, meaning that previous data was left on
the screen (like the output of Qingy), nouveau simply did not render anything
on the screen.
Also note that once I was successful with the modprobe nouveau, right after I
uninstalled the nvidia module, without reboot.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
