From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50043] GT240 (nv40) doesn't show anything at boot up,
 nor X starts
Date: Thu, 17 May 2012 15:12:30 +0000
Message-ID: <bug-50043-8800-dsJvvfXcHK@http.bugs.freedesktop.org/>
References: <bug-50043-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50043-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=50043

--- Comment #2 from Peter Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-05-17 08:12:30 PDT ---
That optimus message is a mistake that is fixed in newer kernels:

commit f24f9104f70cabc2534b16f94149d33127d249d5
Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed May 2 20:26:24 2012 +0100

    nouveau: initialise has_optimus variable.

    commit addde4ec31456c5f1e9b61aae3edcfeb0f338f87 upstream.

    We should initialise this to 0 really to avoid getting false positives.

    Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
