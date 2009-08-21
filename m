From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: rewrite nouveau_dma_wait()
Date: Sat, 22 Aug 2009 01:42:52 +0200
Message-ID: <6d4bc9fc0908211642q3c1d2544n52e1cf4d12147aa4@mail.gmail.com>
References: <1250848611-21642-1-git-send-email-skeggsb@gmail.com>
	<6d4bc9fc0908211230l7f63207fm673559e3b4f656bb@mail.gmail.com>
	<1250897199.20095.1.camel@keine.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250897199.20095.1.camel-oFTkVezJ1HzzwxVw7NwMvg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Aug 22, 2009 at 1:26 AM, Ben Skeggs<skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, 2009-08-21 at 21:30 +0200, Maarten Maathuis wrote:
>> The timeout is too short, the gallium driver will easily trigger an asse=
rt.
> Oops, that was a typo. =A0Thanks, fixed.
>
> Any other comments?

Not really, it's been running fine apart from the mentioned issue.

>>
>> Maarten.
>
>
>
