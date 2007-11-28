From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 11935] DMA queue hang
Date: Wed, 28 Nov 2007 14:34:40 -0800 (PST)
Message-ID: <20071128223440.8697E130052@annarchy.freedesktop.org>
References: <bug-11935-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-11935-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=11935





------- Comment #13 from ddup1-evNnO5DUyiodnm+yROfE0A@public.gmane.org  2007-11-28 14:34 PST -------
(In reply to comment #12)
> I tried today the git nouveau driver with xorg and i get an identical crash.
> Are you interested in log (xorg/drm), if so i can give you this tomorrow.
> 
> [quote Xorg.log]
> (II) NOUVEAU(0): [0x2002] 0x00000000
> (II) NOUVEAU(0): [0x2003] 0x00000000
> (II) NOUVEAU(0): [0x2004] 0x00000000
> (II) NOUVEAU(0): [0x2005] 0x00000000
> (II) NOUVEAU(0): [0x2006] 0x00000000
> (II) NOUVEAU(0): End of fifo dump
> 
> Fatal server error:
> DMA queue hang: dmaPut=1ffd, current=1, status=0
> 
> [/quote]
> 

Sorry forget some details :
I have an archlinux distribution uptodate (Xorg 7.3 if i remember, linux
2.6.23)
My graphic card is a Geforce 7600 GT (G70)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
