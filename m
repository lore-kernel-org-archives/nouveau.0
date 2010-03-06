From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25258] [9400M] KMS and X do not use monitor's native
	resolution
Date: Sat,  6 Mar 2010 11:29:54 -0800 (PST)
Message-ID: <20100306192954.CB6A81300A7@annarchy.freedesktop.org>
References: <bug-25258-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25258-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=25258





--- Comment #11 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>  2010-03-06 11:29:54 PST ---
Created an attachment (id=33820)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33820)
Xorg.0.log with nv

ION is also working with nv driver now.

Attached is output with nv driver (for EDID) which is also 1280x720 but it fits
to my monitor.

Nouveau's (invalid) EDID which "produces" output out of monitor's area:

00FFFFFFFFFFFF0020A337320100000026100103804627780A0DC9A05747982712484CBFCF0001010101010101010101010101010101011D007251D01A206E2855007E884200001A011D00BC52D01E20B8285540C48E21000018000000FC004C43443232333345550A202020000000FD0032500F440F000A202020202020015E

I hope it is useful.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
