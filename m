From: Csillag Kristof <csillag.kristof-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: is there a way to override EDID detection? (for monitor
 with broken EDID)
Date: Tue, 30 Aug 2011 06:51:10 +0200
Message-ID: <4E5C6C3E.8040505@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Dear Nouveau users,

I am stuck with a bogus (but otherwise, great) monitor that can no 
longer properly reports back it's EDID block via a digital connection.
(With most of the video cards, anyway. I suspect a low-level (maybe 
voltage) issue here.)

I can get it to work with the proprietary NVIDIA driver by specifying 
the "ConnectedMonitor" option (to override detecting the monitor, which 
also fails most of the time), and the "CustomEDID" option (to pass in 
the binary EDID info I have captured using one of the rare cards that 
could drive it properly).

With this setup, it works reliably and flawlessly.

The question is, can I do the same thing with free Nouveou driver somehow?

The current statis is that when I try to load the nouveau kernel module, 
it fails to read the EDID, and then the monitor is no longer available.
(The box does not crash, I can still login via the network, and read dmesg.)

Could you please advise me how to proceed?
(Other that replace than fixing the hardware error, which is something I 
can not do now, because of various reasons.)

Thank you for your help:

    Kristof Csillag
