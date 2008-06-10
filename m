From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16285] First display corrupted when second screen
 plugged at boot
Date: Mon,  9 Jun 2008 21:52:56 -0700 (PDT)
Message-ID: <20080610045256.51C5E130056@annarchy.freedesktop.org>
References: <bug-16285-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16285-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16285


Benjamin Cama <benoar-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |NOTABUG




--- Comment #3 from Benjamin Cama <benoar-GANU6spQydw@public.gmane.org>  2008-06-09 21:52:55 PST ---
OK, it was my fault, updating to the latest git did it work ... Sorry for not
having tested that prior to reporting this problem. For the record, the version
that make it work :
drm commit 4b8aecbde8e62af5370d5401d49a8ab8d089fe8e
DDX commit e034616ab2bbbc486f90c5f64e2bd2de194cf92e

And it works really well actually : it even detected the extended resolution
(1680x1050) of my LCD without a itch. This is really nice. Even Xv works quite
well.

The only "problem" is that since I switched to offb, I don't have any more
console VT ... but now I am not stuck anymore because of some strange DMA
problem it seems (I didn't extensively test that) when switching VT.

Concerning UseFBDev, I didn't change anything and it's still set to true. If
someone could explain me the meaning of this option, I'd be glad, as it never
changed anything on all the linux boxes I touched ...

Thanks for all !


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
