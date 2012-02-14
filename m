From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39550] Brightness stuck to low value after
	suspend/resume
Date: Tue, 14 Feb 2012 15:13:42 +0000
Message-ID: <bug-39550-8800-SEX3OIrQrW@http.bugs.freedesktop.org/>
References: <bug-39550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39550

--- Comment #23 from Walther <walther.MD-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-02-14 07:13:42 PST ---
There should be a solution to this dilemma, considering that nvidia's binary blob does it correctly.

I got the nvapeek results for using the binary blob, and the results I got are:

Before
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266640 0441474b
0000e280: 44444747 00000000

After
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266640 0441474b
0000e280: 44444747 00000000

Notice that unlike nouveau, register 0xe104's content is unaltered after resuming. What is this particular register for?

The vbios before suspending is identical between nouveau and nvidia, and it is also identical to the one after resuming with nvidia. However, nvgetbios fails
with nouveau after resuming:

./nvagetbios > vbios.txt
No extraction method specified (using -s extraction_method). Defaulting to PRAMIN.
Attempt to extract the vbios from card 0 (nv96) using PRAMIN
Invalid signature(0x55aa). You may want to try another retrieval method.

Is this a sign that the vbios is somehow wrong/corrupted after resume?

Note that I am also using a Elitebook 8530W, with an nVidia Corporation G96M [Quadro FX 770M] card, using Linux 3.1.10.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
