From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14567] Randr 1.2 fails on nv17 lvds in a Dell
 Inspiron 8100 ( continued from 14491)
Date: Thu, 28 Feb 2008 17:22:22 -0800 (PST)
Message-ID: <20080229012222.7EFBC130085@annarchy.freedesktop.org>
References: <bug-14567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14567


Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org




--- Comment #6 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-02-28 17:22:21 PST ---
An randr12 and non-randr12 comparison of:
./radeontool regset 0x6808b0 0x10004
./radeontool regmatch 0x6808b4
./radeontool regset 0x6808b8 0x10004
./radeontool regmatch 0x6808bc
./radeontool regset 0x6828b0 0x10004
./radeontool regmatch 0x6828b4
./radeontool regset 0x6828b8 0x10004
./radeontool regmatch 0x6828bc
might be interesting - the fact that the effect isn't cured on exit to console
indicates the digital output setup is wrong :(


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
