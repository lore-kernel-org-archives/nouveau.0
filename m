From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15758] Invisible mouse pointer on NV4E (C51)
Date: Sun,  5 Apr 2009 02:18:10 -0700 (PDT)
Message-ID: <20090405091810.5DB7F130016@annarchy.freedesktop.org>
References: <bug-15758-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15758-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15758





--- Comment #18 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-04-05 02:18:09 PST ---
Hi,

Sorry for the late response, but here is some data...

> An unlikely idea, but might be worth a go, is the following:
Always worth a try :)

> 1) get the nvidia version of radeontool:
> git clone git://anongit.freedesktop.org/~stuart/radeontool; cd radeontool; make
Done. Radeontool-version: 0b5dab7add1a69103a7dfd912f188f46839b4623
> 2) start X using the nvidia proprietary driver
Done. X-version: 1.5.1 Nvidia-version: 180.44
> 3) read the values of 0x9200, 0x9210, and 0x9220:
> ./radeontool regmatch 0x9200 (for all three registers)
> make a note of the values
Done. Values:
0x9220  0x00000008
0x9200  0x00000798
0x9210  0x000000fa
> 4) start X using the nouveau driver, set 0x9220, 0x9200, 0x9210 (in that order)
> to the values read in step 3
> ./radeontool regset 0x9220 0xSOME_VALUE (for all three registers/values)
Nouveau-driver version: 11be9a982073d66a68cd3db2bfc611eb58d3ea81
Drm-driver version: 51d6346f9f3c425f49e57d185530c6bcaeb94f5e
Done. Original values (just for information):
0x9220  0x00010000
0x9200  0x000014c8
0x9210  0x00000271
After setting the regs to the same values as they are with the nvidia driver I
verified they ware saved (it did not move back to the old values).
> 5) attempt to reproduce disappearing cursor using vt switching / resolution
> changes as described in previous comments (note: don't restart X, that will
> over-write the changes you made in step 4)
Only changing VT made the cursor already go away...
> 6) report here whether this game made any difference
Done :)

Note: Just to let you know: In xorg.conf I *removed* any options that influence
the nouveau driver. (In my case this was only HWcursor).

                                       Greets, Ronald


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
