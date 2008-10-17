From: "Arann Gaspard Leon" <gaspard.leon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: corruption in firefox with nouveau
Date: Fri, 17 Oct 2008 22:14:22 +1300
Message-ID: <4194afb0810170214m65d8adccje2792b960524b7c5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

Some minor visual corruption is evident in firefox on Ubuntu Hardy
when using the nouveau driver (from RAOF's PPA)

Best tested by:
- Going to the ubuntu hardy default home page ( http://start.ubuntu.com/8.04/ )
- Reset zoom (100%) if zoomed in or out
- Scroll down all the way (my screen is 1280x1024)
- Scroll back up (slowly for best results) and you will see the top of
the background corrupted.
(also the bottom of the page slightly corrupted..)

I've noticed it on other pages as well sometimes as a vertical line in
the middle of the page...

As this is a mailing list I won't attach a screenshot, but I've got
some if anyone is interested...

Hardy 8.04 with proposed and backports enabled
AGP Nvidia Geforce 5900XT w/128MB on an ABit NF7-S (NForce 2 based)

Other then that, so far the driver is working well, it's outperforming
nv and nvidia in gtkperf... and if it had suspend support, I would
probably switch over to it permanently.

Thanks,
Gaspard Leon
