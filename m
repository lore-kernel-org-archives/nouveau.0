From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 35514] Black screen with nouveau on a GeForce
 8600M GT, either LiveCD or fresh install
Date: Mon, 21 Mar 2011 19:55:42 -0000
Message-ID: <op.vsplm4db7cbmmg@emo>
References: <bug-35514-8800@http.bugs.freedesktop.org/>
	<20110321182844.11F1913000C@annarchy.freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110321182844.11F1913000C-4GnqB8vgsbnwRzGw0Gvu8Q/tdpCO6/zZ@public.gmane.org>
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
Cc: mathieu.marquer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

There are a couple of things that should be taken into account

1. In the dmesg log provided nouveau is not loaded (remove nomodeset from
the kernel command line)
2. Please (re)move the nouveau_dri.so file, as 3D is not supported.

Most likely the issue is unrelated to point 2, but without a comprehensive
log (see point 1), nothing decisive can be said.
As a possible "fix" take a look at Forcing Modes [1], and select a
lower resolution. (the list can be seen in your Xorg log)

[1] http://nouveau.freedesktop.org/wiki/KernelModeSetting
