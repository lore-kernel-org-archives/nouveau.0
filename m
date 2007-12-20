From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13750] Repetitively Taking Screenshots Causes the X
	Server to Hang
Date: Thu, 20 Dec 2007 05:55:08 -0800 (PST)
Message-ID: <20071220135509.15B6A130054@annarchy.freedesktop.org>
References: <bug-13750-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-13750-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13750


shlomif-ik1l9ssToec+JF/nGntIXQ@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |shlomif-ik1l9ssToec+JF/nGntIXQ@public.gmane.org




------- Comment #1 from shlomif-ik1l9ssToec+JF/nGntIXQ@public.gmane.org  2007-12-20 05:55 PST -------
Here are a few more things I discovered:

1. When ssh'ing into the machine and running top, one can see that X consumes
100% of the CPU.

2. Here is the output of ps auxwwwwwww | grep ksnap:

<<<<<<<<<<<<
kdetest   4735  0.1  0.6  36420 17148 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4736  0.1  0.6  36420 17156 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4737  0.1  0.6  36420 17144 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4738  0.1  0.6  36420 17040 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4739  0.1  0.6  36420 17024 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4740  0.1  0.6  36420 17028 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4741  0.1  0.6  36420 17032 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4742  0.1  0.6  36420 17164 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4743  0.1  0.6  36420 17032 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4744  0.1  0.6  36420 17168 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4745  0.1  0.6  36420 17032 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4746  0.1  0.6  36420 17028 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4747  0.1  0.6  36420 17024 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4748  0.1  0.6  36420 17020 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4750  0.1  0.6  36420 17152 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4751  0.1  0.6  36420 17152 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4752  0.1  0.6  36420 17028 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4753  0.1  0.6  36412 17152 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4754  0.1  0.6  36420 17164 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4755  0.1  0.6  36456 17040 ?        S    15:17   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4756  0.1  0.6  36420 17028 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4757  0.1  0.6  36420 17032 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4758  0.1  0.6  36420 17028 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4759  0.1  0.6  36412 17028 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4760  0.1  0.6  36420 17040 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4761  0.1  0.6  36420 17160 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4762  0.1  0.6  36420 17024 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4763  0.1  0.6  36420 17016 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4764  0.1  0.6  36420 17160 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4765  0.1  0.6  36420 17164 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4766  0.1  0.6  36420 17168 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4767  0.1  0.6  36456 17148 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4769  0.0  0.6  36124 16384 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4770  0.0  0.6  36120 16372 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4771  0.0  0.6  36124 16076 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4772  0.0  0.6  36192 16372 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4773  0.0  0.6  36120 16092 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4774  0.0  0.6  36120 16084 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
kdetest   4775  0.0  0.5  33108 14080 ?        S    15:18   0:00 ksnapshot
-caption KSnapshot -icon ksnapshot -miniicon ksnapshot
shlomi    4995  0.0  0.0   4104   764 pts/3    R+   15:26   0:00 grep --color
ksnap
>>>>>>>>>>>>

3. I cannot kill the X server process using "pkill X". Only "pkill -9 X" works.

Regards,

        Shlomi Fish


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
