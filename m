From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Subject: Re: Re-enable dithering after
	commit	a7b9f9e5adef276c25584e28ce9e520045ff048b
Date: Wed, 16 Jun 2010 19:24:03 +0200
Message-ID: <4C1908B3.2060201@ensi-bourges.fr>
References: <4C187F74.4040402@ensi-bourges.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C187F74.4040402-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
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

Le 16/06/2010 09:38, Martin Peres a =E9crit :
> Hi everyone,
>
> After commit a7b9f9e5adef276c25584e28ce9e520045ff048b, dithering has =

> disappeared on LVDS (for those who needed it).
>
> ThibG on IRC has bisected this behaviour to =

> a7b9f9e5adef276c25584e28ce9e520045ff048b. Here is a patch that =

> re-enables it.
>
> Please comment on it.
>
> Martin
Well, too late, Jerez already pushed a patch to do that :)

Do you have any idea of why it took almost 10 hours between the moment I =

sent this mail and the moment I actually received it from the list ? Is =

there a manual approbation somewhere to get rid of the spam ?

Thanks to Jerez for the patch anyway :) It works just as great and is =

better designed.
