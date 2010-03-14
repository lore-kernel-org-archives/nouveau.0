From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa3d-dev] [PATCH] nv30/nv40 Gallium drivers
	unification
Date: Mon, 15 Mar 2010 00:17:14 +0100
Message-ID: <b67489df1003141617v2d30c028h8eca769c784c7918@mail.gmail.com>
References: <ff13bc9a1003130929v68107b8fge54fc1a7d7e78f91@mail.gmail.com>
	<c524168e1003130935t603b36a7u55fbe4ae96e57358@mail.gmail.com>
	<c524168e1003141612s3b667cd1s33fcf2c8b588a0f6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <c524168e1003141612s3b667cd1s33fcf2c8b588a0f6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Keith Whitwell <keith.whitwell-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>, mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 15, 2010 at 12:12 AM, Keith Whitwell
<keith.whitwell-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> On Sat, Mar 13, 2010 at 5:35 PM, Keith Whitwell
> <keith.whitwell-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> Sounds good to me - fewer driver directories to fix up after changes...
>>
>
> It'd be good to get this merged sooner rather than later as I'll soon
> be starting on pipe_resources conversion for the nv drivers. =A0Once I
> do that, there will be heaps of conflicts with your patches, but if I
> can merge them in before I do the conversion all will be well...
>

I tested unification+fixes branch on nv35 with 11 games that you can
see on that page :
http://nouveau.freedesktop.org/wiki/XavierChantry

No regression to report compared to mesa master.

A benefit worth mentioning is the SWTNL support which allows to run
the 4 games currently broken with mesa master.
