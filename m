From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: nouveau_pm.c: Build error
Date: Mon, 11 Apr 2011 19:40:47 +0200
Message-ID: <4DA33D1F.10102@free.fr>
References: <4DA30096.1070404@ece.ntua.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4DA30096.1070404-CiBbMcFdDxlMo1R+fwTmgw@public.gmane.org>
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

Le 11/04/2011 15:22, Stratos Psomadakis a =E9crit :
> In nouveau_pm.c, in the function nouveau_pm_acpi_event(), there's no
> check for CONFIG_POWER_SUPPLY.
>
> If CONFIG_POWER_SUPPLY is set to either n or m, the
> power_supply_is_system_supplied() is 'missing' and there's a build error.
>
> One solution is to add an #ifdef CONFIG_POWER_SUPPLY along with the
> #ifdef CONFIG_ACPI before the function.
Thanks, I'll send a patch for that tonight.

Can I add a Reported-by: line with your name and email address?
