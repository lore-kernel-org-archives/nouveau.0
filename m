From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [patch] "Junior" ToDo Warn if Modesetting Disabled
Date: Mon, 27 Aug 2012 00:18:06 +0200
Message-ID: <503AA09E.7090409@free.fr>
References: <20120826211500.18936vaz6qo2nkes@www.careysoft.co.nz>
	<20120827090558.33082n3ef2x2nbg6@www.careysoft.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120827090558.33082n3ef2x2nbg6-H39yYvbTrNBS04pZAofVr6U/zSkkHjvu@public.gmane.org>
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

On 26/08/2012 23:05, Mark Carey wrote:
> v2 spaces to tabs as per RSpliets feedback on IRC
Hi Mark,

Thanks for the patch, it is indeed needed :)

However, I don't like the wording. Instead of telling that it isn't 
normal, we don't tell what should be done neither what it will impact.
I guess something like "modesetting disabled, hw acceleration disabled" 
would be more suitable.

Speaking about that, I wonder how Nouveau would work on a CRTC-less card :D

Martin

PS: I have tested booting Arch with "nomodeset" and x-server loads VESA. 
Exactly the behaviour we are looking for :)
