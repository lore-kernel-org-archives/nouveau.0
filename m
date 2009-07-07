From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] Driver can't detect video output and xserver
 doesn't start
Date: Tue,  7 Jul 2009 09:26:11 -0700 (PDT)
Message-ID: <20090707162612.129DB130058@annarchy.freedesktop.org>
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





--- Comment #40 from Martin Decky <martin-Jk0gIJtyDDQ@public.gmane.org>  2009-07-07 09:26:11 PST ---
Comment to the previous three attachments:

I have a very similar problem with my iMac G4 (Flat Panel model, GeForce4 440
Go). The machine has an integrated flat panel and a mini-VGA external
connector. The BIOS also lacks the DCB table.

With the patch provided here (tweaking it trivially to take the "Working around
missing output tables" code path in my case) I get correct output on the
external monitor connected via mini-VGA, but the integrated flat panel is not
detected (but it glows with funny green bars).

I'm not an expert on nVidia, thus I was just randomly tweaking the patch
somehow and the "best" I was able to achieve was a correct detection of both
the flat panel and the external monitor over mini-VGA (see attached X.log), but
the flat panel still just glows with funny color bars. The combination of the
fabricated outputs in this case is as follows:

fabricate_vga_output(dcb, LEGACY_I2C_CRT, 0x1, 0);
fabricate_vga_output(dcb, LEGACY_I2C_PANEL, 0x3, 2);

(Again, please excuse my total ignorance, this is just a random guess.)

I have also attached the output of radeontool and nvclock (with ofonly console,
both outputs are on and show kernel output properly). Thanks for any help with
configuring both outputs.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
