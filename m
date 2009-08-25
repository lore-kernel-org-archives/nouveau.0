From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23495] nouveau KMS produces no output on a Dell
	3008WFP monitor
Date: Mon, 24 Aug 2009 20:35:20 -0700 (PDT)
Message-ID: <20090825033520.4548013005B@annarchy.freedesktop.org>
References: <bug-23495-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23495-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23495


Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #2 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-08-24 20:35:19 PST ---
Ok, this looks like a failure to setup dual-link TMDS which the larger monitor
would require to run at its native resolution.  To solve the immediate problem,
load the nouveau kernel module with "modprobe nouveau duallink=0" to reject
modes that require more bandwidth than is available on single-link TMDS.  You
won't be running at your monitor's native mode, but you should have an image.

Now, we don't know exactly how to program dual-link as of yet so if you're
willing to do some experimentation that'd be *really* good.  Also, grabbing
traces of the NVIDIA binary driver initialising it would help a lot.  See
http://nouveau.freedesktop.org/wiki/MmioTrace for details on how to do this.

For some random testing that may help, try playing with the uscript_tmds module
option.  Valid values for most cards are 0x0001 0x0002 and 0x0105.  0x0001 is
the default, to try the others use "modprobe nouveau uscript_tmds=0x0105" etc.

Thanks!


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
