From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [BUG ?] Nouveau driver on 330M GT
Date: Tue, 15 Jun 2010 21:31:03 +1000
Message-ID: <1276601463.2526.4.camel@nisroch>
References: <201006111052.29187.goretux@gmail.com>
	<AANLkTilGym6lbGnSKuahBvIAT7a2Wt405i_XZtd7FFwd@mail.gmail.com>
	<201006151318.08619.goretux@gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201006151318.08619.goretux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Eric Lacombe <goretux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 2010-06-15 at 13:18 +0200, Eric Lacombe wrote:
> > Please make sure nvidiafb is not loaded. If you still have issues
> > after making sure that nouveau is the only kernel module running for
> > this device please attach a full log.
> 
> nvidiafb is not loaded.
> 
> I've attached the full log. And here are the drm lines of the log :
> 
> [drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x0a5580a2)
> [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
> [drm] nouveau 0000:01:00.0: ... BIOS signature not found
> [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PROM
> [drm] nouveau 0000:01:00.0: ... BIOS signature not found
> [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PCIROM
> [drm] nouveau 0000:01:00.0: ... BIOS signature not found
> [drm] nouveau 0000:01:00.0: No valid BIOS image found
Is this a system with switchable graphics (Optimus probably)?  If so,
fiddle with your BIOS options and try and enable only the NVIDIA board.

Dave has some patches that can retrieve the VBIOS image via ACPI which
may be of use to you, but I'm not sure of the status.

Ben.
> 
> Regards,
> 
> 	Eric
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
