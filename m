From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] Driver can't detect video output and xserver
 doesn't start
Date: Tue, 21 Apr 2009 06:56:20 -0700 (PDT)
Message-ID: <20090421135620.A52FB130057@annarchy.freedesktop.org>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21273





--- Comment #10 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-04-21 06:56:19 PST ---
(In reply to comment #8)
> Created an attachment (id=24992)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=24992) [details]
> rom file
> 
> I have no clue why the rom is corrupted. I'm going out on a limp here, and hope
> that this machine is included in a firmware update for geforce cards that apple
> released a couple of years ago. I extracted the files from that update and they
> are attached.

Thanks for looking at this.  Rather than corruption, I suspect the problem is
that for early models such as this they simply didn't bother putting the
necessary table in the OF NVDA,BMP.

The NVIDIA1100-A74.rom is for an nv17, but is an older version than the
existing one, and also misses the appropriate table :(  However, from looking
at the rest of the rom it doesn't look like they've hidden the DCB in some
other part of OF

Andrey: could you attach a compressed tar file of /proc/device-tree (or if
that's too big, just the nvidia pci-card subdirectory containing NVDA,BMP) so
we can see if OF gives any hints, or whether we just have to make this up.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
