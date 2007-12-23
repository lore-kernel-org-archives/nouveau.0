From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13796] tnt2 16Mb agp, corrupted image
Date: Sun, 23 Dec 2007 09:21:32 -0800 (PST)
Message-ID: <20071223172132.C58C7130051@annarchy.freedesktop.org>
References: <bug-13796-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-13796-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13796





------- Comment #5 from randrik-JGs/UdohzUI@public.gmane.org  2007-12-23 09:21 PST -------
Ok, with 

(**) NOUVEAU(0): Option "MigrationHeuristic" "greedy"                           
(**) NOUVEAU(0): Option "EXANoComposite" "1"                                    
(**) NOUVEAU(0): Option "EXANoUploadToScreen" "1"                               
(**) NOUVEAU(0): Option "EXANoDownloadFromScreen" "1"

it works better. Fonts are back, and window decorations sometimes fully
visible. But scroll (xchat, mozilla) still give me very strange results - image
not updated until something "forced" redraw. (i'm using e 0.16.8.11-001 as my
window manager, but it works just fine with nouveau + nv11 and nouveau + nv40)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
