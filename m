From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC] Initial power management vbios parsing,
 voltage & clock setting to nouveau.
Date: Mon, 20 Sep 2010 01:54:42 +0200
Message-ID: <4C96A2C2.7090804@free.fr>
References: <4C909882.2080702@free.fr> <i6qfu5$nk2$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <i6qfu5$nk2$1@dough.gmane.org>
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

  Le 15/09/2010 14:58, Robert Kaiser a =E9crit :
> On an only slightly related note, what's the recommended way to read =

> out the temperature of the GPU when using nouveau? (I have a NV4B =

> card, but I think I read this is mostly the same for all NVidias, right?)
There is no way to get the temperature using nouveau at the moment. This =

feature should land in nouveau git some time this week.

Reading the temperature is not as straightforward as just reading a =

register. It works that way on nv84+, for earlier cards, you need to =

parse the vbios to set-up the sensor and then read the temperature (and =

change the value with some additional little calcultations). The =

documentation should be available soon, I'm working on merging all the =

doc we have.
