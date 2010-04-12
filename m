From: Didier Spaier <didier.spaier-GqzDj6/B2j8@public.gmane.org>
Subject: Re: nouveau userspace bits for 2.6.34
Date: Mon, 12 Apr 2010 23:42:24 +0200
Message-ID: <4BC393C0.2000407@epsm.fr>
References: <20100412212203.GA2671@hexapodia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100412212203.GA2671-3HqRAUrWAWyGglJvpFV4uA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andy Isaacson <adi-3HqRAUrWAWyGglJvpFV4uA@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Kseggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

Andy Isaacson wrote:

> 
> What version of libdrm-nouveau and xserver-xorg-video-nouveau do I need
> in order to run nouveau on 2.6.34-rc3 and later?
> 
On Slackware 64-current using unmodified 2.6.34-rc3 with libdrm-2.4.19 and xf86-video-nouveau pulled from git commit 2462b417fc550b71f021ca9736808f8f2d1cb6f0 works well.
 >
> What git branches should I be tracking?  What changesets add support for
> nouveau interface version 0.0.16?
> 
> (I'm on Debian and Ubuntu, but building my own from git is fine.)
> 
Didier
