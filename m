From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14426] SIGSEV in NVAccelUploadIFC
Date: Sat,  9 Feb 2008 09:03:17 -0800 (PST)
Message-ID: <20080209170318.0B1A1130009@annarchy.freedesktop.org>
References: <bug-14426-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14426-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14426





--- Comment #2 from Jaime Velasco Juan <jsagarribay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-02-09 09:03:17 PST ---
Created an attachment (id=14237)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=14237)
Xorg.log with DMA_TRACE and DMA_DEBUG enabled

I enabled NOUVEAU_DMA_DEBUG and NOUVEAU_DMA_TRACE.

The bug triggers when the input needs padding. The code reads the padding bytes
from the input data, but after the last line of the input there is not valid
data and the driver gets a SIGSEV. If I force the driver to skip the last line
it doesn't crash (but I get some corruption).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
