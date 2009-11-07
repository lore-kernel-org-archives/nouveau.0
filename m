From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24820] [nv15] Vertical screen corruption in X when
 KMS is enabled
Date: Sat,  7 Nov 2009 07:59:04 -0800 (PST)
Message-ID: <20091107155904.8CCEB130070@annarchy.freedesktop.org>
References: <bug-24820-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24820-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24820





--- Comment #8 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>  2009-11-07 07:59:04 PST ---
(In reply to comment #7)
> Which clock frequencies were you using exactly? It would also be interesting to
> know if it works at 24 bit depth or with kernel modesetting disabled.

It works with KMS disabled (16 / 24 bit depth).

It also works with 24 bit depth and KMS enabled.

Only with 16 bit and KMS enabled it does not work all time...

Tested resolutions (all 3 cases above):
800x600   @ 76 / 75 / 70.7 / 74.9 / 65.3 / 60.3 / 60 Hz
1024x768  @ 76 / 75.1 / 70.7 / 74.8 / 65.3 / 60 Hz
1280x720  @ 76 / 70.7 / 65.3 / 74.9 / 60 Hz
1920x1080 @ 60 / 59 Hz

> > Btw2. if I use my TNT2 M64 KMS works also fine but X/kdm login manager displays
> > only a black background and a white (login) box...
> > 
> Logs and config files might be helpful, but probably an unrelated bug.

I will try it soon. If it is not also "fixed" with 24 bit depth I will post
log/config files.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
