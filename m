From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21536] Accelerated 2D Does Not Work On HP tx2000z
 (Geforce 6150 Go)
Date: Thu,  7 May 2009 14:09:51 -0700 (PDT)
Message-ID: <20090507210951.2BD54130057@annarchy.freedesktop.org>
References: <bug-21536-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21536-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21536





--- Comment #3 from Jeremy Uchitel <circular-AMv+oqoGJ4vR7s880joybQ@public.gmane.org>  2009-05-07 14:09:50 PST ---
Reading around, something stuck out about having more 2GB of memory in a system
being problematic.  So, I had a few minutes last night to power down my laptop,
remove one 2GB DIMM, and start back up.  EXA works in this configuration. 
Turning on desktop effects with Xrender under KDE is PAINFULLY slow--slower
than running the nouveau driver with shadowfb--but I no longer get the error
messages or screen corruption I previously reported.

Is this behavior likely to change? I reinstalled the second DIMM and let the
memtest application run all night.  The memory checks out just fine. 
Obviously, the built-in video adapter does not have dedicated VRAM, but why
would having 4GB of system memory cause the accelerated driver to fail?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
