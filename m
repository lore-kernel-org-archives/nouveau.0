From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27905] DVI monitor is blank - DVI detected as
	Display Port ?
Date: Tue,  4 May 2010 16:26:19 -0700 (PDT)
Message-ID: <20100504232619.E9D5F13004E@annarchy.freedesktop.org>
References: <bug-27905-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27905-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27905

--- Comment #15 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-05-04 16:26:19 PDT ---
(In reply to comment #14)
> (In reply to comment #13)
> 
> > Ok, my question for you is:  Are you able to make your VBIOS setup the DVI
> > display during POST instead of the LVDS panel?  There may be options in your
> > BIOS setup to allow this.  If so, let me know and we may be able to get traces
> > that'll help me track this problem down for you.
> 
> That is my current set up: BIOS POST and Linux kernel messages are shown on the
> DVI display until nouveau is loading.

Ah, great!  In that case, can you boot with "nomodeset 3" so you're at a VGA
text console and get some VBIOS traces for me?  Instructions on grabbing
vbtracetool are at http://nouveau.freedesktop.org/wiki/DumpingVideoBios

I'll need:
./vbtracetool -2 2>vbios.rom
./vbtracetool -lp 2>post.iolog
./vbtracetool -dp 2>post.log (this will possibly take several minutes to
complete)

If you could "bzip -9" those, and mail to mmio.dumps-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org I'll take a look
when I get a chance and see if I can find the missing magic.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
