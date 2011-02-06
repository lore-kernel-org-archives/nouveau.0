From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33887] nouveau causes graphic corruption were you
 cant do anything
Date: Sun,  6 Feb 2011 13:36:21 -0800 (PST)
Message-ID: <20110206213621.A99AE13004D@annarchy.freedesktop.org>
References: <bug-33887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33887

--- Comment #18 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-06 13:36:21 PST ---
(In reply to comment #17)
> I read the mmiotrace.txt file on how to use the kernel functionality.
> Can you tell me what actions exactly would be useful to be traced after the WM
> is started.
> 
> It is written :
> "During tracing you can place comments (markers) into the trace by
> $ echo "X is up" > /sys/kernel/debug/tracing/trace_marker
> This makes it easier to see which part of the (huge) trace corresponds to
> which action. It is recommended to place descriptive markers about what you
> do."
> But what actions exactly to do during the trace process ?
> 
> And :
> "Please, pack into a compressed archive the trace file and a free description
> about what you do during the trace."
> Again what is useful to do ?
> 

AFAIK with nouveau, you get corruption just by starting X.
So I think you just need to start X with the blob, mark X is up in the trace,
and stop.

> Can you also precise to me the format of the name of the archive file.
> "The name of the archive file should contain the PCI id and GPU family, or the
> commercial name of your card."
> Can you give an example of name please ?
> 
> Again :
> "If you are doing a trace for a driver project, e.g. Nouveau, you should also
> do the following before sending your results:
> $ lspci -vvv > lspci.txt
> $ dmesg > dmesg.txt
> $ tar zcf pciid-nick-mmiotrace.tar.gz mydump.txt lspci.txt dmesg.txt
> and then send the .tar.gz file. The trace compresses considerably. Replace
> "pciid" and "nick" with the PCI ID or model name of your piece of hardware
> under investigation and your nickname."
> I would like an example of name of the tarball file.

$ lspci -n -d 10de:
01:00.0 0300: 10de:0407 (rev a1)

-> the pci id of my card is 0407 (10de is vendor id, nvidia)

$ dmesg | grep generation
[11562.063550] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card
(0x084700a2)

-> generation is nv50, codename nv84.

So in my case I would just call it nv84-0407-shining-mmiotrace.tar.gz

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
